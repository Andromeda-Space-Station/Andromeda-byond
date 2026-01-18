// Этот датум - всего лишь одиночный экземпляр, который позволяет настраивать поведение "может быть применено" без создания экземпляра раны.
// Например: вы можете создать подтип pregen_data для своей раны, который переопределяет can_be_applied_to, чтобы применяться только к конечностям слизнелюдей.
// Без этого вы ограничены очень статичными начальными переменными.

/// Одиночный датум, который хранит предварительно сгенерированные и статические данные о ране. Каждый датум раны должен иметь соответствующий wound_pregen_data.
/datum/wound_pregen_data
	/// Путь к типу раны, которую мы будем обрабатывать и хранить данные о ней. НЕОБХОДИМО, ЕСЛИ ЭТО НЕ АБСТРАКТНЫЙ ТИП!
	var/datum/wound/wound_path_to_generate

	/// Будет ли этот датум инстанцирован?
	var/abstract = FALSE

	/// Если true, наша рана может быть выбрана при обычном случайном создании ран. Если false, наша рана может быть создана только прямым указанием её пути.
	var/can_be_randomly_generated = TRUE

	/// Список биологических состояний, которые конечность должна иметь, чтобы получить нашу рану. Определяется в wounds.dm.
	var/required_limb_biostate
	/// Если false, мы будем проверять, имеет ли конечность ВСЕ наши требуемые биологические состояния, а не ЛЮБОЕ из них.
	var/require_any_biostate = FALSE

	/// Если false, мы пройдемся по ранам на данной конечности, и если найдется совпадение по типу, мы не добавим нашу рану.
	var/duplicates_allowed = FALSE

	/// Если мы требуем BIO_BLOODED, мы не добавим нашу рану, если это true и конечность не может кровоточить.
	var/ignore_cannot_bleed = TRUE // многие кровоточащие раны все равно должны быть применены для целей изувечения плоти

	/// Список зон тела, к которым мы применимы.
	var/list/viable_zones = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	/// Тип атаки, который может создать эту рану.
	/// Например: WOUND_SLASH = острая атака может вызвать это, WOUND_BLUNT = атака без остроты/атака с остротой против конечности с изувеченной внешней частью может вызвать это.
	var/required_wounding_type

	/// Вес, который будет использоваться, если в конце выбора ран останется несколько валидных ран. Будет вставлен в pick_weight, поэтому используйте целые числа.
	var/weight = WOUND_DEFAULT_WEIGHT

	/// Минимальный бросок травмы, который атака должна получить, чтобы создать нас. Зависит от threshold_penalty и series_threshold_penalty нашей раны, а также от wound_bonus атаки. См. check_wounding_mods().
	var/threshold_minimum

	/// Серия ран, к которой это относится. Смотри wounds.dm (файл с дефайнами) для более подробного объяснения - но вкратце: не может быть двух ран одной серии на конечности.
	var/wound_series

	/// Если true, мы попытаемся во время случайного создания раны "пересилить" и удалить другие типы ран из списка возможных, используя competition_mode.
	var/compete_for_wounding = TRUE
	/// Режим конкуренции, с которым мы будем удалять другие раны из возможного списка при условии, что [compete_for_wounding] равен TRUE. Смотри wounds.dm, файл с дефайнами, для информации о том, что они делают.
	var/competition_mode = WOUND_COMPETITION_OVERPOWER_LESSERS

	/// Список BIO_ дефайнов, который будет перебираться по порядку для определения файла шрама, который наша рана создаст.
	/// Используйте generate_scar_priorities для создания кастомного списка.
	var/list/scar_priorities

/datum/wound_pregen_data/New()
	. = ..()

	if (!abstract)
		if (required_limb_biostate == null)
			stack_trace("required_limb_biostate равен null - пожалуйста, установите его! Произошло на: [src.type]")
		if (wound_path_to_generate == null)
			stack_trace("wound_path_to_generate равен null - пожалуйста, установите его! Произошло на: [src.type]")

	scar_priorities = generate_scar_priorities()

/// Должен возвращать список BIO_ биологических состояний в порядке приоритета. Смотри [scar_priorities] для дальнейшей документации.
/datum/wound_pregen_data/proc/generate_scar_priorities()
	RETURN_TYPE(/list)

	var/list/priorities = list(
		"[BIO_FLESH]",
		"[BIO_BONE]",
	)

	return priorities

// Эта процедура - основная причина существования этого датума - одиночный экземпляр, чтобы мы могли всегда запускать эту процедуру даже без существования раны
/**
 * Аргументы:
 * * obj/item/bodypart/limb: Конечность, которую мы рассматриваем.
 * * suggested_wounding_type: Тип ранения для проверки против требуемого нами типа ранения. По умолчанию required_wounding_type.
 * * datum/wound/old_wound: Если бы мы заменяли рану, это была бы старая рана. Может быть null.
 * * random_roll = FALSE: Если это в контексте случайного создания раны, и эта рана не была проверена специально.
 *
 * Возвращает:
 * FALSE, если конечность не может быть ранена, если типы ранения не совпадают с нашими (через wounding_types_valid()), если у нас уже есть рана более высокой тяжести в нашей серии,
 * если есть несоответствие биологического типа, если конечность не в допустимой зоне, или если есть дублирующиеся типы ран.
 * TRUE в противном случае.
 */
