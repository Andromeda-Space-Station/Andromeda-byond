
/**
 * # Элемент питания
 *
 * Элементы питания, используемые в основном для портативных и переносных устройств. Содержит разумное количество энергии.
 */
/obj/item/stock_parts/power_store/cell
	name = "power cell"
	desc = "Перезаряжаемый электрохимический элемент питания."
	icon = 'icons/obj/machines/cell_charger.dmi'
	icon_state = "cell"
	inhand_icon_state = "cell"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	force = 5
	throwforce = 5
	throw_speed = 2
	throw_range = 5
	emp_damage_modifier = 1
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*7, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.5)
	grind_results = list(/datum/reagent/lithium = 15, /datum/reagent/iron = 5, /datum/reagent/silicon = 5)

/obj/item/stock_parts/power_store/cell/get_ru_names()
	return alist(
		NOMINATIVE = "батарея",
		GENITIVE = "батареи",
		DATIVE = "батарее",
		ACCUSATIVE = "батарею",
		INSTRUMENTAL = "батареей",
		PREPOSITIONAL = "батарее",
	)

/obj/item/stock_parts/power_store/cell/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_FISHING_BAIT, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_POISONOUS_BAIT, INNATE_TRAIT) //bro is fishing using lithium...
	var/static/list/slapcraft_recipe_list = list(/datum/crafting_recipe/battery_match)
	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

/* Cell variants*/
/obj/item/stock_parts/power_store/cell/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/crap
	name = "brand AA cell"
	desc = "Лучшая батарейка от корпорации Нанотрейзен." //TOTALLY TRADEMARK INFRINGEMENT
	icon_state = "aa_cell"
	maxcharge = STANDARD_CELL_CHARGE * 0.5
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.4)

/obj/item/stock_parts/power_store/cell/crap/get_ru_names()
	return alist(
		NOMINATIVE = "пальчиковая батарейка",
		GENITIVE = "пальчиковой батарейки",
		DATIVE = "пальчиковой батарейке",
		ACCUSATIVE = "пальчиковую батарейку",
		INSTRUMENTAL = "пальчиковой батарейкой",
		PREPOSITIONAL = "пальчиковой батарейке",
	)

/obj/item/stock_parts/power_store/cell/crap/Initialize(mapload)
	AddElement(/datum/element/update_icon_blocker)
	return ..()

/obj/item/stock_parts/power_store/cell/crap/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/upgraded
	name = "upgraded power cell"
	desc = "Элемент питания с немного большей емкостью, чем обычно!"
	icon_state = "9v_cell"
	maxcharge = STANDARD_CELL_CHARGE * 2.5
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.5)
	chargerate = STANDARD_CELL_RATE * 0.5

/obj/item/stock_parts/power_store/cell/upgraded/get_ru_names()
	return alist(
		NOMINATIVE = "батарейка крона",
		GENITIVE = "батарейки крона",
		DATIVE = "батарейке крона",
		ACCUSATIVE = "батарейку крона",
		INSTRUMENTAL = "батарейкой крона",
		PREPOSITIONAL = "батарейке крона",
	)

/obj/item/stock_parts/power_store/cell/upgraded/Initialize(mapload)
	AddElement(/datum/element/update_icon_blocker)
	return ..()

/obj/item/stock_parts/power_store/cell/upgraded/plus
	name = "upgraded power cell+"
	desc = "Элемент питания с еще большей емкостью, чем у базовой модели!"
	maxcharge = STANDARD_CELL_CHARGE * 5

/obj/item/stock_parts/power_store/cell/upgraded/plus/get_ru_names()
	return alist(
		NOMINATIVE = "улучшенная батарейка крона",
		GENITIVE = "улучшенной батарейки крона",
		DATIVE = "улучшенной батарейке крона",
		ACCUSATIVE = "улучшенную батарейку крона",
		INSTRUMENTAL = "улучшенной батарейкой крона",
		PREPOSITIONAL = "улучшенной батарейке крона",
	)

