/obj/item/stack/tile/iron
	name = "floor tile"
	singular_name = "floor tile"
	desc = "Земля, по которой вы ходите."
	gender = FEMALE
	icon_state = "tile"
	inhand_icon_state = "tile"
	force = 6
	mats_per_unit = list(/datum/material/iron=SHEET_MATERIAL_AMOUNT*0.25)
	throwforce = 10
	obj_flags = CONDUCTS_ELECTRICITY
	turf_type = /turf/open/floor/iron
	armor_type = /datum/armor/tile_iron
	resistance_flags = FIRE_PROOF
	matter_amount = 1
	cost = HALF_SHEET_MATERIAL_AMOUNT * 0.5
	source = /datum/robot_energy_storage/material/iron
	merge_type = /obj/item/stack/tile/iron
	tile_reskin_types = list(
		/obj/item/stack/tile/iron/base,
		/obj/item/stack/tile/iron/edge,
		/obj/item/stack/tile/iron/half,
		/obj/item/stack/tile/iron/corner,
		/obj/item/stack/tile/iron/large,
		/obj/item/stack/tile/iron/small,
		/obj/item/stack/tile/iron/diagonal,
		/obj/item/stack/tile/iron/herringbone,
		/obj/item/stack/tile/iron/textured,
		/obj/item/stack/tile/iron/textured_edge,
		/obj/item/stack/tile/iron/textured_half,
		/obj/item/stack/tile/iron/textured_corner,
		/obj/item/stack/tile/iron/textured_large,
		/obj/item/stack/tile/iron/dark,
		/obj/item/stack/tile/iron/dark/smooth_edge,
		/obj/item/stack/tile/iron/dark/smooth_half,
		/obj/item/stack/tile/iron/dark/smooth_corner,
		/obj/item/stack/tile/iron/dark/smooth_large,
		/obj/item/stack/tile/iron/dark/small,
		/obj/item/stack/tile/iron/dark/diagonal,
		/obj/item/stack/tile/iron/dark/herringbone,
		/obj/item/stack/tile/iron/dark_side,
		/obj/item/stack/tile/iron/dark_corner,
		/obj/item/stack/tile/iron/checker,
		/obj/item/stack/tile/iron/dark/textured,
		/obj/item/stack/tile/iron/dark/textured_edge,
		/obj/item/stack/tile/iron/dark/textured_half,
		/obj/item/stack/tile/iron/dark/textured_corner,
		/obj/item/stack/tile/iron/dark/textured_large,
		/obj/item/stack/tile/iron/white,
		/obj/item/stack/tile/iron/white/smooth_edge,
		/obj/item/stack/tile/iron/white/smooth_half,
		/obj/item/stack/tile/iron/white/smooth_corner,
		/obj/item/stack/tile/iron/white/smooth_large,
		/obj/item/stack/tile/iron/white/small,
		/obj/item/stack/tile/iron/white/diagonal,
		/obj/item/stack/tile/iron/white/herringbone,
		/obj/item/stack/tile/iron/white_side,
		/obj/item/stack/tile/iron/white_corner,
		/obj/item/stack/tile/iron/cafeteria,
		/obj/item/stack/tile/iron/white/textured,
		/obj/item/stack/tile/iron/white/textured_edge,
		/obj/item/stack/tile/iron/white/textured_half,
		/obj/item/stack/tile/iron/white/textured_corner,
		/obj/item/stack/tile/iron/white/textured_large,
		/obj/item/stack/tile/iron/recharge_floor,
		/obj/item/stack/tile/iron/smooth,
		/obj/item/stack/tile/iron/smooth_edge,
		/obj/item/stack/tile/iron/smooth_half,
		/obj/item/stack/tile/iron/smooth_corner,
		/obj/item/stack/tile/iron/smooth_large,
		/obj/item/stack/tile/iron/terracotta,
		/obj/item/stack/tile/iron/terracotta/small,
		/obj/item/stack/tile/iron/terracotta/diagonal,
		/obj/item/stack/tile/iron/terracotta/herringbone,
		/obj/item/stack/tile/iron/kitchen,
		/obj/item/stack/tile/iron/kitchen/small,
		/obj/item/stack/tile/iron/kitchen/diagonal,
		/obj/item/stack/tile/iron/kitchen/herringbone,
		/obj/item/stack/tile/iron/chapel,
		/obj/item/stack/tile/iron/showroomfloor,
		/obj/item/stack/tile/iron/solarpanel,
		/obj/item/stack/tile/iron/freezer,
		/obj/item/stack/tile/iron/freezer/edge,
		/obj/item/stack/tile/iron/freezer/half,
		/obj/item/stack/tile/iron/freezer/corner,
		/obj/item/stack/tile/iron/freezer/large,
		/obj/item/stack/tile/iron/grimy,
		/obj/item/stack/tile/iron/sepia,
	)

/obj/item/stack/tile/iron/get_ru_names()
	return alist(
		NOMINATIVE = "железная плитка",
		GENITIVE = "железной плитки",
		DATIVE = "железной плитке",
		ACCUSATIVE = "железную плитку",
		INSTRUMENTAL = "железной плиткой",
		PREPOSITIONAL = "железной плитке",
	)

/obj/item/stack/tile/iron/two
	amount = 2

/obj/item/stack/tile/iron/four
	amount = 4

/datum/armor/tile_iron
	fire = 100
	acid = 70

/obj/item/stack/tile/iron/Initialize(mapload)
	. = ..()
	var/static/list/tool_behaviors = list(
		TOOL_WELDER = list(
			SCREENTIP_CONTEXT_LMB = "Сделать железные листы",
			SCREENTIP_CONTEXT_RMB = "Сделать железные прутья",
		),
	)
	AddElement(/datum/element/contextual_screentip_tools, tool_behaviors)

/obj/item/stack/tile/iron/welder_act(mob/living/user, obj/item/tool)
	if(get_amount() < 4)
		balloon_alert(user, "недостаточно плитки!")
		return
	if(tool.use_tool(src, user, delay = 0, volume = 40))
		var/obj/item/stack/sheet/iron/new_item = new(user.loc)
		user.visible_message(
			span_notice("[user.name] переплавляет [src] в листы при помощи [tool]."),
			blind_message = span_hear("Слышна сварка."),
			vision_distance = COMBAT_MESSAGE_RANGE,
			ignored_mobs = user
		)
		use(4)
		user.put_in_inactive_hand(new_item)
		return ITEM_INTERACT_SUCCESS

/obj/item/stack/tile/iron/welder_act_secondary(mob/living/user, obj/item/tool)
	if(get_amount() < 2)
		balloon_alert(user, "недостаточно плитки!")
		return
	if(tool.use_tool(src, user, delay = 0, volume = 40))
		var/obj/item/stack/rods/new_item = new(user.loc)
		user.visible_message(
			span_notice("[user.name] переплавляет [src] в прутья при помощи [tool]."),
			blind_message = span_hear("Слышна сварка."),
			vision_distance = COMBAT_MESSAGE_RANGE,
			ignored_mobs = user
		)
		use(2)
		user.put_in_inactive_hand(new_item)
		return ITEM_INTERACT_SUCCESS

/obj/item/stack/tile/iron/base //this subtype should be used for most stuff
	merge_type = /obj/item/stack/tile/iron/base

