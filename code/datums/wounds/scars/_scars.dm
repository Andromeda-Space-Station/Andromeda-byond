/**
 * Шрамы - это косметические данные, которые присваиваются частям тела после заживления ран. Каждый тип раны и её степень тяжести имеют собственное описание того, как выглядит шрам,
 * и затем каждая часть тела имеет список "конкретных местоположений", таких как локоть, запястье или где бы то ни было, где может появиться шрам, чтобы сделать его более интересным, чем просто "правая рука".
 *
 *
 * Аргументы:
 * *
 */
/datum/scar
	var/obj/item/bodypart/limb // Часть тела
	var/mob/living/carbon/victim // Пострадавший
	/// Степень тяжести шрама, полученная из наихудшей степени тяжести раны до её заживления (см.: порезы). Определяет, насколько видимым/выраженным является описание шрама.
	var/severity
	/// Описание шрама для осмотра
	var/description
	/// Строка, детализирующая конкретную часть части тела, на которой находится шрам, для атмосферности. См. [/datum/scar/proc/generate]
	var/precise_location

	/// Предполагается, что эти шрамы являются следствием маскировки генокрадов, а не постоянными или от ран. Как таковые, они удаляются при сбросе маскировки генокрадов и игнорируются системой сохранения.
	var/fake = FALSE
	/// На каком расстоянии в клетках кто-то может увидеть этот шрам, увеличивается с тяжестью. Одежда, покрывающая эту конечность, будет уменьшать видимость на 1 за каждый предмет, кроме головы/лица, где проверка является бинарной "маска закрывает лицо".
	var/visibility = 2
	/// Может ли этот шрам быть фактически скрыт одеждой
	var/coverable = TRUE
	/// Если мы постоянный шрам или можем им стать, мы сохраняемся в этом слоте персонажа
	var/persistent_character_slot = 0

	/// Биологические состояния, которые требуются от конечности, чтобы нанести на неё наш шрам.
	var/required_limb_biostate
	/// Если FALSE, мы будем проверять, имеет ли конечность ВСЕ наши биологические состояния, а не ЛЮБОЕ из них.
	var/check_any_biostates

/datum/scar/Destroy(force)
	if(limb)
		LAZYREMOVE(limb.scars, src) // Лениво удаляем этот шрам из списка шрамов конечности
	if(victim)
		LAZYREMOVE(victim.all_scars, src) // Лениво удаляем этот шрам из общего списка шрамов жертвы
	limb = null
	victim = null
	. = ..()

/**
 * generate() используется для фактического заполнения информации о шраме в соответствии с переданной конечностью и раной.
 *
 * После создания шрама вызовите эту процедуру, нацелившись на изувеченную часть тела с помощью заданной раны, чтобы применить шрам.
 *
 * Аргументы:
 * * BP - Целевая часть тела
 * * W - Рана, используемая для генерации информации о тяжести и описании
 * * add_to_scars - Всегда должно быть TRUE, если вы не просто сохраняете шрам для последующего использования, как в случае с порезами, которые хотят сохранить шрам для наивысшей степени тяжести пореза, а не для степени тяжести, когда рана полностью зажила (вероятно, пониженной до умеренной)
 */
/datum/scar/proc/generate(obj/item/bodypart/BP, datum/wound/W, add_to_scars=TRUE)

	if (!W.can_scar) // Если рана не может оставить шрам
		qdel(src) // Удаляем этот объект шрама
		return

	var/datum/wound_pregen_data/pregen_data = GLOB.all_wound_pregen_data[W.type] // Получаем предварительно сгенерированные данные для этого типа раны
	if (!pregen_data)
		qdel(src)
		return

	required_limb_biostate = pregen_data.required_limb_biostate
	check_any_biostates = pregen_data.require_any_biostate

	limb = BP
	RegisterSignal(limb, COMSIG_QDELETING, PROC_REF(limb_gone))

	severity = W.severity
	if(limb.owner)
		victim = limb.owner
		persistent_character_slot = victim.mind?.original_character_slot_index
	if(add_to_scars)
		LAZYADD(limb.scars, src)
		if(victim)
			LAZYADD(victim.all_scars, src)

	var/scar_file = W.get_scar_file(BP, add_to_scars)
	var/scar_keyword = W.get_scar_keyword(BP, add_to_scars)
	if (!scar_file || !scar_keyword)
		qdel(src)
		return

	description = pick_list(scar_file, scar_keyword)
	if (!description)
		stack_trace("Не найдено корректного описания для шрама! файл: [scar_file] ключевое слово: [scar_keyword] рана: [W.type]")
		description = "сильное обезображивание"

	precise_location = pick_list_replacements(SCAR_LOC_FILE, limb.body_zone)
	switch(W.severity)
		if(WOUND_SEVERITY_MODERATE)
			visibility = 2
		if(WOUND_SEVERITY_SEVERE)
			visibility = 3
		if(WOUND_SEVERITY_CRITICAL)
			visibility = 5
		if(WOUND_SEVERITY_LOSS)
			visibility = 7
			precise_location = "ампутация"

