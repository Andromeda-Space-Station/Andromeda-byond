
/turf/open/floor/iron
	icon_state = "floor"
	gender = MALE
	floor_tile = /obj/item/stack/tile/iron/base
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/open/floor/iron/get_ru_names()
	return alist(
		NOMINATIVE = "железный пол",
		GENITIVE = "железного пола",
		DATIVE = "железному полу",
		ACCUSATIVE = "железный пол",
		INSTRUMENTAL = "железным полом",
		PREPOSITIONAL = "железном поле",
	)

/turf/open/floor/iron/broken_states()
	return list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")

/turf/open/floor/iron/burnt_states()
	return list("floorscorched1", "floorscorched2")


/turf/open/floor/iron/examine(mob/user)
	. = ..()
	. += span_notice("На краю виднеется <b>небольшая трещина</b>.")

/turf/open/floor/iron/update_icon_state()
	if(broken || burnt)
		return ..()
	icon_state = base_icon_state
	return ..()


/turf/open/floor/iron/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/iron/icemoon
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/open/floor/iron/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS

/turf/open/floor/iron/edge
	icon_state = "floor_edge"
	base_icon_state = "floor_edge"
	floor_tile = /obj/item/stack/tile/iron/edge

/turf/open/floor/iron/half
	icon_state = "floor_half"
	base_icon_state = "floor_half"
	floor_tile = /obj/item/stack/tile/iron/half

/turf/open/floor/iron/corner
	icon_state = "floor_corner"
	base_icon_state = "floor_corner"
	floor_tile = /obj/item/stack/tile/iron/corner

/turf/open/floor/iron/large
	icon_state = "floor_large"
	base_icon_state = "floor_large"
	floor_tile = /obj/item/stack/tile/iron/large

/turf/open/floor/iron/textured
	icon_state = "textured"
	base_icon_state = "textured"
	floor_tile = /obj/item/stack/tile/iron/textured

/turf/open/floor/iron/textured/get_ru_names()
	return alist(
		NOMINATIVE = "фактурный железный пол",
		GENITIVE = "фактурного железного пола",
		DATIVE = "фактурному железному полу",
		ACCUSATIVE = "фактурный железный пол",
		INSTRUMENTAL = "фактурным железным полом",
		PREPOSITIONAL = "фактурном железном поле",
	)

/turf/open/floor/iron/textured_edge
	icon_state = "textured_edge"
	base_icon_state = "textured_edge"
	floor_tile = /obj/item/stack/tile/iron/textured_edge

/turf/open/floor/iron/textured_half
	icon_state = "textured_half"
	base_icon_state = "textured_half"
	floor_tile = /obj/item/stack/tile/iron/textured_half

/turf/open/floor/iron/textured_corner
	icon_state = "textured_corner"
	base_icon_state = "textured_corner"
	floor_tile = /obj/item/stack/tile/iron/textured_corner

/turf/open/floor/iron/textured_large
	icon_state = "textured_large"
	base_icon_state = "textured_large"
	floor_tile = /obj/item/stack/tile/iron/textured_large

/turf/open/floor/iron/small
	icon_state = "small"
	base_icon_state = "small"
	floor_tile = /obj/item/stack/tile/iron/small

/turf/open/floor/iron/diagonal
	icon_state = "diagonal"
	base_icon_state = "diagonal"
	floor_tile = /obj/item/stack/tile/iron/diagonal

/turf/open/floor/iron/diagonal/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS

/turf/open/floor/iron/herringbone
	icon_state = "herringbone"
	base_icon_state = "herringbone"
	floor_tile = /obj/item/stack/tile/iron/herringbone

/turf/open/floor/iron/dark
	icon_state = "darkfull"
	base_icon_state = "darkfull"
	floor_tile = /obj/item/stack/tile/iron/dark

/turf/open/floor/iron/dark/get_ru_names()
	return alist(
		NOMINATIVE = "тёмный железный пол",
		GENITIVE = "тёмного железного пола",
		DATIVE = "тёмному железному полу",
		ACCUSATIVE = "тёмный железный пол",
		INSTRUMENTAL = "тёмным железным полом",
		PREPOSITIONAL = "тёмном железном поле",
	)

/turf/open/floor/iron/dark/smooth_edge
	icon_state = "dark_edge"
	base_icon_state = "dark_edge"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_edge