/obj/item/stack/tile/iron/base/cyborg //cant reskin these, fucks with borg code
	tile_reskin_types = null

/obj/item/stack/tile/iron/edge
	name = "edge tile"
	singular_name = "edge floor tile"
	icon_state = "tile_edge"
	turf_type = /turf/open/floor/iron/edge
	merge_type = /obj/item/stack/tile/iron/edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая железная плитка",
		GENITIVE = "краевой железной плитки",
		DATIVE = "краевой железной плитке",
		ACCUSATIVE = "краевую железную плитку",
		INSTRUMENTAL = "краевой железной плиткой",
		PREPOSITIONAL = "краевой железной плитке",
	)

/obj/item/stack/tile/iron/half
	name = "half tile"
	singular_name = "half floor tile"
	icon_state = "tile_half"
	turf_type = /turf/open/floor/iron/half
	merge_type = /obj/item/stack/tile/iron/half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая железная плитка",
		GENITIVE = "половинчатой железной плитки",
		DATIVE = "половинчатой железной плитке",
		ACCUSATIVE = "половинчатую железную плитку",
		INSTRUMENTAL = "половинчатой железной плиткой",
		PREPOSITIONAL = "половинчатой железной плитке",
	)

/obj/item/stack/tile/iron/corner
	name = "corner tile"
	singular_name = "corner floor tile"
	icon_state = "tile_corner"
	turf_type = /turf/open/floor/iron/corner
	merge_type = /obj/item/stack/tile/iron/corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая железная плитка",
		GENITIVE = "угловой железной плитки",
		DATIVE = "угловой железной плитке",
		ACCUSATIVE = "угловую железную плитку",
		INSTRUMENTAL = "угловой железной плиткой",
		PREPOSITIONAL = "угловой железной плитке",
	)

/obj/item/stack/tile/iron/large
	name = "large tile"
	singular_name = "large floor tile"
	icon_state = "tile_large"
	turf_type = /turf/open/floor/iron/large
	merge_type = /obj/item/stack/tile/iron/large

/obj/item/stack/tile/iron/large/get_ru_names()
	return alist(
		NOMINATIVE = "большая железная плитка",
		GENITIVE = "большой железной плитки",
		DATIVE = "большой железной плитке",
		ACCUSATIVE = "большую железную плитку",
		INSTRUMENTAL = "большой железной плиткой",
		PREPOSITIONAL = "большой железной плитке",
	)

/obj/item/stack/tile/iron/textured
	name = "textured tile"
	singular_name = "textured floor tile"
	icon_state = "tile_textured"
	turf_type = /turf/open/floor/iron/textured
	merge_type = /obj/item/stack/tile/iron/textured

/obj/item/stack/tile/iron/textured/get_ru_names()
	return alist(
		NOMINATIVE = "фактурная железная плитка",
		GENITIVE = "фактурной железной плитки",
		DATIVE = "фактурной железной плитке",
		ACCUSATIVE = "фактурную железную плитку",
		INSTRUMENTAL = "фактурной железной плиткой",
		PREPOSITIONAL = "фактурной железной плитке",
	)

/obj/item/stack/tile/iron/textured_edge
	name = "textured edge tile"
	singular_name = "edged textured floor tile"
	icon_state = "tile_textured_edge"
	turf_type = /turf/open/floor/iron/textured_edge
	merge_type = /obj/item/stack/tile/iron/textured_edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/textured_edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая фактурная железная плитка",
		GENITIVE = "краевой фактурной железной плитки",
		DATIVE = "краевой фактурной железной плитке",
		ACCUSATIVE = "краевую фактурную железную плитку",
		INSTRUMENTAL = "краевой фактурной железной плиткой",
		PREPOSITIONAL = "краевой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/textured_half
	name = "textured half tile"
	singular_name = "halved textured floor tile"
	icon_state = "tile_textured_half"
	turf_type = /turf/open/floor/iron/textured_half
	merge_type = /obj/item/stack/tile/iron/textured_half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/textured_half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая фактурная железная плитка",
		GENITIVE = "половинчатой фактурной железной плитки",
		DATIVE = "половинчатой фактурной железной плитке",
		ACCUSATIVE = "половинчатую фактурную железную плитку",
		INSTRUMENTAL = "половинчатой фактурной железной плиткой",
		PREPOSITIONAL = "половинчатой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/textured_corner
	name = "textured corner tile"
	singular_name = "cornered textured floor tile"
	icon_state = "tile_textured_corner"
	turf_type = /turf/open/floor/iron/textured_corner
	merge_type = /obj/item/stack/tile/iron/textured_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/textured_corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая фактурная железная плитка",
		GENITIVE = "угловой фактурной железной плитки",
		DATIVE = "угловой фактурной железной плитке",
		ACCUSATIVE = "угловую фактурную железную плитку",
		INSTRUMENTAL = "угловой фактурной железной плиткой",
		PREPOSITIONAL = "угловой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/textured_large
	name = "textured large tile"
	singular_name = "large textured floor tile"
	icon_state = "tile_textured_large"
	turf_type = /turf/open/floor/iron/textured_large
	merge_type = /obj/item/stack/tile/iron/textured_large

