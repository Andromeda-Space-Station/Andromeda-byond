/turf/closed/wall/mineral
	name = "mineral wall"
	desc = "Этого не должно существовать."
	icon_state = ""
	abstract_type = /turf/closed/wall/mineral
	smoothing_flags = SMOOTH_BITMASK
	canSmoothWith = null
	rcd_memory = null
	material_flags = MATERIAL_EFFECTS
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/gold
	name = "gold wall"
	desc = "Стена с золотым покрытием."
	icon = 'icons/turf/walls/gold_wall.dmi'
	icon_state = "gold_wall-0"
	base_icon_state = "gold_wall"
	sheet_type = /obj/item/stack/sheet/mineral/gold
	hardness = 65 //gold is soft
	explosive_resistance = 0 //gold is a soft metal you dingus.
	smoothing_groups = SMOOTH_GROUP_GOLD_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_GOLD_WALLS
	custom_materials = list(/datum/material/gold = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/gold/get_ru_names()
	return alist(
		NOMINATIVE = "золотая стена",
		GENITIVE = "золотой стены",
		DATIVE = "золотой стене",
		ACCUSATIVE = "золотую стену",
		INSTRUMENTAL = "золотой стеной",
		PREPOSITIONAL = "золотой стене"
	)

/turf/closed/wall/mineral/silver
	name = "silver wall"
	desc = "Стена с серебряным покрытием."
	icon = 'icons/turf/walls/silver_wall.dmi'
	icon_state = "silver_wall-0"
	base_icon_state = "silver_wall"
	sheet_type = /obj/item/stack/sheet/mineral/silver
	hardness = 65 //silver is also soft according to moh's scale
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_SILVER_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_SILVER_WALLS
	custom_materials = list(/datum/material/silver = SHEET_MATERIAL_AMOUNT*2)

/turf/closed/wall/mineral/silver/get_ru_names()
	return alist(
		NOMINATIVE = "серебряная стена",
		GENITIVE = "серебряной стены",
		DATIVE = "серебряной стене",
		ACCUSATIVE = "серебряную стену",
		INSTRUMENTAL = "серебряной стеной",
		PREPOSITIONAL = "серебряной стене"
	)

/turf/closed/wall/mineral/diamond
	name = "diamond wall"
	desc = "Стена с алмазным покрытием."
	icon = 'icons/turf/walls/diamond_wall.dmi'
	icon_state = "diamond_wall-0"
	base_icon_state = "diamond_wall"
	sheet_type = /obj/item/stack/sheet/mineral/diamond
	hardness = 5 //diamond is very hard
	slicing_duration = 200   //diamond wall takes twice as much time to slice
	explosive_resistance = 3
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_DIAMOND_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_DIAMOND_WALLS
	custom_materials = list(/datum/material/diamond = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_REINFORCED

/turf/closed/wall/mineral/diamond/get_ru_names()
	return alist(
		NOMINATIVE = "алмазная стена",
		GENITIVE = "алмазной стены",
		DATIVE = "алмазной стене",
		ACCUSATIVE = "алмазную стену",
		INSTRUMENTAL = "алмазной стеной",
		PREPOSITIONAL = "алмазной стене"
	)

/turf/closed/wall/mineral/diamond/hulk_recoil(obj/item/bodypart/arm, mob/living/carbon/human/hulkman, damage = 41)
	return ..()

/turf/closed/wall/mineral/bananium
	name = "bananium wall"
	desc = "Стена с бананиевым покрытием."
	icon = 'icons/turf/walls/bananium_wall.dmi'
	icon_state = "bananium_wall-0"
	base_icon_state = "bananium_wall"
	sheet_type = /obj/item/stack/sheet/mineral/bananium
	hardness = 70 //it's banana
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_BANANIUM_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_BANANIUM_WALLS
	custom_materials = list(/datum/material/bananium = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/bananium/get_ru_names()
	return alist(
		NOMINATIVE = "баннаниумовая стена",
		GENITIVE = "баннаниумовой стены",
		DATIVE = "баннаниумовой стене",
		ACCUSATIVE = "баннаниумовую стену",
		INSTRUMENTAL = "баннаниумовой стеной",
		PREPOSITIONAL = "баннаниумовой стене"
	)

/turf/closed/wall/mineral/sandstone
	name = "sandstone wall"
	desc = "Стена с песчаниковым покрытием."
	icon = 'icons/turf/walls/sandstone_wall.dmi'
	icon_state = "sandstone_wall-0"
	base_icon_state = "sandstone_wall"
	sheet_type = /obj/item/stack/sheet/mineral/sandstone
	hardness = 50 //moh says this is apparently 6-7 on it's scale
	explosive_resistance = 0
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_SANDSTONE_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_SANDSTONE_WALLS
	custom_materials = list(/datum/material/sandstone = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/sandstone/get_ru_names()
	return alist(
		NOMINATIVE = "песчаниковая стена",
		GENITIVE = "песчаниковой стены",
		DATIVE = "песчаниковой стене",
		ACCUSATIVE = "песчаниковую стену",
		INSTRUMENTAL = "песчаниковой стеной",
		PREPOSITIONAL = "песчаниковой стене"
	)

/turf/closed/wall/mineral/uranium
	name = "uranium wall"
	desc = "Стена с урановым покрытием."
	icon = 'icons/turf/walls/uranium_wall.dmi'
	icon_state = "uranium_wall-0"
	base_icon_state = "uranium_wall"
	sheet_type = /obj/item/stack/sheet/mineral/uranium
	hardness = 40 //uranium is a 6 on moh's scale
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_URANIUM_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_URANIUM_WALLS
	custom_materials = list(/datum/material/uranium = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_REINFORCED
	/// Mutex to prevent infinite recursion when propagating radiation pulses
	var/active = null
	/// The last time a radiation pulse was performed
	var/last_event = 0

/turf/closed/wall/mineral/uranium/get_ru_names()
	return alist(
		NOMINATIVE = "урановая стена",
		GENITIVE = "урановой стены",
		DATIVE = "урановой стене",
		ACCUSATIVE = "урановую стену",
		INSTRUMENTAL = "урановой стеной",
		PREPOSITIONAL = "урановой стене"
	)

/turf/closed/wall/mineral/uranium/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ATOM_PROPAGATE_RAD_PULSE, PROC_REF(radiate))

/turf/closed/wall/mineral/uranium/proc/radiate()
	SIGNAL_HANDLER
	if(active)
		return
	if(world.time <= last_event + 1.5 SECONDS)
		return
	active = TRUE
	radiation_pulse(
		src,
		max_range = 3,
		threshold = RAD_LIGHT_INSULATION,
		chance = URANIUM_IRRADIATION_CHANCE,
		minimum_exposure_time = URANIUM_RADIATION_MINIMUM_EXPOSURE_TIME,
	)
	propagate_radiation_pulse()
	last_event = world.time
	active = FALSE

/turf/closed/wall/mineral/uranium/attack_hand(mob/user, list/modifiers)
	radiate()
	return ..()

/turf/closed/wall/mineral/uranium/attackby(obj/item/W, mob/user, list/modifiers)
	radiate()
	return ..()

/turf/closed/wall/mineral/uranium/Bumped(atom/movable/AM)
	radiate()
	return ..()

/turf/closed/wall/mineral/uranium/hulk_recoil(obj/item/bodypart/arm, mob/living/carbon/human/hulkman, damage = 41)
	return ..()

/turf/closed/wall/mineral/plasma
	name = "plasma wall"
	desc = "Стена с плазменным покрытием."
	icon = 'icons/turf/walls/plasma_wall.dmi'
	icon_state = "plasma_wall-0"
	base_icon_state = "plasma_wall"
	sheet_type = /obj/item/stack/sheet/mineral/plasma
	hardness = 70 // I'll tentatively compare it to Bismuth
	thermal_conductivity = 0.04
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_PLASMA_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_PLASMA_WALLS
	custom_materials = list(/datum/material/plasma = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/plasma/get_ru_names()
	return alist(
		NOMINATIVE = "плазменная стена",
		GENITIVE = "плазменной стены",
		DATIVE = "плазменной стене",
		ACCUSATIVE = "плазменную стену",
		INSTRUMENTAL = "плазменной стеной",
		PREPOSITIONAL = "плазменной стене"
	)

/turf/closed/wall/mineral/wood
	name = "wooden wall"
	desc = "Стена с деревянным покрытием."
	icon = 'icons/turf/walls/wood_wall.dmi'
	icon_state = "wood_wall-0"
	base_icon_state = "wood_wall"
	sheet_type = /obj/item/stack/sheet/mineral/wood
	hardness = 80
	turf_flags = IS_SOLID
	explosive_resistance = 0
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_WOOD_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_WOOD_WALLS
	custom_materials = list(/datum/material/wood = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/wood/get_ru_names()
	return alist(
		NOMINATIVE = "деревянная стена",
		GENITIVE = "деревянной стены",
		DATIVE = "деревянной стене",
		ACCUSATIVE = "деревянную стену",
		INSTRUMENTAL = "деревянной стеной",
		PREPOSITIONAL = "деревянной стене"
	)

/turf/closed/wall/mineral/wood/attackby(obj/item/W, mob/user)
	if(W.get_sharpness() && W.force)
		var/duration = ((4.8 SECONDS)/W.force) * 2 //In seconds, for now.
		if(istype(W, /obj/item/hatchet) || istype(W, /obj/item/fireaxe))
			duration /= 4 //Much better with hatchets and axes.
		if(do_after(user, duration * (1 SECONDS), target=src)) //Into deciseconds.
			dismantle_wall(FALSE,FALSE)
			return
	return ..()

/turf/closed/wall/mineral/hulk_recoil(obj/item/bodypart/arm, mob/living/carbon/human/hulkman, damage = 0)
	return ..() //No recoil damage, wood is weak

/turf/closed/wall/mineral/wood/nonmetal
	desc = "Основательная деревянная стена. Она немного слабее стены из металла."
	girder_type = /obj/structure/barricade/wooden
	hardness = 67 //a bit weaker than iron (60)

/turf/closed/wall/mineral/bamboo
	name = "bamboo wall"
	desc = "Стена с бамбуковой отделкой."
	icon = 'icons/turf/walls/bamboo_wall.dmi'
	icon_state = "bamboo_wall-0"
	base_icon_state = "bamboo_wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_BAMBOO_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_BAMBOO_WALLS
	sheet_type = /obj/item/stack/sheet/mineral/bamboo
	hardness = 80 //it's not a mineral...
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/bamboo/get_ru_names()
	return alist(
		NOMINATIVE = "бамбуковая стена",
		GENITIVE = "бамбуковой стены",
		DATIVE = "бамбуковой стене",
		ACCUSATIVE = "бамбуковую стену",
		INSTRUMENTAL = "бамбуковой стеной",
		PREPOSITIONAL = "бамбуковой стене"
	)

/turf/closed/wall/mineral/iron
	name = "rough iron wall"
	desc = "Стена с покрытием из грубого железа."
	icon = 'icons/turf/walls/iron_wall.dmi'
	icon_state = "iron_wall-0"
	base_icon_state = "iron_wall"
	sheet_type = /obj/item/stack/rods
	hardness = 60
	sheet_amount = 5
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_IRON_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_IRON_WALLS
	custom_materials = list(/datum/material/iron =SHEET_MATERIAL_AMOUNT * 2.5)
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/bamboo/get_ru_names()
	return alist(
		NOMINATIVE = "грубая железная стена",
		GENITIVE = "грубой железной стены",
		DATIVE = "грубой железной стене",
		ACCUSATIVE = "грубую железную стену",
		INSTRUMENTAL = "грубой железной стеной",
		PREPOSITIONAL = "грубой железной стене"
	)

/turf/closed/wall/mineral/snow
	name = "packed snow wall"
	desc = "Стена из плотно спрессованных снежных блоков."
	icon = 'icons/turf/walls/snow_wall.dmi'
	icon_state = "snow_wall-0"
	base_icon_state = "snow_wall"
	smoothing_flags = SMOOTH_BITMASK
	hardness = 80
	explosive_resistance = 0
	slicing_duration = 30
	sheet_type = /obj/item/stack/sheet/mineral/snow
	canSmoothWith = null
	girder_type = null
	bullet_sizzle = TRUE
	bullet_bounce_sound = null
	custom_materials = list(/datum/material/snow = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/closed/wall/mineral/snow/get_ru_names()
	return alist(
		NOMINATIVE = "снежная стена",
		GENITIVE = "снежной стены",
		DATIVE = "снежной стене",
		ACCUSATIVE = "снежную стену",
		INSTRUMENTAL = "снежной стеной",
		PREPOSITIONAL = "снежной стене"
	)

/turf/closed/wall/mineral/snow/hulk_recoil(obj/item/bodypart/arm, mob/living/carbon/human/hulkman, damage = 0)
	return ..() //No recoil damage, snow is weak

/turf/closed/wall/mineral/abductor
	name = "alien wall"
	desc = "Стена с покрытием из инопланетного сплава."
	icon = 'icons/turf/walls/abductor_wall.dmi'
	icon_state = "abductor_wall-0"
	base_icon_state = "abductor_wall"
	sheet_type = /obj/item/stack/sheet/mineral/abductor
	hardness = 10
	slicing_duration = 200   //alien wall takes twice as much time to slice
	explosive_resistance = 3
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	smoothing_groups = SMOOTH_GROUP_ABDUCTOR_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_ABDUCTOR_WALLS
	custom_materials = list(/datum/material/alloy/alien = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_ORGANIC

/turf/closed/wall/mineral/abductor/get_ru_names()
	return alist(
		NOMINATIVE = "инопланетная стена",
		GENITIVE = "инопланетной стены",
		DATIVE = "инопланетной стене",
		ACCUSATIVE = "инопланетную стену",
		INSTRUMENTAL = "инопланетной стеной",
		PREPOSITIONAL = "инопланетной стене"
	)

/////////////////////Titanium walls/////////////////////

/turf/closed/wall/mineral/titanium //has to use this path due to how building walls works
	name = "wall"
	desc = "Лёгкая титановая стена, используемая в шаттлах."
	icon = 'icons/turf/walls/shuttle_wall.dmi'
	icon_state = "shuttle_wall-0"
	base_icon_state = "shuttle_wall"
	explosive_resistance = 3
	flags_1 = CAN_BE_DIRTY_1
	flags_ricochet = RICOCHET_SHINY | RICOCHET_HARD
	sheet_type = /obj/item/stack/sheet/mineral/titanium
	hardness = 40 //6 on moh's scale
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	smoothing_groups = SMOOTH_GROUP_TITANIUM_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_TITANIUM_WALLS
	custom_materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_TITANIUM

/turf/closed/wall/mineral/titanium/get_ru_names()
	return alist(
		NOMINATIVE = "стена",
		GENITIVE = "стены",
		DATIVE = "стене",
		ACCUSATIVE = "стену",
		INSTRUMENTAL = "стеной",
		PREPOSITIONAL = "стене"
	)

/turf/closed/wall/mineral/titanium/rust_turf()
	if(HAS_TRAIT(src, TRAIT_RUSTY))
		ChangeTurf(/turf/closed/wall/rust)
		return
	return ..()

/turf/closed/wall/mineral/titanium/nodiagonal
	icon = MAP_SWITCH('icons/turf/walls/shuttle_wall.dmi', 'icons/turf/walls/misc_wall.dmi')
	icon_state = MAP_SWITCH("shuttle_wall-0", "shuttle_nd")
	smoothing_flags = SMOOTH_BITMASK

/turf/closed/wall/mineral/titanium/overspace
	icon = MAP_SWITCH('icons/turf/walls/shuttle_wall.dmi', 'icons/turf/walls/misc_wall.dmi')
	icon_state = MAP_SWITCH("shuttle_wall-0", "shuttle_overspace")
	fixed_underlay = list("space" = TRUE)

/turf/closed/wall/mineral/titanium/interior/copyTurf(turf/copy_to_turf, copy_air = FALSE, flags = null)
	. = ..()
	copy_to_turf.transform = transform

/turf/closed/wall/mineral/titanium/copyTurf(turf/copy_to_turf, copy_air = FALSE, flags = null)
	. = ..()
	copy_to_turf.transform = transform

/turf/closed/wall/mineral/titanium/survival
	name = "pod wall"
	desc = "Легко сжимаемая стена, используемая для временного укрытия."
	icon = 'icons/turf/walls/survival_pod_walls.dmi'
	icon_state = "survival_pod_walls-0"
	base_icon_state = "survival_pod_walls"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	canSmoothWith = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_TITANIUM_WALLS
	rust_resistance = RUST_RESISTANCE_TITANIUM

/turf/closed/wall/mineral/titanium/survival/get_ru_names()
	return alist(
		NOMINATIVE = "стена",
		GENITIVE = "стены",
		DATIVE = "стене",
		ACCUSATIVE = "стену",
		INSTRUMENTAL = "стеной",
		PREPOSITIONAL = "стене"
	)

/turf/closed/wall/mineral/titanium/survival/nodiagonal
	icon = 'icons/turf/walls/survival_pod_walls.dmi'
	icon_state = "survival_pod_walls-0"
	base_icon_state = "survival_pod_walls"
	smoothing_flags = SMOOTH_BITMASK
	rust_resistance = RUST_RESISTANCE_TITANIUM

/turf/closed/wall/mineral/titanium/survival/pod
	smoothing_groups = SMOOTH_GROUP_SURVIVAL_TITANIUM_POD + SMOOTH_GROUP_TITANIUM_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_SURVIVAL_TITANIUM_POD
	rust_resistance = RUST_RESISTANCE_TITANIUM

/turf/closed/wall/mineral/titanium/rust_turf()
	if(HAS_TRAIT(src, TRAIT_RUSTY))
		ChangeTurf(/turf/closed/wall/rust)
		return
	return ..()

/////////////////////Plastitanium walls/////////////////////

/turf/closed/wall/mineral/plastitanium
	name = "wall"
	desc = "Прочная стена из сплава плазмы и титана."
	icon = 'icons/turf/walls/plastitanium_wall.dmi'
	icon_state = "plastitanium_wall-0"
	base_icon_state = "plastitanium_wall"
	explosive_resistance = 4
	sheet_type = /obj/item/stack/sheet/mineral/plastitanium
	hardness = 25 //upgrade on titanium
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_DIAGONAL_CORNERS
	smoothing_groups = SMOOTH_GROUP_PLASTITANIUM_WALLS + SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_SHUTTLE_PARTS + SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_PLASTITANIUM_WALLS + SMOOTH_GROUP_SYNDICATE_WALLS
	custom_materials = list(/datum/material/alloy/plastitanium = SHEET_MATERIAL_AMOUNT*2)
	rust_resistance = RUST_RESISTANCE_TITANIUM

/turf/closed/wall/mineral/plastitanium/get_ru_names()
	return alist(
		NOMINATIVE = "пластитановая стена",
		GENITIVE = "пластитановой стены",
		DATIVE = "пластитановой стене",
		ACCUSATIVE = "пластитановую стену",
		INSTRUMENTAL = "пластитановой стеной",
		PREPOSITIONAL = "пластитановой стене"
	)

/turf/closed/wall/mineral/plastitanium/rust_turf()
	if(HAS_TRAIT(src, TRAIT_RUSTY))
		ChangeTurf(/turf/closed/wall/rust)
		return
	return ..()


/turf/closed/wall/mineral/plastitanium/nodiagonal
	icon = MAP_SWITCH('icons/turf/walls/plastitanium_wall.dmi', 'icons/turf/walls/misc_wall.dmi')
	icon_state = MAP_SWITCH("plastitanium_wall-0", "plastitanium_nd")
	smoothing_flags = SMOOTH_BITMASK

/turf/closed/wall/mineral/plastitanium/overspace
	icon = MAP_SWITCH('icons/turf/walls/plastitanium_wall.dmi', 'icons/turf/walls/misc_wall.dmi')
	icon_state = MAP_SWITCH("plastitanium_wall-0", "plastitanium_overspace")
	fixed_underlay = list("space" = TRUE)

/turf/closed/wall/mineral/plastitanium/rust_turf()
	if(HAS_TRAIT(src, TRAIT_RUSTY))
		ChangeTurf(/turf/closed/wall/rust)
		return
	return ..()


/turf/closed/wall/mineral/plastitanium/explosive/ex_act(severity)
	var/obj/item/bombcore/large/bombcore = new(get_turf(src))
	bombcore.detonate()
	return ..()

/turf/closed/wall/mineral/plastitanium/hulk_recoil(obj/item/bodypart/arm, mob/living/carbon/human/hulkman, damage = 41)
	return ..()

/turf/closed/wall/mineral/plastitanium/copyTurf(turf/copy_to_turf, copy_air = FALSE, flags = null)
	. = ..()
	copy_to_turf.transform = transform
