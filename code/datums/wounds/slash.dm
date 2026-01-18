/*
	Режущие раны
*/

/datum/wound/slash
	name = "Порез"
	undiagnosed_name = "Порез"
	sound_effect = 'sound/items/weapons/slice.ogg'

/datum/wound/slash/get_self_check_description(self_aware)
	if(!limb.can_bleed())
		return ..()

	switch(severity)
		if(WOUND_SEVERITY_TRIVIAL)
			return span_danger("Она сочится кровью из маленького [LOWER_TEXT(undiagnosed_name || name)].")
		if(WOUND_SEVERITY_MODERATE)
			return span_warning("Она сочится кровью из [LOWER_TEXT(undiagnosed_name || name)].")
		if(WOUND_SEVERITY_SEVERE)
			return span_boldwarning("Она сочится кровью из серьезного [LOWER_TEXT(undiagnosed_name || name)]!")
		if(WOUND_SEVERITY_CRITICAL)
			return span_boldwarning("Она сочится кровью из крупного [LOWER_TEXT(undiagnosed_name || name)]!!")

/datum/wound_pregen_data/flesh_slash // ПЛОТЬ_ПОРЕЗ
	abstract = TRUE

	required_wounding_type = WOUND_SLASH
	required_limb_biostate = BIO_FLESH

	wound_series = WOUND_SERIES_FLESH_SLASH_BLEED // СЕРИЯ_РАН_ПЛОТЬ_ПОРЕЗ_КРОВОТЕЧЕНИЕ

/datum/wound/slash/flesh
	name = "Порез плоти"
	threshold_penalty = 5
	processes = TRUE
	treatable_tools = list(TOOL_CAUTERY)
	base_treat_time = 3 SECONDS
	wound_flags = (ACCEPTS_GAUZE|CAN_BE_GRASPED)

	default_scar_file = FLESH_SCAR_FILE

	/// Сколько крови мы начинаем терять, когда эта рана впервые нанесена
	var/initial_flow
	/// Когда у нас меньше этого количества кровотока, либо из-за лечения, либо из-за свертывания, мы понижаемся до более легкого пореза или рана заживает
	var/minimum_flow
	/// Насколько наш кровоток будет естественно уменьшаться в секунду, не только большие порезы кровоточат быстрее, но и свертываются медленнее (большее число = быстрее свертывается, отрицательное = раскрывается)
	var/clot_rate

	/// Как только кровоток падает ниже minimum_flow, мы понижаем ее до этого типа раны. Если нет, мы полностью выздоровели
	var/demotes_to

	/// Плохая система, которую я использую для отслеживания худшего шрама, который мы получили (поскольку мы можем понизиться, мы хотим самый большой шрам, который у нас был, а не тот, что был при излечении (вероятно, умеренный))
	var/datum/scar/highest_scar

/datum/wound/slash/flesh/Destroy()
	highest_scar = null

	return ..()

/datum/wound/slash/flesh/wound_injury(datum/wound/slash/flesh/old_wound = null, attack_direction = null)
	if(old_wound)
		set_blood_flow(max(old_wound.blood_flow, initial_flow))
		if(old_wound.severity > severity && old_wound.highest_scar)
			set_highest_scar(old_wound.highest_scar)
			old_wound.clear_highest_scar()
	else
		set_blood_flow(initial_flow)
		if(limb.can_bleed() && attack_direction && victim.get_blood_volume() > BLOOD_VOLUME_OKAY)
			victim.spray_blood(attack_direction, severity)

	if(!highest_scar)
		var/datum/scar/new_scar = new
		set_highest_scar(new_scar)
		new_scar.generate(limb, src, add_to_scars=FALSE)

	return ..()

/datum/wound/slash/flesh/proc/set_highest_scar(datum/scar/new_scar)
	if(highest_scar)
		UnregisterSignal(highest_scar, COMSIG_QDELETING)
	if(new_scar)
		RegisterSignal(new_scar, COMSIG_QDELETING, PROC_REF(clear_highest_scar))
	highest_scar = new_scar