/obj/item/stack/tile/iron/textured_large/get_ru_names()
	return alist(
		NOMINATIVE = "большая фактурная железная плитка",
		GENITIVE = "большой фактурной железной плитки",
		DATIVE = "большой фактурной железной плитке",
		ACCUSATIVE = "большую фактурную железную плитку",
		INSTRUMENTAL = "большой фактурной железной плиткой",
		PREPOSITIONAL = "большой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/small
	name = "small tile"
	singular_name = "small floor tile"
	icon_state = "tile_small"
	turf_type = /turf/open/floor/iron/small
	merge_type = /obj/item/stack/tile/iron/small

/obj/item/stack/tile/iron/small/get_ru_names()
	return alist(
		NOMINATIVE = "маленькая железная плитка",
		GENITIVE = "маленькой железной плитки",
		DATIVE = "маленькой железной плитке",
		ACCUSATIVE = "маленькую железную плитку",
		INSTRUMENTAL = "маленькой железной плиткой",
		PREPOSITIONAL = "маленькой железной плитке",
	)

/obj/item/stack/tile/iron/diagonal
	name = "diagonal tile"
	singular_name = "diagonal floor tile"
	icon_state = "tile_diagonal"
	turf_type = /turf/open/floor/iron/diagonal
	merge_type = /obj/item/stack/tile/iron/diagonal

/obj/item/stack/tile/iron/diagonal/get_ru_names()
	return alist(
		NOMINATIVE = "диагональная железная плитка",
		GENITIVE = "диагональной железной плитки",
		DATIVE = "диагональной железной плитке",
		ACCUSATIVE = "диагональную железную плитку",
		INSTRUMENTAL = "диагональной железной плиткой",
		PREPOSITIONAL = "диагональной железной плитке",
	)

/obj/item/stack/tile/iron/herringbone
	name = "herringbone tile"
	singular_name = "herringbone floor tile"
	icon_state = "tile_herringbone"
	turf_type = /turf/open/floor/iron/herringbone
	merge_type = /obj/item/stack/tile/iron/herringbone

/obj/item/stack/tile/iron/herringbone/get_ru_names()
	return alist(
		NOMINATIVE = "железная плитка «ёлочка»",
		GENITIVE = "железной плитки «ёлочка»",
		DATIVE = "железной плитке «ёлочка»",
		ACCUSATIVE = "железную плитку «ёлочка»",
		INSTRUMENTAL = "железной плиткой «ёлочка»",
		PREPOSITIONAL = "железной плитке «ёлочка»",
	)

/obj/item/stack/tile/iron/dark
	name = "dark tile"
	singular_name = "dark floor tile"
	icon_state = "tile_dark"
	turf_type = /turf/open/floor/iron/dark
	merge_type = /obj/item/stack/tile/iron/dark

/obj/item/stack/tile/iron/dark/get_ru_names()
	return alist(
		NOMINATIVE = "тёмная железная плитка",
		GENITIVE = "тёмной железной плитки",
		DATIVE = "тёмной железной плитке",
		ACCUSATIVE = "тёмную железную плитку",
		INSTRUMENTAL = "тёмной железной плиткой",
		PREPOSITIONAL = "тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark/smooth_edge
	name = "dark edge tile"
	singular_name = "edged dark floor tile"
	icon_state = "tile_dark_edge"
	turf_type = /turf/open/floor/iron/dark/smooth_edge
	merge_type = /obj/item/stack/tile/iron/dark/smooth_edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/dark/smooth_edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая тёмная железная плитка",
		GENITIVE = "краевой тёмной железной плитки",
		DATIVE = "краевой тёмной железной плитке",
		ACCUSATIVE = "краевую тёмную железную плитку",
		INSTRUMENTAL = "краевой тёмной железной плиткой",
		PREPOSITIONAL = "краевой тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark/smooth_half
	name = "dark half tile"
	singular_name = "halved dark floor tile"
	icon_state = "tile_dark_half"
	turf_type = /turf/open/floor/iron/dark/smooth_half
	merge_type = /obj/item/stack/tile/iron/dark/smooth_half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/dark/smooth_half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая тёмная железная плитка",
		GENITIVE = "половинчатой тёмной железной плитки",
		DATIVE = "половинчатой тёмной железной плитке",
		ACCUSATIVE = "половинчатую тёмную железную плитку",
		INSTRUMENTAL = "половинчатой тёмной железной плиткой",
		PREPOSITIONAL = "половинчатой тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark/smooth_corner
	name = "dark corner tile"
	singular_name = "cornered dark floor tile"
	icon_state = "tile_dark_corner"
	turf_type = /turf/open/floor/iron/dark/smooth_corner
	merge_type = /obj/item/stack/tile/iron/dark/smooth_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/dark/smooth_corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая тёмная железная плитка",
		GENITIVE = "угловой тёмной железной плитки",
		DATIVE = "угловой тёмной железной плитке",
		ACCUSATIVE = "угловую тёмную железную плитку",
		INSTRUMENTAL = "угловой тёмной железной плиткой",
		PREPOSITIONAL = "угловой тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark/smooth_large
	name = "dark large tile"
	singular_name = "large dark floor tile"
	icon_state = "tile_dark_large"
	turf_type = /turf/open/floor/iron/dark/smooth_large
	merge_type = /obj/item/stack/tile/iron/dark/smooth_large

/obj/item/stack/tile/iron/dark/smooth_large/get_ru_names()
	return alist(
		NOMINATIVE = "большая тёмная железная плитка",
		GENITIVE = "большой тёмной железной плитки",
		DATIVE = "большой тёмной железной плитке",
		ACCUSATIVE = "большую тёмную железную плитку",
		INSTRUMENTAL = "большой тёмной железной плиткой",
		PREPOSITIONAL = "большой тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark_side
	name = "half dark tile"
	singular_name = "half dark floor tile"
	icon_state = "tile_darkside"
	turf_type = /turf/open/floor/iron/dark/side
	merge_type = /obj/item/stack/tile/iron/dark_side
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)

/obj/item/stack/tile/iron/dark_side/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая тёмная железная плитка",
		GENITIVE = "половинчатой тёмной железной плитки",
		DATIVE = "половинчатой тёмной железной плитке",
		ACCUSATIVE = "половинчатую тёмную железную плитку",
		INSTRUMENTAL = "половинчатой тёмной железной плиткой",
		PREPOSITIONAL = "половинчатой тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark_corner
	name = "quarter dark tile"
	singular_name = "quarter dark floor tile"
	icon_state = "tile_darkcorner"
	turf_type = /turf/open/floor/iron/dark/corner
	merge_type = /obj/item/stack/tile/iron/dark_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/dark_corner/get_ru_names()
	return alist(
		NOMINATIVE = "четвертная тёмная железная плитка",
		GENITIVE = "четвертной тёмной железной плитки",
		DATIVE = "четвертной тёмной железной плитке",
		ACCUSATIVE = "четвертную тёмную железную плитку",
		INSTRUMENTAL = "четвертной тёмной железной плиткой",
		PREPOSITIONAL = "четвертной тёмной железной плитке",
	)

/obj/item/stack/tile/iron/checker
	name = "checker tile"
	singular_name = "checker floor tile"
	icon_state = "tile_checker"
	turf_type = /turf/open/floor/iron/checker
	merge_type = /obj/item/stack/tile/iron/checker
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/checker/get_ru_names()
	return alist(
		NOMINATIVE = "шахматная плитка",
		GENITIVE = "шахматной плитки",
		DATIVE = "шахматной плитке",
		ACCUSATIVE = "шахматную плитку",
		INSTRUMENTAL = "шахматной плиткой",
		PREPOSITIONAL = "шахматной плитке",
	)

/obj/item/stack/tile/iron/dark/textured
	name = "dark textured tile"
	singular_name = "dark textured floor tile"
	icon_state = "tile_textured_dark"
	turf_type = /turf/open/floor/iron/dark/textured
	merge_type = /obj/item/stack/tile/iron/dark/textured

/obj/item/stack/tile/iron/dark/textured/get_ru_names()
	return alist(
		NOMINATIVE = "тёмная фактурная железная плитка",
		GENITIVE = "тёмной фактурной железной плитки",
		DATIVE = "тёмной фактурной железной плитке",
		ACCUSATIVE = "тёмную фактурную железную плитку",
		INSTRUMENTAL = "тёмной фактурной железной плиткой",
		PREPOSITIONAL = "тёмной фактурной железной плитке",
	)

/obj/item/stack/tile/iron/dark/textured_edge
	name = "dark textured edge tile"
	singular_name = "edged dark textured floor tile"
	icon_state = "tile_textured_dark_edge"
	turf_type = /turf/open/floor/iron/dark/textured_edge
	merge_type = /obj/item/stack/tile/iron/dark/textured_edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/dark/textured_edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая тёмная фактурная железная плитка",
		GENITIVE = "краевой тёмной фактурной железной плитки",
		DATIVE = "краевой тёмной фактурной железной плитке",
		ACCUSATIVE = "краевую тёмную фактурную железную плитку",
		INSTRUMENTAL = "краевой тёмной фактурной железной плиткой",
		PREPOSITIONAL = "краевой тёмной фактурной железной плитке",
	)

/obj/item/stack/tile/iron/dark/textured_half
	name = "dark textured half tile"
	singular_name = "halved dark textured floor tile"
	icon_state = "tile_textured_dark_half"
	turf_type = /turf/open/floor/iron/dark/textured_half
	merge_type = /obj/item/stack/tile/iron/dark/textured_half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/dark/textured_half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая тёмная фактурная железная плитка",
		GENITIVE = "половинчатой тёмной фактурной железной плитки",
		DATIVE = "половинчатой тёмной фактурной железной плитке",
		ACCUSATIVE = "половинчатую тёмную фактурную железную плитку",
		INSTRUMENTAL = "половинчатой тёмной фактурной железной плиткой",
		PREPOSITIONAL = "половинчатой тёмной фактурной железной плитке",
	)

