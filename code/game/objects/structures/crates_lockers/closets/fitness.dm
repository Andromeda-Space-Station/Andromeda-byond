/obj/structure/closet/athletic_mixed
	name = "athletic wardrobe"
	desc = "Это шкаф для хранения спортивной одежды."
	gender = MALE
	icon_door = "mixed"

/obj/structure/closet/athletic_mixed/get_ru_names()
	return list(
		NOMINATIVE = "спортивный гардероб",
		GENITIVE = "спортивного гардероба",
		DATIVE = "спортивному гардеробу",
		ACCUSATIVE = "спортивный гардероб",
		INSTRUMENTAL = "спортивным гардеробом",
		PREPOSITIONAL = "спортивном гардеробе",
	)

/obj/structure/closet/athletic_mixed/PopulateContents()
	..()
	new /obj/item/clothing/under/shorts/purple(src)
	new /obj/item/clothing/under/shorts/grey(src)
	new /obj/item/clothing/under/shorts/black(src)
	new /obj/item/clothing/under/shorts/red(src)
	new /obj/item/clothing/under/shorts/blue(src)
	new /obj/item/clothing/under/shorts/green(src)
	new /obj/item/clothing/under/costume/jabroni(src)


/obj/structure/closet/boxinggloves
	name = "boxing gloves closet"
	desc = "Это шкаф для хранения перчаток, используемых на боксёрском ринге."
	gender = MALE
	icon_door = "mixed"

/obj/structure/closet/boxinggloves/get_ru_names()
	return list(
		NOMINATIVE = "шкаф с боксёрскими перчатками",
		GENITIVE = "шкафа с боксёрскими перчатками",
		DATIVE = "шкафу с боксёрскими перчатками",
		ACCUSATIVE = "шкаф с боксёрскими перчатками",
		INSTRUMENTAL = "шкафом с боксёрскими перчатками",
		PREPOSITIONAL = "шкафе с боксёрскими перчатками",
	)

/obj/structure/closet/boxinggloves/PopulateContents()
	..()
	new /obj/item/clothing/gloves/boxing/blue(src)
	new /obj/item/clothing/gloves/boxing/green(src)
	new /obj/item/clothing/gloves/boxing/yellow(src)
	new /obj/item/clothing/gloves/boxing(src)


/obj/structure/closet/masks
	name = "mask closet"
	desc = "ЭТО ШКАФ ДЛЯ ХРАНЕНИЯ МАСОК БОЙЦОВ, ОЛЕ!"
	gender = MALE

/obj/structure/closet/masks/get_ru_names()
	return list(
		NOMINATIVE = "шкаф с масками",
		GENITIVE = "шкафа с масками",
		DATIVE = "шкафу с масками",
		ACCUSATIVE = "шкаф с масками",
		INSTRUMENTAL = "шкафом с масками",
		PREPOSITIONAL = "шкафе с масками",
	)

/obj/structure/closet/masks/PopulateContents()
	..()
	new /obj/item/clothing/mask/luchador(src)
	new /obj/item/clothing/mask/luchador/rudos(src)
	new /obj/item/clothing/mask/luchador/tecnicos(src)


/obj/structure/closet/lasertag/red
	name = "red laser tag equipment"
	desc = "Это стойка для хранения снаряжения для лазертага."
	gender = FEMALE
	icon_door = "red"
	icon_state = "rack"

/obj/structure/closet/lasertag/red/get_ru_names()
	return list(
		NOMINATIVE = "стойка с красным снаряжением",
		GENITIVE = "стойки с красным снаряжением",
		DATIVE = "стойке с красным снаряжением",
		ACCUSATIVE = "стойку с красным снаряжением",
		INSTRUMENTAL = "стойкой с красным снаряжением",
		PREPOSITIONAL = "стойке с красным снаряжением",
	)

/obj/structure/closet/lasertag/red/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser/redtag(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/redtag(src)
	new /obj/item/clothing/head/helmet/taghelm/red(src)


/obj/structure/closet/lasertag/blue
	name = "blue laser tag equipment"
	desc = "Это стойка для хранения снаряжения для лазертага."
	gender = FEMALE
	icon_door = "blue"
	icon_state = "rack"

/obj/structure/closet/lasertag/blue/get_ru_names()
	return list(
		NOMINATIVE = "стойка с синим снаряжением",
		GENITIVE = "стойки с синим снаряжением",
		DATIVE = "стойке с синим снаряжением",
		ACCUSATIVE = "стойку с синим снаряжением",
		INSTRUMENTAL = "стойкой с синим снаряжением",
		PREPOSITIONAL = "стойке с синим снаряжением",
	)

/obj/structure/closet/lasertag/blue/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser/bluetag(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/bluetag(src)
	new /obj/item/clothing/head/helmet/taghelm/blue(src)
