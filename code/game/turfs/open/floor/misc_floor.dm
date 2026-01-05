// Usage for a bar light is 160, let's do a bit less then that since these tend to be used a lot in one place
#define CIRCUIT_FLOOR_POWERUSE 120
//Circuit flooring, glows a little
/turf/open/floor/circuit
	icon = 'icons/turf/floors.dmi'
	gender = MALE
	icon_state = "bcircuit"
	base_icon_state = "bcircuit"
	light_color = LIGHT_COLOR_BABY_BLUE
	floor_tile = /obj/item/stack/tile/circuit
	rust_resistance = RUST_RESISTANCE_REINFORCED
	/// If we want to ignore our area's power status and just be always off
	/// Mostly for mappers doing asthetic things, or cases where the floor should be broken
	var/always_off = FALSE
	/// If this floor is powered or not
	/// We don't consume any power, but we do require it
	var/on = -1

/turf/open/floor/circuit/get_ru_names()
	return alist(
		NOMINATIVE = "пол-схема",
		GENITIVE = "пола-схемы",
		DATIVE = "полу-схеме",
		ACCUSATIVE = "пол-схему",
		INSTRUMENTAL = "полом-схемой",
		PREPOSITIONAL = "поле-схеме",
	)

/turf/open/floor/circuit/Initialize(mapload)
	SSmapping.nuke_tiles += src
	RegisterSignal(loc, COMSIG_AREA_POWER_CHANGE, PROC_REF(handle_powerchange))
	var/area/cur_area = get_area(src)
	if (!isnull(cur_area))
		handle_powerchange(cur_area, TRUE)
	. = ..()

/turf/open/floor/circuit/Destroy()
	SSmapping.nuke_tiles -= src
	UnregisterSignal(loc, COMSIG_AREA_POWER_CHANGE)
	var/area/cur_area = get_area(src)
	if(on && !isnull(cur_area))
		cur_area.removeStaticPower(CIRCUIT_FLOOR_POWERUSE, AREA_USAGE_STATIC_LIGHT)
	return ..()

/turf/open/floor/circuit/update_appearance(updates)
	. = ..()
	if(!on)
		set_light(0)
		return

	set_light_color(LAZYLEN(SSmapping.nuke_threats) ? LIGHT_COLOR_INTENSE_RED : initial(light_color))
	set_light(2, 1.5)

/turf/open/floor/circuit/update_icon_state()
	icon_state = on ? (LAZYLEN(SSmapping.nuke_threats) ? "rcircuitanim" : initial(icon_state)) : "[base_icon_state]off"
	return ..()

/turf/open/floor/circuit/on_change_area(area/old_area, area/new_area)
	. = ..()
	UnregisterSignal(old_area, COMSIG_AREA_POWER_CHANGE)
	RegisterSignal(new_area, COMSIG_AREA_POWER_CHANGE, PROC_REF(handle_powerchange))
	if(on)
		old_area.removeStaticPower(CIRCUIT_FLOOR_POWERUSE, AREA_USAGE_STATIC_LIGHT)
	handle_powerchange(new_area)

/// Enables/disables our lighting based off our source area
/turf/open/floor/circuit/proc/handle_powerchange(area/source, mapload = FALSE)
	SIGNAL_HANDLER
	var/old_on = on
	if(always_off)
		on = FALSE
	else
		on = source.powered(AREA_USAGE_LIGHT)
	if(on == old_on)
		return

	if(on)
		source.addStaticPower(CIRCUIT_FLOOR_POWERUSE, AREA_USAGE_STATIC_LIGHT)
	else if (!mapload)
		source.removeStaticPower(CIRCUIT_FLOOR_POWERUSE, AREA_USAGE_STATIC_LIGHT)
	update_appearance()

#undef CIRCUIT_FLOOR_POWERUSE

/turf/open/floor/circuit/off
	icon_state = "bcircuitoff"
	always_off = TRUE

/turf/open/floor/circuit/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/circuit/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/circuit/telecomms/mainframe
	name = "mainframe base"

