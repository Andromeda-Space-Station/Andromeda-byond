/*
	ОЖОГИ
*/

/datum/wound/burn
	name = "Ожог"
	undiagnosed_name = "Ожоги"
	sound_effect = 'sound/effects/wounds/sizzle1.ogg'

/datum/wound/burn/flesh
	name = "Ожог плоть"
	processes = TRUE
	threshold_penalty = 15

	default_scar_file = FLESH_SCAR_FILE // ФАЙЛ_ШРАМОВ_ПЛОТИ

	// Переменные повреждения плоти
	/// Сколько повреждений нашей плоти у нас в настоящее время. Как только и это, и инфекция достигнут 0, рана считается зажившей
	var/flesh_damage = 5
	/// Наш текущий счетчик того, сколько регенерации плоти у нас накопилось от регенеративной сетки/синтетической плоти/чего-либо еще, уменьшается каждый тик и снижает flesh_damage
	var/flesh_healing = 0

	// Переменные инфекции (только для серьезных и критических)
	/// Как быстро размножается инфекция на этом ожоге, если у нас нет дезинфицирующего средства
	var/infection_rate = 0
	/// Наш текущий уровень инфекции
	var/infection = 0
	/// Наш текущий уровень санитарной обработки/анти-инфекции, от дезинфицирующих средств/спирта/УФ-ламп. Пока положителен, полностью останавливает и медленно обращает эффекты инфекции каждый тик
	var/sanitization = 0

	/// Как только мы достигнем инфекции выше WOUND_INFECTION_SEPTIC, мы получим столько предупреждений, прежде чем конечность будет полностью парализована (вам придется игнорировать действительно плохой ожог действительно долгое время, чтобы это произошло)
	var/strikes_to_lose_limb = 3 // УДАРОВ_ДО_ПОТЕРИ_КОНЕЧНОСТИ