/obj/item/stock_parts/power_store/cell/secborg
	name = "security borg rechargeable D cell"
	maxcharge = STANDARD_CELL_CHARGE * 0.6
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.4)

/obj/item/stock_parts/power_store/cell/secborg/get_ru_names()
	return alist(
		NOMINATIVE = "батарея борга охраны",
		GENITIVE = "батареи борга охраны",
		DATIVE = "батарее борга охраны",
		ACCUSATIVE = "батарею борга охраны",
		INSTRUMENTAL = "батареей борга охраны",
		PREPOSITIONAL = "батарее борга охраны",
	)

/obj/item/stock_parts/power_store/cell/secborg/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/mini_egun
	name = "miniature energy gun power cell"
	maxcharge = STANDARD_CELL_CHARGE * 0.6

/obj/item/stock_parts/power_store/cell/mini_egun/get_ru_names()
	return alist(
		NOMINATIVE = "миниатюрная батарея пистолета",
		GENITIVE = "миниатюрной батареи пистолета",
		DATIVE = "миниатюрной батарее пистолета",
		ACCUSATIVE = "миниатюрную батарею пистолета",
		INSTRUMENTAL = "миниатюрной батареей пистолета",
		PREPOSITIONAL = "миниатюрной батарее пистолета",
	)

/obj/item/stock_parts/power_store/cell/hos_gun
	name = "X-01 multiphase energy gun power cell"
	maxcharge = STANDARD_CELL_CHARGE * 1.2

/obj/item/stock_parts/power_store/cell/hos_gun/get_ru_names()
	return alist(
		NOMINATIVE = "многофазная батарея X-01",
		GENITIVE = "многофазной батареи X-01",
		DATIVE = "многофазной батарее X-01",
		ACCUSATIVE = "многофазную батарею X-01",
		INSTRUMENTAL = "многофазной батареей X-01",
		PREPOSITIONAL = "многофазной батарее X-01",
	)

/obj/item/stock_parts/power_store/cell/pulse //200 pulse shots
	name = "pulse rifle power cell"
	emp_damage_modifier = 0.5
	maxcharge = STANDARD_CELL_CHARGE * 40
	chargerate = STANDARD_CELL_RATE * 0.75

/obj/item/stock_parts/power_store/cell/pulse/get_ru_names()
	return alist(
		NOMINATIVE = "батарея импульсной винтовки",
		GENITIVE = "батареи импульсной винтовки",
		DATIVE = "батарее импульсной винтовки",
		ACCUSATIVE = "батарею импульсной винтовки",
		INSTRUMENTAL = "батареей импульсной винтовки",
		PREPOSITIONAL = "батарее импульсной винтовки",
	)

/obj/item/stock_parts/power_store/cell/pulse/carbine //25 pulse shots
	name = "pulse carbine power cell"
	maxcharge = STANDARD_CELL_CHARGE * 5

/obj/item/stock_parts/power_store/cell/pulse/carbine/get_ru_names()
	return alist(
		NOMINATIVE = "батарея импульсного карабина",
		GENITIVE = "батареи импульсного карабина",
		DATIVE = "батарее импульсного карабина",
		ACCUSATIVE = "батарею импульсного карабина",
		INSTRUMENTAL = "батареей импульсного карабина",
		PREPOSITIONAL = "батарее импульсного карабина",
	)

/obj/item/stock_parts/power_store/cell/pulse/pistol //10 pulse shots
	name = "pulse pistol power cell"
	maxcharge = STANDARD_CELL_CHARGE * 2

/obj/item/stock_parts/power_store/cell/pulse/pistol/get_ru_names()
	return alist(
		NOMINATIVE = "батарея импульсного пистолета",
		GENITIVE = "батареи импульсного пистолета",
		DATIVE = "батарее импульсного пистолета",
		ACCUSATIVE = "батарею импульсного пистолета",
		INSTRUMENTAL = "батареей импульсного пистолета",
		PREPOSITIONAL = "батарее импульсного пистолета",
	)

/obj/item/stock_parts/power_store/cell/laser_pistol
	name = "laser pistol power cell"
	chargerate = STANDARD_CELL_RATE * 3

