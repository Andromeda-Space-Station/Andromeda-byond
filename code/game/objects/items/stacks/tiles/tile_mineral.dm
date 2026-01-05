/obj/item/stack/tile/mineral
	/// Determines what stack is gotten out of us when welded.
	var/mineralType = null
	gender = FEMALE

/obj/item/stack/tile/mineral/attackby(obj/item/W, mob/user, list/modifiers, list/attack_modifiers)
	if(W.tool_behaviour == TOOL_WELDER)
		if(get_amount() < 4)
			to_chat(user, span_warning("Вам нужно как минимум четыре плитки для этого!"))
			return
		if(!mineralType)
			to_chat(user, span_warning("Это невозможно переформировать!"))
			stack_trace("A mineral tile of type [type] doesn't have its mineralType set.")
			return
		if(W.use_tool(src, user, 0, volume=40))
			var/sheet_type = text2path("/obj/item/stack/sheet/mineral/[mineralType]")
			var/obj/item/stack/sheet/mineral/new_item = new sheet_type(user.loc)
			user.visible_message(span_notice("[user] переплавляет [src] в [new_item] при помощи [W]."), \
				span_notice("Вы переплавляете [src] в [new_item] при помощи [W]."), \
				span_hear("Слышна сварка."))
			var/holding = user.is_holding(src)
			use(4)
			if(holding && QDELETED(src))
				user.put_in_hands(new_item)
	else
		return ..()

/obj/item/stack/tile/mineral/plasma
	name = "plasma tile"
	singular_name = "plasma floor tile"
	desc = "Плитка из легковоспламеняющейся плазмы. Это может закончиться только хорошо."
	icon_state = "tile_plasma"
	inhand_icon_state = "tile-plasma"
	turf_type = /turf/open/floor/mineral/plasma
	mineralType = "plasma"
	mats_per_unit = list(/datum/material/plasma=SHEET_MATERIAL_AMOUNT*0.25)
	merge_type = /obj/item/stack/tile/mineral/plasma

/obj/item/stack/tile/mineral/plasma/get_ru_names()
	return alist(
		NOMINATIVE = "плазменная плитка",
		GENITIVE = "плазменной плитки",
		DATIVE = "плазменной плитке",
		ACCUSATIVE = "плазменную плитку",
		INSTRUMENTAL = "плазменной плиткой",
		PREPOSITIONAL = "плазменной плитке",
	)

/obj/item/stack/tile/mineral/uranium
	name = "uranium tile"
	singular_name = "uranium floor tile"
	desc = "Плитка, сделанная из урана. Вы чувствуете лёгкое головокружение."
	icon_state = "tile_uranium"
	inhand_icon_state = "tile-uranium"
	turf_type = /turf/open/floor/mineral/uranium
	mineralType = "uranium"
	mats_per_unit = list(/datum/material/uranium=SHEET_MATERIAL_AMOUNT*0.25)
	merge_type = /obj/item/stack/tile/mineral/uranium

/obj/item/stack/tile/mineral/uranium/get_ru_names()
	return alist(
		NOMINATIVE = "урановая плитка",
		GENITIVE = "урановой плитки",
		DATIVE = "урановой плитке",
		ACCUSATIVE = "урановую плитку",
		INSTRUMENTAL = "урановой плиткой",
		PREPOSITIONAL = "урановой плитке",
	)

/obj/item/stack/tile/mineral/gold
	name = "gold tile"
	singular_name = "gold floor tile"
	desc = "Плитка, сделанная из золота. От неё так и веет роскошью."
	icon_state = "tile_gold"
	inhand_icon_state = "tile-gold"
	turf_type = /turf/open/floor/mineral/gold
	mineralType = "gold"
	mats_per_unit = list(/datum/material/gold=SHEET_MATERIAL_AMOUNT*0.25)
	merge_type = /obj/item/stack/tile/mineral/gold

