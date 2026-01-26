/obj/item/clothing/gloves/color/plasmaman
	desc = "Скрывает костлявые руки.."
	name = "plasma envirogloves"
	icon_state = "plasmaman"
	greyscale_colors = "#913b00"
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor_type = /datum/armor/color_plasmaman
	equip_sound = 'sound/items/equip/glove_equip.ogg'

/datum/armor/color_plasmaman
	bio = 100
	fire = 95
	acid = 95

/obj/item/clothing/gloves/color/plasmaman/black
	name = "black envirogloves"
	icon_state = "blackplasma"
	greyscale_colors = "#2f2e31"

/obj/item/clothing/gloves/color/plasmaman/get_ru_names()
	return alist(
		NOMINATIVE = "плазмогерметичные перчатки",
		GENITIVE = "плазмогерметичных перчаток",
		DATIVE = "плазмогерметичным перчаткам",
		ACCUSATIVE = "плазмогерметичные перчатки",
		INSTRUMENTAL = "плазмогерметичными перчатками",
		PREPOSITIONAL = "плазмогерметичных перчатках",
	)

/obj/item/clothing/gloves/color/plasmaman/plasmanitrile
	name = "nitrile envirogloves"
	desc = "Дорогие нитриловые перчатки, изготовленные для плазмалюдей."
	icon_state = "nitrile"
	greyscale_colors = "#913b00"
	clothing_traits = list(TRAIT_QUICKER_CARRY, TRAIT_FASTMED)

/obj/item/clothing/gloves/color/plasmaman/white
	name = "white envirogloves"
	icon_state = "whiteplasma"
	greyscale_colors = "#ffffff"

/obj/item/clothing/gloves/color/plasmaman/robot
	name = "roboticist envirogloves"
	icon_state = "robotplasma"
	greyscale_colors = "#932500"

/obj/item/clothing/gloves/color/plasmaman/janny
	name = "janitor envirogloves"
	icon_state = "jannyplasma"
	greyscale_colors = "#883391"

/obj/item/clothing/gloves/color/plasmaman/cargo
	name = "cargo envirogloves"
	icon_state = "cargoplasma"
	greyscale_colors = "#bb9042"

/obj/item/clothing/gloves/color/plasmaman/engineer
	name = "engineering envirogloves"
	icon_state = "engieplasma"
	greyscale_colors = "#d75600"
	siemens_coefficient = 0

/obj/item/clothing/gloves/color/plasmaman/atmos
	name = "atmos envirogloves"
	icon_state = "atmosplasma"
	greyscale_colors = "#00a5ff"

/obj/item/clothing/gloves/color/plasmaman/explorer
	name = "explorer envirogloves"
	icon_state = "explorerplasma"
	greyscale_colors = "#47453d"

/obj/item/clothing/gloves/color/plasmaman/plasmanitrile/get_ru_names()
	return alist(
		NOMINATIVE = "плазмогерметичные нитриловые перчатки",
		GENITIVE = "плазмогерметичных нитриловых перчаток",
		DATIVE = "плазмогерметичным нитриловым перчаткам",
		ACCUSATIVE = "плазмогерметичные нитриловые перчатки",
		INSTRUMENTAL = "плазмогерметичными нитриловыми перчатками",
		PREPOSITIONAL = "плазмогерметичных нитриловых перчатках",
	)

/obj/item/clothing/gloves/color/plasmaman/botanic_leather
	name = "botany envirogloves"
	desc = "Эти кожаные перчатки защищают ваши костлявые руки от шипов, зазубрин, колючек, иголок и других опасных объектов растительного происхождения."
	icon_state = "botanyplasma"
	greyscale_colors = "#3164ff"
	clothing_traits = list(TRAIT_PLANT_SAFE)

/obj/item/clothing/gloves/color/plasmaman/prototype
	name = "prototype envirogloves"
	icon_state = "protoplasma"
	greyscale_colors = "#911801"

/obj/item/clothing/gloves/color/plasmaman/clown
	name = "clown envirogloves"
	icon_state = "clownplasma"
	greyscale_colors = "#ff0000"

/obj/item/clothing/gloves/color/plasmaman/botanic_leather/get_ru_names()
	return alist(
		NOMINATIVE = "плазмогерметичные кожаные перчатки",
		GENITIVE = "плазмогерметичных кожаных перчаток",
		DATIVE = "плазмогерметичным кожаным перчаткам",
		ACCUSATIVE = "плазмогерметичные кожаные перчатки",
		INSTRUMENTAL = "плазмогерметичными кожаными перчатками",
		PREPOSITIONAL = "плазмогерметичных кожаных перчатках",
	)

/obj/item/clothing/gloves/color/plasmaman/clown/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CLOWN, CELL_VIRUS_TABLE_GENERIC, rand(2,3), 0)

/obj/item/clothing/gloves/color/plasmaman/head_of_personnel
	name = "head of personnel's envirogloves"
	desc = "Скрывает костлявые руки. Похоже, это попытка сделать реплику перчаток капитана."
	icon_state = "hopplasma"
	inhand_icon_state = null
	greyscale_colors = null

/obj/item/clothing/gloves/color/plasmaman/chief_engineer
	name = "chief engineer's envirogloves"
	icon_state = "ceplasma"
	greyscale_colors = "#45ff00"
	siemens_coefficient = 0

/obj/item/clothing/gloves/color/plasmaman/research_director
	name = "research director's envirogloves"
	icon_state = "rdplasma"
	greyscale_colors = "#64008a"

/obj/item/clothing/gloves/color/plasmaman/centcom_commander
	name = "CentCom commander envirogloves"
	icon_state = "commanderplasma"
	greyscale_colors = "#009100"

/obj/item/clothing/gloves/color/plasmaman/centcom_official
	name = "CentCom official envirogloves"
	icon_state = "officialplasma"
	greyscale_colors = "#10af77"

/obj/item/clothing/gloves/color/plasmaman/centcom_intern
	name = "CentCom intern envirogloves"
	icon_state = "internplasma"
	greyscale_colors = "#00974b"

/obj/item/clothing/gloves/color/plasmaman/head_of_personnel/get_ru_names()
	return alist(
		NOMINATIVE = "плазмогерметичные перчатки главы",
		GENITIVE = "плазмогерметичных перчаток главы",
		DATIVE = "плазмогерметичным перчаткам главы",
		ACCUSATIVE = "плазмогерметичные перчатки главы",
		INSTRUMENTAL = "плазмогерметичными перчатками главы",
		PREPOSITIONAL = "плазмогерметичных перчатках главы",
	)

/obj/item/clothing/gloves/color/plasmaman/radio
	name = "translation envirogloves"
	desc = "Позволяет менее разговорчивым плазмалюдям использовать язык жестов по каналам связи."
	icon_state = "radio_gplasma"
	inhand_icon_state = null
	greyscale_colors = null
	worn_icon_state = "radio_g"
	clothing_traits = list(TRAIT_CAN_SIGN_ON_COMMS)

/obj/item/clothing/gloves/color/plasmaman/radio/get_ru_names()
	return alist(
		NOMINATIVE = "плазмогерметичные переводные перчатки",
		GENITIVE = "плазмогерметичных переводных перчаток",
		DATIVE = "плазмогерметичным переводным перчаткам",
		ACCUSATIVE = "плазмогерметичные переводные перчатки",
		INSTRUMENTAL = "плазмогерметичными переводными перчатками",
		PREPOSITIONAL = "плазмогерметичных переводных перчатках",
	)