/turf/open/floor/iron/dark/smooth_half
	icon_state = "dark_half"
	base_icon_state = "dark_half"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_half

/turf/open/floor/iron/dark/smooth_corner
	icon_state = "dark_corner"
	base_icon_state = "dark_corner"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_corner

/turf/open/floor/iron/dark/smooth_large
	icon_state = "dark_large"
	base_icon_state = "dark_large"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_large

/turf/open/floor/iron/dark/side
	icon_state = "dark"
	base_icon_state = "dark"
	floor_tile = /obj/item/stack/tile/iron/dark_side

/turf/open/floor/iron/dark/corner
	icon_state = "darkcorner"
	base_icon_state = "darkcorner"
	floor_tile = /obj/item/stack/tile/iron/dark_corner

/turf/open/floor/iron/checker
	icon_state = "checker"
	base_icon_state = "checker"
	floor_tile = /obj/item/stack/tile/iron/checker

/turf/open/floor/iron/checker/get_ru_names()
	return alist(
		NOMINATIVE = "клетчатый пол",
		GENITIVE = "клетчатого пола",
		DATIVE = "клетчатому полу",
		ACCUSATIVE = "клетчатый пол",
		INSTRUMENTAL = "клетчатым полом",
		PREPOSITIONAL = "клетчатом поле",
	)

/turf/open/floor/iron/dark/textured
	icon_state = "textured_dark"
	base_icon_state = "textured_dark"
	floor_tile = /obj/item/stack/tile/iron/dark/textured

/turf/open/floor/iron/dark/textured/get_ru_names()
	return alist(
		NOMINATIVE = "тёмный фактурный железный пол",
		GENITIVE = "тёмного фактурного железного пола",
		DATIVE = "тёмному фактурному железному полу",
		ACCUSATIVE = "тёмный фактурный железный пол",
		INSTRUMENTAL = "тёмным фактурным железным полом",
		PREPOSITIONAL = "тёмном фактурном железном поле",
	)

/turf/open/floor/iron/dark/textured_edge
	icon_state = "textured_dark_edge"
	base_icon_state = "textured_dark_edge"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_edge

/turf/open/floor/iron/dark/textured_half
	icon_state = "textured_dark_half"
	base_icon_state = "textured_dark_half"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_half

/turf/open/floor/iron/dark/textured_corner
	icon_state = "textured_dark_corner"
	base_icon_state = "textured_dark_corner"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_corner

/turf/open/floor/iron/dark/textured_large
	icon_state = "textured_dark_large"
	base_icon_state = "textured_dark_large"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_large

/turf/open/floor/iron/dark/textured/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/dark/textured_edge/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/dark/textured_half/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/dark/textured_corner/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/dark/textured_large/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/dark/small
	icon_state = "dark_small"
	base_icon_state = "dark_small"
	floor_tile = /obj/item/stack/tile/iron/dark/small

/turf/open/floor/iron/dark/diagonal
	icon_state = "dark_diagonal"
	base_icon_state = "dark_diagonal"
	floor_tile = /obj/item/stack/tile/iron/dark/diagonal

/turf/open/floor/iron/dark/herringbone
	icon_state = "dark_herringbone"
	base_icon_state = "dark_herringbone"
	floor_tile = /obj/item/stack/tile/iron/dark/herringbone

/turf/open/floor/iron/dark/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/dark/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/iron/dark/textured/airless
	initial_gas_mix = AIRLESS_ATMOS
/turf/open/floor/iron/dark/smooth_large/airless
	initial_gas_mix = AIRLESS_ATMOS
/turf/open/floor/iron/dark/side/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/dark/corner/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/checker/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/white
	icon_state = "white"
	base_icon_state = "white"
	floor_tile = /obj/item/stack/tile/iron/white

/turf/open/floor/iron/white/get_ru_names()
	return alist(
		NOMINATIVE = "белый железный пол",
		GENITIVE = "белого железного пола",
		DATIVE = "белому железному полу",
		ACCUSATIVE = "белый железный пол",
		INSTRUMENTAL = "белым железным полом",
		PREPOSITIONAL = "белом железном поле",
	)

/turf/open/floor/iron/white/smooth_edge
	icon_state = "white_edge"
	base_icon_state = "white_edge"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_edge

