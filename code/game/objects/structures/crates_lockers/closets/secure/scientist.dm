/obj/structure/closet/secure_closet/research_director
	name = "research director's locker"
	gender = MALE
	req_access = list(ACCESS_RD)
	icon_state = "rd"

/obj/structure/closet/secure_closet/research_director/get_ru_names()
	return list(
		NOMINATIVE = "шкаф научного руководителя",
		GENITIVE = "шкафа научного руководителя",
		DATIVE = "шкафу научного руководителя",
		ACCUSATIVE = "шкаф научного руководителя",
		INSTRUMENTAL = "шкафом научного руководителя",
		PREPOSITIONAL = "шкафе научного руководителя",
	)

/obj/structure/closet/secure_closet/research_director/PopulateContents()
	..()

	new /obj/item/clothing/suit/bio_suit/scientist(src)
	new /obj/item/clothing/head/bio_hood/scientist(src)
	new /obj/item/storage/bag/garment/research_director(src)
	new /obj/item/computer_disk/command/rd(src)
	new /obj/item/radio/headset/heads/rd(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/storage/lockbox/medal/sci(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/door_remote/research_director(src)
	new /obj/item/circuitboard/machine/techfab/department/science(src)
	new /obj/item/storage/photo_album/rd(src)
	new /obj/item/storage/box/skillchips/science(src)

/obj/structure/closet/secure_closet/research_director/populate_contents_immediate()
	. = ..()

	// Traitor steal objectives
	new /obj/item/clothing/suit/armor/reactive/teleport(src)
	new /obj/item/laser_pointer(src)

/obj/structure/closet/secure_closet/cytology
	name = "cytology equipment locker"
	gender = MALE
	icon_state = "science"
	req_access = list(ACCESS_RESEARCH)

/obj/structure/closet/secure_closet/cytology/get_ru_names()
	return list(
		NOMINATIVE = "шкаф цитологического оборудования",
		GENITIVE = "шкафа цитологического оборудования",
		DATIVE = "шкафу цитологического оборудования",
		ACCUSATIVE = "шкаф цитологического оборудования",
		INSTRUMENTAL = "шкафом цитологического оборудования",
		PREPOSITIONAL = "шкафе цитологического оборудования",
	)

/obj/structure/closet/secure_closet/cytology/PopulateContents()
	. = ..()
	new /obj/item/pushbroom(src)
	new /obj/item/storage/bag/xeno(src)
	new /obj/item/storage/box/petridish(src)
	for(var/i in 1 to 2)
		new /obj/item/biopsy_tool(src)
		new /obj/item/storage/box/swab(src)
	new /obj/item/reagent_containers/condiment/protein(src)