/obj/item/stack/tile/mineral/gold/get_ru_names()
	return alist(
		NOMINATIVE = "золотая плитка",
		GENITIVE = "золотой плитки",
		DATIVE = "золотой плитке",
		ACCUSATIVE = "золотую плитку",
		INSTRUMENTAL = "золотой плиткой",
		PREPOSITIONAL = "золотой плитке",
	)

/obj/item/stack/tile/mineral/silver
	name = "silver tile"
	singular_name = "silver floor tile"
	desc = "Плитка, сделанная из серебра. Блеск от неё просто ослепляет."
	icon_state = "tile_silver"
	inhand_icon_state = "tile-silver"
	turf_type = /turf/open/floor/mineral/silver
	mineralType = "silver"
	mats_per_unit = list(/datum/material/silver=SHEET_MATERIAL_AMOUNT*0.25)
	merge_type = /obj/item/stack/tile/mineral/silver

/obj/item/stack/tile/mineral/silver/get_ru_names()
	return alist(
		NOMINATIVE = "серебряная плитка",
		GENITIVE = "серебряной плитки",
		DATIVE = "серебряной плитке",
		ACCUSATIVE = "серебряную плитку",
		INSTRUMENTAL = "серебряной плиткой",
		PREPOSITIONAL = "серебряной плитке",
	)

/obj/item/stack/tile/mineral/diamond
	name = "diamond tile"
	singular_name = "diamond floor tile"
	desc = "Плитка, сделанная из алмазов. Вау, просто вау."
	icon_state = "tile_diamond"
	inhand_icon_state = "tile-diamond"
	turf_type = /turf/open/floor/mineral/diamond
	mineralType = "diamond"
	mats_per_unit = list(/datum/material/diamond=SHEET_MATERIAL_AMOUNT*0.25)
	merge_type = /obj/item/stack/tile/mineral/diamond

/obj/item/stack/tile/mineral/diamond/get_ru_names()
	return alist(
		NOMINATIVE = "алмазная плитка",
		GENITIVE = "алмазной плитки",
		DATIVE = "алмазной плитке",
		ACCUSATIVE = "алмазную плитку",
		INSTRUMENTAL = "алмазной плиткой",
		PREPOSITIONAL = "алмазной плитке",
	)

/obj/item/stack/tile/mineral/bananium
	name = "bananium tile"
	singular_name = "bananium floor tile"
	desc = "Нескользкая плитка из бананиума, ХО-О-О-ОНК!"
	icon_state = "tile_bananium"
	inhand_icon_state = "tile-bananium"
	turf_type = /turf/open/floor/mineral/bananium
	mineralType = "bananium"
	mats_per_unit = list(/datum/material/bananium=SHEET_MATERIAL_AMOUNT*0.25)
	material_flags = NONE //The slippery comp makes it unpractical for good clown decor. The material tiles should still slip.
	merge_type = /obj/item/stack/tile/mineral/bananium

/obj/item/stack/tile/mineral/bananium/get_ru_names()
	return alist(
		NOMINATIVE = "бананиумовая плитка",
		GENITIVE = "бананиумовой плитки",
		DATIVE = "бананиумовой плитке",
		ACCUSATIVE = "бананиумовую плитку",
		INSTRUMENTAL = "бананиумовой плиткой",
		PREPOSITIONAL = "бананиумовой плитке",
	)

/obj/item/stack/tile/mineral/abductor
	name = "alien floor tile"
	singular_name = "alien floor tile"
	desc = "Плитка из инопланетного сплава."
	icon = 'icons/obj/antags/abductor.dmi'
	icon_state = "tile_abductor"
	inhand_icon_state = "tile-abductor"
	mats_per_unit = list(/datum/material/alloy/alien=SHEET_MATERIAL_AMOUNT*0.25)
	turf_type = /turf/open/floor/mineral/abductor
	mineralType = "abductor"
	merge_type = /obj/item/stack/tile/mineral/abductor