/turf/open/floor/iron/white/smooth_half
	icon_state = "white_half"
	base_icon_state = "white_half"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_half

/turf/open/floor/iron/white/smooth_corner
	icon_state = "white_corner"
	base_icon_state = "white_corner"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_corner

/turf/open/floor/iron/white/smooth_large
	icon_state = "white_large"
	base_icon_state = "white_large"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_large

/turf/open/floor/iron/white/side
	icon_state = "whitehall"
	base_icon_state = "whitehall"
	floor_tile = /obj/item/stack/tile/iron/white_side

/turf/open/floor/iron/white/corner
	icon_state = "whitecorner"
	base_icon_state = "whitecorner"
	floor_tile = /obj/item/stack/tile/iron/white_corner

/turf/open/floor/iron/cafeteria
	icon_state = "cafeteria"
	base_icon_state = "cafeteria"
	floor_tile = /obj/item/stack/tile/iron/cafeteria

/turf/open/floor/iron/cafeteria/get_ru_names()
	return alist(
		NOMINATIVE = "пол кафетерия",
		GENITIVE = "пола кафетерия",
		DATIVE = "полу кафетерия",
		ACCUSATIVE = "пол кафетерия",
		INSTRUMENTAL = "полом кафетерия",
		PREPOSITIONAL = "полу кафетерия",
	)

/turf/open/floor/iron/white/textured
	icon_state = "textured_white"
	base_icon_state = "textured_white"
	floor_tile = /obj/item/stack/tile/iron/white/textured

/turf/open/floor/iron/white/textured/get_ru_names()
	return alist(
		NOMINATIVE = "белый фактурный железный пол",
		GENITIVE = "белого фактурного железного пола",
		DATIVE = "белому фактурному железному полу",
		ACCUSATIVE = "белый фактурный железный пол",
		INSTRUMENTAL = "белым фактурным железным полом",
		PREPOSITIONAL = "белом фактурном железном поле",
	)

/turf/open/floor/iron/white/textured_edge
	icon_state = "textured_white_edge"
	base_icon_state = "textured_white_edge"
	floor_tile = /obj/item/stack/tile/iron/white/textured_edge

/turf/open/floor/iron/white/textured_half
	icon_state = "textured_white_half"
	base_icon_state = "textured_white_half"
	floor_tile = /obj/item/stack/tile/iron/white/textured_half

/turf/open/floor/iron/white/textured_corner
	icon_state = "textured_white_corner"
	base_icon_state = "textured_white_corner"
	floor_tile = /obj/item/stack/tile/iron/white/textured_corner

/turf/open/floor/iron/white/textured_large
	icon_state = "textured_white_large"
	base_icon_state = "textured_white_large"
	floor_tile = /obj/item/stack/tile/iron/white/textured_large

/turf/open/floor/iron/white/small
	icon_state = "white_small"
	base_icon_state = "white_small"
	floor_tile = /obj/item/stack/tile/iron/white/small

/turf/open/floor/iron/white/diagonal
	icon_state = "white_diagonal"
	base_icon_state = "white_diagonal"
	floor_tile = /obj/item/stack/tile/iron/white/diagonal

/turf/open/floor/iron/white/herringbone
	icon_state = "white_herringbone"
	base_icon_state = "white_herringbone"
	floor_tile = /obj/item/stack/tile/iron/white/herringbone

/turf/open/floor/iron/white/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/white/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/iron/white/side/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/white/corner/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/cafeteria/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/recharge_floor
	icon_state = "recharge_floor"
	base_icon_state = "recharge_floor"
	floor_tile = /obj/item/stack/tile/iron/recharge_floor

/turf/open/floor/iron/recharge_floor/get_ru_names()
	return alist(
		NOMINATIVE = "пол для подзарядки",
		GENITIVE = "пола для подзарядки",
		DATIVE = "полу для подзарядки",
		ACCUSATIVE = "пол для подзарядки",
		INSTRUMENTAL = "полом для подзарядки",
		PREPOSITIONAL = "поле для подзарядки",
	)

/turf/open/floor/iron/recharge_floor/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/recharge_floor/asteroid
	icon_state = "recharge_floor_asteroid"
	base_icon_state = "recharge_floor_asteroid"

