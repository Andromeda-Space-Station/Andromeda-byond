// Closets for specific jobs

/obj/structure/closet/gmcloset
	name = "formal closet"
	desc = "Это шкаф для хранения официальной одежды."
	gender = MALE
	icon_door = "bar_wardrobe"

/obj/structure/closet/gmcloset/get_ru_names()
	return list(
		NOMINATIVE = "шкаф с официальной одеждой",
		GENITIVE = "шкафа с официальной одеждой",
		DATIVE = "шкафу с официальной одеждой",
		ACCUSATIVE = "шкаф с официальной одеждой",
		INSTRUMENTAL = "шкафом с официальной одеждой",
		PREPOSITIONAL = "шкафе с официальной одеждой",
	)

/obj/structure/closet/gmcloset/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/clothing/head/hats/tophat = 2,
		/obj/item/radio/headset/headset_srv = 2,
		/obj/item/clothing/under/costume/buttondown/slacks/service = 2,
		/obj/item/clothing/accessory/waistcoat = 2,
		/obj/item/clothing/head/soft/black = 2,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/rag = 2,
		/obj/item/storage/box/beanbag = 1,
		/obj/item/clothing/suit/armor/vest/alt = 1,
		/obj/item/circuitboard/machine/dish_drive = 1,
		/obj/item/clothing/glasses/sunglasses/reagent = 1,
		/obj/item/clothing/neck/petcollar = 1,
		/obj/item/storage/belt/bandolier = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/chefcloset
	name = "chef's closet"
	desc = "Это шкаф для хранения одежды работников кухни и мышеловок."
	gender = MALE
	icon_door = "chef_wardrobe"

/obj/structure/closet/chefcloset/get_ru_names()
	return list(
		NOMINATIVE = "шкаф шеф-повара",
		GENITIVE = "шкафа шеф-повара",
		DATIVE = "шкафу шеф-повара",
		ACCUSATIVE = "шкаф шеф-повара",
		INSTRUMENTAL = "шкафом шеф-повара",
		PREPOSITIONAL = "шкафе шеф-повара",
	)

/obj/structure/closet/chefcloset/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/clothing/under/suit/waiter = 2,
		/obj/item/radio/headset/headset_srv = 2,
		/obj/item/clothing/accessory/waistcoat = 2,
		/obj/item/clothing/suit/apron/chef = 3,
		/obj/item/clothing/head/soft/mime = 2,
		/obj/item/storage/box/mousetraps = 2,
		/obj/item/circuitboard/machine/dish_drive = 1,
		/obj/item/clothing/suit/toggle/chef = 1,
		/obj/item/clothing/under/costume/buttondown/slacks/service = 1,
		/obj/item/clothing/head/utility/chefhat = 1,
		/obj/item/rag = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/jcloset
	name = "custodial closet"
	desc = "Это шкаф для хранения одежды и инвентаря уборщика."
	gender = MALE
	icon_door = "jani_wardrobe"

/obj/structure/closet/jcloset/get_ru_names()
	return list(
		NOMINATIVE = "шкаф уборщика",
		GENITIVE = "шкафа уборщика",
		DATIVE = "шкафу уборщика",
		ACCUSATIVE = "шкаф уборщика",
		INSTRUMENTAL = "шкафом уборщика",
		PREPOSITIONAL = "шкафе уборщика",
	)

