/obj/structure/closet/secure_closet/hydroponics
	name = "botanist's locker"
	gender = MALE
	req_access = list(ACCESS_HYDROPONICS)
	icon_state = "hydro"

/obj/structure/closet/secure_closet/hydroponics/get_ru_names()
	return alist(
		NOMINATIVE = "шкаф ботаника",
		GENITIVE = "шкафа ботаника",
		DATIVE = "шкафу ботаника",
		ACCUSATIVE = "шкаф ботаника",
		INSTRUMENTAL = "шкафом ботаника",
		PREPOSITIONAL = "шкафе ботаника",
	)

/obj/structure/closet/secure_closet/hydroponics/PopulateContents()
	..()
	new /obj/item/storage/bag/plants/portaseeder(src)
	new /obj/item/plant_analyzer(src)
	new /obj/item/radio/headset/headset_srv(src)
	new /obj/item/cultivator(src)
	new /obj/item/hatchet(src)
	new /obj/item/secateurs(src)