/turf/open/floor/circuit/telecomms/mainframe/get_ru_names()
	return alist(
		NOMINATIVE = "основание мейнфрейма",
		GENITIVE = "основания мейнфрейма",
		DATIVE = "основанию мейнфрейма",
		ACCUSATIVE = "основание мейнфрейма",
		INSTRUMENTAL = "основанием мейнфрейма",
		PREPOSITIONAL = "основании мейнфрейма",
	)

/turf/open/floor/circuit/telecomms/server
	name = "server base"

/turf/open/floor/circuit/telecomms/server/get_ru_names()
	return alist(
		NOMINATIVE = "основание сервера",
		GENITIVE = "основания сервера",
		DATIVE = "основанию сервера",
		ACCUSATIVE = "основание сервера",
		INSTRUMENTAL = "основанием сервера",
		PREPOSITIONAL = "основании сервера",
	)

/turf/open/floor/circuit/green
	icon_state = "gcircuit"
	base_icon_state = "gcircuit"
	light_color = LIGHT_COLOR_VIVID_GREEN
	floor_tile = /obj/item/stack/tile/circuit/green

/turf/open/floor/circuit/green/get_ru_names()
	return alist(
		NOMINATIVE = "зелёная пол-схема",
		GENITIVE = "зелёного пола-схемы",
		DATIVE = "зелёному полу-схеме",
		ACCUSATIVE = "зелёной пол-схему",
		INSTRUMENTAL = "зелёным полом-схемой",
		PREPOSITIONAL = "зелёной поле-схеме",
	)

/turf/open/floor/circuit/green/off
	icon_state = "gcircuitoff"
	always_off = TRUE

/turf/open/floor/circuit/green/anim
	icon_state = "gcircuitanim"
	floor_tile = /obj/item/stack/tile/circuit/green/anim

/turf/open/floor/circuit/green/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/circuit/green/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/circuit/green/telecomms/mainframe
	name = "mainframe base"

/turf/open/floor/circuit/green/telecomms/mainframe/get_ru_names()
	return alist(
		NOMINATIVE = "основание мейнфрейма",
		GENITIVE = "основания мейнфрейма",
		DATIVE = "основанию мейнфрейма",
		ACCUSATIVE = "основание мейнфрейма",
		INSTRUMENTAL = "основанием мейнфрейма",
		PREPOSITIONAL = "основании мейнфрейма",
	)

/turf/open/floor/circuit/red
	icon_state = "rcircuit"
	base_icon_state = "rcircuit"
	light_color = LIGHT_COLOR_INTENSE_RED
	floor_tile = /obj/item/stack/tile/circuit/red

/turf/open/floor/circuit/red/get_ru_names()
	return alist(
		NOMINATIVE = "красная пол-схема",
		GENITIVE = "красного пола-схемы",
		DATIVE = "красной полу-схеме",
		ACCUSATIVE = "красную пол-схему",
		INSTRUMENTAL = "красным полом-схемой",
		PREPOSITIONAL = "красной поле-схеме",
	)

/turf/open/floor/circuit/red/off
	icon_state = "rcircuitoff"
	always_off = TRUE

/turf/open/floor/circuit/red/anim
	icon_state = "rcircuitanim"
	floor_tile = /obj/item/stack/tile/circuit/red/anim

/turf/open/floor/circuit/red/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/circuit/red/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/pod
	name = "pod floor"
	icon_state = "podfloor"
	floor_tile = /obj/item/stack/tile/pod

/turf/open/floor/pod/get_ru_names()
	return alist(
		NOMINATIVE = "рифлёный пол",
		GENITIVE = "рифлёного пола",
		DATIVE = "рифлёному полу",
		ACCUSATIVE = "рифлёный пол",
		INSTRUMENTAL = "рифлёным полом",
		PREPOSITIONAL = "рифлёном поле",
	)

/turf/open/floor/pod/light
	icon_state = "podfloor_light"
	floor_tile = /obj/item/stack/tile/pod/light

/turf/open/floor/pod/light/get_ru_names()
	return alist(
		NOMINATIVE = "светлый рифлёный пол",
		GENITIVE = "светлого рифлёного пола",
		DATIVE = "светлому рифлёному полу",
		ACCUSATIVE = "светлый рифлёный пол",
		INSTRUMENTAL = "светлым рифлёным полом",
		PREPOSITIONAL = "светлом рифлёном поле",
	)