/obj/item/stack/tile/iron/dark/textured_corner
	name = "dark textured corner tile"
	singular_name = "cornered dark textured floor tile"
	icon_state = "tile_textured_dark_corner"
	turf_type = /turf/open/floor/iron/dark/textured_corner
	merge_type = /obj/item/stack/tile/iron/dark/textured_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/dark/textured_corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая тёмная фактурная железная плитка",
		GENITIVE = "угловой тёмной фактурной железной плитки",
		DATIVE = "угловой тёмной фактурной железной плитке",
		ACCUSATIVE = "угловую тёмную фактурную железную плитку",
		INSTRUMENTAL = "угловой тёмной фактурной железной плиткой",
		PREPOSITIONAL = "угловой тёмной фактурной железной плитке",
	)

/obj/item/stack/tile/iron/dark/textured_large
	name = "dark textured large tile"
	singular_name = "large dark textured floor tile"
	icon_state = "tile_textured_dark_large"
	turf_type = /turf/open/floor/iron/dark/textured_large
	merge_type = /obj/item/stack/tile/iron/dark/textured_large

/obj/item/stack/tile/iron/dark/textured_large/get_ru_names()
	return alist(
		NOMINATIVE = "большая тёмная фактурная железная плитка",
		GENITIVE = "большой тёмной фактурной железной плитки",
		DATIVE = "большой тёмной фактурной железной плитке",
		ACCUSATIVE = "большую тёмную фактурную железную плитку",
		INSTRUMENTAL = "большой тёмной фактурной железной плиткой",
		PREPOSITIONAL = "большой тёмной фактурной железной плитке",
	)

/obj/item/stack/tile/iron/dark/small
	name = "dark small tile"
	singular_name = "dark small floor tile"
	icon_state = "tile_dark_small"
	turf_type = /turf/open/floor/iron/dark/small
	merge_type = /obj/item/stack/tile/iron/dark/small

/obj/item/stack/tile/iron/dark/small/get_ru_names()
	return alist(
		NOMINATIVE = "маленькая тёмная железная плитка",
		GENITIVE = "маленькой тёмной железной плитки",
		DATIVE = "маленькой тёмной железной плитке",
		ACCUSATIVE = "маленькую тёмную железную плитку",
		INSTRUMENTAL = "маленькой тёмной железной плиткой",
		PREPOSITIONAL = "маленькой тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark/diagonal
	name = "dark diagonal tile"
	singular_name = "dark diagonal floor tile"
	icon_state = "tile_dark_diagonal"
	turf_type = /turf/open/floor/iron/dark/diagonal
	merge_type = /obj/item/stack/tile/iron/dark/diagonal

/obj/item/stack/tile/iron/dark/diagonal/get_ru_names()
	return alist(
		NOMINATIVE = "диагональная тёмная железная плитка",
		GENITIVE = "диагональной тёмной железной плитки",
		DATIVE = "диагональной тёмной железной плитке",
		ACCUSATIVE = "диагональную тёмную железную плитку",
		INSTRUMENTAL = "диагональной тёмной железной плиткой",
		PREPOSITIONAL = "диагональной тёмной железной плитке",
	)

/obj/item/stack/tile/iron/dark/herringbone
	name = "dark herringbone tile"
	singular_name = "dark herringbone floor tile"
	icon_state = "tile_dark_herringbone"
	turf_type = /turf/open/floor/iron/dark/herringbone
	merge_type = /obj/item/stack/tile/iron/dark/herringbone

/obj/item/stack/tile/iron/dark/herringbone/get_ru_names()
	return alist(
		NOMINATIVE = "тёмная железная плитка «ёлочка»",
		GENITIVE = "тёмной железной плитки «ёлочка»",
		DATIVE = "тёмной железной плитке «ёлочка»",
		ACCUSATIVE = "тёмную железную плитку «ёлочка»",
		INSTRUMENTAL = "тёмной железной плиткой «ёлочка»",
		PREPOSITIONAL = "тёмной железной плитке «ёлочка»",
	)

/obj/item/stack/tile/iron/white
	name = "white tile"
	singular_name = "white floor tile"
	icon_state = "tile_white"
	turf_type = /turf/open/floor/iron/white
	merge_type = /obj/item/stack/tile/iron/white

/obj/item/stack/tile/iron/white/get_ru_names()
	return alist(
		NOMINATIVE = "белая железная плитка",
		GENITIVE = "белой железной плитки",
		DATIVE = "белой железной плитке",
		ACCUSATIVE = "белую железную плитку",
		INSTRUMENTAL = "белой железной плиткой",
		PREPOSITIONAL = "белой железной плитке",
	)

/obj/item/stack/tile/iron/white/smooth_edge
	name = "white edge tile"
	singular_name = "edged white floor tile"
	icon_state = "tile_white_edge"
	turf_type = /turf/open/floor/iron/white/smooth_edge
	merge_type = /obj/item/stack/tile/iron/white/smooth_edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/white/smooth_edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая белая железная плитка",
		GENITIVE = "краевой белой железной плитки",
		DATIVE = "краевой белой железной плитке",
		ACCUSATIVE = "краевую белую железную плитку",
		INSTRUMENTAL = "краевой белой железной плиткой",
		PREPOSITIONAL = "краевой белой железной плитке",
	)

/obj/item/stack/tile/iron/white/smooth_half
	name = "white half tile"
	singular_name = "halved white floor tile"
	icon_state = "tile_white_half"
	turf_type = /turf/open/floor/iron/white/smooth_half
	merge_type = /obj/item/stack/tile/iron/white/smooth_half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/white/smooth_half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая белая железная плитка",
		GENITIVE = "половинчатой белой железной плитки",
		DATIVE = "половинчатой белой железной плитке",
		ACCUSATIVE = "половинчатую белую железную плитку",
		INSTRUMENTAL = "половинчатой белой железной плиткой",
		PREPOSITIONAL = "половинчатой белой железной плитке",
	)

/obj/item/stack/tile/iron/white/smooth_corner
	name = "white corner tile"
	singular_name = "cornered white floor tile"
	icon_state = "tile_white_corner"
	turf_type = /turf/open/floor/iron/white/smooth_corner
	merge_type = /obj/item/stack/tile/iron/white/smooth_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/white/smooth_corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая белая железная плитка",
		GENITIVE = "угловой белой железной плитки",
		DATIVE = "угловой белой железной плитке",
		ACCUSATIVE = "угловую белую железную плитку",
		INSTRUMENTAL = "угловой белой железной плиткой",
		PREPOSITIONAL = "угловой белой железной плитке",
	)