/datum/wound/slash/flesh/proc/clear_highest_scar(datum/source)
	SIGNAL_HANDLER
	set_highest_scar(null)

/datum/wound/slash/flesh/remove_wound(ignore_limb, replaced)
	if(!replaced && highest_scar)
		already_scarred = TRUE
		highest_scar.lazy_attach(limb)
	return ..()

/datum/wound/slash/flesh/get_wound_description(mob/user)
	if(!limb.current_gauze)
		return ..()

	var/list/msg = list("Порезы на [victim.p_their()] [limb.plaintext_zone] обернуты ")
	// сколько жизни осталось в этих бинтах
	switch(limb.current_gauze.absorption_capacity)
		if(0 to 1.25)
			msg += "почти испорченными"
		if(1.25 to 2.75)
			msg += "сильно изношенными"
		if(2.75 to 4)
			msg += "слегка залитыми кровью"
		if(4 to INFINITY)
			msg += "чистыми"
	msg += " [limb.current_gauze.name]!"

	return "<B>[msg.Join()]</B>"

/datum/wound/slash/flesh/receive_damage(wounding_type, wounding_dmg, wound_bonus)
	if (!victim) // если мы ампутированы, мы все еще можем получать урон, нормально проверить здесь
		return

	if(victim.stat != DEAD && wound_bonus != CANT_WOUND && wounding_type == WOUND_SLASH) // нельзя колоть трупы, чтобы заставить их кровоточить быстрее таким образом
		adjust_blood_flow(WOUND_SLASH_DAMAGE_FLOW_COEFF * wounding_dmg) // КОЭФФИЦИЕНТ_КРОВОТОКА_УРОНА_ПОРЕЗА

	return ..()

/datum/wound/slash/flesh/drag_bleed_amount()
	// скажем, у нас 3 серьезных пореза с кровотоком 3 каждый, довольно разумно
	// сравните с тем, что было при 100 брута до этого, когда вы кровоточили (брут/100 * 2), = 2 крови за клетку
	var/bleed_amt = min(blood_flow * 0.1, 1) // 3 * 3 * 0.1 = 0.9 крови всего, меньше, чем раньше! доля здесь, конечно, .3 крови.

	if(limb.current_gauze) // марля останавливает все кровотечение от волочения на этой конечности, но быстрее изнашивает марлю
		limb.seep_gauze(bleed_amt * 0.33)
		return

	return bleed_amt

/datum/wound/slash/flesh/get_bleed_rate_of_change()
	// в основном, если вид не истекает кровью, рана застойная и не заживет сама по себе (но и не ухудшится)
	if(!limb.can_bleed())
		return BLOOD_FLOW_STEADY
	if(HAS_TRAIT(victim, TRAIT_BLOOD_FOUNTAIN))
		return BLOOD_FLOW_INCREASING
	if(limb.current_gauze || clot_rate > 0)
		return BLOOD_FLOW_DECREASING
	if(clot_rate < 0)
		return BLOOD_FLOW_INCREASING

/datum/wound/slash/flesh/handle_process(seconds_per_tick, times_fired)
	if (!victim || HAS_TRAIT(victim, TRAIT_STASIS))
		return

	// на случай, если у жертвы есть черта NOBLOOD, рана просто не будет свертываться сама по себе
	if(limb.can_bleed())
		if(clot_rate > 0)
			adjust_blood_flow(-clot_rate * seconds_per_tick)
			if(QDELETED(src))
				return

		if(HAS_TRAIT(victim, TRAIT_BLOOD_FOUNTAIN))
			adjust_blood_flow(0.25) // старый гепарин просто добавлял +2 к стекам кровотечения за тик, это добавляет 0.5 кровотока ко всем открытым порезам, что, вероятно, даже сильнее, если вы сможете сначала их порезать

	if(limb.current_gauze)
		var/gauze_power = limb.current_gauze.absorption_rate
		limb.seep_gauze(gauze_power * seconds_per_tick)
		adjust_blood_flow(-gauze_power * seconds_per_tick)