/obj/item/stock_parts/power_store/cell/laser_pistol/get_ru_names()
	return alist(
		NOMINATIVE = "батарея лазерного пистолета",
		GENITIVE = "батареи лазерного пистолета",
		DATIVE = "батарее лазерного пистолета",
		ACCUSATIVE = "батарею лазерного пистолета",
		INSTRUMENTAL = "батареей лазерного пистолета",
		PREPOSITIONAL = "батарее лазерного пистолета",
	)

/obj/item/stock_parts/power_store/cell/ninja
	name = "black power cell"
	icon_state = "bscell"
	emp_damage_modifier = 3
	maxcharge = STANDARD_CELL_CHARGE * 10
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.6)
	chargerate = STANDARD_CELL_RATE

/obj/item/stock_parts/power_store/cell/ninja/get_ru_names()
	return alist(
		NOMINATIVE = "чёрная батарея",
		GENITIVE = "чёрной батареи",
		DATIVE = "чёрной батарее",
		ACCUSATIVE = "чёрную батарею",
		INSTRUMENTAL = "чёрной батареей",
		PREPOSITIONAL = "чёрной батарее",
	)

/obj/item/stock_parts/power_store/cell/high
	name = "high-capacity power cell"
	icon_state = "hcell"
	emp_damage_modifier = 3
	maxcharge = STANDARD_CELL_CHARGE * 10
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.6)
	chargerate = STANDARD_CELL_RATE * 0.75

/obj/item/stock_parts/power_store/cell/high/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/high/get_ru_names()
	return alist(
		NOMINATIVE = "батарея повышенной ёмкости",
		GENITIVE = "батареи повышенной ёмкости",
		DATIVE = "батарее повышенной ёмкости",
		ACCUSATIVE = "батарею повышенной ёмкости",
		INSTRUMENTAL = "батареей повышенной ёмкости",
		PREPOSITIONAL = "батарее повышенной ёмкости",
	)

/obj/item/stock_parts/power_store/cell/super
	name = "super-capacity power cell"
	icon_state = "scell"
	emp_damage_modifier = 5
	maxcharge = STANDARD_CELL_CHARGE * 20
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT * 3)
	chargerate = STANDARD_CELL_RATE

/obj/item/stock_parts/power_store/cell/super/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/high/get_ru_names()
	return alist(
		NOMINATIVE = "суперёмкая батарея",
		GENITIVE = "суперёмкой батареи",
		DATIVE = "суперёмкой батарее",
		ACCUSATIVE = "суперёмкую батарею",
		INSTRUMENTAL = "суперёмкой батареей",
		PREPOSITIONAL = "суперёмкой батарее",
	)

/obj/item/stock_parts/power_store/cell/hyper
	name = "hyper-capacity power cell"
	icon_state = "hpcell"
	emp_damage_modifier = 5
	maxcharge = STANDARD_CELL_CHARGE * 30
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT * 4)
	chargerate = STANDARD_CELL_RATE * 1.5

/obj/item/stock_parts/power_store/cell/hyper/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/hyper/get_ru_names()
	return alist(
		NOMINATIVE = "гиперёмкая батарея",
		GENITIVE = "гиперёмкой батареи",
		DATIVE = "гиперёмкой батарее",
		ACCUSATIVE = "гиперёмкую батарею",
		INSTRUMENTAL = "гиперёмкой батареей",
		PREPOSITIONAL = "гиперёмкой батарее",
	)

/obj/item/stock_parts/power_store/cell/bluespace
	name = "bluespace power cell"
	desc = "Перезаряжаемый межпространственный элемент питания."
	icon_state = "bscell"
	emp_damage_modifier = 5
	maxcharge = STANDARD_CELL_CHARGE * 40
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*6)
	chargerate = STANDARD_CELL_RATE * 2