/obj/item/stack/tile/iron/white/smooth_large
	name = "white large tile"
	singular_name = "large white floor tile"
	icon_state = "tile_white_large"
	turf_type = /turf/open/floor/iron/white/smooth_large
	merge_type = /obj/item/stack/tile/iron/white/smooth_large

/obj/item/stack/tile/iron/white/smooth_large/get_ru_names()
	return alist(
		NOMINATIVE = "большая белая железная плитка",
		GENITIVE = "большой белой железной плитки",
		DATIVE = "большой белой железной плитке",
		ACCUSATIVE = "большую белую железную плитку",
		INSTRUMENTAL = "большой белой железной плиткой",
		PREPOSITIONAL = "большой белой железной плитке",
	)

/obj/item/stack/tile/iron/white_side
	name = "half white tile"
	singular_name = "half white floor tile"
	icon_state = "tile_whiteside"
	turf_type = /turf/open/floor/iron/white/side
	merge_type = /obj/item/stack/tile/iron/white_side
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)

/obj/item/stack/tile/iron/white_side/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая белая железная плитка",
		GENITIVE = "половинчатой белой железной плитки",
		DATIVE = "половинчатой белой железной плитке",
		ACCUSATIVE = "половинчатую белую железную плитку",
		INSTRUMENTAL = "половинчатой белой железной плиткой",
		PREPOSITIONAL = "половинчатой белой железной плитке",
	)

/obj/item/stack/tile/iron/white_corner
	name = "quarter white tile"
	singular_name = "quarter white floor tile"
	icon_state = "tile_whitecorner"
	turf_type = /turf/open/floor/iron/white/corner
	merge_type = /obj/item/stack/tile/iron/white_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/white_corner/get_ru_names()
	return alist(
		NOMINATIVE = "четвертная белая железная плитка",
		GENITIVE = "четвертной белой железной плитки",
		DATIVE = "четвертной белой железной плитке",
		ACCUSATIVE = "четвертную белую железную плитку",
		INSTRUMENTAL = "четвертной белой железной плиткой",
		PREPOSITIONAL = "четвертной белой железной плитке",
	)

/obj/item/stack/tile/iron/cafeteria
	name = "cafeteria tile"
	singular_name = "cafeteria floor tile"
	icon_state = "tile_cafeteria"
	turf_type = /turf/open/floor/iron/cafeteria
	merge_type = /obj/item/stack/tile/iron/cafeteria
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/cafeteria/get_ru_names()
	return alist(
		NOMINATIVE = "плитка кафетерия",
		GENITIVE = "плитки кафетерия",
		DATIVE = "плитке кафетерия",
		ACCUSATIVE = "плитку кафетерия",
		INSTRUMENTAL = "плиткой кафетерия",
		PREPOSITIONAL = "плитке кафетерия",
	)

/obj/item/stack/tile/iron/white/textured
	name = "white textured tile"
	singular_name = "white textured floor tile"
	icon_state = "tile_textured_white"
	turf_type = /turf/open/floor/iron/white/textured
	merge_type = /obj/item/stack/tile/iron/white/textured

/obj/item/stack/tile/iron/white/textured/get_ru_names()
	return alist(
		NOMINATIVE = "белая фактурная железная плитка",
		GENITIVE = "белой фактурной железной плитки",
		DATIVE = "белой фактурной железной плитке",
		ACCUSATIVE = "белую фактурную железную плитку",
		INSTRUMENTAL = "белой фактурной железной плиткой",
		PREPOSITIONAL = "белой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/white/textured_edge
	name = "white textured edge tile"
	singular_name = "edged white textured floor tile"
	icon_state = "tile_textured_white_edge"
	turf_type = /turf/open/floor/iron/white/textured_edge
	merge_type = /obj/item/stack/tile/iron/white/textured_edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/white/textured_edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая белая фактурная железная плитка",
		GENITIVE = "краевой белой фактурной железной плитки",
		DATIVE = "краевой белой фактурной железной плитке",
		ACCUSATIVE = "краевую белую фактурную железную плитку",
		INSTRUMENTAL = "краевой белой фактурной железной плиткой",
		PREPOSITIONAL = "краевой белой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/white/textured_half
	name = "white textured half tile"
	singular_name = "halved white textured floor tile"
	icon_state = "tile_textured_white_half"
	turf_type = /turf/open/floor/iron/white/textured_half
	merge_type = /obj/item/stack/tile/iron/white/textured_half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/white/textured_half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая белая фактурная железная плитка",
		GENITIVE = "половинчатой белой фактурной железной плитки",
		DATIVE = "половинчатой белой фактурной железной плитке",
		ACCUSATIVE = "половинчатую белую фактурную железную плитку",
		INSTRUMENTAL = "половинчатой белой фактурной железной плиткой",
		PREPOSITIONAL = "половинчатой белой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/white/textured_corner
	name = "white textured corner tile"
	singular_name = "cornered white textured floor tile"
	icon_state = "tile_textured_white_corner"
	turf_type = /turf/open/floor/iron/white/textured_corner
	merge_type = /obj/item/stack/tile/iron/white/textured_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/white/textured_corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая белая фактурная железная плитка",
		GENITIVE = "угловой белой фактурной железной плитки",
		DATIVE = "угловой белой фактурной железной плитке",
		ACCUSATIVE = "угловую белую фактурную железную плитку",
		INSTRUMENTAL = "угловой белой фактурной железной плиткой",
		PREPOSITIONAL = "угловой белой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/white/textured_large
	name = "white textured large tile"
	singular_name = "large white textured floor tile"
	icon_state = "tile_textured_white_large"
	turf_type = /turf/open/floor/iron/white/textured_large
	merge_type = /obj/item/stack/tile/iron/white/textured_large

/obj/item/stack/tile/iron/white/textured_large/get_ru_names()
	return alist(
		NOMINATIVE = "большая белая фактурная железная плитка",
		GENITIVE = "большой белой фактурной железной плитки",
		DATIVE = "большой белой фактурной железной плитке",
		ACCUSATIVE = "большую белую фактурную железную плитку",
		INSTRUMENTAL = "большой белой фактурной железной плиткой",
		PREPOSITIONAL = "большой белой фактурной железной плитке",
	)

/obj/item/stack/tile/iron/white/small
	name = "white small tile"
	singular_name = "white small floor tile"
	icon_state = "tile_white_small"
	turf_type = /turf/open/floor/iron/white/small
	merge_type = /obj/item/stack/tile/iron/white/small

/obj/item/stack/tile/iron/white/small/get_ru_names()
	return alist(
		NOMINATIVE = "маленькая белая железная плитка",
		GENITIVE = "маленькой белой железной плитки",
		DATIVE = "маленькой белой железной плитке",
		ACCUSATIVE = "маленькую белую железную плитку",
		INSTRUMENTAL = "маленькой белой железной плиткой",
		PREPOSITIONAL = "маленькой белой железной плитке",
	)

/obj/item/stack/tile/iron/white/diagonal
	name = "white diagonal tile"
	singular_name = "white diagonal floor tile"
	icon_state = "tile_white_diagonal"
	turf_type = /turf/open/floor/iron/white/diagonal
	merge_type = /obj/item/stack/tile/iron/white/diagonal

/obj/item/stack/tile/iron/white/diagonal/get_ru_names()
	return alist(
		NOMINATIVE = "диагональная белая железная плитка",
		GENITIVE = "диагональной белой железной плитки",
		DATIVE = "диагональной белой железной плитке",
		ACCUSATIVE = "диагональную белую железную плитку",
		INSTRUMENTAL = "диагональной белой железной плиткой",
		PREPOSITIONAL = "диагональной белой железной плитке",
	)

/obj/item/stack/tile/iron/white/herringbone
	name = "white herringbone tile"
	singular_name = "white herringbone floor tile"
	icon_state = "tile_white_herringbone"
	turf_type = /turf/open/floor/iron/white/herringbone
	merge_type = /obj/item/stack/tile/iron/white/herringbone

/obj/item/stack/tile/iron/white/herringbone/get_ru_names()
	return alist(
		NOMINATIVE = "белая железная плитка «ёлочка»",
		GENITIVE = "белой железной плитки «ёлочка»",
		DATIVE = "белой железной плитке «ёлочка»",
		ACCUSATIVE = "белую железную плитку «ёлочка»",
		INSTRUMENTAL = "белой железной плиткой «ёлочка»",
		PREPOSITIONAL = "белой железной плитке «ёлочка»",
	)

/obj/item/stack/tile/iron/recharge_floor
	name = "recharge floor tile"
	singular_name = "recharge floor tile"
	icon_state = "tile_recharge"
	turf_type = /turf/open/floor/iron/recharge_floor
	merge_type = /obj/item/stack/tile/iron/recharge_floor

/obj/item/stack/tile/iron/recharge_floor/get_ru_names()
	return alist(
		NOMINATIVE = "плитка для подзарядки",
		GENITIVE = "плитки для подзарядки",
		DATIVE = "плитке для подзарядки",
		ACCUSATIVE = "плитку для подзарядки",
		INSTRUMENTAL = "плиткой для подзарядки",
		PREPOSITIONAL = "плитке для подзарядки",
	)

/obj/item/stack/tile/iron/smooth
	name = "smooth tile"
	singular_name = "smooth floor tile"
	icon_state = "tile_smooth"
	turf_type = /turf/open/floor/iron/smooth
	merge_type = /obj/item/stack/tile/iron/smooth

/obj/item/stack/tile/iron/smooth/get_ru_names()
	return alist(
		NOMINATIVE = "гладкая железная плитка",
		GENITIVE = "гладкой железной плитки",
		DATIVE = "гладкой железной плитке",
		ACCUSATIVE = "гладкую железную плитку",
		INSTRUMENTAL = "гладкой железной плиткой",
		PREPOSITIONAL = "гладкой железной плитке",
	)

/obj/item/stack/tile/iron/smooth_edge
	name = "smooth edge tile"
	singular_name = "edged smooth floor tile"
	icon_state = "tile_smooth_edge"
	turf_type = /turf/open/floor/iron/smooth_edge
	merge_type = /obj/item/stack/tile/iron/smooth_edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/smooth_edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая гладкая железная плитка",
		GENITIVE = "краевой гладкой железной плитки",
		DATIVE = "краевой гладкой железной плитке",
		ACCUSATIVE = "краевую гладкую железную плитку",
		INSTRUMENTAL = "краевой гладкой железной плиткой",
		PREPOSITIONAL = "краевой гладкой железной плитке",
	)

