/obj/item/stack/light_w
	name = "wired glass tile"
	singular_name = "wired glass floor tile"
	desc = "Стеклянная плитка, каким-то образом оплетённая проводами."
	icon = 'icons/obj/tiles.dmi'
	icon_state = "glass_wire"
	w_class = WEIGHT_CLASS_NORMAL
	force = 3
	throwforce = 5
	throw_speed = 3
	throw_range = 7
	obj_flags = CONDUCTS_ELECTRICITY
	max_amount = 60
	grind_results = list(/datum/reagent/silicon = 20, /datum/reagent/copper = 5)
	mats_per_unit = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT * 1.05, /datum/material/glass = SHEET_MATERIAL_AMOUNT * 1.05)
	merge_type = /obj/item/stack/light_w

/obj/item/stack/light_w/get_ru_names()
	return alist(
		NOMINATIVE = "проволочная стеклянная плитка",
		GENITIVE = "проволочной стеклянной плитки",
		DATIVE = "проволочной стеклянной плитке",
		ACCUSATIVE = "проволочную стеклянную плитку",
		INSTRUMENTAL = "проволочной стеклянной плиткой",
		PREPOSITIONAL = "проволочной стеклянной плитке"
	)

/obj/item/stack/light_w/examine(mob/user)
	. = ..()
	. += span_warning("[capitalize(declent_ru(NOMINATIVE))] выглядит незавершённой, добавьте <b>железо</b> для завершения.")

/obj/item/stack/light_w/attackby(obj/item/O, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(O, /obj/item/stack/sheet/iron))
		var/obj/item/stack/sheet/iron/M = O
		if (M.use(1))
			var/obj/item/L = new /obj/item/stack/tile/light(user.drop_location())
			to_chat(user, span_notice("Вы создаёте светящуюся стеклянную плитку."))
			if (!QDELETED(L))
				L.add_fingerprint(user)
			use(1)
		else
			to_chat(user, span_warning("Вам нужен один лист железа для завершения светящейся стеклянной плитки!"))
	else
		return ..()

/obj/item/stack/light_w/wirecutter_act(mob/living/user, obj/item/I)
	. = ..()
	var/atom/Tsec = user.drop_location()
	var/obj/item/stack/cable_coil/CC = new (Tsec, 5)
	if (!QDELETED(CC))
		CC.add_fingerprint(user)
	var/obj/item/stack/sheet/glass/G = new (Tsec)
	if (!QDELETED(G))
		G.add_fingerprint(user)
	use(1)