/datum/wound/burn/flesh/handle_process(seconds_per_tick, times_fired)

	if (!victim || HAS_TRAIT(victim, TRAIT_STASIS))
		return

	. = ..()
	if(strikes_to_lose_limb <= 0) // мы уже достигли сепсиса, больше нечего делать
		victim.adjust_tox_loss(0.25 * seconds_per_tick)
		if(SPT_PROB(0.5, seconds_per_tick))
			victim.visible_message(span_danger("Инфекция на остатках [limb.plaintext_zone] [victim] сдвигается и пузырится тошнотворно!"), span_warning("Вы чувствуете, как инфекция на остатках вашей [limb.plaintext_zone] течет по вашим венам!"), vision_distance = COMBAT_MESSAGE_RANGE)
		return

	for(var/datum/reagent/reagent as anything in victim.reagents.reagent_list)
		if(reagent.chemical_flags & REAGENT_AFFECTS_WOUNDS) // РЕАГЕНТ_ВЛИЯЕТ_НА_РАНЫ
			reagent.on_burn_wound_processing(src)

	if(HAS_TRAIT(victim, TRAIT_VIRUS_RESISTANCE)) // УСТОЙЧИВОСТЬ_К_ВИРУСАМ
		sanitization += 0.9
	if(HAS_TRAIT(victim, TRAIT_IMMUNODEFICIENCY)) // ИММУНОДЕФИЦИТ
		infection += 0.05
		sanitization = max(sanitization - 0.15, 0)
		if(infection_rate <= 0.15 && prob(50))
			infection_rate += 0.001
	if(limb.current_gauze)
		limb.seep_gauze(WOUND_BURN_SANITIZATION_RATE * seconds_per_tick) // СКОРОСТЬ_САНИТАЦИИ_ОЖОГА

	if(flesh_healing > 0) // хорошие повязки умножают длительность заживления плоти
		var/bandage_factor = limb.current_gauze?.burn_cleanliness_bonus || 1 // бонус_чистоты_ожога
		flesh_damage = max(flesh_damage - (0.5 * seconds_per_tick), 0)
		flesh_healing = max(flesh_healing - (0.5 * bandage_factor * seconds_per_tick), 0) // хорошие повязки умножают длительность заживления плоти

	// если у нас небольшая/отсутствующая инфекция, конечность имеет небольшие ожоговые повреждения, и наше питание хорошее, заживляем немного плоти
	if(infection <= WOUND_INFECTION_MODERATE && (limb.burn_dam < 5) && (victim.nutrition >= NUTRITION_LEVEL_FED)) // УРОВЕНЬ_ИНФЕКЦИИ_УМЕРЕННЫЙ, УРОВЕНЬ_ПИТАНИЯ_СЫТЫЙ
		flesh_healing += 0.2

	// вот проверка, очистились ли мы
	if((flesh_damage <= 0) && (infection <= WOUND_INFECTION_MODERATE))
		to_chat(victim, span_green("Ожоги на вашей [limb.plaintext_zone] очистились!"))
		qdel(src)
		return

	// санитарная обработка проверяется после проверки очистки, но до фактических негативных эффектов, потому что мы замораживаем эффекты инфекции, пока у нас есть санитарная обработка
	if(sanitization > 0)
		var/bandage_factor = limb.current_gauze?.burn_cleanliness_bonus || 1
		infection = max(infection - (WOUND_BURN_SANITIZATION_RATE * seconds_per_tick), 0)
		sanitization = max(sanitization - (WOUND_BURN_SANITIZATION_RATE * bandage_factor * seconds_per_tick), 0)
		return

	infection += infection_rate * seconds_per_tick
	switch(infection)
		if(0 to WOUND_INFECTION_MODERATE)
			return

		if(WOUND_INFECTION_MODERATE to WOUND_INFECTION_SEVERE) // СЕРЬЕЗНЫЙ
			if(SPT_PROB(15, seconds_per_tick))
				victim.adjust_tox_loss(0.2)
				if(prob(6))
					to_chat(victim, span_warning("Волдыри на вашей [limb.plaintext_zone] сочатся странным гноем..."))

		if(WOUND_INFECTION_SEVERE to WOUND_INFECTION_CRITICAL)
			if(!disabling)
				if(SPT_PROB(1, seconds_per_tick))
					to_chat(victim, span_warning("<b>Ваша [limb.plaintext_zone] полностью блокируется, пока вы боретесь за контроль над инфекцией!</b>"))
					set_disabling(TRUE)
					return
			else if(SPT_PROB(4, seconds_per_tick))
				to_chat(victim, span_notice("Вы восстанавливаете чувствительность в вашей [limb.plaintext_zone], но она все еще в ужасном состоянии!"))
				set_disabling(FALSE)
				return

			if(SPT_PROB(10, seconds_per_tick))
				victim.adjust_tox_loss(0.5)

		if(WOUND_INFECTION_CRITICAL to WOUND_INFECTION_SEPTIC) // СЕПТИЧЕСКИЙ
			if(!disabling)
				if(SPT_PROB(1.5, seconds_per_tick))
					to_chat(victim, span_warning("<b>Вы внезапно теряете все ощущения гниющей инфекции в вашей [limb.plaintext_zone]!</b>"))
					set_disabling(TRUE)
					return
			else if(SPT_PROB(1.5, seconds_per_tick))
				to_chat(victim, span_notice("Вы снова едва чувствуете свою [limb.plaintext_zone], и вам приходится напрягаться, чтобы сохранить моторный контроль!"))
				set_disabling(FALSE)
				return

			if(SPT_PROB(2.48, seconds_per_tick))
				if(prob(20))
					to_chat(victim, span_warning("Вы размышляете о жизни без вашей [limb.plaintext_zone]..."))
					victim.adjust_tox_loss(0.75)
				else
					victim.adjust_tox_loss(1)

		if(WOUND_INFECTION_SEPTIC to INFINITY)
			if(SPT_PROB(0.5 * infection, seconds_per_tick))
				strikes_to_lose_limb--
				switch(strikes_to_lose_limb)
					if(2 to INFINITY)
						to_chat(victim, span_deadsay("<b>Инфекция в вашей [limb.plaintext_zone] буквально сочится, вы чувствуете себя ужасно!</b>"))
					if(1)
						to_chat(victim, span_deadsay("<b>Инфекция почти полностью захватила вашу [limb.plaintext_zone]!</b>"))
					if(0)
						to_chat(victim, span_deadsay("<b>Последние нервные окончания в вашей [limb.plaintext_zone] увядают, поскольку инфекция полностью парализует суставной соединитель.</b>"))
						threshold_penalty *= 2 // чертовски легко уничтожить
						set_disabling(TRUE)

