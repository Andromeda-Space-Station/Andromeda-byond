/turf/closed/wall/mineral/cult
	name = "runed metal wall"
	desc = "Холодная металлическая стена, покрытая нечитаемыми символами. При их изучении начинает пульсировать голова."
	icon = 'icons/turf/walls/cult_wall.dmi'
	icon_state = "cult_wall-0"
	base_icon_state = "cult_wall"
	turf_flags = IS_SOLID
	smoothing_flags = SMOOTH_BITMASK
	canSmoothWith = null
	sheet_type = /obj/item/stack/sheet/runed_metal
	sheet_amount = 1
	girder_type = /obj/structure/girder/cult

/turf/closed/wall/mineral/cult/get_ru_names()
	return alist(
		NOMINATIVE = "руническая стена",
		GENITIVE = "рунической стены",
		DATIVE = "рунической стене",
		ACCUSATIVE = "руническую стену",
		INSTRUMENTAL = "рунической стеной",
		PREPOSITIONAL = "рунической стене"
	)

/turf/closed/wall/mineral/cult/Initialize(mapload)
	new /obj/effect/temp_visual/cult/turf(src)
	. = ..()

/turf/closed/wall/mineral/cult/devastate_wall()
	new sheet_type(get_turf(src), sheet_amount)

/turf/closed/wall/mineral/cult/artificer
	name = "runed stone wall"
	desc = "Холодная каменная стена, покрытая нечитаемыми символами. При их изучении начинает пульсировать голова."

/turf/closed/wall/mineral/cult/artificer/get_ru_names()
	return alist(
		NOMINATIVE = "каменная руническая стена",
		GENITIVE = "каменной рунической стены",
		DATIVE = "каменной рунической стене",
		ACCUSATIVE = "каменную руническую стену",
		INSTRUMENTAL = "каменной рунической стеной",
		PREPOSITIONAL = "каменной рунической стене"
	)

/turf/closed/wall/mineral/cult/artificer/break_wall()
	new /obj/effect/temp_visual/cult/turf(get_turf(src))
	return null //excuse me we want no runed metal here

/turf/closed/wall/mineral/cult/artificer/devastate_wall()
	new /obj/effect/temp_visual/cult/turf(get_turf(src))

/turf/closed/wall/ice
	icon = 'icons/turf/walls/icedmetal_wall.dmi'
	icon_state = "icedmetal_wall-0"
	base_icon_state = "icedmetal_wall"
	desc = "Стена, покрытая толстым слоем льда."
	turf_flags = IS_SOLID
	smoothing_flags = SMOOTH_BITMASK
	canSmoothWith = null
	rcd_memory = null
	hardness = 35
	slicing_duration = 150 //резка через лёд+металл
	bullet_sizzle = TRUE

/turf/closed/wall/rust
	//SDMM supports colors, this is simply for easier mapping
	WHEN_MAP(color = COLOR_ORANGE_BROWN)

/turf/closed/wall/rust/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/rust)

/turf/closed/wall/heretic_rust
	WHEN_MAP(color = COLOR_GREEN_GRAY)

/turf/closed/wall/heretic_rust/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/rust/heretic)

/turf/closed/wall/r_wall/rust
	//SDMM supports colors, this is simply for easier mapping
	WHEN_MAP(color = COLOR_ORANGE_BROWN)
	base_decon_state = "rusty_r_wall"

/turf/closed/wall/r_wall/rust/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/rust)

/turf/closed/wall/r_wall/heretic_rust
	WHEN_MAP(color = COLOR_GREEN_GRAY)

/turf/closed/wall/r_wall/heretic_rust/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/rust/heretic)

/turf/closed/wall/mineral/bronze
	name = "clockwork wall"
	desc = "Огромный кусок бронзы, украшенный как шестерни и механизмы."
	icon = 'icons/turf/walls/clockwork_wall.dmi'
	icon_state = "clockwork_wall-0"
	base_icon_state = "clockwork_wall"
	turf_flags = IS_SOLID
	smoothing_flags = SMOOTH_BITMASK
	sheet_type = /obj/item/stack/sheet/bronze
	sheet_amount = 2
	girder_type = /obj/structure/girder/bronze