/* БЕРЕГИСЬ, СЛЕДУЮЩАЯ ЧУШЬ - БЕЗУМИЕ. bones.dm выглядит более похожим на то, что у меня в голове, и достаточно чист, не обращайте внимания на этот беспорядок */

/datum/wound/slash/flesh/check_grab_treatments(obj/item/tool, mob/user)
	if(istype(tool, /obj/item/gun/energy/laser))
		return TRUE
	if(tool.get_temperature()) // если мы используем что-то горячее, но не прижигатель, нам нужно сначала агрессивно схватить их, чтобы мы не попытались лечить того, кого мы режем лазером
		return TRUE
	return FALSE

/datum/wound/slash/flesh/treat(obj/item/tool, mob/user)
	if(istype(tool, /obj/item/gun/energy/laser))
		las_cauterize(tool, user)
	else if(tool.tool_behaviour == TOOL_CAUTERY || tool.get_temperature())
		tool_cauterize(tool, user)

/datum/wound/slash/flesh/try_handling(mob/living/user)
	if(user.pulling != victim || !HAS_TRAIT(user, TRAIT_WOUND_LICKER) || !victim.try_inject(user, injection_flags = INJECT_TRY_SHOW_ERROR_MESSAGE)) // ЛИЖУЩИЙ_РАНЫ
		return FALSE
	if(!isnull(user.hud_used?.zone_select) && user.zone_selected != limb.body_zone)
		return FALSE

	if(DOING_INTERACTION_WITH_TARGET(user, victim))
		to_chat(user, span_warning("Вы уже взаимодействуете с [victim]!"))
		return
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		if(carbon_user.is_mouth_covered()) // рот_закрыт
			to_chat(user, span_warning("Ваш рот закрыт, вы не можете зализать раны [victim]!"))
			return
		if(!carbon_user.get_organ_slot(ORGAN_SLOT_TONGUE)) // СЛОТ_ОРГАНА_ЯЗЫК
			to_chat(user, span_warning("Вы не можете зализывать раны без языка!")) // f в чате
			return

	lick_wounds(user)
	return TRUE

/// если фелинид зализывает этот порез, чтобы уменьшить кровотечение
/datum/wound/slash/flesh/proc/lick_wounds(mob/living/carbon/human/user)
	// передача односторонняя пациент -> фелинид, так как гугл сказал, что кошачья слюна антисептическая или что-то в этом роде, а также потому, что фелиниды уже рискуют быть избитыми за это, даже без подозрений, что они распространяют смертельный вирус
	for(var/datum/disease/iter_disease as anything in victim.diseases)
		if(iter_disease.spread_flags & (DISEASE_SPREAD_SPECIAL | DISEASE_SPREAD_NON_CONTAGIOUS)) // РАСПРОСТРАНЕНИЕ_БОЛЕЗНИ_СПЕЦИАЛЬНОЕ, РАСПРОСТРАНЕНИЕ_БОЛЕЗНИ_НЕЗАРАЗНОЕ
			continue
		user.ForceContractDisease(iter_disease)

	user.visible_message(span_notice("[user] начинает зализывать раны на [limb.plaintext_zone] [victim]."), span_notice("Вы начинаете зализывать раны на [limb.plaintext_zone] [victim]..."), ignored_mobs=victim)
	to_chat(victim, span_notice("[user] начинает зализывать раны на вашей [limb.plaintext_zone]."))
	if(!do_after(user, base_treat_time, target = victim, extra_checks = CALLBACK(src, PROC_REF(still_exists))))
		return

	user.visible_message(span_notice("[user] зализывает раны на [limb.plaintext_zone] [victim]."), span_notice("Вы зализываете некоторые раны на [limb.plaintext_zone] [victim]"), ignored_mobs=victim)
	to_chat(victim, span_green("[user] зализывает раны на вашей [limb.plaintext_zone]!"))
	var/mob/victim_stored = victim
	adjust_blood_flow(-0.5)

	if(blood_flow > minimum_flow)
		try_handling(user)
	else if(demotes_to)
		to_chat(user, span_green("Вы успешно снизили тяжесть порезов [user == victim_stored ? "своих" : "[victim_stored]"]."))

