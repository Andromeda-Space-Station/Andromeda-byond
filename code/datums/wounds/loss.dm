/datum/wound_pregen_data/loss // ПОТЕРЯ
	abstract = FALSE

	wound_path_to_generate = /datum/wound/loss
	required_limb_biostate = NONE
	require_any_biostate = TRUE

	required_wounding_type = WOUND_ALL

	wound_series = WOUND_SERIES_LOSS_BASIC // СЕРИЯ_РАН_ПОТЕРЯ_БАЗОВАЯ

	threshold_minimum = WOUND_DISMEMBER_OUTRIGHT_THRESH // ПОРОГ_ПРЯМОЙ_АМПУТАЦИИ // фактически не используется, поскольку ампутация обрабатывается иначе, но можно присвоить, раз уж он есть

/datum/wound/loss
	name = "Ампутировано"
	desc = "ой, больно!!"

	sound_effect = 'sound/effects/dismember.ogg'
	severity = WOUND_SEVERITY_LOSS
	status_effect_type = null
	scar_keyword = "dismember" // "ампутация"
	wound_flags = null
	already_scarred = TRUE // Мы вручную назначаем шрамы для ампутаций через отсутствующие конечности в конце раунда и лечение админов

	/// Тип ранения атаки, которая вызвала нас. Используется для генерации описания нашего шрама. В настоящее время не используется, но существует в основном на случай добавления небиологических ран.
	var/loss_wounding_type

/// Наша специальная процедура для нашей специальной ампутации, тип ранения имеет значение только для текста, который мы имеем
/datum/wound/loss/proc/apply_dismember(obj/item/bodypart/dismembered_part, wounding_type = WOUND_SLASH, outright = FALSE, attack_direction)
	if(!istype(dismembered_part) || !dismembered_part.owner || !(dismembered_part.body_zone in get_viable_zones()) || isalien(dismembered_part.owner) || !dismembered_part.can_dismember()) // может_быть_ампутирована
		qdel(src)
		return

	set_victim(dismembered_part.owner)
	var/self_msg

	if(dismembered_part.body_zone == BODY_ZONE_CHEST)
		occur_text = "рассечена, вызывая выпадение внутренних органов [victim.p_their()]!"
		self_msg = "рассечена, вызывая выпадение ваших внутренних органов!"
	else
		occur_text = dismembered_part.get_dismember_message(wounding_type, outright)

	var/msg = span_bolddanger("[victim] [dismembered_part.plaintext_zone] [occur_text]")

	victim.visible_message(msg, span_userdanger("Ваша [dismembered_part.plaintext_zone] [self_msg ? self_msg : occur_text]"))

	loss_wounding_type = wounding_type

	set_limb(dismembered_part)
	second_wind()
	log_wound(victim, src)
	if(dismembered_part.can_bleed() && wounding_type != WOUND_BURN && victim.get_blood_volume())
		victim.spray_blood(attack_direction, severity)
	dismembered_part.dismember(wounding_type == WOUND_BURN ? BURN : BRUTE, wounding_type = wounding_type)
	qdel(src)
	return TRUE

/obj/item/bodypart/proc/get_dismember_message(wounding_type, outright)
	var/occur_text

	if(outright)
		switch(wounding_type)
			if(WOUND_BLUNT)
				occur_text = "прямо расплющена в отвратительную кашицу, полностью отделяя ее!"
			if(WOUND_SLASH)
				occur_text = "прямо отсечена, полностью отделяя ее!"
			if(WOUND_PIERCE)
				occur_text = "прямо разорвана на части, полностью отделяя ее!"
			if(WOUND_BURN)
				occur_text = "прямо сожжена дотла, превращаясь в пыль!"
	else
		var/bone_text = get_internal_description()
		var/tissue_text = get_external_description()

		switch(wounding_type)
			if(WOUND_BLUNT)
				occur_text = "разрушена через последнюю [bone_text], удерживающую ее вместе, полностью отделяя ее!"
			if(WOUND_SLASH)
				occur_text = "рассечена через последнюю [tissue_text], удерживающую ее вместе, полностью отделяя ее!"
			if(WOUND_PIERCE)
				occur_text = "пронзена через последнюю [tissue_text], удерживающую ее вместе, полностью отделяя ее!"
			if(WOUND_BURN)
				occur_text = "полностью сожжена дотла, превращаясь в пыль!"

	return occur_text