/obj/structure/closet/jcloset/PopulateContents()
	..()
	new /obj/item/clothing/under/rank/civilian/janitor(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/head/soft/purple(src)
	new /obj/item/paint/paint_remover(src)
	new /obj/item/melee/flyswatter(src)
	new /obj/item/flashlight(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/caution(src)
	new /obj/item/holosign_creator(src)
	new /obj/item/lightreplacer(src)
	new /obj/item/soap(src)
	new /obj/item/storage/bag/trash(src)
	new /obj/item/clothing/shoes/galoshes(src)
	new /obj/item/watertank/janitor(src)
	new /obj/item/storage/belt/janitor(src)


/obj/structure/closet/lawcloset
	name = "legal closet"
	desc = "Это шкаф для хранения одежды и предметов зала суда."
	gender = MALE
	icon_door = "law_wardrobe"

/obj/structure/closet/lawcloset/get_ru_names()
	return list(
		NOMINATIVE = "юридический шкаф",
		GENITIVE = "юридического шкафа",
		DATIVE = "юридическому шкафу",
		ACCUSATIVE = "юридический шкаф",
		INSTRUMENTAL = "юридическим шкафом",
		PREPOSITIONAL = "юридическом шкафе",
	)

/obj/structure/closet/lawcloset/PopulateContents()
	..()
	new /obj/item/clothing/under/suit/black(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/beige(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/black(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/red(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/bluesuit(src)
	new /obj/item/clothing/neck/tie/blue(src)
	new /obj/item/clothing/suit/toggle/lawyer(src)
	new /obj/item/clothing/under/rank/civilian/lawyer/purpsuit(src)
	new /obj/item/clothing/suit/toggle/lawyer/purple(src)
	new /obj/item/clothing/under/costume/buttondown/slacks/service(src)
	new /obj/item/clothing/neck/tie/black(src)
	new /obj/item/clothing/suit/toggle/lawyer/black(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/shoes/laceup(src)

/obj/structure/closet/lawcloset/populate_contents_immediate()
	. = ..()
	new /obj/item/clothing/accessory/lawyers_badge(src)
	new /obj/item/clothing/accessory/lawyers_badge(src)

/obj/structure/closet/wardrobe/chaplain_black
	name = "chapel wardrobe"
	desc = "Это шкаф для хранения одобренной Nanotrasen религиозной одежды."
	gender = MALE
	icon_door = "chap_wardrobe"

/obj/structure/closet/wardrobe/chaplain_black/get_ru_names()
	return list(
		NOMINATIVE = "церковный гардероб",
		GENITIVE = "церковного гардероба",
		DATIVE = "церковному гардеробу",
		ACCUSATIVE = "церковный гардероб",
		INSTRUMENTAL = "церковным гардеробом",
		PREPOSITIONAL = "церковном гардеробе",
	)

/obj/structure/closet/wardrobe/chaplain_black/PopulateContents()
	new /obj/item/choice_beacon/holy(src)
	new /obj/item/clothing/accessory/pocketprotector/cosmetology(src)
	new /obj/item/clothing/under/rank/civilian/chaplain(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/suit/chaplainsuit/nun(src)
	new /obj/item/clothing/head/chaplain/nun_hood(src)
	new /obj/item/clothing/suit/hooded/chaplainsuit/monkhabit(src)
	new /obj/item/clothing/suit/chaplainsuit/holidaypriest(src)
	new /obj/item/storage/backpack/cultpack(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/storage/fancy/candle_box(src)
	return

/obj/structure/closet/wardrobe/red
	name = "security wardrobe"
	gender = MALE
	icon_door = "sec_wardrobe"

/obj/structure/closet/wardrobe/red/get_ru_names()
	return list(
		NOMINATIVE = "гардероб охраны",
		GENITIVE = "гардероба охраны",
		DATIVE = "гардеробу охраны",
		ACCUSATIVE = "гардероб охраны",
		INSTRUMENTAL = "гардеробом охраны",
		PREPOSITIONAL = "гардеробе охраны",
	)

/obj/structure/closet/wardrobe/red/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/suit/hooded/wintercoat/security = 1,
		/obj/item/storage/backpack/security = 1,
		/obj/item/storage/backpack/satchel/sec = 1,
		/obj/item/storage/backpack/duffelbag/sec = 2,
		/obj/item/storage/backpack/messenger/sec = 1,
		/obj/item/clothing/under/rank/security/officer = 3,
		/obj/item/clothing/under/rank/security/officer/skirt = 2,
		/obj/item/clothing/shoes/jackboots = 3,
		/obj/item/clothing/head/beret/sec = 3,
		/obj/item/clothing/head/soft/sec = 3,
		/obj/item/clothing/mask/bandana/red = 2)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/cargotech
	name = "cargo wardrobe"
	gender = MALE
	icon_door = "cargo_wardrobe"

/obj/structure/closet/wardrobe/cargotech/get_ru_names()
	return list(
		NOMINATIVE = "грузовой гардероб",
		GENITIVE = "грузового гардероба",
		DATIVE = "грузовому гардеробу",
		ACCUSATIVE = "грузовой гардероб",
		INSTRUMENTAL = "грузовым гардеробом",
		PREPOSITIONAL = "грузовом гардеробе",
	)

/obj/structure/closet/wardrobe/cargotech/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/suit/hooded/wintercoat/cargo = 1,
		/obj/item/clothing/under/rank/cargo/tech = 3,
		/obj/item/clothing/shoes/sneakers/black = 3,
		/obj/item/clothing/gloves/fingerless = 3,
		/obj/item/clothing/head/soft = 3,
		/obj/item/radio/headset/headset_cargo = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/wardrobe/atmospherics_yellow
	name = "atmospherics wardrobe"
	gender = MALE
	icon_door = "atmos_wardrobe"

/obj/structure/closet/wardrobe/atmospherics_yellow/get_ru_names()
	return list(
		NOMINATIVE = "атмосферный гардероб",
		GENITIVE = "атмосферного гардероба",
		DATIVE = "атмосферному гардеробу",
		ACCUSATIVE = "атмосферный гардероб",
		INSTRUMENTAL = "атмосферным гардеробом",
		PREPOSITIONAL = "атмосферном гардеробе",
	)

/obj/structure/closet/wardrobe/atmospherics_yellow/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/duffelbag/engineering = 1,
		/obj/item/storage/backpack/satchel/eng = 1,
		/obj/item/storage/backpack/industrial = 1,
		/obj/item/storage/backpack/messenger/eng = 1,
		/obj/item/clothing/suit/atmos_overalls = 3,
		/obj/item/clothing/suit/hooded/wintercoat/engineering/atmos = 3,
		/obj/item/clothing/under/rank/engineering/atmospheric_technician = 3,
		/obj/item/clothing/shoes/sneakers/black = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/engineering_yellow
	name = "engineering wardrobe"
	gender = MALE
	icon_door = "engi_wardrobe"

/obj/structure/closet/wardrobe/engineering_yellow/get_ru_names()
	return list(
		NOMINATIVE = "инженерный гардероб",
		GENITIVE = "инженерного гардероба",
		DATIVE = "инженерному гардеробу",
		ACCUSATIVE = "инженерный гардероб",
		INSTRUMENTAL = "инженерным гардеробом",
		PREPOSITIONAL = "инженерном гардеробе",
	)

/obj/structure/closet/wardrobe/engineering_yellow/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/duffelbag/engineering = 1,
		/obj/item/storage/backpack/industrial = 1,
		/obj/item/storage/backpack/satchel/eng = 1,
		/obj/item/storage/backpack/messenger/eng = 1,
		/obj/item/clothing/suit/hooded/wintercoat/engineering = 1,
		/obj/item/clothing/under/rank/engineering/engineer = 3,
		/obj/item/clothing/suit/hazardvest = 3,
		/obj/item/clothing/shoes/workboots = 3,
		/obj/item/clothing/head/utility/hardhat = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/white/medical
	name = "medical doctor's wardrobe"
	gender = MALE
	icon_door = "med_wardrobe"

/obj/structure/closet/wardrobe/white/medical/get_ru_names()
	return list(
		NOMINATIVE = "гардероб врача",
		GENITIVE = "гардероба врача",
		DATIVE = "гардеробу врача",
		ACCUSATIVE = "гардероб врача",
		INSTRUMENTAL = "гардеробом врача",
		PREPOSITIONAL = "гардеробе врача",
	)

/obj/structure/closet/wardrobe/white/medical/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/duffelbag/med = 1,
		/obj/item/storage/backpack/medic = 1,
		/obj/item/storage/backpack/satchel/med = 1,
		/obj/item/storage/backpack/messenger/med = 1,
		/obj/item/clothing/suit/hooded/wintercoat/medical = 1,
		/obj/item/clothing/head/costume/nursehat = 1,
		/obj/item/clothing/under/rank/medical/scrubs/blue = 1,
		/obj/item/clothing/under/rank/medical/scrubs/green = 1,
		/obj/item/clothing/under/rank/medical/scrubs/purple = 1,
		/obj/item/clothing/suit/toggle/labcoat = 3,
		/obj/item/clothing/suit/toggle/labcoat/paramedic = 3,
		/obj/item/clothing/shoes/sneakers/white = 3,
		/obj/item/clothing/head/soft/paramedic = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/robotics_black
	name = "robotics wardrobe"
	gender = MALE
	icon_door = "robo_wardrobe"

/obj/structure/closet/wardrobe/robotics_black/get_ru_names()
	return list(
		NOMINATIVE = "гардероб робототехника",
		GENITIVE = "гардероба робототехника",
		DATIVE = "гардеробу робототехника",
		ACCUSATIVE = "гардероб робототехника",
		INSTRUMENTAL = "гардеробом робототехника",
		PREPOSITIONAL = "гардеробе робототехника",
	)

/obj/structure/closet/wardrobe/robotics_black/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/glasses/hud/diagnostic = 2,
		/obj/item/clothing/under/rank/rnd/roboticist = 2,
		/obj/item/clothing/suit/toggle/labcoat = 2,
		/obj/item/clothing/shoes/sneakers/black = 2,
		/obj/item/clothing/gloves/fingerless = 2,
		/obj/item/clothing/head/soft/black = 2)
	generate_items_inside(items_inside,src)
	if(prob(40))
		new /obj/item/clothing/mask/bandana/skull/black(src)
	if(prob(40))
		new /obj/item/clothing/mask/bandana/skull/black(src)
	return


/obj/structure/closet/wardrobe/chemistry_white
	name = "chemistry wardrobe"
	gender = MALE
	icon_door = "chem_wardrobe"

/obj/structure/closet/wardrobe/chemistry_white/get_ru_names()
	return list(
		NOMINATIVE = "химический гардероб",
		GENITIVE = "химического гардероба",
		DATIVE = "химическому гардеробу",
		ACCUSATIVE = "химический гардероб",
		INSTRUMENTAL = "химическим гардеробом",
		PREPOSITIONAL = "химическом гардеробе",
	)

/obj/structure/closet/wardrobe/chemistry_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/under/rank/medical/chemist = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/suit/toggle/labcoat/chemist = 2,
		/obj/item/storage/backpack/chemistry = 2,
		/obj/item/storage/backpack/satchel/chem = 2,
		/obj/item/storage/backpack/messenger/chem = 2,
		/obj/item/storage/backpack/duffelbag/chemistry = 2,
		/obj/item/storage/bag/chemistry = 2)
	generate_items_inside(items_inside,src)
	return


/obj/structure/closet/wardrobe/genetics_white
	name = "genetics wardrobe"
	gender = MALE
	icon_door = "gen_wardrobe"

/obj/structure/closet/wardrobe/genetics_white/get_ru_names()
	return list(
		NOMINATIVE = "гардероб генетика",
		GENITIVE = "гардероба генетика",
		DATIVE = "гардеробу генетика",
		ACCUSATIVE = "гардероб генетика",
		INSTRUMENTAL = "гардеробом генетика",
		PREPOSITIONAL = "гардеробе генетика",
	)

/obj/structure/closet/wardrobe/genetics_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/under/rank/rnd/geneticist = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/suit/toggle/labcoat/genetics = 2,
		/obj/item/storage/backpack/genetics = 2,
		/obj/item/storage/backpack/satchel/gen = 2,
		/obj/item/storage/backpack/messenger/gen = 2,
		/obj/item/storage/backpack/duffelbag/genetics = 2)
	generate_items_inside(items_inside,src)
	return


/obj/structure/closet/wardrobe/virology_white
	name = "virology wardrobe"
	gender = MALE
	icon_door = "viro_wardrobe"

/obj/structure/closet/wardrobe/virology_white/get_ru_names()
	return list(
		NOMINATIVE = "вирусологический гардероб",
		GENITIVE = "вирусологического гардероба",
		DATIVE = "вирусологическому гардеробу",
		ACCUSATIVE = "вирусологический гардероб",
		INSTRUMENTAL = "вирусологическим гардеробом",
		PREPOSITIONAL = "вирусологическом гардеробе",
	)

/obj/structure/closet/wardrobe/virology_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/under/rank/medical/virologist = 2,
		/obj/item/clothing/shoes/sneakers/white = 2,
		/obj/item/clothing/suit/toggle/labcoat/virologist = 2,
		/obj/item/clothing/mask/surgical = 2,
		/obj/item/storage/backpack/virology = 2,
		/obj/item/storage/backpack/satchel/vir = 2,
		/obj/item/storage/backpack/messenger/vir = 2,
		/obj/item/storage/backpack/duffelbag/virology = 2,)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/science_white
	name = "science wardrobe"
	gender = MALE
	icon_door = "sci_wardrobe"

/obj/structure/closet/wardrobe/science_white/get_ru_names()
	return list(
		NOMINATIVE = "научный гардероб",
		GENITIVE = "научного гардероба",
		DATIVE = "научному гардеробу",
		ACCUSATIVE = "научный гардероб",
		INSTRUMENTAL = "научным гардеробом",
		PREPOSITIONAL = "научном гардеробе",
	)

/obj/structure/closet/wardrobe/science_white/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/accessory/pocketprotector = 1,
		/obj/item/storage/backpack/science = 2,
		/obj/item/storage/backpack/satchel/science = 2,
		/obj/item/storage/backpack/duffelbag/science = 2,
		/obj/item/clothing/suit/hooded/wintercoat/science = 1,
		/obj/item/clothing/under/rank/rnd/scientist = 3,
		/obj/item/clothing/suit/toggle/labcoat/science = 3,
		/obj/item/clothing/shoes/sneakers/white = 3,
		/obj/item/radio/headset/headset_sci = 2,
		/obj/item/clothing/mask/gas = 3)
	generate_items_inside(items_inside,src)
	return

/obj/structure/closet/wardrobe/botanist
	name = "botanist wardrobe"
	gender = MALE
	icon_door = "botany_wardrobe"

/obj/structure/closet/wardrobe/botanist/get_ru_names()
	return list(
		NOMINATIVE = "гардероб ботаника",
		GENITIVE = "гардероба ботаника",
		DATIVE = "гардеробу ботаника",
		ACCUSATIVE = "гардероб ботаника",
		INSTRUMENTAL = "гардеробом ботаника",
		PREPOSITIONAL = "гардеробе ботаника",
	)

/obj/structure/closet/wardrobe/botanist/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/backpack/botany = 2,
		/obj/item/storage/backpack/satchel/hyd = 2,
		/obj/item/storage/backpack/messenger/hyd = 2,
		/obj/item/storage/backpack/duffelbag/hydroponics = 2,
		/obj/item/clothing/suit/hooded/wintercoat/hydro = 1,
		/obj/item/clothing/suit/apron = 2,
		/obj/item/clothing/suit/apron/overalls = 2,
		/obj/item/clothing/under/rank/civilian/hydroponics = 3,
		/obj/item/clothing/mask/bandana/striped/botany = 3)
	generate_items_inside(items_inside,src)

/obj/structure/closet/wardrobe/curator
	name = "treasure hunting wardrobe"
	gender = MALE
	icon_door = "curator_wardrobe"

/obj/structure/closet/wardrobe/curator/get_ru_names()
	return list(
		NOMINATIVE = "гардероб охотника за сокровищами",
		GENITIVE = "гардероба охотника за сокровищами",
		DATIVE = "гардеробу охотника за сокровищами",
		ACCUSATIVE = "гардероб охотника за сокровищами",
		INSTRUMENTAL = "гардеробом охотника за сокровищами",
		PREPOSITIONAL = "гардеробе охотника за сокровищами",
	)

/obj/structure/closet/wardrobe/curator/PopulateContents()
	new /obj/item/clothing/head/fedora/curator(src)
	new /obj/item/clothing/suit/jacket/curator(src)
	new /obj/item/clothing/under/rank/civilian/curator/treasure_hunter(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/storage/backpack/satchel/explorer(src)
	new /obj/item/storage/backpack/messenger/explorer(src)