/datum/wound/burn/flesh/set_disabling(new_value)
	. = ..()
	if(new_value && strikes_to_lose_limb <= 0)
		treat_text_short = "Немедленно ампутировать или заменить конечность, либо поместить пациента в криогенную камеру."
	else
		treat_text_short = initial(treat_text_short)

/datum/wound/burn/flesh/get_wound_description(mob/user)
	if(strikes_to_lose_limb <= 0)
		return span_deadsay("<B>[victim.p_Their()] [limb.plaintext_zone] полностью заблокирована и не функционирует.</B>")

	var/list/condition = list("[victim.p_Their()] [limb.plaintext_zone] [examine_desc]")
	if(limb.current_gauze)
		var/bandage_condition
		switch(limb.current_gauze.absorption_capacity)
			if(0 to 1.25)
				bandage_condition = "почти испорчена"
			if(1.25 to 2.75)
				bandage_condition = "сильно изношена"
			if(2.75 to 4)
				bandage_condition = "слегка испачкана"
			if(4 to INFINITY)
				bandage_condition = "чиста"

		condition += " под повязкой из [bandage_condition] [limb.current_gauze.name]."
	else
		switch(infection)
			if(WOUND_INFECTION_MODERATE to WOUND_INFECTION_SEVERE)
				condition += ", [span_deadsay("с ранними признаками инфекции.")]"
			if(WOUND_INFECTION_SEVERE to WOUND_INFECTION_CRITICAL)
				condition += ", [span_deadsay("с растущими скоплениями инфекции.")]"
			if(WOUND_INFECTION_CRITICAL to WOUND_INFECTION_SEPTIC)
				condition += ", [span_deadsay("с полосами гниющей инфекции!")]"
			if(WOUND_INFECTION_SEPTIC to INFINITY)
				return span_deadsay("<B>[victim.p_Their()] [limb.plaintext_zone] представляет собой месиво обугленной кожи и зараженной гнили!</B>")
			else
				condition += "!"

	return "<B>[condition.Join()]</B>"

/datum/wound/burn/flesh/severity_text(simple = FALSE)
	. = ..()
	. += " Ожог / "
	switch(infection)
		if(-INFINITY to WOUND_INFECTION_MODERATE)
			. += "Отсутствует"
		if(WOUND_INFECTION_MODERATE to WOUND_INFECTION_SEVERE)
			. += "Умеренный"
		if(WOUND_INFECTION_SEVERE to WOUND_INFECTION_CRITICAL)
			. += "<b>Серьезный</b>"
		if(WOUND_INFECTION_CRITICAL to WOUND_INFECTION_SEPTIC)
			. += "<b>Критический</b>"
		if(WOUND_INFECTION_SEPTIC to INFINITY)
			. += "<b>Полный</b>"
	. += " Инфекция"

/datum/wound/burn/flesh/get_scanner_description(mob/user)
	if(strikes_to_lose_limb <= 0) // Неясно, может ли она опуститься ниже 0, лучше не рисковать
		var/oopsie = "Тип: [name]<br>Тяжесть: [severity_text()]"
		oopsie += "<div class='ml-3'>Уровень инфекции: [span_deadsay("Часть тела пострадала от полного сепсиса и должна быть удалена. Немедленно ампутируйте или замените конечность, либо поместите пациента в криотрубу.")]</div>"
		return oopsie

	. = ..()
	. += "<div class='ml-3'>"

	if(infection <= sanitization && flesh_damage <= flesh_healing)
		. += "Дальнейшее лечение не требуется: Ожоги скоро заживут."
	else
		switch(infection)
			if(WOUND_INFECTION_MODERATE to WOUND_INFECTION_SEVERE)
				. += "Уровень инфекции: Умеренный\n"
			if(WOUND_INFECTION_SEVERE to WOUND_INFECTION_CRITICAL)
				. += "Уровень инфекции: Серьезный\n"
			if(WOUND_INFECTION_CRITICAL to WOUND_INFECTION_SEPTIC)
				. += "Уровень инфекции: [span_deadsay("КРИТИЧЕСКИЙ")]\n"
			if(WOUND_INFECTION_SEPTIC to INFINITY)
				. += "Уровень инфекции: [span_deadsay("ПОТЕРЯ НЕМИНУЕМА")]\n"
		if(infection > sanitization)
			. += "\tХирургическая санация, антибиотики/стерилизаторы или регенеративная сетка избавят от инфекции. Парамедицинские УФ-ручки также эффективны.\n"

		if(flesh_damage > 0)
			. += "Обнаружено повреждение плоти: Нанесение мази, регенеративной сетки, Синтетической плоти или употребление \"Шахтерской мази\" восстановят поврежденную плоть. Хорошее питание, отдых и поддержание раны в чистоте также могут медленно восстановить плоть.\n"
	. += "</div>"

