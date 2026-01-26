//defines the drill hat's yelling setting
#define DRILL_DEFAULT "default"
#define DRILL_SHOUTING "shouting"
#define DRILL_YELLING "yelling"
#define DRILL_CANADIAN "canadian"

//Chef
/obj/item/clothing/head/utility/chefhat
	name = "chef's hat"
	inhand_icon_state = "chefhat"
	icon_state = "chef"
	desc = "Головной убор повара."
	strip_delay = 1 SECONDS
	equip_delay_other = 1 SECONDS
	dog_fashion = /datum/dog_fashion/head/chef
	/// The chance that the movements of a mouse inside of this hat get relayed to the human wearing the hat
	var/mouse_control_probability = 20
	/// Allowed time between movements
	COOLDOWN_DECLARE(move_cooldown)
	pickup_sound = null
	drop_sound = null
	equip_sound = null

/// Admin variant of the chef hat where every mouse pilot input will always be transferred to the wearer
/obj/item/clothing/head/utility/chefhat/i_am_assuming_direct_control
	desc = "Головной убор поваров. При ближайшем рассмотрении внутри этой шляпы, кажется, находятся десятки крошечных рычагов, кнопок, циферблатов и экранов. Какого чёрта...?"
	mouse_control_probability = 100

/obj/item/clothing/head/utility/chefhat/Initialize(mapload)
	. = ..()
	create_storage(storage_type = /datum/storage/pockets/chefhat)

/obj/item/clothing/head/utility/chefhat/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	var/mob/living/basic/new_boss = get_mouse(arrived)
	if(!new_boss)
		return
	RegisterSignal(new_boss, COMSIG_MOB_PRE_EMOTED, PROC_REF(on_mouse_emote))
	RegisterSignal(new_boss, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(on_mouse_moving))
	RegisterSignal(new_boss, COMSIG_MOB_CLIENT_PRE_LIVING_MOVE, PROC_REF(on_mouse_moving))

/obj/item/clothing/head/utility/chefhat/Exited(atom/movable/gone, direction)
	. = ..()
	var/mob/living/basic/old_boss = get_mouse(gone)
	if(!old_boss)
		return
	UnregisterSignal(old_boss, list(COMSIG_MOB_PRE_EMOTED, COMSIG_MOVABLE_PRE_MOVE, COMSIG_MOB_CLIENT_PRE_LIVING_MOVE))

/// Returns a mob stored inside a mob container, if there is one
/obj/item/clothing/head/utility/chefhat/proc/get_mouse(atom/possible_mouse)
	if (!ispickedupmob(possible_mouse))
		return
	var/obj/item/mob_holder/mousey_holder = possible_mouse
	return locate(/mob/living/basic) in mousey_holder.contents

/// Relays emotes emoted by your boss to the hat wearer for full immersion
/obj/item/clothing/head/utility/chefhat/proc/on_mouse_emote(mob/living/source, key, emote_message, type_override, intentional, datum/emote/emote)
	SIGNAL_HANDLER
	var/mob/living/carbon/wearer = loc
	if(!wearer || INCAPACITATED_IGNORING(wearer, INCAPABLE_RESTRAINTS))
		return
	if (!prob(mouse_control_probability))
		return COMPONENT_CANT_EMOTE
	INVOKE_ASYNC(wearer, TYPE_PROC_REF(/mob, emote), key, type_override, emote_message, FALSE)
	return COMPONENT_CANT_EMOTE

/// Relays movement made by the mouse in your hat to the wearer of the hat
/obj/item/clothing/head/utility/chefhat/proc/on_mouse_moving(mob/living/source, atom/moved_to)
	SIGNAL_HANDLER
	if (!prob(mouse_control_probability) || !COOLDOWN_FINISHED(src, move_cooldown))
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE // Didn't roll well enough or on cooldown

	var/mob/living/carbon/wearer = loc
	if(!wearer || INCAPACITATED_IGNORING(wearer, INCAPABLE_RESTRAINTS))
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE // Not worn or can't move

	var/move_direction = get_dir(wearer, moved_to)
	if(!wearer.Process_Spacemove(move_direction))
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE // Currently drifting in space
	if(!has_gravity() || !isturf(wearer.loc))
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE // Not in a location where we can move

	step_towards(wearer, moved_to)
	var/move_delay = wearer.cached_multiplicative_slowdown
	if (ISDIAGONALDIR(move_direction))
		move_delay *= sqrt(2)
	COOLDOWN_START(src, move_cooldown, move_delay)
	return COMPONENT_MOVABLE_BLOCK_PRE_MOVE

/obj/item/clothing/head/utility/chefhat/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[RU_USER_NOM] надевает [RU_SRC_NOM]! Похоже, [GEND_HE_SHE(user)] пытается стать поваром."))
	user.say("Где ты, Рататуй?", forced = "поварской суицид")
	sleep(2 SECONDS)
	user.visible_message(span_suicide("[RU_USER_NOM] залезает в воображаемую печь!"))
	user.say("А вот ты где!", forced = "поварской суицид")
	playsound(user, 'sound/machines/ding.ogg', 50, TRUE)
	return FIRELOSS

/obj/item/clothing/head/utility/chefhat/get_ru_names()
	return alist(
		NOMINATIVE = "поварской колпак",
		GENITIVE = "поварского колпака",
		DATIVE = "поварскому колпаку",
		ACCUSATIVE = "поварской колпак",
		INSTRUMENTAL = "поварским колпаком",
		PREPOSITIONAL = "поварском колпаке",
	)

//Captain
/obj/item/clothing/head/hats/caphat
	name = "captain's hat"
	desc = "Хорошо быть королём."
	icon_state = "captain"
	inhand_icon_state = "that"
	flags_inv = 0
	armor_type = /datum/armor/hats_caphat
	strip_delay = 6 SECONDS
	dog_fashion = /datum/dog_fashion/head/captain

//Captain: This is no longer space-worthy
/datum/armor/hats_caphat
	melee = 25
	bullet = 15
	laser = 25
	energy = 35
	bomb = 25
	fire = 50
	acid = 50
	wound = 5

/obj/item/clothing/head/hats/caphat/get_ru_names()
	return alist(
		NOMINATIVE = "шляпа капитана",
		GENITIVE = "шляпы капитана",
		DATIVE = "шляпе капитана",
		ACCUSATIVE = "шляпу капитана",
		INSTRUMENTAL = "шляпой капитана",
		PREPOSITIONAL = "шляпе капитана",
	)