/turf/open/floor/pod/dark
	icon_state = "podfloor_dark"
	floor_tile = /obj/item/stack/tile/pod/dark

/turf/open/floor/pod/dark/get_ru_names()
	return alist(
		NOMINATIVE = "тёмный рифлёный пол",
		GENITIVE = "тёмного рифлёного пола",
		DATIVE = "тёмному рифлёному полу",
		ACCUSATIVE = "тёмный рифлёный пол",
		INSTRUMENTAL = "тёмным рифлёным полом",
		PREPOSITIONAL = "тёмном рифлёном поле",
	)

/turf/open/floor/noslip
	name = "high-traction floor"
	icon_state = "noslip"
	floor_tile = /obj/item/stack/tile/noslip
	slowdown = -0.3

/turf/open/floor/noslip/get_ru_names()
	return alist(
		NOMINATIVE = "нескользящий пол",
		GENITIVE = "нескользящего пола",
		DATIVE = "нескользящему полу",
		ACCUSATIVE = "нескользящий пол",
		INSTRUMENTAL = "нескользящим полом",
		PREPOSITIONAL = "нескользящем поле",
	)

/turf/open/floor/noslip/broken_states()
	return list("noslip-damaged1","noslip-damaged2","noslip-damaged3")

/turf/open/floor/noslip/burnt_states()
	return list("noslip-scorched1","noslip-scorched2")

/turf/open/floor/noslip/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/noslip/tram/Initialize(mapload)
	. = ..()
	var/current_holiday_color = request_station_colors(src, PATTERN_VERTICAL_STRIPE) || request_holiday_colors(src, PATTERN_VERTICAL_STRIPE)
	if(current_holiday_color)
		color = current_holiday_color
	else
		color = "#EFB341"

/turf/open/floor/oldshuttle
	icon = 'icons/turf/shuttleold.dmi'
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/iron/base

/turf/open/floor/bluespace
	slowdown = -1
	icon_state = "bluespace"
	desc = "Череда микро-телепортов позволяет людям перемещаться по этим плиткам с невероятной скоростью."
	floor_tile = /obj/item/stack/tile/bluespace

/turf/open/floor/bluespace/get_ru_names()
	return alist(
		NOMINATIVE = "блюспейс пол",
		GENITIVE = "блюспейс пола",
		DATIVE = "блюспейс полу",
		ACCUSATIVE = "блюспейс пол",
		INSTRUMENTAL = "блюспейс полом",
		PREPOSITIONAL = "блюспейс поле",
	)

/turf/open/floor/sepia
	slowdown = 2
	icon_state = "sepia"
	desc = "Время, кажется, течёт очень медленно вокруг этих плиток."
	floor_tile = /obj/item/stack/tile/sepia

/turf/open/floor/sepia/get_ru_names()
	return alist(
		NOMINATIVE = "сепия пол",
		GENITIVE = "сепия пола",
		DATIVE = "сепия полу",
		ACCUSATIVE = "сепия пол",
		INSTRUMENTAL = "сепия полом",
		PREPOSITIONAL = "сепия поле",
	)

/turf/open/floor/bronze
	name = "bronze floor"
	desc = "Тяжёлые бронзовые плиты."
	icon_state = "clockwork_floor"
	floor_tile = /obj/item/stack/tile/bronze

/turf/open/floor/bronze/get_ru_names()
	return alist(
		NOMINATIVE = "бронзовый пол",
		GENITIVE = "бронзового пола",
		DATIVE = "бронзовому полу",
		ACCUSATIVE = "бронзовый пол",
		INSTRUMENTAL = "бронзовым полом",
		PREPOSITIONAL = "бронзовом поле",
	)

/turf/open/floor/bronze/flat
	icon_state = "reebe"
	floor_tile = /obj/item/stack/tile/bronze/flat

/turf/open/floor/bronze/filled
	icon_state = "clockwork_floor_filled"
	floor_tile = /obj/item/stack/tile/bronze/filled