/*
	новые общие процедуры для ожогов
*/

/// Проверяет, находится ли рана в состоянии, когда мазь или плоть помогут
/datum/wound/burn/flesh/proc/can_be_ointmented_or_meshed()
	if(infection > 0 && sanitization < infection)
		return TRUE
	if(flesh_damage > 0 && flesh_healing <= flesh_damage)
		return TRUE
	return FALSE

/// Парамедицинские УФ-ручки
/datum/wound/burn/flesh/proc/uv(obj/item/flashlight/pen/paramedic/I, mob/user)
	if(!COOLDOWN_FINISHED(I, uv_cooldown)) // кд_ультрафиолета
		to_chat(user, span_notice("[I] все еще перезаряжается!"))
		return
	if(infection <= 0 || infection < sanitization)
		to_chat(user, span_notice("На [limb.plaintext_zone] [victim] нет инфекции для лечения!"))
		return

	user.visible_message(span_notice("[user] освещает ожоги на [limb] [victim] с помощью [I]."), span_notice("Вы освещаете ожоги на [user == victim ? "своей" : "[limb.plaintext_zone] [victim]"] с помощью [I]."), vision_distance=COMBAT_MESSAGE_RANGE)
	sanitization += I.uv_power // сила_ультрафиолета
	COOLDOWN_START(I, uv_cooldown, I.uv_cooldown_length) // длительность_кд_ультрафиолета

/datum/wound/burn/flesh/treat(obj/item/tool, mob/user)
	if(istype(tool, /obj/item/flashlight/pen/paramedic))
		uv(tool, user)

// люди жаловались, что ожоги не заживают на кроватях стазиса, поэтому в дополнение к проверке на излечение, они также получают особую способность очень медленно заживать на кроватях стазиса, если у них есть накопленные эффекты заживления
/datum/wound/burn/flesh/on_stasis(seconds_per_tick, times_fired)
	. = ..()
	if(strikes_to_lose_limb <= 0) // мы уже достигли сепсиса, больше нечего делать
		if(SPT_PROB(0.5, seconds_per_tick))
			victim.visible_message(span_danger("Инфекция на остатках [limb.plaintext_zone] [victim] сдвигается и пузырится тошнотворно!"), span_warning("Вы чувствуете, как инфекция на остатках вашей [limb.plaintext_zone] течет по вашим венам!"), vision_distance = COMBAT_MESSAGE_RANGE)
		return
	if(flesh_healing > 0)
		flesh_damage = max(flesh_damage - (0.1 * seconds_per_tick), 0)
	if((flesh_damage <= 0) && (infection <= 1))
		to_chat(victim, span_green("Ожоги на вашей [limb.plaintext_zone] очистились!"))
		qdel(src)
		return
	if(sanitization > 0)
		infection = max(infection - (0.1 * WOUND_BURN_SANITIZATION_RATE * seconds_per_tick), 0)

/datum/wound/burn/flesh/on_synthflesh(reac_volume)
	flesh_healing += reac_volume * 0.5 // пластырь на 20ед. вылечит 10 плоти стандартно

/datum/wound_pregen_data/flesh_burn
	abstract = TRUE

	required_wounding_type = WOUND_BURN
	required_limb_biostate = BIO_FLESH

	wound_series = WOUND_SERIES_FLESH_BURN_BASIC // СЕРИЯ_РАН_ПЛОТЬ_ОЖОГ_БАЗОВАЯ

/datum/wound/burn/get_limb_examine_description()
	return span_warning("Плоть на этой конечности выглядит сильно обожженной.")

