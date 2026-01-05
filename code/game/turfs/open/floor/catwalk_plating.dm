/**
 * ## catwalk flooring
 *
 * They show what's underneath their catwalk flooring (pipes and the like)
 * you can screwdriver it to interact with the underneath stuff without destroying the tile...
 * unless you want to!
 */
/turf/open/floor/catwalk_floor	//the base type, meant to look like a maintenance panel
	icon = 'icons/turf/floors/catwalk_plating.dmi'
	icon_state = "maint_above"
	name = "catwalk floor"
	desc = "Решётчатый настил, открывающий вид на коммуникации. Инженеры его обожают!"
	gender = MALE
	baseturfs = /turf/open/floor/plating
	floor_tile = /obj/item/stack/tile/catwalk_tile
	layer = CATWALK_LAYER
	footstep = FOOTSTEP_CATWALK
	overfloor_placed = TRUE
	underfloor_accessibility = UNDERFLOOR_VISIBLE
	rust_resistance = RUST_RESISTANCE_BASIC
	var/covered = TRUE
	var/catwalk_type = "maint"

/turf/open/floor/catwalk_floor/get_ru_names()
	return alist(
		NOMINATIVE = "мостик",
		GENITIVE = "мостика",
		DATIVE = "мостику",
		ACCUSATIVE = "мостик",
		INSTRUMENTAL = "мостиком",
		PREPOSITIONAL = "мостике",
	)

/turf/open/floor/catwalk_floor/examine(mob/user)
	. = ..()

	if(covered)
		. += span_notice("Вы можете <b>открутить</b> покрытие, чтобы открыть доступ к коммуникациям.")
	else
		. += span_notice("Вы можете <b>прикрутить</b> покрытие, чтобы скрыть коммуникации.")
		. += span_notice("На краю виднеется <b>небольшая трещина</b>.")

/turf/open/floor/catwalk_floor/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	covered = !covered
	if(!covered)
		underfloor_accessibility = UNDERFLOOR_INTERACTABLE
		layer = LOW_FLOOR_LAYER
		icon_state = "[catwalk_type]_below"
		ADD_TRAIT(src, TRAIT_UNCOVERED_TURF, INNATE_TRAIT)
	else
		underfloor_accessibility = UNDERFLOOR_VISIBLE
		icon_state = "[catwalk_type]_above"
		layer = initial(layer)
		REMOVE_TRAIT(src, TRAIT_UNCOVERED_TURF, INNATE_TRAIT)

	levelupdate()
	user.balloon_alert(user, "[!covered ? "покрытие снято" : "покрытие установлено"]")
	tool.play_tool_sound(src)
	update_appearance()

/turf/open/floor/catwalk_floor/update_overlays()
	. = ..()
	if (!covered)
		. += mutable_appearance(icon, "[catwalk_type]_overlay", CATWALK_LAYER, src, FLOOR_PLANE, appearance_flags = KEEP_APART)

/turf/open/floor/catwalk_floor/crowbar_act(mob/user, obj/item/crowbar)
	if(covered)
		user.balloon_alert(user, "сначала нужно снять покрытие!")
		return FALSE
	. = ..()

//Reskins! More fitting with most of our tiles, and appear as a radial on the base type
/turf/open/floor/catwalk_floor/iron
	name = "iron plated catwalk floor"
	icon_state = "iron_above"
	floor_tile = /obj/item/stack/tile/catwalk_tile/iron
	catwalk_type = "iron"

/turf/open/floor/catwalk_floor/iron/get_ru_names()
	return alist(
		NOMINATIVE = "железный мостик",
		GENITIVE = "железного мостика",
		DATIVE = "железному мостику",
		ACCUSATIVE = "железный мостик",
		INSTRUMENTAL = "железным мостиком",
		PREPOSITIONAL = "железном мостике",
	)

/turf/open/floor/catwalk_floor/iron_white
	name = "white plated catwalk floor"
	icon_state = "whiteiron_above"
	floor_tile = /obj/item/stack/tile/catwalk_tile/iron_white
	catwalk_type = "whiteiron"

/turf/open/floor/catwalk_floor/iron_white/get_ru_names()
	return alist(
		NOMINATIVE = "белый железный мостик",
		GENITIVE = "белого железного мостика",
		DATIVE = "белому железному мостику",
		ACCUSATIVE = "белый железный мостик",
		INSTRUMENTAL = "белым железным мостиком",
		PREPOSITIONAL = "белом железном мостике",
	)

/turf/open/floor/catwalk_floor/iron_dark
	name = "dark plated catwalk floor"
	icon_state = "darkiron_above"
	floor_tile = /obj/item/stack/tile/catwalk_tile/iron_dark
	catwalk_type = "darkiron"

/turf/open/floor/catwalk_floor/iron_dark/get_ru_names()
	return alist(
		NOMINATIVE = "тёмный железный мостик",
		GENITIVE = "тёмного железного мостика",
		DATIVE = "тёмному железному мостику",
		ACCUSATIVE = "тёмный железный мостик",
		INSTRUMENTAL = "тёмным железным мостиком",
		PREPOSITIONAL = "тёмном железном мостике",
	)

/turf/open/floor/catwalk_floor/titanium
	name = "titanium plated catwalk floor"
	icon_state = "titanium_above"
	floor_tile = /obj/item/stack/tile/catwalk_tile/titanium
	catwalk_type = "titanium"
	rust_resistance = RUST_RESISTANCE_TITANIUM

/turf/open/floor/catwalk_floor/titanium/get_ru_names()
	return alist(
		NOMINATIVE = "титановый мостик",
		GENITIVE = "титанового мостика",
		DATIVE = "титановому мостику",
		ACCUSATIVE = "титановый мостик",
		INSTRUMENTAL = "титановым мостиком",
		PREPOSITIONAL = "титановом мостике",
	)

/turf/open/floor/catwalk_floor/iron_smooth //the original green type
	name = "smooth plated catwalk floor"
	icon_state = "smoothiron_above"
	floor_tile = /obj/item/stack/tile/catwalk_tile/iron_smooth
	catwalk_type = "smoothiron"

/turf/open/floor/catwalk_floor/iron_smooth/get_ru_names()
	return alist(
		NOMINATIVE = "гладкий железный мостик",
		GENITIVE = "гладкого железного мостика",
		DATIVE = "гладкому железному мостику",
		ACCUSATIVE = "гладкий железный мостик",
		INSTRUMENTAL = "гладким железным мостиком",
		PREPOSITIONAL = "гладком железном мостике",
	)

//Airless variants of the above
/turf/open/floor/catwalk_floor/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/catwalk_floor/iron/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/catwalk_floor/iron_white/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/catwalk_floor/iron_dark/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/catwalk_floor/iron_dark/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/catwalk_floor/titanium/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/catwalk_floor/iron_smooth/airless
	initial_gas_mix = AIRLESS_ATMOS