/obj/item/stack/tile/mineral/abductor/get_ru_names()
	return alist(
		NOMINATIVE = "инопланетная плитка",
		GENITIVE = "инопланетной плитки",
		DATIVE = "инопланетной плитке",
		ACCUSATIVE = "инопланетную плитку",
		INSTRUMENTAL = "инопланетной плиткой",
		PREPOSITIONAL = "инопланетной плитке",
	)

/obj/item/stack/tile/mineral/titanium
	name = "titanium tile"
	singular_name = "titanium floor tile"
	desc = "Гладкая титановая плитка, используемая для шаттлов."
	icon_state = "tile_titanium"
	inhand_icon_state = "tile-shuttle"
	turf_type = /turf/open/floor/mineral/titanium
	mineralType = "titanium"
	mats_per_unit = list(/datum/material/titanium=SHEET_MATERIAL_AMOUNT*0.25)
	merge_type = /obj/item/stack/tile/mineral/titanium
	tile_reskin_types = list(
		/obj/item/stack/tile/mineral/titanium,
		/obj/item/stack/tile/mineral/titanium/yellow,
		/obj/item/stack/tile/mineral/titanium/blue,
		/obj/item/stack/tile/mineral/titanium/white,
		/obj/item/stack/tile/mineral/titanium/purple,
		/obj/item/stack/tile/mineral/titanium/tiled,
		/obj/item/stack/tile/mineral/titanium/tiled/yellow,
		/obj/item/stack/tile/mineral/titanium/tiled/blue,
		/obj/item/stack/tile/mineral/titanium/tiled/white,
		/obj/item/stack/tile/mineral/titanium/tiled/purple,
		)