/turf/open/floor/iron/smooth
	icon_state = "smooth"
	base_icon_state = "smooth"
	floor_tile = /obj/item/stack/tile/iron/smooth

/turf/open/floor/iron/smooth/get_ru_names()
	return alist(
		NOMINATIVE = "гладкий железный пол",
		GENITIVE = "гладкого железного пола",
		DATIVE = "гладкому железному полу",
		ACCUSATIVE = "гладкий железный пол",
		INSTRUMENTAL = "гладким железным полом",
		PREPOSITIONAL = "гладком железном поле",
	)

/turf/open/floor/iron/smooth/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/smooth_edge
	icon_state = "smooth_edge"
	base_icon_state = "smooth_edge"
	floor_tile = /obj/item/stack/tile/iron/smooth_edge

/turf/open/floor/iron/smooth_edge/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/smooth_half
	icon_state = "smooth_half"
	base_icon_state = "smooth_half"
	floor_tile = /obj/item/stack/tile/iron/smooth_half

/turf/open/floor/iron/smooth_half/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/smooth_corner
	icon_state = "smooth_corner"
	base_icon_state = "smooth_corner"
	floor_tile = /obj/item/stack/tile/iron/smooth_corner

/turf/open/floor/iron/smooth_corner/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/smooth_large
	icon_state = "smooth_large"
	base_icon_state = "smooth_large"
	floor_tile = /obj/item/stack/tile/iron/smooth_large

/turf/open/floor/iron/smooth_large/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/terracotta
	icon_state = "terracotta"
	base_icon_state = "terracotta"
	floor_tile = /obj/item/stack/tile/iron/terracotta

/turf/open/floor/iron/terracotta/get_ru_names()
	return alist(
		NOMINATIVE = "терракотовый пол",
		GENITIVE = "терракотового пола",
		DATIVE = "терракотовому полу",
		ACCUSATIVE = "терракотовый пол",
		INSTRUMENTAL = "терракотовым полом",
		PREPOSITIONAL = "терракотовом поле",
	)

/turf/open/floor/iron/terracotta/small
	icon_state = "terracotta_small"
	base_icon_state = "terracotta_small"
	floor_tile = /obj/item/stack/tile/iron/terracotta/small

/turf/open/floor/iron/terracotta/diagonal
	icon_state = "terracotta_diagonal"
	base_icon_state = "terracotta_diagonal"
	floor_tile = /obj/item/stack/tile/iron/terracotta/diagonal

/turf/open/floor/iron/terracotta/herringbone
	icon_state = "terracotta_herringbone"
	base_icon_state = "terracotta_herringbone"
	floor_tile = /obj/item/stack/tile/iron/terracotta/herringbone

/turf/open/floor/iron/kitchen
	icon_state = "kitchen"
	base_icon_state = "kitchen"
	floor_tile = /obj/item/stack/tile/iron/kitchen

/turf/open/floor/iron/kitchen/get_ru_names()
	return alist(
		NOMINATIVE = "кухонный пол",
		GENITIVE = "кухонного пола",
		DATIVE = "кухонному полу",
		ACCUSATIVE = "кухонный пол",
		INSTRUMENTAL = "кухонным полом",
		PREPOSITIONAL = "кухонном поле",
	)

/turf/open/floor/iron/kitchen/small
	icon_state = "kitchen_small"
	base_icon_state = "kitchen_small"
	floor_tile = /obj/item/stack/tile/iron/kitchen/small

/turf/open/floor/iron/kitchen/diagonal
	icon_state = "kitchen_diagonal"
	base_icon_state = "kitchen_diagonal"
	floor_tile = /obj/item/stack/tile/iron/kitchen/diagonal

/turf/open/floor/iron/kitchen/herringbone
	icon_state = "kitchen_herringbone"
	base_icon_state = "kitchen_herringbone"
	floor_tile = /obj/item/stack/tile/iron/kitchen/herringbone

/turf/open/floor/iron/chapel
	icon_state = "chapel"
	base_icon_state = "chapel"
	floor_tile = /obj/item/stack/tile/iron/chapel

/turf/open/floor/iron/chapel/get_ru_names()
	return alist(
		NOMINATIVE = "пол церкви",
		GENITIVE = "пола церкви",
		DATIVE = "полу церкви",
		ACCUSATIVE = "пол церкви",
		INSTRUMENTAL = "полом церкви",
		PREPOSITIONAL = "полу церкви",
	)