/turf/closed/wall/mineral/bronze/get_ru_names()
	return alist(
		NOMINATIVE = "часовая стена",
		GENITIVE = "часовой стены",
		DATIVE = "часовой стене",
		ACCUSATIVE = "часовую стену",
		INSTRUMENTAL = "часовой стеной",
		PREPOSITIONAL = "часовой стене"
	)

/turf/closed/wall/rock
	name = "reinforced rock"
	desc = "Имеет металлические распорки, которые нужно вырезать сваркой, прежде чем можно будет добывать."
	icon = 'icons/turf/walls/reinforced_rock.dmi'
	icon_state = "porous_rock-0"
	base_icon_state = "porous_rock"
	turf_flags = NO_RUST
	sheet_amount = 1
	hardness = 50
	girder_type = null
	decon_type = /turf/closed/mineral/asteroid

/turf/closed/wall/rock/get_ru_names()
	return alist(
		NOMINATIVE = "укреплённая порода",
		GENITIVE = "укреплённой породы",
		DATIVE = "укреплённой породе",
		ACCUSATIVE = "укреплённую породу",
		INSTRUMENTAL = "укреплённой породой",
		PREPOSITIONAL = "укреплённой породе"
	)

/turf/closed/wall/rock/porous
	name = "reinforced porous rock"
	desc = "Эта порода содержит карманы с пригодным для дыхания воздухом. Она имеет металлические распорки для защиты от добычи."
	decon_type = /turf/closed/mineral/asteroid/porous

/turf/closed/wall/rock/porous/get_ru_names()
	return alist(
		NOMINATIVE = "укреплённая пористая порода",
		GENITIVE = "укреплённой пористой породы",
		DATIVE = "укреплённой пористой породе",
		ACCUSATIVE = "укреплённую пористую породу",
		INSTRUMENTAL = "укреплённой пористой породой",
		PREPOSITIONAL = "укреплённой пористой породе"
	)

/turf/closed/wall/space
	name = "illusionist wall"
	icon = 'icons/turf/space.dmi'
	icon_state = "space"
	plane = PLANE_SPACE
	turf_flags = NO_RUST
	smoothing_flags = NONE
	canSmoothWith = null
	smoothing_groups = null

/turf/closed/wall/space/get_ru_names()
	return alist(
		NOMINATIVE = "иллюзионистская стена",
		GENITIVE = "иллюзионистской стены",
		DATIVE = "иллюзионистской стене",
		ACCUSATIVE = "иллюзионистскую стену",
		INSTRUMENTAL = "иллюзионистской стеной",
		PREPOSITIONAL = "иллюзионистской стене"
	)

/turf/closed/wall/material/meat
	name = "living wall"
	baseturfs = /turf/open/floor/material/meat
	girder_type = null
	material_flags = MATERIAL_EFFECTS | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS

/turf/closed/wall/material/meat/get_ru_names()
	return alist(
		NOMINATIVE = "живая стена",
		GENITIVE = "живой стены",
		DATIVE = "живой стене",
		ACCUSATIVE = "живую стену",
		INSTRUMENTAL = "живой стеной",
		PREPOSITIONAL = "живой стене"
	)

/turf/closed/wall/material/meat/Initialize(mapload)
	. = ..()
	set_custom_materials(list(GET_MATERIAL_REF(/datum/material/meat) = SHEET_MATERIAL_AMOUNT))

/turf/closed/wall/material/meat/airless
	baseturfs = /turf/open/floor/material/meat/airless

/turf/closed/wall/tomb
	name = "tomb wall"
	desc = "Резная поверхность пыльной гробницы. Неясно, кто её построил."
	icon = 'icons/turf/walls/boss_wall.dmi'
	icon_state = "boss_wall-0"
	base_icon_state = "boss_wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_BOSS_WALLS
	canSmoothWith = SMOOTH_GROUP_BOSS_WALLS
	turf_flags = NO_RUST
	explosive_resistance = 50
	baseturfs = /turf/open/misc/asteroid/basalt/airless

/turf/closed/wall/tomb/get_ru_names()
	return alist(
		NOMINATIVE = "стена гробницы",
		GENITIVE = "стены гробницы",
		DATIVE = "стене гробницы",
		ACCUSATIVE = "стену гробницы",
		INSTRUMENTAL = "стеной гробницы",
		PREPOSITIONAL = "стене гробницы"
	)