/turf/open/floor/bronze/filled/lavaland
	planetary_atmos = TRUE
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS

/turf/open/floor/bronze/filled/icemoon
	planetary_atmos = TRUE
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS

/turf/open/floor/white
	name = "white floor"
	desc = "Плитка кристально белого цвета."
	icon_state = "pure_white"

/turf/open/floor/white/get_ru_names()
	return alist(
		NOMINATIVE = "белый пол",
		GENITIVE = "белого пола",
		DATIVE = "белому полу",
		ACCUSATIVE = "белый пол",
		INSTRUMENTAL = "белым полом",
		PREPOSITIONAL = "белом поле",
	)

/turf/open/floor/black
	name = "black floor"
	icon_state = "black"

/turf/open/floor/black/get_ru_names()
	return alist(
		NOMINATIVE = "чёрный пол",
		GENITIVE = "чёрного пола",
		DATIVE = "чёрному полу",
		ACCUSATIVE = "чёрный пол",
		INSTRUMENTAL = "чёрным полом",
		PREPOSITIONAL = "чёрном поле",
	)

/turf/open/floor/greenscreen
	name = "greenscreen"
	icon_state = "green"

/turf/open/floor/greenscreen/get_ru_names()
	return alist(
		NOMINATIVE = "хромакей",
		GENITIVE = "хромакея",
		DATIVE = "хромакею",
		ACCUSATIVE = "хромакей",
		INSTRUMENTAL = "хромакеем",
		PREPOSITIONAL = "хромакее",
	)

/turf/open/floor/plastic
	name = "plastic floor"
	desc = "Дешёвое, лёгкое покрытие. Легко плавится."
	icon_state = "plastic"
	thermal_conductivity = 0.1
	heat_capacity = 900
	custom_materials = list(/datum/material/plastic=SMALL_MATERIAL_AMOUNT*5)
	floor_tile = /obj/item/stack/tile/plastic

/turf/open/floor/plastic/get_ru_names()
	return alist(
		NOMINATIVE = "пластиковый пол",
		GENITIVE = "пластикового пола",
		DATIVE = "пластиковому полу",
		ACCUSATIVE = "пластиковый пол",
		INSTRUMENTAL = "пластиковым полом",
		PREPOSITIONAL = "пластиковом поле",
	)

/turf/open/floor/plastic/broken_states()
	return list("plastic-damaged1","plastic-damaged2")

/turf/open/floor/eighties
	name = "retro floor"
	desc = "Эта плитка возвращает вас в прошлое."
	icon_state = "eighties"
	floor_tile = /obj/item/stack/tile/eighties
	rust_resistance = RUST_RESISTANCE_BASIC

/turf/open/floor/eighties/get_ru_names()
	return alist(
		NOMINATIVE = "ретро-пол",
		GENITIVE = "ретро-пола",
		DATIVE = "ретро-полу",
		ACCUSATIVE = "ретро-пол",
		INSTRUMENTAL = "ретро-полом",
		PREPOSITIONAL = "ретро-поле",
	)

/turf/open/floor/eighties/broken_states()
	return list("eighties_damaged")

/turf/open/floor/eighties/red
	name = "red retro floor"
	desc = "РАДИКАЛЬНО красный!"
	icon_state = "eightiesred"
	floor_tile = /obj/item/stack/tile/eighties/red

/turf/open/floor/eighties/red/get_ru_names()
	return alist(
		NOMINATIVE = "красный ретро-пол",
		GENITIVE = "красного ретро-пола",
		DATIVE = "красному ретро-полу",
		ACCUSATIVE = "красный ретро-пол",
		INSTRUMENTAL = "красным ретро-полом",
		PREPOSITIONAL = "красном ретро-поле",
	)

/turf/open/floor/eighties/red/broken_states()
	return list("eightiesred_damaged")

/turf/open/floor/plating/rust
	//SDMM supports colors, this is simply for easier mapping
	//and should be removed on initialize
	color = COLOR_BROWN

/turf/open/floor/plating/rust/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/rust)
	color = null

/turf/open/floor/plating/rust/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plating/heretic_rust
	color = COLOR_GREEN_GRAY