/turf/open/floor/iron/showroomfloor
	icon_state = "showroomfloor"
	base_icon_state = "showroomfloor"
	floor_tile = /obj/item/stack/tile/iron/showroomfloor

/turf/open/floor/iron/showroomfloor/get_ru_names()
	return alist(
		NOMINATIVE = "пол выставочного зала",
		GENITIVE = "пола выставочного зала",
		DATIVE = "полу выставочного зала",
		ACCUSATIVE = "пол выставочного зала",
		INSTRUMENTAL = "полом выставочного зала",
		PREPOSITIONAL = "полу выставочного зала",
	)

/turf/open/floor/iron/showroomfloor/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/solarpanel
	icon_state = "solarpanel"
	base_icon_state = "solarpanel"
	floor_tile = /obj/item/stack/tile/iron/solarpanel

/turf/open/floor/iron/solarpanel/get_ru_names()
	return alist(
		NOMINATIVE = "пол из солнечных панелей",
		GENITIVE = "пола из солнечных панелей",
		DATIVE = "полу из солнечных панелей",
		ACCUSATIVE = "пол из солнечных панелей",
		INSTRUMENTAL = "полом из солнечных панелей",
		PREPOSITIONAL = "поле из солнечных панелей",
	)

/turf/open/floor/iron/solarpanel/airless
	initial_gas_mix = AIRLESS_ATMOS


/turf/open/floor/iron/freezer
	icon_state = "freezer"
	base_icon_state = "freezer"
	floor_tile = /obj/item/stack/tile/iron/freezer

/turf/open/floor/iron/freezer/get_ru_names()
	return alist(
		NOMINATIVE = "пол морозильника",
		GENITIVE = "пола морозильника",
		DATIVE = "полу морозильника",
		ACCUSATIVE = "пол морозильника",
		INSTRUMENTAL = "полом морозильника",
		PREPOSITIONAL = "поле морозильника",
	)

/turf/open/floor/iron/freezer/edge
	icon_state = "freezer_edge"
	base_icon_state = "freezer_edge"
	floor_tile = /obj/item/stack/tile/iron/freezer/edge

/turf/open/floor/iron/freezer/half
	icon_state = "freezer_half"
	base_icon_state = "freezer_half"
	floor_tile = /obj/item/stack/tile/iron/freezer/half

/turf/open/floor/iron/freezer/corner
	icon_state = "freezer_corner"
	base_icon_state = "freezer_corner"
	floor_tile = /obj/item/stack/tile/iron/freezer/corner

/turf/open/floor/iron/freezer/large
	icon_state = "freezer_large"
	base_icon_state = "freezer_large"
	floor_tile = /obj/item/stack/tile/iron/freezer/large

/turf/open/floor/iron/freezer/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/freezer/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS

/turf/open/floor/iron/kitchen_coldroom
	name = "cold room floor"
	initial_gas_mix = KITCHEN_COLDROOM_ATMOS

/turf/open/floor/iron/kitchen_coldroom/get_ru_names()
	return alist(
		NOMINATIVE = "пол холодильной камеры",
		GENITIVE = "пола холодильной камеры",
		DATIVE = "полу холодильной камеры",
		ACCUSATIVE = "пол холодильной камеры",
		INSTRUMENTAL = "полом холодильной камеры",
		PREPOSITIONAL = "поле холодильной камеры",
	)

/turf/open/floor/iron/kitchen_coldroom/dark
	icon_state = "darkfull"
	base_icon_state = "darkfull"
	floor_tile = /obj/item/stack/tile/iron/dark

/turf/open/floor/iron/kitchen_coldroom/dark/textured
	icon_state = "textured_dark"
	base_icon_state = "textured_dark"
	floor_tile = /obj/item/stack/tile/iron/dark/textured

/turf/open/floor/iron/kitchen_coldroom/freezerfloor
	icon_state = "freezer"
	base_icon_state = "freezer"
	floor_tile = /obj/item/stack/tile/iron/freezer

/turf/open/floor/iron/grimy
	icon_state = "grimy"
	base_icon_state = "grimy"
	tiled_turf = FALSE
	floor_tile = /obj/item/stack/tile/iron/grimy