/obj/item/clothing/head/hats/caphat/parade
	name = "captain's parade cap"
	desc = "Носится только капитанами с избытком веса."
	icon_state = "capcap"
	dog_fashion = null

/obj/item/clothing/head/hats/caphat/parade/get_ru_names()
	return alist(
		NOMINATIVE = "парадная кепка капитана",
		GENITIVE = "парадной кепки капитана",
		DATIVE = "парадной кепке капитана",
		ACCUSATIVE = "парадную кепку капитана",
		INSTRUMENTAL = "парадной кепкой капитана",
		PREPOSITIONAL = "парадной кепке капитана",
	)

/obj/item/clothing/head/caphat/beret
	name = "captain's beret"
	desc = "Для капитанов, известных своим чувством стиля."
	icon = 'icons/map_icons/clothing/head/_head.dmi'
	icon_state = "/obj/item/clothing/head/caphat/beret"
	post_init_icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#0070B7#FFCE5B"
	hair_mask = /datum/hair_mask/standard_hat_middle

/obj/item/clothing/head/caphat/beret/get_ru_names()
	return alist(
		NOMINATIVE = "берет капитана",
		GENITIVE = "берета капитана",
		DATIVE = "берету капитана",
		ACCUSATIVE = "берет капитана",
		INSTRUMENTAL = "беретом капитана",
		PREPOSITIONAL = "берете капитана",
	)

//Head of Personnel
/obj/item/clothing/head/hats/hopcap
	name = "head of personnel's cap"
	icon_state = "hopcap"
	desc = "Символ истинного бюрократического микроменеджмента."
	armor_type = /datum/armor/hats_hopcap
	dog_fashion = /datum/dog_fashion/head/hop

//Chaplain
/datum/armor/hats_hopcap
	melee = 25
	bullet = 15
	laser = 25
	energy = 35
	bomb = 25
	fire = 50
	acid = 50

/obj/item/clothing/head/hats/hopcap/get_ru_names()
	return alist(
		NOMINATIVE = "кепка главы персонала",
		GENITIVE = "кепки главы персонала",
		DATIVE = "кепке главы персонала",
		ACCUSATIVE = "кепку главы персонала",
		INSTRUMENTAL = "кепкой главы персонала",
		PREPOSITIONAL = "кепке главы персонала",
	)

/obj/item/clothing/head/chaplain/nun_hood
	name = "nun hood"
	desc = "Максимальное благочестие в этой звёздной системе."
	icon_state = "nun_hood"
	flags_inv = HIDEHAIR
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/chaplain/nun_hood/get_ru_names()
	return alist(
		NOMINATIVE = "капюшон монахини",
		GENITIVE = "капюшона монахини",
		DATIVE = "капюшону монахини",
		ACCUSATIVE = "капюшон монахини",
		INSTRUMENTAL = "капюшоном монахини",
		PREPOSITIONAL = "капюшоне монахини",
	)

/obj/item/clothing/head/chaplain/habit_veil
	name = "nun veil"
	desc = "Тоже самое, что и капюшон."
	icon_state = "nun_hood_alt"
	flags_inv = HIDEHAIR | HIDEEARS
	clothing_flags = SNUG_FIT // can't be knocked off by throwing a paper hat.

/obj/item/clothing/head/chaplain/habit_veil/get_ru_names()
	return alist(
		NOMINATIVE = "вуаль монахини",
		GENITIVE = "вуали монахини",
		DATIVE = "вуали монахини",
		ACCUSATIVE = "вуаль монахини",
		INSTRUMENTAL = "вуалью монахини",
		PREPOSITIONAL = "вуали монахини",
	)

/obj/item/clothing/head/chaplain/bishopmitre
	name = "bishop mitre"
	desc = "Роскошная шляпа, которая функционирует как рация к Богу. Или как громоотвод, зависит от того, кого спросишь."
	icon_state = "bishopmitre"

#define CANDY_CD_TIME 2 MINUTES

/obj/item/clothing/head/chaplain/bishopmitre/get_ru_names()
	return alist(
		NOMINATIVE = "митра епископа",
		GENITIVE = "митры епископа",
		DATIVE = "митре епископа",
		ACCUSATIVE = "митру епископа",
		INSTRUMENTAL = "митрой епископа",
		PREPOSITIONAL = "митре епископа",
	)

//Detective
/obj/item/clothing/head/fedora/det_hat
	name = "detective's fedora"
	desc = "Есть только один человек, который может учуять грязное зловоние преступления, и, вероятно, на нём эта шляпа."
	armor_type = /datum/armor/fedora_det_hat
	icon_state = "detective"
	interaction_flags_click = NEED_DEXTERITY|NEED_HANDS|ALLOW_RESTING
	dog_fashion = /datum/dog_fashion/head/detective
	/// Path for the flask that spawns inside their hat roundstart
	var/flask_path = /obj/item/reagent_containers/cup/glass/flask/det
	/// Cooldown for retrieving precious candy corn with rmb
	COOLDOWN_DECLARE(candy_cooldown)


/datum/armor/fedora_det_hat
	melee = 25
	bullet = 5
	laser = 25
	energy = 35
	fire = 30
	acid = 50
	wound = 5

/obj/item/clothing/head/fedora/det_hat/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/small/fedora/detective)

	register_context()

	new flask_path(src)


/obj/item/clothing/head/fedora/det_hat/examine(mob/user)
	. = ..()
	. += span_notice("Альт-клик, чтобы взять кукурузную конфету.")


/obj/item/clothing/head/fedora/det_hat/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()

	context[SCREENTIP_CONTEXT_ALT_LMB] = "Время конфет"

	return CONTEXTUAL_SCREENTIP_SET


/// Now to solve where all these keep coming from
/obj/item/clothing/head/fedora/det_hat/click_alt(mob/user)
	if(!COOLDOWN_FINISHED(src, candy_cooldown))
		to_chat(user, span_warning("Кукурузная конфета была только что взята! Тебе стоит подождать пару минут, а то проредишь запасы."))
		return CLICK_ACTION_BLOCKING

	var/obj/item/food/candy_corn/sweets = new /obj/item/food/candy_corn(src)
	user.put_in_hands(sweets)
	to_chat(user, span_notice("Вы достаёте кукурузную конфету из [RU_SRC_NOM]."))
	COOLDOWN_START(src, candy_cooldown, CANDY_CD_TIME)

	return CLICK_ACTION_SUCCESS


#undef CANDY_CD_TIME