// мы даже не заботимся об ожогах первой степени, сразу ко второй
/datum/wound/burn/flesh/moderate
	name = "Ожоги второй степени"
	desc = "Пациент страдает от значительных ожогов с легким проникновением в кожу, ослабляя целостность конечности и усиливая ощущение жжения."
	treat_text = "Нанесите местную мазь или регенеративную сетку на рану."
	treat_text_short = "Нанесите средство для заживления, такое как регенеративная сетка."
	examine_desc = "сильно обожжена и покрывается волдырями"
	occur_text = "вспыхивает яростными красными ожогами"
	severity = WOUND_SEVERITY_MODERATE
	damage_multiplier_penalty = 1.1
	series_threshold_penalty = 30 // ожоги вызывают значительное снижение целостности конечности по сравнению с другими ранами
	status_effect_type = /datum/status_effect/wound/burn/flesh/moderate
	flesh_damage = 5
	scar_keyword = "burnmoderate" // "ожогумеренный"

	simple_desc = "Кожа пациента обожжена, ослабляя конечность и умножая воспринимаемый урон!"
	simple_treat_text = "Мазь ускорит восстановление, как и регенеративная сетка. Риск инфекции незначителен."
	homemade_treat_text = "Здоровый чай ускорит восстановление. Соль, или предпочтительно смесь соли и воды, продезинфицирует рану, но первое вызовет раздражение кожи, увеличивая риск инфекции."

/datum/wound_pregen_data/flesh_burn/second_degree
	abstract = FALSE

	wound_path_to_generate = /datum/wound/burn/flesh/moderate

	threshold_minimum = 40

/datum/wound/burn/flesh/severe
	name = "Ожоги третьей степени"
	desc = "Пациент страдает от экстремальных ожогов с полным проникновением в кожу, создавая серьезный риск инфекции и значительно сниженную целостность конечности."
	treat_text = "Быстро нанесите средства для заживления, такие как Синтетическая плоть или регенеративная сетка, на рану. \
		Продезинфицируйте рану и хирургически очистите любую зараженную кожу, и оберните чистой марлей / используйте мазь, чтобы предотвратить дальнейшую инфекцию. \
		Если конечность заблокировалась, ее необходимо ампутировать, заменить или лечить криогеникой."
	treat_text_short = "Нанесите средство для заживления, такое как регенеративная сетка, Синтетическая плоть или криогеника, и продезинфицируйте / очистите. \
		Чистая марля или мазь замедлят скорость инфекции."
	examine_desc = "выглядит серьезно обугленной, с агрессивными красными пятнами"
	occur_text = "быстро обугливается, обнажая разрушенную ткань и распространяя яростные красные ожоги"
	severity = WOUND_SEVERITY_SEVERE
	damage_multiplier_penalty = 1.2
	series_threshold_penalty = 40
	status_effect_type = /datum/status_effect/wound/burn/flesh/severe
	treatable_by = list(/obj/item/flashlight/pen/paramedic)
	infection_rate = 0.07 // примерно 9 минут до достижения сепсиса без какого-либо лечения
	flesh_damage = 12.5
	scar_keyword = "burnsevere" // "ожогсерьезный"

	simple_desc = "Кожа пациента сильно обожжена, значительно ослабляя конечность и усугубляя дальнейший урон!!"
	simple_treat_text = "<b>Повязки ускорят восстановление</b>, как и <b>мазь или регенеративная сетка</b>. <b>Космоциллин, стерилизин и 'Шахтерская мазь'</b> помогут с инфекцией."
	homemade_treat_text = "<b>Здоровый чай</b> ускорит восстановление. <b>Соль</b>, или предпочтительно смесь <b>соли и воды</b>, продезинфицирует рану, но первое особенно вызовет раздражение кожи и обезвоживание, ускоряя инфекцию. <b>Космический очиститель</b> можно использовать как дезинфицирующее средство в крайнем случае."

/datum/wound_pregen_data/flesh_burn/third_degree
	abstract = FALSE

	wound_path_to_generate = /datum/wound/burn/flesh/severe

	threshold_minimum = 80