/// Используется, когда мы финализируем шрам от заживающего пореза
/datum/scar/proc/lazy_attach(obj/item/bodypart/BP, datum/wound/W)
	LAZYADD(BP.scars, src)
	if(BP.owner)
		victim = BP.owner
		LAZYADD(victim.all_scars, src)

/// Используется для "загрузки" постоянного шрама
/datum/scar/proc/load(obj/item/bodypart/BP, version, description, specific_location, severity = WOUND_SEVERITY_SEVERE, required_limb_biostate = BIO_STANDARD_UNJOINTED, char_slot, check_any_biostates = FALSE)
	if(!BP.scarrable)
		qdel(src)
		return

	limb = BP
	RegisterSignal(limb, COMSIG_QDELETING, PROC_REF(limb_gone))
	if (isnull(check_any_biostates)) // чтобы не сломать старые шрамы. ПРИМЕЧАНИЕ: УДАЛИТЬ ПОСЛЕ ТОГО, КАК НОМЕР ВЕРСИИ ПРЕВЫСИТ 3
		check_any_biostates = FALSE
	if (check_any_biostates)
		if (!(limb.biological_state & required_limb_biostate))
			qdel(src)
			return
	else if (!((limb.biological_state & required_limb_biostate) == required_limb_biostate)) // проверяем на все
		qdel(src)
		return
	if(limb.owner)
		victim = limb.owner
		LAZYADD(victim.all_scars, src)

	src.severity = severity
	src.required_limb_biostate = required_limb_biostate
	persistent_character_slot = char_slot
	LAZYADD(limb.scars, src)

	src.description = description
	precise_location = specific_location
	switch(severity)
		if(WOUND_SEVERITY_MODERATE)
			visibility = 2
		if(WOUND_SEVERITY_SEVERE)
			visibility = 3
		if(WOUND_SEVERITY_CRITICAL)
			visibility = 5
		if(WOUND_SEVERITY_LOSS)
			visibility = 7
	return src

/datum/scar/proc/limb_gone()
	SIGNAL_HANDLER
	qdel(src)

/// Что будет показано в examine_more(), если этот шрам видим
/datum/scar/proc/get_examine_description(mob/viewer)
	if(!victim || !is_visible(viewer))
		return

	var/msg = "[victim.p_They()] [victim.p_have()] [description] на [victim.p_their()] [precise_location]."
	switch(severity)
		if(WOUND_SEVERITY_MODERATE)
			msg = span_tinynoticeital("[msg]")
		if(WOUND_SEVERITY_SEVERE)
			msg = span_smallnoticeital("[msg]")
		if(WOUND_SEVERITY_CRITICAL)
			msg = span_smallnoticeital("<b>[msg]</b>")
		if(WOUND_SEVERITY_LOSS)
			msg = "[victim.p_Their()] [limb.plaintext_zone] [description]." // другой формат
			msg = span_notice("<i><b>[msg]</b></i>")
	return "\t[msg]"

/// Виден ли шрам в данный момент смотрящему
/datum/scar/proc/is_visible(mob/viewer)
	if(!victim || !viewer)
		return
	if(get_dist(viewer, victim) > visibility)
		return

	if(!ishuman(victim) || isobserver(viewer) || victim == viewer)
		return TRUE

	var/mob/living/carbon/human/human_victim = victim
	if(istype(limb, /obj/item/bodypart/head))
		if(human_victim.obscured_slots & HIDEFACE)
			return FALSE
	else if(limb.scars_covered_by_clothes)
		var/num_covers = LAZYLEN(human_victim.get_clothing_on_part(limb))
		if(num_covers + get_dist(viewer, victim) >= visibility)
			return FALSE

	return TRUE

/// Используется для форматирования шрама для сохранения: либо для постоянных шрамов, либо для маскировок генокрадов
/datum/scar/proc/format()
	return "[SCAR_CURRENT_VERSION]|[limb.body_zone]|[description]|[precise_location]|[severity]|[required_limb_biostate]|[persistent_character_slot]|[check_any_biostates]"

/// Используется для форматирования шрама для сохранения в настройках для постоянных шрамов (ампутированных конечностей)
/datum/scar/proc/format_amputated(body_zone, scar_file = FLESH_SCAR_FILE)
	description = pick_list(scar_file, "dismember")
	return "[SCAR_CURRENT_VERSION]|[body_zone]|[description]|ампутировано|[WOUND_SEVERITY_LOSS]|[required_limb_biostate]|[persistent_character_slot]|[check_any_biostates]"
