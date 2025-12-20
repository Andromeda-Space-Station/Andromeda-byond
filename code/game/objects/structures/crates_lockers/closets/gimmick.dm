/obj/structure/closet/cabinet
	name = "cabinet"
	desc = "Классика всегда в моде."
	gender = MALE
	icon_state = "cabinet"
	resistance_flags = FLAMMABLE
	open_sound = 'sound/machines/closet/wooden_closet_open.ogg'
	close_sound = 'sound/machines/closet/wooden_closet_close.ogg'
	open_sound_volume = 25
	close_sound_volume = 50
	max_integrity = 70
	door_anim_time = 0 // no animation

/obj/structure/closet/cabinet/get_ru_names()
	return list(
		NOMINATIVE = "деревянный шкаф",
		GENITIVE = "деревянного шкафа",
		DATIVE = "деревянному шкафу",
		ACCUSATIVE = "деревянный шкаф",
		INSTRUMENTAL = "деревянным шкафом",
		PREPOSITIONAL = "деревянном шкафе",
	)

/obj/structure/closet/acloset
	name = "strange closet"
	desc = "Выглядит инопланетно!"
	gender = MALE
	icon_state = "alien"
	material_drop = /obj/item/stack/sheet/mineral/abductor

/obj/structure/closet/acloset/get_ru_names()
	return list(
		NOMINATIVE = "странный шкаф",
		GENITIVE = "странного шкафа",
		DATIVE = "странному шкафу",
		ACCUSATIVE = "странный шкаф",
		INSTRUMENTAL = "странным шкафом",
		PREPOSITIONAL = "странном шкафе",
	)

/obj/structure/closet/gimmick
	name = "administrative supply closet"
	desc = "Это хранилище для вещей, которым здесь не место."
	gender = MALE
	icon_state = "syndicate"

/obj/structure/closet/gimmick/get_ru_names()
	return list(
		NOMINATIVE = "шкаф административного снабжения",
		GENITIVE = "шкафа административного снабжения",
		DATIVE = "шкафу административного снабжения",
		ACCUSATIVE = "шкаф административного снабжения",
		INSTRUMENTAL = "шкафом административного снабжения",
		PREPOSITIONAL = "шкафе административного снабжения",
	)

/obj/structure/closet/gimmick/russian
	name = "\improper Russian surplus closet"
	desc = "Это склад для российского стандартного излишка."

/obj/structure/closet/gimmick/russian/get_ru_names()
	return list(
		NOMINATIVE = "шкаф с российской униформой",
		GENITIVE = "шкафа с российской униформой",
		DATIVE = "шкафу с российской униформой",
		ACCUSATIVE = "шкаф с российской униформой",
		INSTRUMENTAL = "шкафом с российской униформой",
		PREPOSITIONAL = "шкафе с российской униформой",
	)

/obj/structure/closet/gimmick/russian/PopulateContents()
	..()
	for(var/i in 1 to 5)
		new /obj/item/clothing/head/costume/ushanka(src)
	for(var/i in 1 to 5)
		new /obj/item/clothing/under/costume/soviet(src)

/obj/structure/closet/gimmick/tacticool
	name = "tacticool gear closet"
	desc = "Это хранилище для Тактикульного снаряжения."

/obj/structure/closet/gimmick/tacticool/get_ru_names()
	return list(
		NOMINATIVE = "шкаф с тактикульным снаряжением",
		GENITIVE = "шкафа с тактикульным снаряжением",
		DATIVE = "шкафу с тактикульным снаряжением",
		ACCUSATIVE = "шкаф с тактикульным снаряжением",
		INSTRUMENTAL = "шкафом с тактикульным снаряжением",
		PREPOSITIONAL = "шкафе с тактикульным снаряжением",
	)