/obj/item/stack/tile/iron/smooth_half
	name = "smooth half tile"
	singular_name = "halved smooth floor tile"
	icon_state = "tile_smooth_half"
	turf_type = /turf/open/floor/iron/smooth_half
	merge_type = /obj/item/stack/tile/iron/smooth_half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/smooth_half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая гладкая железная плитка",
		GENITIVE = "половинчатой гладкой железной плитки",
		DATIVE = "половинчатой гладкой железной плитке",
		ACCUSATIVE = "половинчатую гладкую железную плитку",
		INSTRUMENTAL = "половинчатой гладкой железной плиткой",
		PREPOSITIONAL = "половинчатой гладкой железной плитке",
	)

/obj/item/stack/tile/iron/smooth_corner
	name = "smooth corner tile"
	singular_name = "cornered smooth floor tile"
	icon_state = "tile_smooth_corner"
	turf_type = /turf/open/floor/iron/smooth_corner
	merge_type = /obj/item/stack/tile/iron/smooth_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/smooth_corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая гладкая железная плитка",
		GENITIVE = "угловой гладкой железной плитки",
		DATIVE = "угловой гладкой железной плитке",
		ACCUSATIVE = "угловую гладкую железную плитку",
		INSTRUMENTAL = "угловой гладкой железной плиткой",
		PREPOSITIONAL = "угловой гладкой железной плитке",
	)

/obj/item/stack/tile/iron/smooth_large
	name = "smooth large tile"
	singular_name = "large smooth floor tile"
	icon_state = "tile_smooth_large"
	turf_type = /turf/open/floor/iron/smooth_large
	merge_type = /obj/item/stack/tile/iron/smooth_large

/obj/item/stack/tile/iron/smooth_large/get_ru_names()
	return alist(
		NOMINATIVE = "большая гладкая железная плитка",
		GENITIVE = "большой гладкой железной плитки",
		DATIVE = "большой гладкой железной плитке",
		ACCUSATIVE = "большую гладкую железную плитку",
		INSTRUMENTAL = "большой гладкой железной плиткой",
		PREPOSITIONAL = "большой гладкой железной плитке",
	)

/obj/item/stack/tile/iron/terracotta
	name = "terracotta floor tile"
	singular_name = "terracotta floor tile"
	icon_state = "tile_terracotta"
	turf_type = /turf/open/floor/iron/terracotta
	merge_type = /obj/item/stack/tile/iron/terracotta

/obj/item/stack/tile/iron/terracotta/get_ru_names()
	return alist(
		NOMINATIVE = "терракотовая плитка",
		GENITIVE = "терракотовой плитки",
		DATIVE = "терракотовой плитке",
		ACCUSATIVE = "терракотовую плитку",
		INSTRUMENTAL = "терракотовой плиткой",
		PREPOSITIONAL = "терракотовой плитке",
	)

/obj/item/stack/tile/iron/terracotta/small
	name = "terracotta small tile"
	singular_name = "terracotta small floor tile"
	icon_state = "tile_terracotta_small"
	turf_type = /turf/open/floor/iron/terracotta/small
	merge_type = /obj/item/stack/tile/iron/terracotta/small

/obj/item/stack/tile/iron/terracotta/small/get_ru_names()
	return alist(
		NOMINATIVE = "маленькая терракотовая плитка",
		GENITIVE = "маленькой терракотовой плитки",
		DATIVE = "маленькой терракотовой плитке",
		ACCUSATIVE = "маленькую терракотовую плитку",
		INSTRUMENTAL = "маленькой терракотовой плиткой",
		PREPOSITIONAL = "маленькой терракотовой плитке",
	)