/datum/wound/slash/flesh/adjust_blood_flow(adjust_by, minimum)
	. = ..()
	if(blood_flow > WOUND_MAX_BLOODFLOW)
		blood_flow = WOUND_MAX_BLOODFLOW
	if(blood_flow < minimum_flow && !QDELETED(src))
		if(demotes_to)
			replace_wound(new demotes_to)
		else
			to_chat(victim, span_green("Порез на вашей [limb.plaintext_zone] [!limb.can_bleed() ? "зажил" : "перестал кровоточить"]!"))
			qdel(src)

/datum/wound/slash/flesh/on_xadone(power)
	. = ..()
	adjust_blood_flow(-0.03 * power) // я думаю, это минимум 3 силы, так что уменьшение кровотока на .09 за тик довольно хорошо за 0 усилий

/datum/wound/slash/flesh/on_synthflesh(reac_volume)
	. = ..()
	adjust_blood_flow(-0.075 * reac_volume) // 20ед. * 0.075 = -1.5 кровотока, довольно хорошо для таких небольших усилий

/// Если кто-то приставляет лазерный пистолет к нашему порезу, чтобы прижечь его
/datum/wound/slash/flesh/proc/las_cauterize(obj/item/gun/energy/laser/lasgun, mob/user)
	var/self_penalty_mult = (user == victim ? 1.25 : 1)
	user.visible_message(span_warning("[user] начинает наводить [lasgun] прямо на [limb.plaintext_zone] [victim]..."), span_userdanger("Вы начинаете наводить [lasgun] прямо на [user == victim ? "свою" : "[limb.plaintext_zone] [victim]"]..."))
	if(!do_after(user, base_treat_time  * self_penalty_mult, target = victim, extra_checks = CALLBACK(src, PROC_REF(still_exists))))
		return
	var/damage = lasgun.chambered.loaded_projectile.damage
	lasgun.chambered.loaded_projectile.wound_bonus -= 30
	lasgun.chambered.loaded_projectile.damage *= self_penalty_mult
	if(!lasgun.process_fire(victim, victim, TRUE, null, limb.body_zone))
		return
	victim.emote("scream")
	victim.visible_message(span_warning("Порезы на [limb.plaintext_zone] [victim] покрываются рубцами!"))
	adjust_blood_flow(-1 * (damage / (5 * self_penalty_mult))) // 20 / 5 = 4 кровотока удалено, неплохо

/// Если кто-то использует либо инструмент для прижигания, либо что-то горячее, чтобы прижечь этот порез
/datum/wound/slash/flesh/proc/tool_cauterize(obj/item/I, mob/user)
	var/improv_penalty_mult = (I.tool_behaviour == TOOL_CAUTERY ? 1 : 1.25) // на 25% дольше и менее эффективно, если вы не используете настоящий прижигатель
	var/self_penalty_mult = (user == victim ? 1.5 : 1) // на 50% дольше и менее эффективно, если вы делаете это себе

	var/treatment_delay = base_treat_time * self_penalty_mult * improv_penalty_mult

	if(HAS_TRAIT(src, TRAIT_WOUND_SCANNED))
		treatment_delay *= 0.5
		user.visible_message(span_danger("[user] начинает профессионально прижигать [limb.plaintext_zone] [victim] с помощью [I]..."), span_warning("Вы начинаете прижигать [user == victim ? "свою" : "[limb.plaintext_zone] [victim]"] с помощью [I], держа в памяти указания голо-изображения..."))
	else
		user.visible_message(span_danger("[user] начинает прижигать [limb.plaintext_zone] [victim] с помощью [I]..."), span_warning("Вы начинаете прижигать [user == victim ? "свою" : "[limb.plaintext_zone] [victim]"] с помощью [I]..."))

	playsound(user, 'sound/items/handling/surgery/cautery1.ogg', 75, TRUE)

	if(!do_after(user, treatment_delay, target = victim, extra_checks = CALLBACK(src, PROC_REF(still_exists))))
		return

	playsound(user, 'sound/items/handling/surgery/cautery2.ogg', 75, TRUE)

	var/bleeding_wording = (!limb.can_bleed() ? "порезов" : "кровотечения")
	user.visible_message(span_green("[user] прижигает часть [bleeding_wording] на [victim]."), span_green("Вы прижигаете часть [bleeding_wording] на [victim]."))
	victim.apply_damage(2 + severity, BURN, limb, wound_bonus = CANT_WOUND)
	if(prob(30))
		victim.emote("scream")
	var/blood_cauterized = (0.6 / (self_penalty_mult * improv_penalty_mult))
	var/mob/victim_stored = victim
	adjust_blood_flow(-blood_cauterized)

	if(blood_flow > minimum_flow)
		try_treating(I, user)

	else if(demotes_to)
		to_chat(user, span_green("Вы успешно снизили тяжесть порезов [user == victim_stored ? "своих" : "[victim_stored]"]."))