/obj/item/clothing/head/fedora/det_hat/minor
	flask_path = /obj/item/reagent_containers/cup/glass/flask/det/minor

/obj/item/clothing/head/fedora/det_hat/get_ru_names()
	return alist(
		NOMINATIVE = "федора детектива",
		GENITIVE = "федоры детектива",
		DATIVE = "федоре детектива",
		ACCUSATIVE = "федору детектива",
		INSTRUMENTAL = "федорой детектива",
		PREPOSITIONAL = "федоре детектива",
	)

///Detectives Fedora, but like Inspector Gadget. Not a subtype to not inherit candy corn stuff
/obj/item/clothing/head/fedora/inspector_hat
	name = "inspector's fedora"
	desc = "Есть только один человек, который может попытаться остановить злодея."
	armor_type = /datum/armor/fedora_det_hat
	icon_state = "detective"
	dog_fashion = /datum/dog_fashion/head/detective
	interaction_flags_click = FORBID_TELEKINESIS_REACH|ALLOW_RESTING
	///prefix our phrases must begin with
	var/prefix = "убить"
	///an assoc list of regex = item (like regex datum = revolver item)
	var/list/items_by_regex = list()
	///A an assoc list of regex = phrase (like regex datum = gun text)
	var/list/phrases_by_regex = list()
	///how many gadgets can we hold
	var/max_items = 4
	///items above this weight cannot be put in the hat
	var/max_weight = WEIGHT_CLASS_NORMAL

/obj/item/clothing/head/fedora/inspector_hat/Initialize(mapload)
	. = ..()
	become_hearing_sensitive(ROUNDSTART_TRAIT)
	QDEL_NULL(atom_storage)

/obj/item/clothing/head/fedora/inspector_hat/proc/set_prefix(desired_prefix)

	prefix = desired_prefix

	// Regenerated the phrases here.
	for(var/old_regex in phrases_by_regex)
		var/old_phrase = phrases_by_regex[old_regex]
		var/obj/item/old_item = items_by_regex[old_regex]
		items_by_regex -= old_regex
		phrases_by_regex -= old_regex
		set_phrase(old_phrase,old_item)

	return TRUE

/obj/item/clothing/head/fedora/inspector_hat/proc/set_phrase(desired_phrase,obj/item/associated_item)

	var/regex/phrase_regex = regex("[prefix]\[\\s\\W\]+[desired_phrase]","i")

	phrases_by_regex[phrase_regex] = desired_phrase
	items_by_regex[phrase_regex] = associated_item

	return TRUE

/obj/item/clothing/head/fedora/inspector_hat/examine(mob/user)
	. = ..()
	. += span_notice("Ты можешь класть предметы внутрь и доставать их, сказав фразу, или используя его в руках!")
	. += span_notice("Название префикса <b>[prefix]</b>, и его можно изменить с помощью альт+клик!\n")
	for(var/found_regex in phrases_by_regex)
		var/found_phrase = phrases_by_regex[found_regex]
		var/obj/item/found_item = items_by_regex[found_regex]
		. += span_notice("[icon2html(found_item, user)] Ты можешь достать [RU_NOM(found_item)], сказав <b>\"[prefix] [found_phrase]\"</b>!")

/obj/item/clothing/head/fedora/inspector_hat/Hear(atom/movable/speaker, message_language, raw_message, radio_freq, radio_freq_name, radio_freq_color, list/spans, list/message_mods = list(), message_range)
	. = ..()
	var/mob/living/carbon/wearer = loc
	if(!istype(wearer) || speaker != wearer) //if we are worn
		return

	raw_message = htmlrendertext(raw_message)

	for(var/regex/found_regex as anything in phrases_by_regex)
		if(!found_regex.Find(raw_message))
			continue
		var/obj/item/found_item = items_by_regex[found_regex]
		if(wearer.put_in_hands(found_item))
			wearer.visible_message(span_warning("[CAP_RU_NOM(src)] выдаёт [RU_NOM(found_item)] в руки [RU_GEN(wearer)]!"))
			. = TRUE
		else
			balloon_alert(wearer, "нельзя взять в руки!")
			break

	return .