/obj/item/stack/tile/iron/terracotta/diagonal
	name = "terracotta diagonal tile"
	singular_name = "terracotta diagonal floor tile"
	icon_state = "tile_terracotta_diagonal"
	turf_type = /turf/open/floor/iron/terracotta/diagonal
	merge_type = /obj/item/stack/tile/iron/terracotta/diagonal

/obj/item/stack/tile/iron/terracotta/diagonal/get_ru_names()
	return alist(
		NOMINATIVE = "диагональная терракотовая плитка",
		GENITIVE = "диагональной терракотовой плитки",
		DATIVE = "диагональной терракотовой плитке",
		ACCUSATIVE = "диагональную терракотовую плитку",
		INSTRUMENTAL = "диагональной терракотовой плиткой",
		PREPOSITIONAL = "диагональной терракотовой плитке",
	)

/obj/item/stack/tile/iron/terracotta/herringbone
	name = "terracotta herringbone tile"
	singular_name = "terracotta herringbone floor tile"
	icon_state = "tile_terracotta_herringbone"
	turf_type = /turf/open/floor/iron/terracotta/herringbone
	merge_type = /obj/item/stack/tile/iron/terracotta/herringbone

/obj/item/stack/tile/iron/terracotta/herringbone/get_ru_names()
	return alist(
		NOMINATIVE = "терракотовая плитка «ёлочка»",
		GENITIVE = "терракотовой плитки «ёлочка»",
		DATIVE = "терракотовой плитке «ёлочка»",
		ACCUSATIVE = "терракотовую плитку «ёлочка»",
		INSTRUMENTAL = "терракотовой плиткой «ёлочка»",
		PREPOSITIONAL = "терракотовой плитке «ёлочка»",
	)

/obj/item/stack/tile/iron/kitchen
	name = "kitchen tile"
	singular_name = "kitchen tile"
	icon_state = "tile_kitchen"
	turf_type = /turf/open/floor/iron/kitchen
	merge_type = /obj/item/stack/tile/iron/kitchen

/obj/item/stack/tile/iron/kitchen/get_ru_names()
	return alist(
		NOMINATIVE = "кухонная плитка",
		GENITIVE = "кухонной плитки",
		DATIVE = "кухонной плитке",
		ACCUSATIVE = "кухонную плитку",
		INSTRUMENTAL = "кухонной плиткой",
		PREPOSITIONAL = "кухонной плитке",
	)

/obj/item/stack/tile/iron/kitchen/small
	name = "small kitchen tile"
	singular_name = "small kitchen floor tile"
	icon_state = "tile_kitchen_small"
	turf_type = /turf/open/floor/iron/kitchen/small
	merge_type = /obj/item/stack/tile/iron/kitchen/small

/obj/item/stack/tile/iron/kitchen/small/get_ru_names()
	return alist(
		NOMINATIVE = "маленькая кухонная плитка",
		GENITIVE = "маленькой кухонной плитки",
		DATIVE = "маленькой кухонной плитке",
		ACCUSATIVE = "маленькую кухонную плитку",
		INSTRUMENTAL = "маленькой кухонной плиткой",
		PREPOSITIONAL = "маленькой кухонной плитке",
	)

/obj/item/stack/tile/iron/kitchen/diagonal
	name = "diagonal kitchen tile"
	singular_name = "diagonal kitchen floor tile"
	icon_state = "tile_kitchen_diagonal"
	turf_type = /turf/open/floor/iron/kitchen/diagonal
	merge_type = /obj/item/stack/tile/iron/kitchen/diagonal

/obj/item/stack/tile/iron/kitchen/diagonal/get_ru_names()
	return alist(
		NOMINATIVE = "диагональная кухонная плитка",
		GENITIVE = "диагональной кухонной плитки",
		DATIVE = "диагональной кухонной плитке",
		ACCUSATIVE = "диагональную кухонную плитку",
		INSTRUMENTAL = "диагональной кухонной плиткой",
		PREPOSITIONAL = "диагональной кухонной плитке",
	)

/obj/item/stack/tile/iron/kitchen/herringbone
	name = "herringbone kitchen tile"
	singular_name = "herringbone kitchen floor tile"
	icon_state = "tile_kitchen_herringbone"
	turf_type = /turf/open/floor/iron/kitchen/herringbone
	merge_type = /obj/item/stack/tile/iron/kitchen/herringbone

/obj/item/stack/tile/iron/kitchen/herringbone/get_ru_names()
	return alist(
		NOMINATIVE = "кухонная плитка «ёлочка»",
		GENITIVE = "кухонной плитки «ёлочка»",
		DATIVE = "кухонной плитке «ёлочка»",
		ACCUSATIVE = "кухонную плитку «ёлочка»",
		INSTRUMENTAL = "кухонной плиткой «ёлочка»",
		PREPOSITIONAL = "кухонной плитке «ёлочка»",
	)

/obj/item/stack/tile/iron/chapel
	name = "chapel floor tile"
	singular_name = "chapel floor tile"
	icon_state = "tile_chapel"
	turf_type = /turf/open/floor/iron/chapel
	merge_type = /obj/item/stack/tile/iron/chapel
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)

/obj/item/stack/tile/iron/chapel/get_ru_names()
	return alist(
		NOMINATIVE = "плитка церкви",
		GENITIVE = "плитки церкви",
		DATIVE = "плитке церкви",
		ACCUSATIVE = "плитку церкви",
		INSTRUMENTAL = "плиткой церкви",
		PREPOSITIONAL = "плитке церкви",
	)

/obj/item/stack/tile/iron/showroomfloor
	name = "showroom floor tile"
	singular_name = "showroom floor tile"
	icon_state = "tile_showroom"
	turf_type = /turf/open/floor/iron/showroomfloor
	merge_type = /obj/item/stack/tile/iron/showroomfloor

/obj/item/stack/tile/iron/showroomfloor/get_ru_names()
	return alist(
		NOMINATIVE = "плитка выставочного зала",
		GENITIVE = "плитки выставочного зала",
		DATIVE = "плитке выставочного зала",
		ACCUSATIVE = "плитку выставочного зала",
		INSTRUMENTAL = "плиткой выставочного зала",
		PREPOSITIONAL = "плитке выставочного зала",
	)

/obj/item/stack/tile/iron/solarpanel
	name = "solar panel tile"
	singular_name = "solar panel floor tile"
	icon_state = "tile_solarpanel"
	turf_type = /turf/open/floor/iron/solarpanel
	merge_type = /obj/item/stack/tile/iron/solarpanel

/obj/item/stack/tile/iron/solarpanel/get_ru_names()
	return alist(
		NOMINATIVE = "плитка солнечной панели",
		GENITIVE = "плитки солнечной панели",
		DATIVE = "плитке солнечной панели",
		ACCUSATIVE = "плитку солнечной панели",
		INSTRUMENTAL = "плиткой солнечной панели",
		PREPOSITIONAL = "плитке солнечной панели",
	)

/obj/item/stack/tile/iron/freezer
	name = "freezer floor tile"
	singular_name = "freezer floor tile"
	icon_state = "tile_freezer"
	turf_type = /turf/open/floor/iron/freezer
	merge_type = /obj/item/stack/tile/iron/freezer