/datum/wound/slash/get_limb_examine_description()
	return span_warning("Плоть на этой конечности выглядит сильно порезанной.")

/datum/wound/slash/flesh/moderate
	name = "Глубокий порез"
	desc = "Кожа пациента была сильно ободрана, вызывая умеренную потерю крови."
	treat_text = "Наложите повязку или швы на рану. \
		Затем следует еда и период отдыха."
	treat_text_short = "Наложите повязку или швы."
	examine_desc = "имеет открытый порез"
	occur_text = "разрезана, медленно сочится кровь"
	sound_effect = 'sound/effects/wounds/blood1.ogg'
	severity = WOUND_SEVERITY_MODERATE
	initial_flow = 2
	minimum_flow = 0.5
	clot_rate = 0.05
	series_threshold_penalty = 10
	status_effect_type = /datum/status_effect/wound/slash/flesh/moderate
	scar_keyword = "slashmoderate" // "порезумеренный"

	simple_treat_text = "<b>Перевязка</b> раны уменьшит потерю крови, поможет ране закрыться быстрее самостоятельно и ускорит период восстановления крови. Саму рану можно медленно <b>зашить</b>."
	homemade_treat_text = "<b>Чай</b> стимулирует естественные системы заживления организма, слегка ускоряя свертывание. Саму рану также можно промыть в раковине или душе. Другие средства не нужны."

/datum/wound/slash/flesh/moderate/update_descriptions()
	if(!limb.can_bleed())
		occur_text = "разрезана"

/datum/wound_pregen_data/flesh_slash/abrasion // ССАДИНА
	abstract = FALSE

	wound_path_to_generate = /datum/wound/slash/flesh/moderate

	threshold_minimum = 20

/datum/wound/slash/flesh/severe
	name = "Обширное рассечение тканей"
	desc = "Кожа пациента разорвана начисто, позволяя значительной потере крови."
	treat_text = "Быстро наложите повязку или швы на рану, \
		или используйте средства для свертывания крови или прижигание. \
		Затем следует прием препаратов железа или солевой глюкозный раствор и период отдыха."
	treat_text_short = "Наложите повязку, швы, средства для свертывания или прижигание."
	examine_desc = "имеет серьезный порез"
	occur_text = "разорвана, вены брызжут кровью"
	sound_effect = 'sound/effects/wounds/blood2.ogg'
	severity = WOUND_SEVERITY_SEVERE
	initial_flow = 3.25
	minimum_flow = 2.75
	clot_rate = 0.03
	series_threshold_penalty = 25
	demotes_to = /datum/wound/slash/flesh/moderate
	status_effect_type = /datum/status_effect/wound/slash/flesh/severe
	scar_keyword = "slashsevere" // "порезсерьезный"

	simple_treat_text = "<b>Перевязка</b> раны необходима и уменьшит потерю крови. После этого рану можно <b>зашить</b>, предпочтительно пока пациент отдыхает и/или держится за свою рану."
	homemade_treat_text = "Простыни можно разорвать, чтобы сделать <b>самодельную марлю</b>. <b>Мука, поваренная соль или соль, смешанная с водой</b>, нанесенные непосредственно, помогут остановить поток, хотя несмешанная соль раздразит кожу и ухудшит естественное заживление. Отдых и удержание раны также уменьшат кровотечение."

