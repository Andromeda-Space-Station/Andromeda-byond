/obj/structure/closet/secure_closet/medical1
	name = "medicine closet"
	desc = "Забит до отказа медицинским хламом."
	gender = MALE
	icon_state = "med"
	req_access = list(ACCESS_MEDICAL)

/obj/structure/closet/secure_closet/medical1/get_ru_names()
	return list(
		NOMINATIVE = "шкаф с медикаментами",
		GENITIVE = "шкафа с медикаментами",
		DATIVE = "шкафу с медикаментами",
		ACCUSATIVE = "шкаф с медикаментами",
		INSTRUMENTAL = "шкафом с медикаментами",
		PREPOSITIONAL = "шкафе с медикаментами",
	)

/obj/structure/closet/secure_closet/medical1/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/reagent_containers/cup/beaker = 2,
		/obj/item/reagent_containers/dropper = 2,
		/obj/item/storage/belt/medical = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/reagent_containers/cup/bottle/toxin = 1,
		/obj/item/reagent_containers/cup/bottle/morphine = 2,
		/obj/item/reagent_containers/cup/bottle/epinephrine= 3,
		/obj/item/reagent_containers/cup/bottle/multiver = 3,
		/obj/item/storage/box/rxglasses = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/secure_closet/medical2
	name = "anesthetic closet"
	desc = "Используется для отрубания людей."
	gender = MALE
	icon_state = "med_secure"
	req_access = list(ACCESS_SURGERY)

/obj/structure/closet/secure_closet/medical2/get_ru_names()
	return list(
		NOMINATIVE = "шкаф с анестетиками",
		GENITIVE = "шкафа с анестетиками",
		DATIVE = "шкафу с анестетиками",
		ACCUSATIVE = "шкаф с анестетиками",
		INSTRUMENTAL = "шкафом с анестетиками",
		PREPOSITIONAL = "шкафе с анестетиками",
	)