/obj/item/stock_parts/power_store/cell/bluespace/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/bluespace/get_ru_names()
	return alist(
		NOMINATIVE = "блюспейс батарея",
		GENITIVE = "блюспейс батареи",
		DATIVE = "блюспейс батарее",
		ACCUSATIVE = "блюспейс батарею",
		INSTRUMENTAL = "блюспейс батареей",
		PREPOSITIONAL = "блюспейс батарее",
	)

/obj/item/stock_parts/power_store/cell/infinite
	name = "infinite-capacity power cell"
	icon_state = "icell"
	emp_damage_modifier = 0
	maxcharge = INFINITY //little disappointing if you examine it and it's not huge
	custom_materials = list(/datum/material/glass=HALF_SHEET_MATERIAL_AMOUNT)
	chargerate = INFINITY
	ratingdesc = FALSE

/obj/item/stock_parts/power_store/cell/infinite/use(used, force = FALSE)
	return used

/obj/item/stock_parts/power_store/cell/infinite/get_ru_names()
	return alist(
		NOMINATIVE = "батарея бесконечной ёмкости",
		GENITIVE = "батареи бесконечной ёмкости",
		DATIVE = "батарее бесконечной ёмкости",
		ACCUSATIVE = "батарею бесконечной ёмкости",
		INSTRUMENTAL = "батареей бесконечной ёмкости",
		PREPOSITIONAL = "батарее бесконечной ёмкости",
	)

/obj/item/stock_parts/power_store/cell/infinite/abductor
	name = "void core"
	desc = "Инопланетный источник питания, который производит энергию, казалось бы, из ниоткуда."
	icon = 'icons/obj/antags/abductor.dmi'
	icon_state = "cell"
	maxcharge = STANDARD_CELL_CHARGE * 50
	ratingdesc = FALSE

/obj/item/stock_parts/power_store/cell/infinite/abductor/get_ru_names()
	return alist(
		NOMINATIVE = "ядро пустоты",
		GENITIVE = "ядра пустоты",
		DATIVE = "ядру пустоты",
		ACCUSATIVE = "ядро пустоты",
		INSTRUMENTAL = "ядром пустоты",
		PREPOSITIONAL = "ядре пустоты",
	)

/obj/item/stock_parts/power_store/cell/infinite/abductor/Initialize(mapload)
	AddElement(/datum/element/update_icon_blocker)
	return ..()

/obj/item/stock_parts/power_store/cell/potato
	name = "potato battery"
	desc = "Перезаряжаемый элемент питания на основе крахмала."
	icon = 'icons/obj/service/hydroponics/harvest.dmi'
	icon_state = "potato"
	maxcharge = STANDARD_CELL_CHARGE * 0.3
	emp_damage_modifier = 0.5 //It's biological, so
	charge_light_type = null
	connector_type = null
	custom_materials = null
	grown_battery = TRUE //it has the overlays for wires
	custom_premium_price = PAYCHECK_CREW

/obj/item/stock_parts/power_store/cell/potato/Initialize(mapload, override_maxcharge)
	charge = maxcharge * 0.3
	. = ..()

/obj/item/stock_parts/power_store/cell/potato/get_ru_names()
	return alist(
		NOMINATIVE = "картофельная батарейка",
		GENITIVE = "картофельной батарейки",
		DATIVE = "картофельной батарейке",
		ACCUSATIVE = "картофельную батарейку",
		INSTRUMENTAL = "картофельной батарейкой",
		PREPOSITIONAL = "картофельной батарейке",
	)

/obj/item/stock_parts/power_store/cell/emproof
	name = "EMP-proof cell"
	desc = "Защищенная от ЭМИ ячейка."
	emp_damage_modifier = 0
	maxcharge = STANDARD_CELL_CHARGE * 0.5

/obj/item/stock_parts/power_store/cell/emproof/get_ru_names()
	return alist(
		NOMINATIVE = "анти-ЭМИ батарея",
		GENITIVE = "анти-ЭМИ батареи",
		DATIVE = "анти-ЭМИ батарее",
		ACCUSATIVE = "анти-ЭМИ батарею",
		INSTRUMENTAL = "анти-ЭМИ батареей",
		PREPOSITIONAL = "анти-ЭМИ батарее",
	)