/obj/item/stack/tile/iron/freezer/get_ru_names()
	return alist(
		NOMINATIVE = "плитка морозильника",
		GENITIVE = "плитки морозильника",
		DATIVE = "плитке морозильника",
		ACCUSATIVE = "плитку морозильника",
		INSTRUMENTAL = "плиткой морозильника",
		PREPOSITIONAL = "плитке морозильника",
	)

/obj/item/stack/tile/iron/freezer/edge
	name = "freezer edge floor tile"
	singular_name = "edged freezer floor tile"
	icon_state = "tile_freezer_edge"
	turf_type = /turf/open/floor/iron/freezer/edge
	merge_type = /obj/item/stack/tile/iron/freezer/edge
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/freezer/edge/get_ru_names()
	return alist(
		NOMINATIVE = "краевая плитка морозильника",
		GENITIVE = "краевой плитки морозильника",
		DATIVE = "краевой плитке морозильника",
		ACCUSATIVE = "краевую плитку морозильника",
		INSTRUMENTAL = "краевой плиткой морозильника",
		PREPOSITIONAL = "краевой плитке морозильника",
	)

/obj/item/stack/tile/iron/freezer/half
	name = "freezer half floor tile"
	singular_name = "halved freezer floor tile"
	icon_state = "tile_freezer_half"
	turf_type = /turf/open/floor/iron/freezer/half
	merge_type = /obj/item/stack/tile/iron/freezer/half
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/iron/freezer/half/get_ru_names()
	return alist(
		NOMINATIVE = "половинчатая плитка морозильника",
		GENITIVE = "половинчатой плитки морозильника",
		DATIVE = "половинчатой плитке морозильника",
		ACCUSATIVE = "половинчатую плитку морозильника",
		INSTRUMENTAL = "половинчатой плиткой морозильника",
		PREPOSITIONAL = "половинчатой плитке морозильника",
	)

/obj/item/stack/tile/iron/freezer/corner
	name = "freezer corner floor tile"
	singular_name = "cornered freezer floor tile"
	icon_state = "tile_freezer_corner"
	turf_type = /turf/open/floor/iron/freezer/corner
	merge_type = /obj/item/stack/tile/iron/freezer/corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/iron/freezer/corner/get_ru_names()
	return alist(
		NOMINATIVE = "угловая плитка морозильника",
		GENITIVE = "угловой плитки морозильника",
		DATIVE = "угловой плитке морозильника",
		ACCUSATIVE = "угловую плитку морозильника",
		INSTRUMENTAL = "угловой плиткой морозильника",
		PREPOSITIONAL = "угловой плитке морозильника",
	)

/obj/item/stack/tile/iron/freezer/large
	name = "freezer large floor tile"
	singular_name = "large freezer floor tile"
	icon_state = "tile_freezer_large"
	turf_type = /turf/open/floor/iron/freezer/large
	merge_type = /obj/item/stack/tile/iron/freezer/large

/obj/item/stack/tile/iron/freezer/large/get_ru_names()
	return alist(
		NOMINATIVE = "большая плитка морозильника",
		GENITIVE = "большой плитки морозильника",
		DATIVE = "большой плитке морозильника",
		ACCUSATIVE = "большую плитку морозильника",
		INSTRUMENTAL = "большой плиткой морозильника",
		PREPOSITIONAL = "большой плитке морозильника",
	)

/obj/item/stack/tile/iron/grimy
	name = "grimy floor tile"
	singular_name = "grimy floor tile"
	icon_state = "tile_grimy"
	turf_type = /turf/open/floor/iron/grimy
	merge_type = /obj/item/stack/tile/iron/grimy

/obj/item/stack/tile/iron/grimy/get_ru_names()
	return alist(
		NOMINATIVE = "грязная железная плитка",
		GENITIVE = "грязной железной плитки",
		DATIVE = "грязной железной плитке",
		ACCUSATIVE = "грязную железную плитку",
		INSTRUMENTAL = "грязной железной плиткой",
		PREPOSITIONAL = "грязной железной плитке",
	)

/obj/item/stack/tile/iron/sepia
	name = "sepia floor tile"
	singular_name = "sepia floor tile"
	desc = "Хм, течение времени на этой плитке нормальное. Странно."
	icon_state = "tile_sepia"
	turf_type = /turf/open/floor/iron/sepia
	merge_type = /obj/item/stack/tile/iron/sepia

/obj/item/stack/tile/iron/sepia/get_ru_names()
	return alist(
		NOMINATIVE = "сепия плитка",
		GENITIVE = "сепия плитки",
		DATIVE = "сепия плитке",
		ACCUSATIVE = "сепия плитку",
		INSTRUMENTAL = "сепия плиткой",
		PREPOSITIONAL = "сепия плитке",
	)

//Tiles below can't be gotten through tile reskinning

/obj/item/stack/tile/iron/bluespace
	name = "bluespace floor tile"
	singular_name = "bluespace floor tile"
	desc = "К сожалению, быстрее от них вы не станете..."
	icon_state = "tile_bluespace"
	turf_type = /turf/open/floor/iron/bluespace
	merge_type = /obj/item/stack/tile/iron/bluespace
	tile_reskin_types = null

/obj/item/stack/tile/iron/bluespace/get_ru_names()
	return alist(
		NOMINATIVE = "блюспейс плитка",
		GENITIVE = "блюспейс плитки",
		DATIVE = "блюспейс плитке",
		ACCUSATIVE = "блюспейс плитку",
		INSTRUMENTAL = "блюспейс плиткой",
		PREPOSITIONAL = "блюспейс плитке",
	)

/obj/item/stack/tile/iron/goonplaque
	name = "plaqued floor tile"
	singular_name = "plaqued floor tile"
	desc = "\"Эта табличка посвящена нашим товарищам со станций G4407. Надеемся, модель TG4407 сможет оправдать вашу славу и богатство.\" Ниже грубо выцарапано изображение метеора и космонавта. Космонавт смеётся. Метеор взрывается."
	icon_state = "tile_plaque"
	turf_type = /turf/open/floor/iron/goonplaque
	merge_type = /obj/item/stack/tile/iron/goonplaque
	tile_reskin_types = null

/obj/item/stack/tile/iron/goonplaque/get_ru_names()
	return alist(
		NOMINATIVE = "памятная плитка",
		GENITIVE = "памятной плитки",
		DATIVE = "памятной плитке",
		ACCUSATIVE = "памятную плитку",
		INSTRUMENTAL = "памятной плиткой",
		PREPOSITIONAL = "памятной плитке",
	)

/obj/item/stack/tile/iron/vaporwave
	name = "vaporwave floor tile"
	singular_name = "vaporwave floor tile"
	icon_state = "tile_vaporwave"
	turf_type = /turf/open/floor/iron/vaporwave
	merge_type = /obj/item/stack/tile/iron/vaporwave
	tile_reskin_types = null

/obj/item/stack/tile/iron/vaporwave/get_ru_names()
	return alist(
		NOMINATIVE = "вейпорвейв плитка",
		GENITIVE = "вейпорвейв плитки",
		DATIVE = "вейпорвейв плитке",
		ACCUSATIVE = "вейпорвейв плитку",
		INSTRUMENTAL = "вейпорвейв плиткой",
		PREPOSITIONAL = "вейпорвейв плитке",
	)