/datum/wound/burn/flesh/critical
	name = "Ожоги четвёртой степени"
	desc = "Пациент страдает от почти полной потери ткани и значительно обугленных мышц и костей, создавая угрожающий жизни риск инфекции и ничтожную целостность конечности."
	treat_text = "Немедленно нанесите средства для заживления, такие как Синтетическая плоть или регенеративная сетка, на рану. \
		Продезинфицируйте рану и хирургически очистите любую зараженную кожу, и оберните чистой марлей / используйте мазь, чтобы предотвратить дальнейшую инфекцию. \
		Если конечность заблокировалась, ее необходимо ампутировать, заменить или лечить криогеникой."
	treat_text_short = "Нанесите средство для заживления, такое как регенеративная сетка, Синтетическая плоть или криогеника, и продезинфицируйте / очистите. \
		Чистая марля или мазь замедлят скорость инфекции."
	examine_desc = "представляет собой разрушенное месиво побелевших костей, расплавленного жира и обугленной ткани"
	occur_text = "испаряется, когда плоть, кости и жир плавятся вместе в ужасающем месиве"
	severity = WOUND_SEVERITY_CRITICAL
	damage_multiplier_penalty = 1.3
	sound_effect = 'sound/effects/wounds/sizzle2.ogg'
	threshold_penalty = 25
	status_effect_type = /datum/status_effect/wound/burn/flesh/critical
	treatable_by = list(/obj/item/flashlight/pen/paramedic)
	infection_rate = 0.075 // примерно 4.33 минуты до достижения сепсиса без какого-либо лечения
	flesh_damage = 20
	scar_keyword = "burncritical" // "ожогкритический"

	simple_desc = "Кожа пациента уничтожена, а ткань обуглена, оставляя конечность с почти <b>никакой целостностью<b> и drastic шансом <b>инфекции<b>!!!"
	simple_treat_text = "Немедленно <b>перевяжите</b> рану и обработайте ее <b>мазью или регенеративной сеткой</b>. <b>Космоциллин, стерилизин или 'Шахтерская мазь'</b> отгонят инфекцию. Немедленно обратитесь за профессиональной помощью <b>немедленно</b>, прежде чем наступит сепсис и рана станет неизлечимой."
	homemade_treat_text = "<b>Здоровый чай</b> поможет с восстановлением. <b>Смесь соли и воды</b>, нанесенная местно, может помочь отогнать инфекцию в краткосрочной перспективе, но чистая поваренная соль НЕ рекомендуется. <b>Космический очиститель</b> можно использовать как дезинфицирующее средство в крайнем случае."

/datum/wound_pregen_data/flesh_burn/fourth_degree
	abstract = FALSE

	wound_path_to_generate = /datum/wound/burn/flesh/critical

	threshold_minimum = 140

///особая серьезная рана, вызванная вмешательством в спарринг или другими божественными наказаниями.
/datum/wound/burn/flesh/severe/brand
	name = "Священное клеймо"
	desc = "Пациент страдает от экстремальных ожогов от странного клейма, создавая серьезный риск инфекции и значительно сниженную целостность конечности."
	examine_desc = "выглядят так, будто священные символы болезненно выжжены на их плоти, оставляя серьезные ожоги."
	occur_text = "быстро обугливается в странный узор священных символов, выжженных в плоти."

	simple_desc = "На коже пациента странные отметины, значительно ослабляющие конечность и усугубляющие дальнейший урон!!"

/datum/wound_pregen_data/flesh_burn/third_degree/holy
	abstract = FALSE
	can_be_randomly_generated = FALSE

	wound_path_to_generate = /datum/wound/burn/flesh/severe/brand
/// особая серьезная рана, вызванная проклятым игровым автоматом.

/datum/wound/burn/flesh/severe/cursed_brand
	name = "Древнее клеймо"
	desc = "Пациент страдает от экстремальных ожогов с причудливо орнаментными клеймами, создавая серьезный риск инфекции и значительно сниженную целостность конечности."
	examine_desc = "выглядят так, будто орнаментные символы болезненно выжжены на их плоти, оставляя серьезные ожоги"
	occur_text = "быстро обугливается в узор, который можно описать только как скопление нескольких финансовых символов, выжженных в плоти"

/datum/wound/burn/flesh/severe/cursed_brand/get_limb_examine_description()
	return span_warning("Плоть на этой конечности имеет несколько орнаментных символов, выжженных на ней, с ямками по всей поверхности.")

/datum/wound_pregen_data/flesh_burn/third_degree/cursed_brand
	abstract = FALSE
	can_be_randomly_generated = FALSE

	wound_path_to_generate = /datum/wound/burn/flesh/severe/cursed_brand