/obj/item/clothing/head/fedora/inspector_hat/attackby(obj/item/item, mob/user, list/modifiers, list/attack_modifiers)
	. = ..()

	if(LAZYLEN(contents) >= max_items)
		balloon_alert(user, "полон!")
		return
	if(item.w_class > max_weight)
		balloon_alert(user, "слишком большой!")
		return

	var/desired_phrase = tgui_input_text(user, "Какая фраза активации?", "Активация фразы", "негров", max_length = 26)
	if(!desired_phrase || !user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return

	if(item.loc != user || !user.transferItemToLoc(item, src))
		return

	to_chat(user, span_notice("Вы впихиваете [RU_NOM(item)] в [thtotext(contents.len)] слот [RU_SRC_GEN]."))
	playsound(src, 'sound/machines/click.ogg', 30, TRUE)
	set_phrase(desired_phrase,item)

	return TRUE

/obj/item/clothing/head/fedora/inspector_hat/attack_self(mob/user)
	. = ..()
	if(!length(items_by_regex))
		return CLICK_ACTION_BLOCKING
	var/list/found_items = list()
	for(var/found_regex in items_by_regex)
		found_items += items_by_regex[found_regex]
	var/obj/found_item = tgui_input_list(user, "Какой предмет ты хочешь взять?", "Выбор предметов", found_items)
	if(!found_item || !user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return CLICK_ACTION_BLOCKING
	user.put_in_inactive_hand(found_item)

/obj/item/clothing/head/fedora/inspector_hat/click_alt(mob/user)
	var/new_prefix = tgui_input_text(user, "Каким должен быть новый префикс?", "Активация префикса", prefix, max_length = 24)
	if(!new_prefix || !user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
		return CLICK_ACTION_BLOCKING
	set_prefix(new_prefix)
	return CLICK_ACTION_SUCCESS

/obj/item/clothing/head/fedora/inspector_hat/Exited(atom/movable/gone, direction)
	. = ..()
	for(var/found_regex in items_by_regex)
		var/obj/item/found_item = items_by_regex[found_regex]
		if(gone != found_item)
			continue
		items_by_regex -= found_regex
		phrases_by_regex -= found_regex
		break

/obj/item/clothing/head/fedora/inspector_hat/atom_destruction(damage_flag)

	var/atom/atom_location = drop_location()
	for(var/found_regex in items_by_regex)
		var/obj/item/result = items_by_regex[found_regex]
		result.forceMove(atom_location)
		items_by_regex -= found_regex
		phrases_by_regex -= found_regex

	return ..()

/obj/item/clothing/head/fedora/inspector_hat/Destroy()
	QDEL_LIST_ASSOC(items_by_regex) //Anything that failed to drop gets deleted.
	return ..()

/obj/item/clothing/head/fedora/inspector_hat/get_ru_names()
	return alist(
		NOMINATIVE = "федора инспектора",
		GENITIVE = "федоры инспектора",
		DATIVE = "федоре инспектора",
		ACCUSATIVE = "федору инспектора",
		INSTRUMENTAL = "федорой инспектора",
		PREPOSITIONAL = "федоре инспектора",
	)

//Mime
/obj/item/clothing/head/beret
	name = "beret"
	desc = "Берет, любимый головной убор мима."
	dog_fashion = /datum/dog_fashion/head/beret
	icon = 'icons/map_icons/clothing/head/beret.dmi'
	icon_state = "/obj/item/clothing/head/beret"
	post_init_icon_state = "beret"
	greyscale_config = /datum/greyscale_config/beret
	greyscale_config_worn = /datum/greyscale_config/beret/worn
	greyscale_colors = "#972A2A"
	flags_1 = IS_PLAYER_COLORABLE_1
	hair_mask = /datum/hair_mask/standard_hat_middle

/obj/item/clothing/head/beret/get_ru_names()
	return alist(
		NOMINATIVE = "берет",
		GENITIVE = "берета",
		DATIVE = "берету",
		ACCUSATIVE = "берет",
		INSTRUMENTAL = "беретом",
		PREPOSITIONAL = "берете",
	)

//Security
/obj/item/clothing/head/hats/hos
	name = "generic head of security hat"
	desc = "Пожалуйста, свяжитесь с Костюмерным отделом Nanotrasen, если найдёте."
	abstract_type = /obj/item/clothing/head/hats/hos
	armor_type = /datum/armor/hats_hos
	strip_delay = 8 SECONDS

/obj/item/clothing/head/hats/hos/cap
	name = "head of security cap"
	desc = "Прочная стандартная кепка главы службы безопасности. Чтобы показать офицерам, кто здесь главный. Выглядит немного коренасто.."
	icon_state = "hoscap"

/obj/item/clothing/head/hats/hos/cap/Initialize(mapload)
	. = ..()
	// Give it a little publicity
	var/static/list/slapcraft_recipe_list = list(\
		/datum/crafting_recipe/sturdy_shako,\
		)

	AddElement(
		/datum/element/slapcrafting,\
		slapcraft_recipes = slapcraft_recipe_list,\
	)

/datum/armor/hats_hos
	melee = 40
	bullet = 30
	laser = 25
	energy = 35
	bomb = 25
	bio = 10
	fire = 50
	acid = 60
	wound = 10

/obj/item/clothing/head/hats/hos/cap/get_ru_names()
	return alist(
		NOMINATIVE = "кепка главы службы безопасности",
		GENITIVE = "кепки главы службы безопасности",
		DATIVE = "кепке главы службы безопасности",
		ACCUSATIVE = "кепку главы службы безопасности",
		INSTRUMENTAL = "кепкой главы службы безопасности",
		PREPOSITIONAL = "кепке главы службы безопасности",
	)

/obj/item/clothing/head/hats/hos/cap/syndicate
	name = "syndicate cap"
	desc = "Чёрная кепка, подходящая для высокопоставленного офицера Синдиката."

/obj/item/clothing/head/hats/hos/cap/syndicate/get_ru_names()
	return alist(
		NOMINATIVE = "кепка синдиката",
		GENITIVE = "кепки синдиката",
		DATIVE = "кепке синдиката",
		ACCUSATIVE = "кепку синдиката",
		INSTRUMENTAL = "кепкой синдиката",
		PREPOSITIONAL = "кепке синдиката",
	)

/obj/item/clothing/head/hats/hos/shako
	name = "sturdy shako"
	desc = "Если надеть это, захочется крикнуть кому-нибудь: «Отожмись двадцать раз!»."
	icon_state = "hosshako"
	worn_icon = 'icons/mob/large-worn-icons/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	custom_materials = list(/datum/material/alloy/plasteel = SHEET_MATERIAL_AMOUNT * 2, /datum/material/gold = SHEET_MATERIAL_AMOUNT * 2)

/obj/item/clothing/head/hats/hos/shako/get_ru_names()
	return alist(
		NOMINATIVE = "прочный кивер",
		GENITIVE = "прочного кивера",
		DATIVE = "прочному киверу",
		ACCUSATIVE = "прочный кивер",
		INSTRUMENTAL = "прочным кивером",
		PREPOSITIONAL = "прочном кивере",
	)

/obj/item/clothing/head/hats/hos/beret
	name = "head of security's beret"
	desc = "Прочный берет начальника службы безопасности — для стильного вида без ущерба защите."
	icon = 'icons/map_icons/clothing/head/_head.dmi'
	icon_state = "/obj/item/clothing/head/hats/hos/beret"
	post_init_icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#39393f#f0cc8f"
	hair_mask = /datum/hair_mask/standard_hat_middle

/obj/item/clothing/head/hats/hos/beret/sec/get_ru_names()
	return alist(
		NOMINATIVE = "берет главы службы безопасности",
		GENITIVE = "берета главы службы безопасности",
		DATIVE = "берету главы службы безопасности",
		ACCUSATIVE = "берет главы службы безопасности",
		INSTRUMENTAL = "беретом главы службы безопасности",
		PREPOSITIONAL = "берете главы службы безопасности",
	)

/obj/item/clothing/head/hats/hos/beret/navyhos
	name = "head of security's formal beret"
	desc = "Особый берет с эмблемой главы службы безопасности, украшающей его. Символ превосходства, знак мужества, отметка отличия."
	icon_state = "/obj/item/clothing/head/hats/hos/beret/navyhos"
	greyscale_colors = "#638799#f0cc8f"

/obj/item/clothing/head/hats/hos/beret/navyhos/get_ru_names()
	return alist(
		NOMINATIVE = "парадный берет главы службы безопасности",
		GENITIVE = "парадного берета главы службы безопасности",
		DATIVE = "парадному берету главы службы безопасности",
		ACCUSATIVE = "парадный берет главы службы безопасности",
		INSTRUMENTAL = "парадным беретом главы службы безопасности",
		PREPOSITIONAL = "парадном берете главы службы безопасности",
	)

/obj/item/clothing/head/hats/hos/beret/syndicate
	name = "syndicate beret"
	desc = "Чёрный берет с толстой амортизирующей прокладкой внутри. Стильный и прочный."

/obj/item/clothing/head/hats/hos/beret/syndicate/beret/get_ru_names()
	return alist(
		NOMINATIVE = "берет синдиката",
		GENITIVE = "берета синдиката",
		DATIVE = "берету синдиката",
		ACCUSATIVE = "берет синдиката",
		INSTRUMENTAL = "беретом синдиката",
		PREPOSITIONAL = "берете синдиката",
	)

/obj/item/clothing/head/hats/warden
	name = "warden's police hat"
	desc = "Это специальный бронированный шлем, выдаваемый смотрителю службы безопасности. Защищает голову от ударов."
	icon_state = "policehelm"
	armor_type = /datum/armor/hats_warden
	strip_delay = 6 SECONDS
	dog_fashion = /datum/dog_fashion/head/warden

/datum/armor/hats_warden
	melee = 40
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	fire = 30
	acid = 60
	wound = 5

/obj/item/clothing/head/hats/warden/get_ru_names()
	return alist(
		NOMINATIVE = "полицейская шляпа смотрителя",
		GENITIVE = "полицейской шляпы смотрителя",
		DATIVE = "полицейской шляпе смотрителя",
		ACCUSATIVE = "полицейскую шляпу смотрителя",
		INSTRUMENTAL = "полицейской шляпой смотрителя",
		PREPOSITIONAL = "полицейской шляпе смотрителя",
	)

/obj/item/clothing/head/hats/warden/police
	name = "police officer's hat"
	desc = "Шляпа полицейского. Эта шляпа подчёркивает, что вы — ЗАКОН."

/obj/item/clothing/head/hats/warden/police/get_ru_names()
	return alist(
		NOMINATIVE = "коллекционная шляпа полицейского",
		GENITIVE = "коллекционной шляпы полицейского",
		DATIVE = "коллекционной шляпе полицейского",
		ACCUSATIVE = "коллекционную шляпу полицейского",
		INSTRUMENTAL = "коллекционной шляпой полицейского",
		PREPOSITIONAL = "коллекционной шляпе полицейского",
	)

/obj/item/clothing/head/hats/warden/red
	name = "warden's hat"
	desc = "Красная шляпа смотрителя. Взгляд на неё вызывает желание держать людей в камерах как можно дольше."
	icon_state = "wardenhat"
	dog_fashion = /datum/dog_fashion/head/warden_red

/obj/item/clothing/head/hats/warden/red/get_ru_names()
	return alist(
		NOMINATIVE = "шляпа смотрителя",
		GENITIVE = "шляпы смотрителя",
		DATIVE = "шляпе смотрителя",
		ACCUSATIVE = "шляпу смотрителя",
		INSTRUMENTAL = "шляпой смотрителя",
		PREPOSITIONAL = "шляпе смотрителя",
	)

/obj/item/clothing/head/hats/warden/drill
	name = "warden's campaign hat"
	desc = "Особый бронированный походный шлем с нанесённой на него эмблемой службы безопасности. В середине имеется какое-то устройство и с ним можно взаимодействовать с помощью инструментов."
	icon_state = "wardendrill"
	inhand_icon_state = null
	dog_fashion = null
	var/mode = DRILL_DEFAULT

/obj/item/clothing/head/hats/warden/drill/screwdriver_act(mob/living/carbon/human/user, obj/item/I)
	if(..())
		return TRUE
	switch(mode)
		if(DRILL_DEFAULT)
			to_chat(user, span_notice("Вы переключаете голосовой режим в среднее положение."))
			mode = DRILL_SHOUTING
		if(DRILL_SHOUTING)
			to_chat(user, span_notice("Вы переключаете голосовой режим в последнее положение."))
			mode = DRILL_YELLING
		if(DRILL_YELLING)
			to_chat(user, span_notice("Вы переключаете голосовой режим в первое положение."))
			mode = DRILL_DEFAULT
		if(DRILL_CANADIAN)
			to_chat(user, span_danger("Вы переключаете голосовой режим, но ничего не происходит, потому что он сломан."))
	return TRUE

/obj/item/clothing/head/hats/warden/drill/wirecutter_act(mob/living/user, obj/item/I)
	..()
	if(mode != DRILL_CANADIAN)
		to_chat(user, span_danger("Вы сломали голосовой режим!"))
		mode = DRILL_CANADIAN
	return TRUE

/obj/item/clothing/head/hats/warden/drill/equipped(mob/M, slot)
	. = ..()
	if (slot & ITEM_SLOT_HEAD)
		RegisterSignal(M, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	else
		UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/head/hats/warden/drill/dropped(mob/M)
	. = ..()
	UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/clothing/head/hats/warden/drill/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		switch (mode)
			if(DRILL_SHOUTING)
				message += "!"
			if(DRILL_YELLING)
				message += "!!"
			if(DRILL_CANADIAN)
				message = "[message]"
				var/list/canadian_words = strings("canadian_replacement.json", "canadian")

				for(var/key in canadian_words)
					var/value = canadian_words[key]
					if(islist(value))
						value = pick(value)

					message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
					message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
					message = replacetextEx(message, " [key]", " [value]")

				if(prob(30))
					message += pick(", а?", ", А!?")
		speech_args[SPEECH_MESSAGE] = message

/obj/item/clothing/head/hats/warden/drill/get_ru_names()
	return alist(
		NOMINATIVE = "форменная полевая шляпа смотрителя",
		GENITIVE = "форменной полевой шляпы смотрителя",
		DATIVE = "форменной полевой шляпе смотрителя",
		ACCUSATIVE = "форменную полевую шляпу смотрителя",
		INSTRUMENTAL = "форменной полевой шляпой смотрителя",
		PREPOSITIONAL = "форменной полевой шляпе смотрителя",
	)

/obj/item/clothing/head/beret/sec
	name = "security beret"
	desc = "Прочный берет с нанесённой на него эмблемой службы безопасности. Использует усиленную ткань для обеспечения достаточной защиты."
	icon_state = "/obj/item/clothing/head/beret/sec"
	post_init_icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#a52f29#F2F2F2"
	armor_type = /datum/armor/cosmetic_sec
	strip_delay = 6 SECONDS
	dog_fashion = null
	flags_1 = NONE

/datum/armor/cosmetic_sec
	melee = 30
	bullet = 25
	laser = 25
	energy = 35
	bomb = 25
	fire = 20
	acid = 50
	wound = 5

/obj/item/clothing/head/beret/sec/get_ru_names()
	return alist(
		NOMINATIVE = "берет охраны",
		GENITIVE = "берета охраны",
		DATIVE = "берету охраны",
		ACCUSATIVE = "берет охраны",
		INSTRUMENTAL = "беретом охраны",
		PREPOSITIONAL = "берете охраны",
	)

/obj/item/clothing/head/beret/sec/navywarden
	name = "warden's beret"
	desc = "Особый берет с эмблемой службы безопасности, украшающей его. Предназначен для смотрителя."
	icon_state = "/obj/item/clothing/head/beret/sec/navywarden"
	greyscale_colors = "#638799#ebebeb"
	strip_delay = 6 SECONDS

/obj/item/clothing/head/beret/sec/navywarden/get_ru_names()
	return alist(
		NOMINATIVE = "берет смотрителя",
		GENITIVE = "берета смотрителя",
		DATIVE = "берету смотрителя",
		ACCUSATIVE = "берет смотрителя",
		INSTRUMENTAL = "беретом смотрителя",
		PREPOSITIONAL = "берете смотрителя",
	)

/obj/item/clothing/head/beret/sec/navyofficer
	desc = "Особый берет с эмблемой службы безопасности, украшающей его. Предназачен для офицеров."
	icon_state = "/obj/item/clothing/head/beret/sec/navyofficer"
	greyscale_colors = "#638799#a52f29"

/obj/item/clothing/head/beret/sec/navyofficer/get_ru_names()
	return alist(
		NOMINATIVE = "берет офицера",
		GENITIVE = "берета офицера",
		DATIVE = "берету офицера",
		ACCUSATIVE = "берет офицера",
		INSTRUMENTAL = "беретом офицера",
		PREPOSITIONAL = "берете офицера",
	)

//Science
/obj/item/clothing/head/beret/science
	name = "science beret"
	desc = "Берет в научном стиле для наших трудолюбивых учёных."
	icon_state = "/obj/item/clothing/head/beret/science"
	greyscale_colors = "#8D008F"
	flags_1 = NONE

/obj/item/clothing/head/beret/science/get_ru_names()
	return alist(
		NOMINATIVE = "берет учёного",
		GENITIVE = "берета учёного",
		DATIVE = "берету учёного",
		ACCUSATIVE = "берет учёного",
		INSTRUMENTAL = "беретом учёного",
		PREPOSITIONAL = "берете учёного",
	)

/obj/item/clothing/head/beret/science/rd
	desc = "Фиолетовый значок с прикреплённой эмблемой научного руководителя. Для внутреннего бумагомарателя в вас."
	icon_state = "/obj/item/clothing/head/beret/science/rd"
	post_init_icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#7e1980#c9cbcb"

/obj/item/clothing/head/beret/science/rd/get_ru_names()
	return alist(
		NOMINATIVE = "берет научного руководителя",
		GENITIVE = "берета научного руководителя",
		DATIVE = "берету научного руководителя",
		ACCUSATIVE = "берет научного руководителя",
		INSTRUMENTAL = "беретом научного руководителя",
		PREPOSITIONAL = "берете научного руководителя",
	)

//Medical
/obj/item/clothing/head/beret/medical
	name = "medical beret"
	desc = "Берет в медицинском стиле для внутреннего. Для внутреннего доктора в вас."
	icon_state = "/obj/item/clothing/head/beret/medical"
	greyscale_colors = COLOR_WHITE
	flags_1 = NONE

/obj/item/clothing/head/beret/medical/get_ru_names()
	return alist(
		NOMINATIVE = "медицинский берет",
		GENITIVE = "медицинского берета",
		DATIVE = "медицинскому берету",
		ACCUSATIVE = "медицинский берет",
		INSTRUMENTAL = "медицинским беретом",
		PREPOSITIONAL = "медицинском берете",
	)

/obj/item/clothing/head/beret/medical/paramedic
	name = "paramedic beret"
	desc = "Для поиска трупов со стилем!"
	icon_state = "/obj/item/clothing/head/beret/medical/paramedic"
	greyscale_colors = "#16313D"

/obj/item/clothing/head/beret/medical/paramedic/get_ru_names()
	return alist(
		NOMINATIVE = "берет парамедика",
		GENITIVE = "берета парамедика",
		DATIVE = "берету парамедика",
		ACCUSATIVE = "берет парамедика",
		INSTRUMENTAL = "беретом парамедика",
		PREPOSITIONAL = "берете парамедика",
	)

/obj/item/clothing/head/beret/medical/cmo
	name = "chief medical officer beret"
	desc = "Берет в характерном хирургическом бирюзовом цвете."
	icon_state = "/obj/item/clothing/head/beret/medical/cmo"
	greyscale_colors = "#5EB8B8"

/obj/item/clothing/head/beret/medical/cmo/get_ru_names()
	return alist(
		NOMINATIVE = "берет главного врача",
		GENITIVE = "берета главного врача",
		DATIVE = "берету главного врача",
		ACCUSATIVE = "берет главного врача",
		INSTRUMENTAL = "беретом главного врача",
		PREPOSITIONAL = "берете главного врача",
	)

/obj/item/clothing/head/utility/surgerycap
	name = "blue surgery cap"
	icon_state = "surgicalcap"
	desc = "Синяя медицинская хирургическая шапочка для предотвращения попадания волос хирурга внутрь пациента. Не поможет вульпам."
	flags_inv = HIDEHAIR //Cover your head doctor!
	w_class = WEIGHT_CLASS_SMALL //surgery cap can be easily crumpled
	pickup_sound = SFX_CLOTH_PICKUP
	drop_sound = SFX_CLOTH_DROP
	equip_sound = null

/obj/item/clothing/head/utility/surgerycap/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, -3) //FISH DOCTOR?!

/obj/item/clothing/head/utility/surgerycap/attack_self(mob/user)
	. = ..()
	if(.)
		return
	balloon_alert(user, "[flags_inv & HIDEHAIR ? "ослабление" : "затягивание"] нитей...")
	if(!do_after(user, 3 SECONDS, src))
		return
	flags_inv ^= HIDEHAIR
	balloon_alert(user, "[flags_inv & HIDEHAIR ? "затянуть" : "ослабение "] нитей")
	return TRUE

/obj/item/clothing/head/utility/surgerycap/examine(mob/user)
	. = ..()
	. += span_notice("Используй в руке, чтобы [flags_inv & HIDEHAIR ? "ослабить" : "затянуть"] нити.")

/obj/item/clothing/head/utility/surgerycap/get_ru_names()
	return alist(
		NOMINATIVE = "синий хирургический колпак",
		GENITIVE = "синего хирургического колпака",
		DATIVE = "синему хирургическому колпаку",
		ACCUSATIVE = "синий хирургический колпак",
		INSTRUMENTAL = "синим хирургическим колпаком",
		PREPOSITIONAL = "синем хирургическом колпаке",
	)

/obj/item/clothing/head/utility/surgerycap/purple
	name = "burgundy surgery cap"
	icon_state = "surgicalcapwine"
	desc = "Бордовая медицинская хирургическая шапочка для предотвращения попадания волос хирурга внутрь пациента. Не поможет вульпам."

/obj/item/clothing/head/utility/surgerycap/purple/get_ru_names()
	return alist(
		NOMINATIVE = "бордовый хирургический колпак",
		GENITIVE = "бордового хирургического колпака",
		DATIVE = "бордовому хирургическому колпаку",
		ACCUSATIVE = "бордовый хирургический колпак",
		INSTRUMENTAL = "бордовым хирургическим колпаком",
		PREPOSITIONAL = "бордовом хирургическом колпаке",
	)

/obj/item/clothing/head/utility/surgerycap/green
	name = "green surgery cap"
	icon_state = "surgicalcapgreen"
	desc = "Зелёная медицинская хирургическая шапочка для предотвращения попадания волос хирурга внутрь пациента. Не поможет вульпам."

/obj/item/clothing/head/utility/surgerycap/green/get_ru_names()
	return alist(
		NOMINATIVE = "зелёный хирургический колпак",
		GENITIVE = "зелёного хирургического колпака",
		DATIVE = "зелёному хирургическому колпаку",
		ACCUSATIVE = "зелёный хирургический колпак",
		INSTRUMENTAL = "зелёным хирургическим колпаком",
		PREPOSITIONAL = "зелёном хирургическом колпаке",
	)

/obj/item/clothing/head/utility/surgerycap/cmo
	name = "turquoise surgery cap"
	icon_state = "surgicalcapcmo"
	desc = "Хирургическая шапочка главврача, чтобы его волосы не попали внутрь пациента. Не поможет вульпам."

/obj/item/clothing/head/utility/surgerycap/cmo/get_ru_names()
	return alist(
		NOMINATIVE = "бирюзовая хирургическая шапка",
		GENITIVE = "бирюзовой хирургической шапки",
		DATIVE = "бирюзовой хирургической шапке",
		ACCUSATIVE = "бирюзовую хирургическую шапку",
		INSTRUMENTAL = "бирюзовой хирургической шапкой",
		PREPOSITIONAL = "бирюзовой хирургической шапке",
	)

/obj/item/clothing/head/utility/surgerycap/black
	name = "black surgery cap"
	icon_state = "surgicalcapblack"
	desc = "Чёрная медицинская хирургическая шапочка для предотвращения попадания волос хирурга внутрь пациента. Не поможет вульпам."

/obj/item/clothing/head/utility/surgerycap/black/get_ru_names()
	return alist(
		NOMINATIVE = "чёрная хирургическая шапка",
		GENITIVE = "чёрной хирургической шапки",
		DATIVE = "чёрной хирургической шапке",
		ACCUSATIVE = "чёрную хирургическую шапку",
		INSTRUMENTAL = "чёрной хирургической шапкой",
		PREPOSITIONAL = "чёрной хирургической шапке",
	)

/obj/item/clothing/head/utility/head_mirror
	name = "head mirror"
	desc = "Используется врачами для осмотра глаз, ушей и рта пациента. \
		Сейчас, учитывая доступные технологии, немного бесполезен, но определённо завершает образ."
	icon_state = "headmirror"
	body_parts_covered = NONE
	pickup_sound = null
	drop_sound = null
	equip_sound = null

/obj/item/clothing/head/utility/head_mirror/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, -3) //FISH DOCTOR?!

/obj/item/clothing/head/utility/head_mirror/examine(mob/user)
	. = ..()
	. += span_notice("В правильно освещённой комнате ты можешь использовать это, чтобы <i>приближенно</i> осмотреть глаза, уши и рот людей.")

/obj/item/clothing/head/utility/head_mirror/equipped(mob/living/user, slot)
	. = ..()
	if(slot & slot_flags)
		RegisterSignal(user, COMSIG_MOB_EXAMINING_MORE, PROC_REF(examining))
	else
		UnregisterSignal(user, COMSIG_MOB_EXAMINING_MORE)

/obj/item/clothing/head/utility/head_mirror/dropped(mob/living/user)
	. = ..()
	UnregisterSignal(user, COMSIG_MOB_EXAMINING_MORE)

/obj/item/clothing/head/utility/head_mirror/proc/examining(mob/living/examiner, atom/examining, list/examine_list)
	SIGNAL_HANDLER
	if(!ishuman(examining) || examining == examiner || examiner.is_blind() || !examiner.Adjacent(examining))
		return
	var/mob/living/carbon/human/human_examined = examining
	if(!human_examined.get_bodypart(BODY_ZONE_HEAD))
		return
	if(!examiner.has_light_nearby())
		examine_list += span_warning("You attempt to use your [name] to examine [examining]'s head better... but it's too dark. Should've invested in a head lamp.")
		return
	if(examiner.dir == examining.dir) // disallow examine from behind - every other dir is OK
		examine_list += span_warning("You attempt to use your [name] to examine [examining]'s head better... but [examining.p_theyre()] facing the wrong way.")
		return

	var/list/final_message = list("You examine [examining]'s head closer with your [name], you notice [examining.p_they()] [examining.p_have()]...")
	if(human_examined.is_mouth_covered())
		final_message += "\tYou can't see [examining.p_their()] mouth."
	else
		var/obj/item/organ/tongue/has_tongue = human_examined.get_organ_slot(ORGAN_SLOT_TONGUE)
		var/pill_count = 0
		for(var/datum/action/item_action/activate_pill/pill in human_examined.actions)
			pill_count++

		if(pill_count >= 1 && has_tongue)
			final_message += "\t[pill_count] pill\s in [examining.p_their()] mouth, and \a [has_tongue]."
		else if(pill_count >= 1)
			final_message += "\t[pill_count] pill\s in [examining.p_their()] mouth, but oddly no tongue."
		else if(has_tongue)
			final_message += "\t\A [has_tongue] in [examining.p_their()] mouth - go figure."
		else
			final_message += "\tNo tongue in [examining.p_their()] mouth, oddly enough."

	if(human_examined.is_ears_covered())
		final_message += "\tYou can't see [examining.p_their()] ears."
	else
		var/obj/item/organ/ears/has_ears = human_examined.get_organ_slot(ORGAN_SLOT_EARS)
		if(has_ears)
			if(has_ears.temporary_deafness)
				final_message += "\tDamaged eardrums in [examining.p_their()] ear canals."
			else
				final_message += "\tA set of [has_ears.damage ? "" : "healthy "][has_ears.name]."
		else
			final_message += "\tNo eardrums and empty ear canals... how peculiar."

	if(human_examined.is_eyes_covered())
		final_message += "\tYou can't see [examining.p_their()] eyes."
	else
		var/obj/item/organ/eyes/has_eyes = human_examined.get_organ_slot(ORGAN_SLOT_EYES)
		if(has_eyes)
			final_message += "\tA pair of [has_eyes.damage ? "" : "healthy "][has_eyes.name]."
		else
			final_message += "\tEmpty eye sockets."

	examine_list += span_notice("<i>[jointext(final_message, "\n")]</i>")

//Engineering
/obj/item/clothing/head/beret/engi
	name = "engineering beret"
	desc = "Может и не защитит от радиации, но точно защитит от немодного вида!"
	icon_state = "/obj/item/clothing/head/beret/engi"
	greyscale_colors = "#FFBC30"
	flags_1 = NONE

/obj/item/clothing/head/beret/engi/get_ru_names()
	return alist(
		NOMINATIVE = "инженерный берет",
		GENITIVE = "инженерного берета",
		DATIVE = "инженерному берету",
		ACCUSATIVE = "инженерный берет",
		INSTRUMENTAL = "инженерным беретом",
		PREPOSITIONAL = "инженерном берете",
	)

//Cargo
/obj/item/clothing/head/beret/cargo
	name = "cargo beret"
	desc = "Нет нужды комлексовать, когда на тебе этот берет!"
	icon_state = "/obj/item/clothing/head/beret/cargo"
	greyscale_colors = "#b7723d"
	flags_1 = NONE

/obj/item/clothing/head/beret/cargo/get_ru_names()
	return alist(
		NOMINATIVE = "берет снабжения",
		GENITIVE = "берета снабжения",
		DATIVE = "берету снабжения",
		ACCUSATIVE = "берет снабжения",
		INSTRUMENTAL = "беретом снабжения",
		PREPOSITIONAL = "берете снабжения",
	)

//Curator
/obj/item/clothing/head/fedora/curator
	name = "treasure hunter's fedora"
	desc = "Ты сегодня получил красный текст, малыш, но это не значит, что тебе должно это нравиться."
	icon_state = "curator"

/obj/item/clothing/head/fedora/curator/get_ru_names()
	return alist(
		NOMINATIVE = "федора охотника за сокровищами",
		GENITIVE = "федоры охотника за сокровищами",
		DATIVE = "федоре охотника за сокровищами",
		ACCUSATIVE = "федору охотника за сокровищами",
		INSTRUMENTAL = "федорой охотника за сокровищами",
		PREPOSITIONAL = "федоре охотника за сокровищами",
	)

/obj/item/clothing/head/beret/durathread
	name = "durathread beret"
	desc = "Берет, сделанный из дюраткани, его прочные волокна обеспечивают некоторую защиту носящему."
	icon_state = "/obj/item/clothing/head/beret/durathread"
	post_init_icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#C5D4F3#ECF1F8"
	armor_type = /datum/armor/beret_durathread

/datum/armor/beret_durathread
	melee = 15
	bullet = 5
	laser = 15
	energy = 25
	bomb = 10
	fire = 30
	acid = 5
	wound = 5

/obj/item/clothing/head/beret/highlander
	desc = "Это была белая ткань. <i>Была.</i>"
	dog_fashion = null //THIS IS FOR SLAUGHTER, NOT PUPPIES

/obj/item/clothing/head/beret/highlander/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HIGHLANDER_TRAIT)

/obj/item/clothing/head/beret/durathread/get_ru_names()
	return alist(
		NOMINATIVE = "берет из дюраткани",
		GENITIVE = "берета из дюраткани",
		DATIVE = "берету из дюраткани",
		ACCUSATIVE = "берет из дюраткани",
		INSTRUMENTAL = "беретом из дюраткани",
		PREPOSITIONAL = "берете из дюраткани",
	)

//CentCom
/obj/item/clothing/head/beret/centcom_formal
	name = " CentCom Formal Beret"
	desc = "Иногда приходится идти на компромисс между модой и защитой. Благодаря последним улучшениям NanoTrasen в области прочности наноткани, на этот раз это не так."
	icon_state = "/obj/item/clothing/head/beret/centcom_formal"
	post_init_icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#46b946#f2c42e"
	armor_type = /datum/armor/beret_centcom_formal
	strip_delay = 10 SECONDS


#undef DRILL_DEFAULT
#undef DRILL_SHOUTING
#undef DRILL_YELLING
#undef DRILL_CANADIAN

/datum/armor/beret_centcom_formal
	melee = 80
	bullet = 80
	laser = 50
	energy = 50
	bomb = 100
	bio = 100
	fire = 100
	acid = 90
	wound = 10

/obj/item/clothing/head/beret/centcom_formal/get_ru_names()
	return alist(
		NOMINATIVE = "парадный берет ЦентКома",
		GENITIVE = "парадного берета ЦентКома",
		DATIVE = "парадному берету ЦентКома",
		ACCUSATIVE = "парадный берет ЦентКома",
		INSTRUMENTAL = "парадным беретом ЦентКома",
		PREPOSITIONAL = "парадном берете ЦентКома",
	)

//Independant Militia
/obj/item/clothing/head/beret/militia
	name = "Militia General's Beret"
	desc = "Этот берет носят самые искусные ополченцы."
	icon_state = "/obj/item/clothing/head/beret/militia"
	post_init_icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#43523d#a2abb0"
	armor_type = /datum/armor/cosmetic_sec

/obj/item/clothing/head/beret/militia/get_ru_names()
	return alist(
		NOMINATIVE = "берет генерала ополчения",
		GENITIVE = "берета генерала ополчения",
		DATIVE = "берету генерала ополчения",
		ACCUSATIVE = "берет генерала ополчения",
		INSTRUMENTAL = "беретом генерала ополчения",
		PREPOSITIONAL = "берете генерала ополчения",
	)