/obj/item/stock_parts/power_store/cell/emproof/Initialize(mapload)
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF)
	return ..()

/obj/item/stock_parts/power_store/cell/emproof/empty
	empty = TRUE

/obj/item/stock_parts/power_store/cell/emproof/corrupt()
	return

/obj/item/stock_parts/power_store/cell/emproof/slime
	name = "EMP-proof slime core"
	desc = "Желтая слизистая сердцевина, пропитанная плазмой. Органическая природа делает ее невосприимчивой к ЭМИ."
	icon = 'icons/mob/simple/slimes.dmi'
	icon_state = "yellow-core"
	custom_materials = null
	maxcharge = STANDARD_CELL_CHARGE * 5
	charge_light_type = null
	connector_type = "slimecore"

/obj/item/stock_parts/power_store/cell/emproof/slime/get_ru_names()
	return alist(
		NOMINATIVE = "слаймовая анти-ЭМИ батарея",
		GENITIVE = "слаймовой анти-ЭМИ батареи",
		DATIVE = "слаймовой анти-ЭМИ батарее",
		ACCUSATIVE = "слаймовую анти-ЭМИ батарею",
		INSTRUMENTAL = "слаймовой анти-ЭМИ батареей",
		PREPOSITIONAL = "слаймовой анти-ЭМИ батарее",
	)

/obj/item/stock_parts/power_store/cell/emergency_light
	name = "miniature power cell"
	desc = "Миниатюрный элемент питания с очень низкой мощностью. Используется в светильниках для подачи питания в случае отключения."
	maxcharge = STANDARD_CELL_CHARGE * 0.12 //Emergency lights use 0.2 W per tick, meaning ~10 minutes of emergency power from a cell
	custom_materials = list(/datum/material/glass = SMALL_MATERIAL_AMOUNT*0.2)
	w_class = WEIGHT_CLASS_TINY

/obj/item/stock_parts/power_store/cell/emergency_light/get_ru_names()
	return alist(
		NOMINATIVE = "миниатюрная батарея",
		GENITIVE = "миниатюрной батареи",
		DATIVE = "миниатюрной батарее",
		ACCUSATIVE = "миниатюрную батарею",
		INSTRUMENTAL = "миниатюрной батареей",
		PREPOSITIONAL = "миниатюрной батарее",
	)

/obj/item/stock_parts/power_store/cell/emergency_light/Initialize(mapload)
	. = ..()
	var/area/area = get_area(src)
	if(area)
		if(!area.lightswitch || !area.light_power)
			charge = 0 //For naturally depowered areas, we start with no power

/obj/item/stock_parts/power_store/cell/crystal_cell
	name = "crystal power cell"
	desc = "Элемент питания очень высокой мощности, изготовленный из кристаллизованной плазмы."
	icon_state = "crystal_cell"
	maxcharge = STANDARD_CELL_CHARGE * 50
	chargerate = 0
	charge_light_type = null
	connector_type = "crystal"
	custom_materials = null
	grind_results = null

/obj/item/stock_parts/power_store/cell/crystal_cell/get_ru_names()
	return alist(
		NOMINATIVE = "кристаллическая батарея",
		GENITIVE = "кристаллической батареи",
		DATIVE = "кристаллической батарее",
		ACCUSATIVE = "кристаллическую батарею",
		INSTRUMENTAL = "кристаллической батареей",
		PREPOSITIONAL = "кристаллической батарее",
	)

/obj/item/stock_parts/power_store/cell/ethereal
	name = "ahelp it"
	desc = "you sohuldn't see this"
	maxcharge = ETHEREAL_CHARGE_DANGEROUS
	charge = ETHEREAL_CHARGE_FULL
	icon_state = null
	charge_light_type = null
	connector_type = null
	custom_materials = null
	grind_results = null
	emp_damage_modifier = 0
	abstract_type = /obj/item/stock_parts/power_store/cell/ethereal

/obj/item/stock_parts/power_store/cell/ethereal/examine(mob/user)
	. = ..()
	CRASH("[src.type] got examined by [user]")