/turf/open/floor/plating/heretic_rust/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/rust/heretic)
	color = null

/turf/open/floor/plating/plasma
	initial_gas_mix = ATMOS_TANK_PLASMA

/turf/open/floor/plating/plasma/rust/Initialize(mapload)
	. = ..()
	// Because this is a fluff turf explicitly for KiloStation it doesn't make sense to ChangeTurf like usual
	// Especially since it looks like we don't even change the default icon/iconstate???
	AddElement(/datum/element/rust)

/turf/open/floor/stone
	name = "stone brick floor"
	desc = "Странно, правда? Выглядит точь-в-точь как железная стена, но на самом деле это камень, а не железо. Если это скорее жалоба на \
		железность стен или на каменность полов, решать вам. Но вы когда-нибудь видели настолько тусклое железо? Я имею в виду, \
		для станции вполне логично иметь тусклые металлические стены, но мы говорим о том, как выглядела бы примитивная железная стена. В Средневековье даже \
		не строили железных стен, железные стены — это вообще то, чего не существует, потому что железо — дорогой и не самый подходящий материал \
		для строительства стен. Это имеет смысл только в контексте космоса, потому что вы пытаетесь не впустить ледяной вакуум внутрь. Кто-нибудь вообще улавливает мою мысль? \
		Идея \"примитивной\" железной стены не имеет никакого смысла! Хоть что-то из того, что я здесь говорю, правда? Кто-то должен проверить эти факты!"
	icon_state = "stone_floor"

/turf/open/floor/stone/get_ru_names()
	return alist(
		NOMINATIVE = "каменный кирпичный пол",
		GENITIVE = "каменного кирпичного пола",
		DATIVE = "каменному кирпичному полу",
		ACCUSATIVE = "каменный кирпичный пол",
		INSTRUMENTAL = "каменным кирпичным полом",
		PREPOSITIONAL = "каменном кирпичном поле",
	)

/turf/open/floor/stone/icemoon
	initial_gas_mix = ICEMOON_DEFAULT_ATMOS
	name = "stone brick floor"
	desc = "Странно, правда? Выглядит точь-в-точь как железная стена, но на самом деле это камень, а не железо. Если это скорее жалоба на \
		железность стен или на каменность полов, решать вам. Но вы когда-нибудь видели настолько тусклое железо? Я имею в виду, \
		для станции вполне логично иметь тусклые металлические стены, но мы говорим о том, как выглядела бы примитивная железная стена. В Средневековье даже \
		не строили железных стен, железные стены — это вообще то, чего не существует, потому что железо — дорогой и не самый подходящий материал \
		для строительства стен. Это имеет смысл только в контексте космоса, потому что вы пытаетесь не впустить ледяной вакуум внутрь. Кто-нибудь вообще улавливает мою мысль? \
		Идея \"примитивной\" железной стены не имеет никакого смысла! Хоть что-то из того, что я здесь говорю, правда? Кто-то должен проверить эти факты!"
	icon_state = "stone_floor"

/turf/open/floor/vault
	name = "strange floor"
	desc = "Вы чувствуете странную ностальгию, глядя на этот пол..."
	icon_state = "rockvault"
	base_icon_state = "rockvault"

/turf/open/floor/vault/get_ru_names()
	return alist(
		NOMINATIVE = "странный пол",
		GENITIVE = "странного пола",
		DATIVE = "странному полу",
		ACCUSATIVE = "странный пол",
		INSTRUMENTAL = "странным полом",
		PREPOSITIONAL = "странном поле",
	)

/turf/open/floor/vault/rock
	name = "rocky floor"

/turf/open/floor/vault/rock/get_ru_names()
	return alist(
		NOMINATIVE = "каменистый пол",
		GENITIVE = "каменистого пола",
		DATIVE = "каменистому полу",
		ACCUSATIVE = "каменистый пол",
		INSTRUMENTAL = "каменистым полом",
		PREPOSITIONAL = "каменистом поле",
	)

/turf/open/floor/vault/alien
	name = "alien floor"
	icon_state = "alienvault"
	base_icon_state = "alienvault"