/datum/wound_pregen_data/flesh_slash/laceration // РАЗРЫВ
	abstract = FALSE

	wound_path_to_generate = /datum/wound/slash/flesh/severe

	threshold_minimum = 50

/datum/wound/slash/flesh/severe/update_descriptions()
	if(!limb.can_bleed())
		occur_text = "разорвана"

/datum/wound/slash/flesh/critical
	name = "Критическое рассечение тканей"
	desc = "Кожа пациента полностью разорвана, наряду со значительной потерей ткани. Крайняя потеря крови быстро приведет к смерти без вмешательства."
	treat_text = "Немедленно наложите повязку или швы на рану, \
		или используйте средства для свертывания крови или прижигание. \
		Затем следует контролируемое переливание крови."
	treat_text_short = "Наложите повязку, швы, средства для свертывания или прижигание."
	examine_desc = "иссечена до кости, дико разбрызгивая кровь"
	occur_text = "разорвана, дико разбрызгивая кровь"
	sound_effect = 'sound/effects/wounds/blood3.ogg'
	severity = WOUND_SEVERITY_CRITICAL
	initial_flow = 4
	minimum_flow = 3.85
	clot_rate = -0.015 // критические порезы активно ухудшаются, а не улучшаются
	threshold_penalty = 15
	demotes_to = /datum/wound/slash/flesh/severe
	status_effect_type = /datum/status_effect/wound/slash/flesh/critical
	scar_keyword = "slashcritical" // "порезкритический"
	wound_flags = (ACCEPTS_GAUZE | MANGLES_EXTERIOR | CAN_BE_GRASPED)

	simple_treat_text = "<b>Перевязка</b> раны имеет первостепенное значение, как и обращение за прямой медицинской помощью - <b>Смерть</b> наступит, если лечение будет отложено хоть сколько-нибудь, из-за недостатка <b>кислорода</b>, убивающего пациента, поэтому <b>Еда, Железо и солевой раствор</b> всегда рекомендуются после лечения. Эта рана не закроется сама по себе."
	homemade_treat_text = "Простыни можно разорвать, чтобы сделать <b>самодельную марлю</b>. <b>Мука, соль и соленая вода</b>, нанесенные местно, помогут. Падение на землю и удержание раны уменьшит кровоток."

/datum/wound/slash/flesh/critical/update_descriptions()
	if (!limb.can_bleed())
		occur_text = "разорвана"

/datum/wound_pregen_data/flesh_slash/avulsion // АВУЛЬСИЯ
	abstract = FALSE

	wound_path_to_generate = /datum/wound/slash/flesh/critical
	threshold_minimum = 80

/datum/wound/slash/flesh/moderate/many_cuts
	name = "Множественные поверхностные порезы"
	desc = "Кожа пациента имеет множество мелких порезов и царапин, вызывающих умеренную потерю крови."
	examine_desc = "имеет кучу мелких порезов"
	occur_text = "много раз порезана, оставляя множество мелких царапин."

/datum/wound_pregen_data/flesh_slash/abrasion/cuts // ПОРЕЗЫ
	abstract = FALSE
	can_be_randomly_generated = FALSE

	wound_path_to_generate = /datum/wound/slash/flesh/moderate/many_cuts

// Подтип для рассечения (заклинание еретика)
/datum/wound/slash/flesh/critical/cleave // РАССЕЧЕНИЕ
	name = "Проклятое рассечение"
	examine_desc = "разорвана, дико разбрызгивая кровь"
	clot_rate = 0.01

/datum/wound/slash/flesh/critical/cleave/update_descriptions()
	if(!limb.can_bleed())
		occur_text = "разорвана"

/datum/wound_pregen_data/flesh_slash/avulsion/clear
	abstract = FALSE
	can_be_randomly_generated = FALSE

	wound_path_to_generate = /datum/wound/slash/flesh/critical/cleave
