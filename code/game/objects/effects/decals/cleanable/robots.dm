/obj/effect/decal/cleanable/blood/gibs/robot_debris
	name = "robot debris"
	desc = "Это бесполезная куча хлама... <i>или нет?</i>"
	gender = PLURAL
	icon = 'icons/mob/silicon/robots.dmi'
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6", "gib7")
	has_overlay = FALSE
	squishy = FALSE
	color = null

/obj/effect/decal/cleanable/blood/gibs/robot_debris/get_ru_names()
	return list(
		NOMINATIVE = "обломки робота",
		GENITIVE = "обломков робота",
		DATIVE = "обломкам робота",
		ACCUSATIVE = "обломки робота",
		INSTRUMENTAL = "обломками робота",
		PREPOSITIONAL = "обломках робота",
	)

/obj/effect/decal/cleanable/blood/gibs/robot_debris/get_default_blood_type()
	return get_blood_type(BLOOD_TYPE_OIL)

/obj/effect/decal/cleanable/blood/gibs/robot_debris/create_splatter()
	if(prob(40))
		return ..()

/obj/effect/decal/cleanable/blood/gibs/robot_debris/spread_movement_effects(datum/move_loop/has_target/source)
	if(NeverShouldHaveComeHere(loc))
		return
	if (prob(40))
		new /obj/effect/decal/cleanable/blood/splatter(loc, null, GET_ATOM_BLOOD_DNA(src))
	else if (prob(10))
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(3, 1, src)
		s.start()

// Doesn't have overlay support as of now
/obj/effect/decal/cleanable/blood/gibs/robot_debris/update_blood_color()
	color = null

/obj/effect/decal/cleanable/blood/gibs/robot_debris/limb
	icon_state = "gibarm"
	random_icon_states = list("gibarm", "gibleg")

/obj/effect/decal/cleanable/blood/gibs/robot_debris/up
	icon_state = "gibup"
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6", "gib7","gibup","gibup")

/obj/effect/decal/cleanable/blood/gibs/robot_debris/down
	icon_state = "gibdown"
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6", "gib7","gibdown","gibdown")

/obj/effect/decal/cleanable/blood/oil
	name = "motor oil"
	// This is fetched in /datum/blood_type/oil/set_up_blood() for all blood decals with default desc
	desc = "Оно чёрное и жирное. Похоже, Бипски снова наделал грязи."
	gender = NEUTER
	color = /datum/blood_type/oil::color // For mapper sanity

/obj/effect/decal/cleanable/blood/oil/get_ru_names()
	return list(
		NOMINATIVE = "машинное масло",
		GENITIVE = "машинного масла",
		DATIVE = "машинному маслу",
		ACCUSATIVE = "машинное масло",
		INSTRUMENTAL = "машинным маслом",
		PREPOSITIONAL = "машинном масле",
	)

/obj/effect/decal/cleanable/blood/oil/get_default_blood_type()
	return get_blood_type(BLOOD_TYPE_OIL)

/obj/effect/decal/cleanable/blood/oil/slippery/Initialize(mapload, list/datum/disease/diseases, list/blood_or_dna)
	. = ..()
	AddComponent(/datum/component/slippery, 80, (NO_SLIP_WHEN_WALKING | SLIDE))

/obj/effect/decal/cleanable/blood/splatter/oil
	name = "motor oil"
	gender = NEUTER
	color = /datum/blood_type/oil::color

/obj/effect/decal/cleanable/blood/splatter/oil/get_ru_names()
	return list(
		NOMINATIVE = "машинное масло",
		GENITIVE = "машинного масла",
		DATIVE = "машинному маслу",
		ACCUSATIVE = "машинное масло",
		INSTRUMENTAL = "машинным маслом",
		PREPOSITIONAL = "машинном масле",
	)

/obj/effect/decal/cleanable/blood/splatter/oil/get_default_blood_type()
	return get_blood_type(BLOOD_TYPE_OIL)