/datum/wound_pregen_data/proc/can_be_applied_to(obj/item/bodypart/limb, suggested_wounding_type = required_wounding_type, datum/wound/old_wound, random_roll = FALSE, duplicates_allowed = src.duplicates_allowed, care_about_existing_wounds = TRUE)
	SHOULD_BE_PURE(TRUE)

	if (!istype(limb))
		return FALSE

	if (random_roll && !can_be_randomly_generated)
		return FALSE

	if (!wounding_types_valid(suggested_wounding_type))
		return FALSE

	if (care_about_existing_wounds)
		for (var/datum/wound/preexisting_wound as anything in limb.wounds)
			var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[preexisting_wound.type]
			if (pregen_data.wound_series == wound_series)
				if (preexisting_wound.severity >= initial(wound_path_to_generate.severity))
					return FALSE

	if (!ignore_cannot_bleed && ((required_limb_biostate & BIO_BLOODED) && !limb.can_bleed()))
		return FALSE

	if (!biostate_valid(limb.biological_state))
		return FALSE

	if (!(limb.body_zone in viable_zones))
		return FALSE

	// мы принимаем повышения и понижения тяжести, но нет смысла в избыточности. Это уже должно было быть проверено там, где рана была создана и применена (см.: код повреждения частей тела), но мы делаем дополнительную проверку
	// на случай, если мы когда-нибудь напрямую добавляем раны
	if (!duplicates_allowed)
		for (var/datum/wound/preexisting_wound as anything in limb.wounds)
			if (preexisting_wound.type == wound_path_to_generate && (preexisting_wound != old_wound))
				return FALSE
	return TRUE

/// Возвращает true, если мы имеем данные биологические состояния, или ЛЮБОЕ из них, если check_for_any равно true. False в противном случае.
/datum/wound_pregen_data/proc/biostate_valid(biostate)
	if (require_any_biostate)
		if (!(biostate & required_limb_biostate))
			return FALSE
	else if (!((biostate & required_limb_biostate) == required_limb_biostate)) // проверяем на все
		return FALSE

	return TRUE

/**
 * Простой геттер для [weight], с предоставленными аргументами для возможности кастомного поведения.
 *
 * Аргументы:
 * * obj/item/bodypart/limb: Конечность, к которой мы рассматриваем возможность добавления. Может быть null.
 * * woundtype: Тип ранения предполагаемой атаки, которая создала бы нас. Может быть null.
 * * damage: Сырой урон, который вызвал бы нас. Может быть null.
 * * attack_direction: Направление атаки, которая вызвала бы нас. Может быть null.
 * * damage_source: Сущность, которая вызвала бы нас. Может быть null.
 *
 * Возвращает:
 * Наш вес.
 */
/datum/wound_pregen_data/proc/get_weight(obj/item/bodypart/limb, woundtype, damage, attack_direction, damage_source)
	return weight

/// Возвращает TRUE, если мы используем WOUND_ALL или наш тип ранения
/datum/wound_pregen_data/proc/wounding_types_valid(suggested_wounding_type)
	if (required_wounding_type == WOUND_ALL)
		return TRUE
	return suggested_wounding_type == required_wounding_type

/**
 * Простой геттер для [threshold_minimum], с предоставленными аргументами для возможности кастомного поведения.
 *
 * Аргументы:
 * * obj/item/bodypart/part: Конечность, к которой мы рассматриваем возможность добавления.
 * * attack_direction: Направление атаки, которая создала бы нас. Может быть null.
 * * damage_source: Источник урона, который вызвал бы нас. Может быть null.
 */
/datum/wound_pregen_data/proc/get_threshold_for(obj/item/bodypart/part, attack_direction, damage_source)
	return threshold_minimum

/// Возвращает новый экземпляр нашего датума раны.
/datum/wound_pregen_data/proc/generate_instance(obj/item/bodypart/limb, ...)
	RETURN_TYPE(/datum/wound)

	return new wound_path_to_generate

/datum/wound_pregen_data/Destroy(force)
	var/error_message = "[src], одиночный экземпляр предварительно сгенерированных данных раны, был уничтожен! Этого не должно происходить!"
	if (force)
		error_message += " ПРИМЕЧАНИЕ: Этот Destroy() был вызван с force == TRUE. Этот экземпляр будет удален и заменен новым."
	stack_trace(error_message)

	if (!force)
		return QDEL_HINT_LETMELIVE

	. = ..()

	GLOB.all_wound_pregen_data[wound_path_to_generate] = new src.type // восстанавливаем