/obj/structure/closet/secure_closet/medical2/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/tank/internals/anesthetic(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/mask/breath/muzzle(src)

/obj/structure/closet/secure_closet/medical3
	name = "medical doctor's locker"
	gender = MALE
	req_access = list(ACCESS_SURGERY)
	icon_state = "med_secure"

/obj/structure/closet/secure_closet/medical3/get_ru_names()
	return list(
		NOMINATIVE = "шкаф врача",
		GENITIVE = "шкафа врача",
		DATIVE = "шкафу врача",
		ACCUSATIVE = "шкаф врача",
		INSTRUMENTAL = "шкафом врача",
		PREPOSITIONAL = "шкафе врача",
	)

/obj/structure/closet/secure_closet/medical3/PopulateContents()
	..()
	new /obj/item/radio/headset/headset_med(src)
	new /obj/item/defibrillator/loaded(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/clothing/glasses/hud/health(src)
	return

/obj/structure/closet/secure_closet/psychology
	name = "psychology locker"
	gender = MALE
	req_access = list(ACCESS_PSYCHOLOGY)
	icon_state = "cabinet"
	door_anim_time = 0 // no animation
	open_sound = 'sound/machines/closet/wooden_closet_open.ogg'
	close_sound = 'sound/machines/closet/wooden_closet_close.ogg'
	open_sound_volume = 25
	close_sound_volume = 50

/obj/structure/closet/secure_closet/psychology/get_ru_names()
	return list(
		NOMINATIVE = "шкаф психолога",
		GENITIVE = "шкафа психолога",
		DATIVE = "шкафу психолога",
		ACCUSATIVE = "шкаф психолога",
		INSTRUMENTAL = "шкафом психолога",
		PREPOSITIONAL = "шкафе психолога",
	)

/obj/structure/closet/secure_closet/psychology/PopulateContents()
	..()
	new /obj/item/clothing/under/costume/buttondown/slacks/service(src)
	new /obj/item/clothing/under/costume/buttondown/skirt/service(src)
	new /obj/item/clothing/neck/tie/black(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/storage/backpack/medic(src)
	new /obj/item/radio/headset/headset_srvmed(src)
	new /obj/item/clipboard(src)
	new /obj/item/clothing/suit/jacket/straight_jacket(src)
	new /obj/item/clothing/ears/earmuffs(src)
	new /obj/item/clothing/mask/muzzle(src)
	new /obj/item/clothing/glasses/blindfold(src)

/obj/structure/closet/secure_closet/chief_medical
	name = "chief medical officer's locker"
	gender = MALE
	req_access = list(ACCESS_CMO)
	icon_state = "cmo"

/obj/structure/closet/secure_closet/chief_medical/get_ru_names()
	return list(
		NOMINATIVE = "шкаф главного врача",
		GENITIVE = "шкафа главного врача",
		DATIVE = "шкафу главного врача",
		ACCUSATIVE = "шкаф главного врача",
		INSTRUMENTAL = "шкафом главного врача",
		PREPOSITIONAL = "шкафе главного врача",
	)

/obj/structure/closet/secure_closet/chief_medical/PopulateContents()
	..()

	new /obj/item/clothing/suit/bio_suit/cmo(src)
	new /obj/item/clothing/head/bio_hood/cmo(src)
	new /obj/item/storage/bag/garment/chief_medical(src)
	new /obj/item/computer_disk/command/cmo(src)
	new /obj/item/radio/headset/heads/cmo(src)
	new /obj/item/megaphone/command(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/autosurgeon/medical_hud(src)
	new /obj/item/door_remote/chief_medical_officer(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/pet_carrier(src)
	new /obj/item/circuitboard/machine/techfab/department/medical(src)
	new /obj/item/storage/photo_album/cmo(src)
	new /obj/item/storage/lockbox/medal/med(src)

/obj/structure/closet/secure_closet/chief_medical/populate_contents_immediate()
	. = ..()

	// Traitor steal objective
	new /obj/item/reagent_containers/hypospray/cmo(src)
	new /obj/item/defibrillator/compact/loaded/cmo(src)

/obj/structure/closet/secure_closet/animal
	name = "animal control locker"
	gender = MALE
	icon_door = "chemical"
	req_access = list(ACCESS_SURGERY)

/obj/structure/closet/secure_closet/animal/get_ru_names()
	return list(
		NOMINATIVE = "шкаф контроля животных",
		GENITIVE = "шкафа контроля животных",
		DATIVE = "шкафу контроля животных",
		ACCUSATIVE = "шкаф контроля животных",
		INSTRUMENTAL = "шкафом контроля животных",
		PREPOSITIONAL = "шкафе контроля животных",
	)

/obj/structure/closet/secure_closet/animal/PopulateContents()
	..()
	new /obj/item/assembly/signaler(src)
	for(var/i in 1 to 3)
		new /obj/item/electropack(src)

/obj/structure/closet/secure_closet/chemical
	name = "chemical closet"
	desc = "Храните опасные химикаты здесь."
	gender = MALE
	req_access = list(ACCESS_PHARMACY)
	icon_state = "chem_secure"

/obj/structure/closet/secure_closet/chemical/get_ru_names()
	return list(
		NOMINATIVE = "химический шкаф",
		GENITIVE = "химического шкафа",
		DATIVE = "химическому шкафу",
		ACCUSATIVE = "химический шкаф",
		INSTRUMENTAL = "химическим шкафом",
		PREPOSITIONAL = "химическом шкафе",
	)

/obj/structure/closet/secure_closet/chemical/PopulateContents()
	..()
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/box/medigels(src)
	new /obj/item/storage/box/medigels(src)
	new /obj/item/ph_booklet(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/cup/bottle/acidic_buffer(src) //hopefully they get the hint

/obj/structure/closet/secure_closet/chemical/heisenberg //contains one of each beaker, syringe etc.
	name = "advanced chemical closet"
	gender = MALE
	req_access = list(ACCESS_PLUMBING)

/obj/structure/closet/secure_closet/chemical/heisenberg/get_ru_names()
	return list(
		NOMINATIVE = "продвинутый химический шкаф",
		GENITIVE = "продвинутого химического шкафа",
		DATIVE = "продвинутому химическому шкафу",
		ACCUSATIVE = "продвинутый химический шкаф",
		INSTRUMENTAL = "продвинутым химическим шкафом",
		PREPOSITIONAL = "продвинутом химическом шкафе",
	)

/obj/structure/closet/secure_closet/chemical/heisenberg/PopulateContents()
	..()
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/storage/box/syringes/variety(src)
	new /obj/item/storage/box/beakers/variety(src)
	new /obj/item/clothing/glasses/science(src)

/obj/structure/closet/secure_closet/paramedic
	name = "emergency medical team locker"
	gender = MALE
	req_access = list(ACCESS_PARAMEDIC)
	icon_state = "paramed_secure"

/obj/structure/closet/secure_closet/paramedic/get_ru_names()
	return list(
		NOMINATIVE = "шкаф парамедика",
		GENITIVE = "шкафа парамедика",
		DATIVE = "шкафу парамедика",
		ACCUSATIVE = "шкаф парамедика",
		INSTRUMENTAL = "шкафом парамедика",
		PREPOSITIONAL = "шкафе парамедика",
	)

/obj/structure/closet/secure_closet/paramedic/PopulateContents()
	..()

	var/static/items_inside = list(
		/obj/item/storage/medkit/emergency = 1,
		/obj/item/storage/box/bandages = 1,
		/obj/item/pinpointer/crew = 1,
		/obj/item/storage/belt/medical/paramedic = 1,
		/obj/item/radio/headset/headset_med = 2,
		/obj/item/emergency_bed = 2,
		/obj/item/storage/bag/garment/paramedic = 2,
	)
	generate_items_inside(items_inside,src)