/turf/open/floor/iron/grimy/get_ru_names()
	return alist(
		NOMINATIVE = "грязный пол",
		GENITIVE = "грязного пола",
		DATIVE = "грязному полу",
		ACCUSATIVE = "грязный пол",
		INSTRUMENTAL = "грязным полом",
		PREPOSITIONAL = "грязном поле",
	)

/turf/open/floor/iron/vaporwave
	icon_state = "pinkblack"
	base_icon_state = "pinkblack"
	floor_tile = /obj/item/stack/tile/iron/vaporwave

/turf/open/floor/iron/vaporwave/get_ru_names()
	return alist(
		NOMINATIVE = "вейпорвейв пол",
		GENITIVE = "вейпорвейв пола",
		DATIVE = "вейпорвейв полу",
		ACCUSATIVE = "вейпорвейв пол",
		INSTRUMENTAL = "вейпорвейв полом",
		PREPOSITIONAL = "вейпорвейв поле",
	)

/turf/open/floor/iron/goonplaque
	name = "commemorative plaque"
	desc = "\"Эта табличка посвящена нашим товарищам со станций G4407. Надеемся, модель TG4407 сможет оправдать вашу славу и богатство.\" Ниже грубо выцарапано изображение метеора и космонавта. Космонавт смеётся. Метеор взрывается."
	gender = FEMALE
	icon_state = "plaque"
	base_icon_state = "plaque"
	tiled_turf = FALSE
	floor_tile = /obj/item/stack/tile/iron/goonplaque

/turf/open/floor/iron/goonplaque/get_ru_names()
	return alist(
		NOMINATIVE = "памятная табличка",
		GENITIVE = "памятной таблички",
		DATIVE = "памятной табличке",
		ACCUSATIVE = "памятную табличку",
		INSTRUMENTAL = "памятной табличкой",
		PREPOSITIONAL = "памятной табличке",
	)

/turf/open/floor/iron/stairs
	icon_state = "stairs"
	base_icon_state = "stairs"
	gender = PLURAL
	tiled_turf = FALSE

/turf/open/floor/iron/stairs/get_ru_names()
	return alist(
		NOMINATIVE = "ступеньки",
		GENITIVE = "ступенек",
		DATIVE = "ступенькам",
		ACCUSATIVE = "ступеньки",
		INSTRUMENTAL = "ступеньками",
		PREPOSITIONAL = "ступеньках",
	)

/turf/open/floor/iron/stairs/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/stairs/left
	icon_state = "stairs-l"
	base_icon_state = "stairs-l"

/turf/open/floor/iron/stairs/left/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/stairs/medium
	icon_state = "stairs-m"
	base_icon_state = "stairs-m"

/turf/open/floor/iron/stairs/medium/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/stairs/right
	icon_state = "stairs-r"
	base_icon_state = "stairs-r"

/turf/open/floor/iron/stairs/right/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/stairs/old
	icon_state = "stairs-old"
	base_icon_state = "stairs-old"

/turf/open/floor/iron/stairs/old/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/iron/bluespace
	icon_state = "bluespace"
	base_icon_state = "bluespace"
	desc = "К сожалению, быстрее от них вы не станете..."
	floor_tile = /obj/item/stack/tile/iron/bluespace

/turf/open/floor/iron/bluespace/get_ru_names()
	return alist(
		NOMINATIVE = "блюспейс пол",
		GENITIVE = "блюспейс пола",
		DATIVE = "блюспейс полу",
		ACCUSATIVE = "блюспейс пол",
		INSTRUMENTAL = "блюспейс полом",
		PREPOSITIONAL = "блюспейс поле",
	)

/turf/open/floor/iron/sepia
	icon_state = "sepia"
	base_icon_state = "sepia"
	desc = "Хм, течение времени на этой плитке нормальное. Странно."
	floor_tile = /obj/item/stack/tile/iron/sepia

/turf/open/floor/iron/sepia/get_ru_names()
	return alist(
		NOMINATIVE = "сепия пол",
		GENITIVE = "сепия пола",
		DATIVE = "сепия полу",
		ACCUSATIVE = "сепия пол",
		INSTRUMENTAL = "сепия полом",
		PREPOSITIONAL = "сепия поле",
	)