/obj/structure/closet/gimmick/tacticool/PopulateContents()
	..()
	new /obj/item/clothing/glasses/eyepatch(src)
	new /obj/item/clothing/gloves/tackler/combat(src)
	new /obj/item/clothing/gloves/tackler/combat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/head/helmet/swat(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/mod/control/pre_equipped/apocryphal(src)
	new /obj/item/mod/control/pre_equipped/apocryphal(src)
	new /obj/item/clothing/under/syndicate/tacticool(src)
	new /obj/item/clothing/under/syndicate/tacticool(src)

/obj/structure/closet/gimmick/tacticool/populate_contents_immediate()
	new /obj/item/clothing/glasses/sunglasses(src)

/obj/structure/closet/thunderdome
	name = "\improper Thunderdome closet"
	desc = "Всё, что вам нужно!"
	anchored = TRUE

/obj/structure/closet/thunderdome/get_ru_names()
	return list(
		NOMINATIVE = "шкаф Громового Купола",
		GENITIVE = "шкафа Громового Купола",
		DATIVE = "шкафу Громового Купола",
		ACCUSATIVE = "шкаф Громового Купола",
		INSTRUMENTAL = "шкафом Громового Купола",
		PREPOSITIONAL = "шкафе Громового Купола",
	)

/obj/structure/closet/thunderdome/tdred
	name = "red-team Thunderdome closet"
	icon_door = "red"

/obj/structure/closet/thunderdome/tdred/get_ru_names()
	return list(
		NOMINATIVE = "шкаф красной команды Громового Купола",
		GENITIVE = "шкафа красной команды Громового Купола",
		DATIVE = "шкафу красной команды Громового Купола",
		ACCUSATIVE = "шкаф красной команды Громового Купола",
		INSTRUMENTAL = "шкафом красной команды Громового Купола",
		PREPOSITIONAL = "шкафе красной команды Громового Купола",
	)

/obj/structure/closet/thunderdome/tdred/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/armor/tdome/red(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/energy/sword/saber(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/baton/security/loaded(src)
	for(var/i in 1 to 3)
		new /obj/item/storage/box/flashbangs(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/helmet/thunderdome(src)

/obj/structure/closet/thunderdome/tdred/populate_contents_immediate()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser(src)

/obj/structure/closet/thunderdome/tdgreen
	name = "green-team Thunderdome closet"
	icon_door = "green"

/obj/structure/closet/thunderdome/tdgreen/get_ru_names()
	return list(
		NOMINATIVE = "шкаф зелёной команды Громового Купола",
		GENITIVE = "шкафа зелёной команды Громового Купола",
		DATIVE = "шкафу зелёной команды Громового Купола",
		ACCUSATIVE = "шкаф зелёной команды Громового Купола",
		INSTRUMENTAL = "шкафом зелёной команды Громового Купола",
		PREPOSITIONAL = "шкафе зелёной команды Громового Купола",
	)

/obj/structure/closet/thunderdome/tdgreen/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/suit/armor/tdome/green(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/energy/sword/saber(src)
	for(var/i in 1 to 3)
		new /obj/item/melee/baton/security/loaded(src)
	for(var/i in 1 to 3)
		new /obj/item/storage/box/flashbangs(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/helmet/thunderdome(src)

/obj/structure/closet/thunderdome/tdgreen/populate_contents_immediate()
	for(var/i in 1 to 3)
		new /obj/item/gun/energy/laser(src)

/obj/structure/closet/malf/suits
	desc = "Это хранилище для оперативного снаряжения."
	icon_state = "syndicate"

/obj/structure/closet/malf/suits/PopulateContents()
	..()
	new /obj/item/tank/jetpack/void(src)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/clothing/head/helmet/space/nasavoid(src)
	new /obj/item/clothing/suit/space/nasavoid(src)
	new /obj/item/crowbar(src)
	new /obj/item/stock_parts/power_store/cell(src)
	new /obj/item/multitool(src)

/obj/structure/closet/mini_fridge
	name = "grimy mini-fridge"
	desc = "Маленькое приспособление, созданное для приятного охлаждения нескольких напитков."
	gender = MALE
	icon_state = "mini_fridge"
	icon_welded = "welded_small"
	max_mob_size = MOB_SIZE_SMALL
	pass_flags = PASSTABLE
	anchored_tabletop_offset = 3
	anchored = 1
	storage_capacity = 10

/obj/structure/closet/mini_fridge/get_ru_names()
	return list(
		NOMINATIVE = "мини-холодильник",
		GENITIVE = "мини-холодильника",
		DATIVE = "мини-холодильнику",
		ACCUSATIVE = "мини-холодильник",
		INSTRUMENTAL = "мини-холодильником",
		PREPOSITIONAL = "мини-холодильнике",
	)

/obj/structure/closet/mini_fridge/PopulateContents()
	. = ..()
	new /obj/effect/spawner/random/food_or_drink/refreshing_beverage(src)
	new /obj/effect/spawner/random/food_or_drink/refreshing_beverage(src)
	if(prob(50))
		new /obj/effect/spawner/random/food_or_drink/refreshing_beverage(src)
	if(prob(40))
		new /obj/item/reagent_containers/cup/glass/bottle/beer(src)

/obj/structure/closet/mini_fridge/grimy
	name = "grimy mini-fridge"
	desc = "Маленькое приспособление, созданное для приятного охлаждения нескольких напитков. Однако этот устаревший агрегат, похоже, служит лишь компанией для тараканов."

/obj/structure/closet/mini_fridge/grimy/get_ru_names()
	return list(
		NOMINATIVE = "грязный мини-холодильник",
		GENITIVE = "грязного мини-холодильника",
		DATIVE = "грязному мини-холодильнику",
		ACCUSATIVE = "грязный мини-холодильник",
		INSTRUMENTAL = "грязным мини-холодильником",
		PREPOSITIONAL = "грязном мини-холодильнике",
	)

/obj/structure/closet/mini_fridge/grimy/PopulateContents()
	. = ..()
	if(prob(40))
		if(prob(50))
			new /obj/item/food/pizzaslice/moldy/bacteria(src)
		else
			new /obj/item/food/breadslice/moldy/bacteria(src)
	else if(prob(40))
		if(prob(50))
			new /obj/item/food/syndicake(src)
		else
			new /mob/living/basic/cockroach(src)