/turf/open/floor/vault/alien/get_ru_names()
	return alist(
		NOMINATIVE = "инопланетный пол",
		GENITIVE = "инопланетного пола",
		DATIVE = "инопланетному полу",
		ACCUSATIVE = "инопланетный пол",
		INSTRUMENTAL = "инопланетным полом",
		PREPOSITIONAL = "инопланетном поле",
	)

/turf/open/floor/vault/sandstone
	name = "sandstone floor"
	icon_state = "sandstonevault"
	base_icon_state = "sandstonevault"

/turf/open/floor/vault/sandstone/get_ru_names()
	return alist(
		NOMINATIVE = "песчаниковый пол",
		GENITIVE = "песчаникового пола",
		DATIVE = "песчаниковому полу",
		ACCUSATIVE = "песчаниковый пол",
		INSTRUMENTAL = "песчаниковым полом",
		PREPOSITIONAL = "песчаниковом поле",
	)

/turf/open/floor/cult
	name = "engraved floor"
	icon_state = "cult"
	base_icon_state = "cult"
	floor_tile = /obj/item/stack/tile/cult

/turf/open/floor/cult/get_ru_names()
	return alist(
		NOMINATIVE = "гравированный пол",
		GENITIVE = "гравированного пола",
		DATIVE = "гравированному полу",
		ACCUSATIVE = "гравированный пол",
		INSTRUMENTAL = "гравированным полом",
		PREPOSITIONAL = "гравированном поле",
	)

/turf/open/floor/cult/broken_states()
	return list("cultdamage","cultdamage2","cultdamage3","cultdamage4","cultdamage5","cultdamage6","cultdamage7")

/turf/open/floor/cult/narsie_act()
	return

/turf/open/floor/cult/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/material/meat
	name = "living floor"
	icon_state = "grey"
	baseturfs = /turf/open/misc/asteroid
	material_flags = MATERIAL_EFFECTS | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS

/turf/open/floor/material/meat/get_ru_names()
	return alist(
		NOMINATIVE = "живой пол",
		GENITIVE = "живого пола",
		DATIVE = "живому полу",
		ACCUSATIVE = "живой пол",
		INSTRUMENTAL = "живым полом",
		PREPOSITIONAL = "живом поле",
	)

/turf/open/floor/material/meat/Initialize(mapload)
	. = ..()
	set_custom_materials(list(GET_MATERIAL_REF(/datum/material/meat) = SHEET_MATERIAL_AMOUNT))

/turf/open/floor/material/meat/airless
	initial_gas_mix = AIRLESS_ATMOS
	baseturfs = /turf/open/misc/asteroid/airless

/turf/open/floor/iron/tgmcemblem
	name = "TGMC Emblem"
	desc = "Символ Терранского Правительства."
	gender = MALE
	icon_state = "tgmc_emblem"

/turf/open/floor/iron/tgmcemblem/get_ru_names()
	return alist(
		NOMINATIVE = "символ ТП",
		GENITIVE = "символа ТП",
		DATIVE = "символу ТП",
		ACCUSATIVE = "символ ТП",
		INSTRUMENTAL = "символом ТП",
		PREPOSITIONAL = "символе ТП",
	)

/turf/open/floor/iron/tgmcemblem/center
	icon_state = "tgmc_center"

/turf/open/floor/asphalt
	name = "asphalt"
	desc = "Расплавленная нефть в некоторых случаях может использоваться для мощения дорог."
	gender = MALE
	icon_state = "asphalt"

/turf/open/floor/asphalt/get_ru_names()
	return alist(
		NOMINATIVE = "асфальт",
		GENITIVE = "асфальта",
		DATIVE = "асфальту",
		ACCUSATIVE = "асфальт",
		INSTRUMENTAL = "асфальтом",
		PREPOSITIONAL = "асфальте",
	)

/turf/open/floor/asphalt/outdoors
	planetary_atmos = TRUE

/turf/open/floor/asphalt/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	baseturfs = /turf/open/misc/asteroid/basalt

/turf/open/floor/asphalt/lavaland/outdoors
	planetary_atmos = TRUE