/obj/item/stack/tile/mineral/titanium/get_ru_names()
	return alist(
		NOMINATIVE = "титановая плитка",
		GENITIVE = "титановой плитки",
		DATIVE = "титановой плитке",
		ACCUSATIVE = "титановую плитку",
		INSTRUMENTAL = "титановой плиткой",
		PREPOSITIONAL = "титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/yellow
	name = "yellow titanium tile"
	singular_name = "yellow titanium floor tile"
	desc = "Гладкая жёлтая титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/yellow
	icon_state = "tile_titanium_yellow"
	merge_type = /obj/item/stack/tile/mineral/titanium/yellow

/obj/item/stack/tile/mineral/titanium/yellow/get_ru_names()
	return alist(
		NOMINATIVE = "жёлтая титановая плитка",
		GENITIVE = "жёлтой титановой плитки",
		DATIVE = "жёлтой титановой плитке",
		ACCUSATIVE = "жёлтую титановую плитку",
		INSTRUMENTAL = "жёлтой титановой плиткой",
		PREPOSITIONAL = "жёлтой титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/blue
	name = "blue titanium tile"
	singular_name = "blue titanium floor tile"
	desc = "Гладкая синяя титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/blue
	icon_state = "tile_titanium_blue"
	merge_type = /obj/item/stack/tile/mineral/titanium/blue

/obj/item/stack/tile/mineral/titanium/blue/get_ru_names()
	return alist(
		NOMINATIVE = "синяя титановая плитка",
		GENITIVE = "синей титановой плитки",
		DATIVE = "синей титановой плитке",
		ACCUSATIVE = "синюю титановую плитку",
		INSTRUMENTAL = "синей титановой плиткой",
		PREPOSITIONAL = "синей титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/white
	name = "white titanium tile"
	singular_name = "white titanium floor tile"
	desc = "Гладкая белая титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/white
	icon_state = "tile_titanium_white"
	merge_type = /obj/item/stack/tile/mineral/titanium/white

/obj/item/stack/tile/mineral/titanium/white/get_ru_names()
	return alist(
		NOMINATIVE = "белая титановая плитка",
		GENITIVE = "белой титановой плитки",
		DATIVE = "белой титановой плитке",
		ACCUSATIVE = "белую титановую плитку",
		INSTRUMENTAL = "белой титановой плиткой",
		PREPOSITIONAL = "белой титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/purple
	name = "purple titanium tile"
	singular_name = "purple titanium floor tile"
	desc = "Гладкая фиолетовая титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/purple
	icon_state = "tile_titanium_purple"
	merge_type = /obj/item/stack/tile/mineral/titanium/purple

/obj/item/stack/tile/mineral/titanium/purple/get_ru_names()
	return alist(
		NOMINATIVE = "фиолетовая титановая плитка",
		GENITIVE = "фиолетовой титановой плитки",
		DATIVE = "фиолетовой титановой плитке",
		ACCUSATIVE = "фиолетовую титановую плитку",
		INSTRUMENTAL = "фиолетовой титановой плиткой",
		PREPOSITIONAL = "фиолетовой титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/tiled
	name = "tiled titanium tile"
	singular_name = "tiled titanium floor tile"
	desc = "Титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/tiled
	icon_state = "tile_titanium_tiled"
	merge_type = /obj/item/stack/tile/mineral/titanium/tiled

/obj/item/stack/tile/mineral/titanium/tiled/get_ru_names()
	return alist(
		NOMINATIVE = "мощёная титановая плитка",
		GENITIVE = "мощёной титановой плитки",
		DATIVE = "мощёной титановой плитке",
		ACCUSATIVE = "мощёную титановую плитку",
		INSTRUMENTAL = "мощёной титановой плиткой",
		PREPOSITIONAL = "мощёной титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/tiled/yellow
	name = "yellow titanium tile"
	singular_name = "yellow titanium floor tile"
	desc = "Жёлтая титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/tiled/yellow
	icon_state = "tile_titanium_tiled_yellow"
	merge_type = /obj/item/stack/tile/mineral/titanium/tiled/yellow

/obj/item/stack/tile/mineral/titanium/tiled/yellow/get_ru_names()
	return alist(
		NOMINATIVE = "жёлтая мощёная титановая плитка",
		GENITIVE = "жёлтой мощёной титановой плитки",
		DATIVE = "жёлтой мощёной титановой плитке",
		ACCUSATIVE = "жёлтую мощёную титановую плитку",
		INSTRUMENTAL = "жёлтой мощёной титановой плиткой",
		PREPOSITIONAL = "жёлтой мощёной титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/tiled/blue
	name = "blue titanium tile"
	singular_name = "blue titanium floor tile"
	desc = "Синяя титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/tiled/blue
	icon_state = "tile_titanium_tiled_blue"
	merge_type = /obj/item/stack/tile/mineral/titanium/tiled/blue

/obj/item/stack/tile/mineral/titanium/tiled/blue/get_ru_names()
	return alist(
		NOMINATIVE = "синяя мощёная титановая плитка",
		GENITIVE = "синей мощёной титановой плитки",
		DATIVE = "синей мощёной титановой плитке",
		ACCUSATIVE = "синюю мощёную титановую плитку",
		INSTRUMENTAL = "синей мощёной титановой плиткой",
		PREPOSITIONAL = "синей мощёной титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/tiled/white
	name = "white titanium tile"
	singular_name = "white titanium floor tile"
	desc = "Белая титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/tiled/white
	icon_state = "tile_titanium_tiled_white"
	merge_type = /obj/item/stack/tile/mineral/titanium/tiled/white

/obj/item/stack/tile/mineral/titanium/tiled/white/get_ru_names()
	return alist(
		NOMINATIVE = "белая мощёная титановая плитка",
		GENITIVE = "белой мощёной титановой плитки",
		DATIVE = "белой мощёной титановой плитке",
		ACCUSATIVE = "белую мощёную титановую плитку",
		INSTRUMENTAL = "белой мощёной титановой плиткой",
		PREPOSITIONAL = "белой мощёной титановой плитке",
	)

/obj/item/stack/tile/mineral/titanium/tiled/purple
	name = "purple titanium tile"
	singular_name = "purple titanium floor tile"
	desc = "Фиолетовая титановая плитка, используемая для шаттлов."
	turf_type = /turf/open/floor/mineral/titanium/tiled/purple
	icon_state = "tile_titanium_tiled_purple"
	merge_type = /obj/item/stack/tile/mineral/titanium/tiled/purple

/obj/item/stack/tile/mineral/titanium/tiled/purple/get_ru_names()
	return alist(
		NOMINATIVE = "фиолетовая мощёная титановая плитка",
		GENITIVE = "фиолетовой мощёной титановой плитки",
		DATIVE = "фиолетовой мощёной титановой плитке",
		ACCUSATIVE = "фиолетовую мощёную титановую плитку",
		INSTRUMENTAL = "фиолетовой мощёной титановой плиткой",
		PREPOSITIONAL = "фиолетовой мощёной титановой плитке",
	)

/obj/item/stack/tile/mineral/plastitanium
	name = "plastitanium tile"
	singular_name = "plastitanium floor tile"
	desc = "Плитка из пластитана, используется для очень злых шаттлов."
	icon_state = "tile_plastitanium"
	inhand_icon_state = "tile-darkshuttle"
	turf_type = /turf/open/floor/mineral/plastitanium
	mineralType = "plastitanium"
	mats_per_unit = list(/datum/material/alloy/plastitanium=SHEET_MATERIAL_AMOUNT*0.25)
	merge_type = /obj/item/stack/tile/mineral/plastitanium
	tile_reskin_types = list(
		/obj/item/stack/tile/mineral/plastitanium,
		/obj/item/stack/tile/mineral/plastitanium/red,
		)

/obj/item/stack/tile/mineral/plastitanium/get_ru_names()
	return alist(
		NOMINATIVE = "пластитановая плитка",
		GENITIVE = "пластитановой плитки",
		DATIVE = "пластитановой плитке",
		ACCUSATIVE = "пластитановую плитку",
		INSTRUMENTAL = "пластитановой плиткой",
		PREPOSITIONAL = "пластитановой плитке",
	)

/obj/item/stack/tile/mineral/plastitanium/red
	name = "red plastitanium tile"
	singular_name = "red plastitanium floor tile"
	desc = "Плитка из пластитана, используется для очень красных шаттлов."
	turf_type = /turf/open/floor/mineral/plastitanium/red
	icon_state = "tile_plastitanium_red"
	merge_type = /obj/item/stack/tile/mineral/plastitanium/red

/obj/item/stack/tile/mineral/plastitanium/red/get_ru_names()
	return alist(
		NOMINATIVE = "красная пластитановая плитка",
		GENITIVE = "красной пластитановой плитки",
		DATIVE = "красной пластитановой плитке",
		ACCUSATIVE = "красную пластитановую плитку",
		INSTRUMENTAL = "красной пластитановой плиткой",
		PREPOSITIONAL = "красной пластитановой плитке",
	)

/obj/item/stack/tile/mineral/snow
	name = "snow tile"
	singular_name = "snow tile"
	desc = "Слой снега."
	icon_state = "tile_snow"
	inhand_icon_state = "tile-silver"
	turf_type = /turf/open/floor/fake_snow
	mineralType = "snow"
	merge_type = /obj/item/stack/tile/mineral/snow
	mats_per_unit = list(/datum/material/snow = HALF_SHEET_MATERIAL_AMOUNT / 2)

/obj/item/stack/tile/mineral/snow/get_ru_names()
	return alist(
		NOMINATIVE = "снежная плитка",
		GENITIVE = "снежной плитки",
		DATIVE = "снежной плитке",
		ACCUSATIVE = "снежную плитку",
		INSTRUMENTAL = "снежной плиткой",
		PREPOSITIONAL = "снежной плитке",
	)
