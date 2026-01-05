/obj/structure/closet/wardrobe
	name = "wardrobe"
	desc = "Это шкаф для хранения стандартной одежды Nanotrasen."
	gender = MALE
	icon_door = "blue"

/obj/structure/closet/wardrobe/get_ru_names()
	return alist(
		NOMINATIVE = "гардероб",
		GENITIVE = "гардероба",
		DATIVE = "гардеробу",
		ACCUSATIVE = "гардероб",
		INSTRUMENTAL = "гардеробом",
		PREPOSITIONAL = "гардеробе",
	)

/obj/structure/closet/wardrobe/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/blue(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/blue(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/brown(src)
	return

/obj/structure/closet/wardrobe/pink
	name = "pink wardrobe"
	icon_door = "pink"

/obj/structure/closet/wardrobe/pink/get_ru_names()
	return alist(
		NOMINATIVE = "розовый гардероб",
		GENITIVE = "розового гардероба",
		DATIVE = "розовому гардеробу",
		ACCUSATIVE = "розовый гардероб",
		INSTRUMENTAL = "розовым гардеробом",
		PREPOSITIONAL = "розовом гардеробе",
	)

/obj/structure/closet/wardrobe/pink/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/pink(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/pink(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/brown(src)
	return

/obj/structure/closet/wardrobe/black
	name = "black wardrobe"
	icon_door = "black"

/obj/structure/closet/wardrobe/black/get_ru_names()
	return alist(
		NOMINATIVE = "чёрный гардероб",
		GENITIVE = "чёрного гардероба",
		DATIVE = "чёрному гардеробу",
		ACCUSATIVE = "чёрный гардероб",
		INSTRUMENTAL = "чёрным гардеробом",
		PREPOSITIONAL = "чёрном гардеробе",
	)

/obj/structure/closet/wardrobe/black/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/black(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/black(src)
	if(prob(25))
		new /obj/item/clothing/suit/jacket/leather(src)
	if(prob(20))
		new /obj/item/clothing/suit/jacket/leather/biker(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/black(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/hats/tophat(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/soft/black(src)
	new /obj/item/clothing/mask/bandana/black(src)
	new /obj/item/clothing/mask/bandana/black(src)
	if(prob(40))
		new /obj/item/clothing/mask/bandana/skull/black(src)
	return


/obj/structure/closet/wardrobe/green
	name = "green wardrobe"
	icon_door = "green"

/obj/structure/closet/wardrobe/green/get_ru_names()
	return alist(
		NOMINATIVE = "зелёный гардероб",
		GENITIVE = "зелёного гардероба",
		DATIVE = "зелёному гардеробу",
		ACCUSATIVE = "зелёный гардероб",
		INSTRUMENTAL = "зелёным гардеробом",
		PREPOSITIONAL = "зелёном гардеробе",
	)

/obj/structure/closet/wardrobe/green/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/green(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/green(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/mask/bandana/green(src)
	new /obj/item/clothing/mask/bandana/green(src)
	return


/obj/structure/closet/wardrobe/orange
	name = "prison wardrobe"
	desc = "Это шкаф для хранения тюремной формы Nanotrasen."
	icon_door = "orange"

/obj/structure/closet/wardrobe/orange/get_ru_names()
	return alist(
		NOMINATIVE = "тюремный гардероб",
		GENITIVE = "тюремного гардероба",
		DATIVE = "тюремному гардеробу",
		ACCUSATIVE = "тюремный гардероб",
		INSTRUMENTAL = "тюремным гардеробом",
		PREPOSITIONAL = "тюремном гардеробе",
	)

/obj/structure/closet/wardrobe/orange/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/rank/prisoner(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/rank/prisoner/skirt(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/orange(src)
	return


/obj/structure/closet/wardrobe/yellow
	name = "yellow wardrobe"
	icon_door = "yellow"

/obj/structure/closet/wardrobe/yellow/get_ru_names()
	return alist(
		NOMINATIVE = "жёлтый гардероб",
		GENITIVE = "жёлтого гардероба",
		DATIVE = "жёлтому гардеробу",
		ACCUSATIVE = "жёлтый гардероб",
		INSTRUMENTAL = "жёлтым гардеробом",
		PREPOSITIONAL = "жёлтом гардеробе",
	)

/obj/structure/closet/wardrobe/yellow/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/yellow(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/yellow(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/orange(src)
	new /obj/item/clothing/mask/bandana/gold(src)
	new /obj/item/clothing/mask/bandana/gold(src)
	return


/obj/structure/closet/wardrobe/white
	name = "white wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/white/get_ru_names()
	return alist(
		NOMINATIVE = "белый гардероб",
		GENITIVE = "белого гардероба",
		DATIVE = "белому гардеробу",
		ACCUSATIVE = "белый гардероб",
		INSTRUMENTAL = "белым гардеробом",
		PREPOSITIONAL = "белом гардеробе",
	)

/obj/structure/closet/wardrobe/white/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/white(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/white(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/white(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/soft/mime(src)
	new /obj/item/clothing/mask/bandana/white(src)
	new /obj/item/clothing/mask/bandana/white(src)
	return

/obj/structure/closet/wardrobe/pjs
	name = "pajama wardrobe"
	icon_door = "white"

/obj/structure/closet/wardrobe/pjs/get_ru_names()
	return alist(
		NOMINATIVE = "гардероб с пижамами",
		GENITIVE = "гардероба с пижамами",
		DATIVE = "гардеробу с пижамами",
		ACCUSATIVE = "гардероб с пижамами",
		INSTRUMENTAL = "гардеробом с пижамами",
		PREPOSITIONAL = "гардеробе с пижамами",
	)

/obj/structure/closet/wardrobe/pjs/PopulateContents()
	new /obj/item/clothing/under/misc/pj/red(src)
	new /obj/item/clothing/under/misc/pj/red(src)
	new /obj/item/clothing/head/costume/nightcap/red(src)
	new /obj/item/clothing/head/costume/nightcap/red(src)
	new /obj/item/clothing/under/misc/pj/blue(src)
	new /obj/item/clothing/under/misc/pj/blue(src)
	new /obj/item/clothing/head/costume/nightcap/blue(src)
	new /obj/item/clothing/head/costume/nightcap/blue(src)
	for(var/i in 1 to 4)
		new /obj/item/clothing/shoes/sneakers/white(src)
	return


/obj/structure/closet/wardrobe/grey
	name = "grey wardrobe"
	icon_door = "grey"

/obj/structure/closet/wardrobe/grey/get_ru_names()
	return alist(
		NOMINATIVE = "серый гардероб",
		GENITIVE = "серого гардероба",
		DATIVE = "серому гардеробу",
		ACCUSATIVE = "серый гардероб",
		INSTRUMENTAL = "серым гардеробом",
		PREPOSITIONAL = "сером гардеробе",
	)

/obj/structure/closet/wardrobe/grey/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/grey(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/under/color/jumpskirt/grey(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/shoes/sneakers/black(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/head/soft/grey(src)
	if(prob(50))
		new /obj/item/storage/backpack/duffelbag(src)
	if(prob(40))
		new /obj/item/clothing/mask/bandana/black(src)
		new /obj/item/clothing/mask/bandana/black(src)
	if(prob(40))
		new /obj/item/clothing/under/misc/assistantformal(src)
	if(prob(40))
		new /obj/item/clothing/under/misc/assistantformal(src)
	if(prob(30))
		new /obj/item/clothing/suit/hooded/wintercoat(src)
		new /obj/item/clothing/shoes/winterboots(src)
	if(prob(30))
		new /obj/item/clothing/accessory/pocketprotector(src)
	return


/obj/structure/closet/wardrobe/mixed
	name = "mixed wardrobe"
	icon_door = "mixed"

/obj/structure/closet/wardrobe/mixed/get_ru_names()
	return alist(
		NOMINATIVE = "смешанный гардероб",
		GENITIVE = "смешанного гардероба",
		DATIVE = "смешанному гардеробу",
		ACCUSATIVE = "смешанный гардероб",
		INSTRUMENTAL = "смешанным гардеробом",
		PREPOSITIONAL = "смешанном гардеробе",
	)

/obj/structure/closet/wardrobe/mixed/PopulateContents()
	if(prob(40))
		new /obj/item/clothing/suit/jacket/bomber(src)
	new /obj/item/clothing/under/color/white(src)
	new /obj/item/clothing/under/color/jumpskirt/white(src)
	new /obj/item/clothing/under/color/blue(src)
	new /obj/item/clothing/under/color/jumpskirt/blue(src)
	new /obj/item/clothing/under/color/yellow(src)
	new /obj/item/clothing/under/color/jumpskirt/yellow(src)
	new /obj/item/clothing/under/color/green(src)
	new /obj/item/clothing/under/color/jumpskirt/green(src)
	new /obj/item/clothing/under/color/orange(src)
	new /obj/item/clothing/under/color/jumpskirt/orange(src)
	new /obj/item/clothing/under/color/pink(src)
	new /obj/item/clothing/under/color/jumpskirt/pink(src)
	new /obj/item/clothing/under/color/red(src)
	new /obj/item/clothing/under/color/jumpskirt/red(src)
	new /obj/item/clothing/under/color/darkblue(src)
	new /obj/item/clothing/under/color/jumpskirt/darkblue(src)
	new /obj/item/clothing/under/color/teal(src)
	new /obj/item/clothing/under/color/jumpskirt/teal(src)
	new /obj/item/clothing/under/color/lightpurple(src)
	new /obj/item/clothing/under/color/jumpskirt/lightpurple(src)
	new /obj/item/clothing/mask/bandana/red(src)
	new /obj/item/clothing/mask/bandana/blue(src)
	new /obj/item/clothing/mask/bandana/gold(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/shoes/sneakers/brown(src)
	new /obj/item/clothing/shoes/sneakers/white(src)
	if(prob(30))
		new /obj/item/clothing/suit/hooded/wintercoat(src)
		new /obj/item/clothing/shoes/winterboots(src)
	return
