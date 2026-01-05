// Note, the order these in are deliberate, as it affects
// the order they are shown via radial.
GLOBAL_LIST_INIT(runed_metal_recipes, list( \
	new /datum/stack_recipe/radial( \
		title = "пилон", \
		result_type = /obj/structure/destructible/cult/pylon, \
		req_amount = 4, \
		time = 4 SECONDS, \
		crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, \
		desc = span_cult_bold("Пилон: Лечит и восстанавливает кровь ближайших культистов и конструктов, а также \
			превращает ближайшие напольные плитки в ритуальные полы, что позволяет культистам чертить руны быстрее."), \
		required_noun = "runed metal sheet", \
		category = CAT_CULT, \
	), \
	new /datum/stack_recipe/radial( \
		title = "алтарь", \
		result_type = /obj/structure/destructible/cult/item_dispenser/altar, \
		req_amount = 3, \
		time = 4 SECONDS, \
		crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, \
		desc = span_cult_bold("Алтарь: Может создавать Эльдричские точильные камни, Оболочки конструктов и Колбы нечистой воды."), \
		required_noun = "runed metal sheet", \
		category = CAT_CULT, \
	), \
	new /datum/stack_recipe/radial( \
		title = "архивы", \
		result_type = /obj/structure/destructible/cult/item_dispenser/archives, \
		req_amount = 3, \
		time = 4 SECONDS, \
		crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, \
		desc = span_cult_bold("Архивы: Может создавать Повязки фанатиков, Сферы проклятия шаттлов и \
			снаряжение Скитальца Теней. Излучает свет."), \
		required_noun = "runed metal sheet", \
		category = CAT_CULT, \
	), \
	new /datum/stack_recipe/radial( \
		title = "кузница демонов", \
		result_type = /obj/structure/destructible/cult/item_dispenser/forge, \
		req_amount = 3, \
		time = 4 SECONDS, \
		crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, \
		desc = span_cult_bold("Кузница демонов: Может создавать Закалённые доспехи Нар'Сиена, Робы бичующих \
			и Эльдричские длинные мечи. Излучает свет."), \
		required_noun = "runed metal sheet", \
		category = CAT_CULT, \
	), \
	new /datum/stack_recipe/radial( \
		title = "руническая дверь", \
		result_type = /obj/machinery/door/airlock/cult, \
		time = 5 SECONDS, \
		crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, \
		desc = span_cult_bold("Руническая дверь: Слабая дверь, которая оглушает не-культистов, прикоснувшихся к ней."), \
		required_noun = "runed metal sheet", \
		category = CAT_CULT, \
	), \
	new /datum/stack_recipe/radial( \
		title = "руническая балка", \
		result_type = /obj/structure/girder/cult, \
		time = 5 SECONDS, \
		crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, \
		desc = span_cult_bold("Руническая балка: Слабая балка, которую можно мгновенно разрушить ритуальным кинжалом. \
			Не рекомендуется использовать для этого рунический металл."), \
		required_noun = "runed metal sheet", \
		category = CAT_CULT, \
	), \

	new /datum/stack_recipe("руническая платформа", /obj/structure/platform/cult, 2, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, trait_booster = TRAIT_QUICK_BUILD, trait_modifier = 0.75, category = CAT_STRUCTURE), \
))

/obj/item/stack/sheet/runed_metal
	name = "runed metal"
	desc = "Листы холодного металла с меняющимися надписями, начертанными на них."
	singular_name = "runed metal sheet"
	icon_state = "sheet-runed"
	inhand_icon_state = "sheet-runed"
	icon = 'icons/obj/stack_objects.dmi'
	mats_per_unit = list(/datum/material/runedmetal = SHEET_MATERIAL_AMOUNT)
	construction_path_type = "runed"
	merge_type = /obj/item/stack/sheet/runed_metal
	grind_results = list(/datum/reagent/iron = 5, /datum/reagent/blood = 15)
	material_type = /datum/material/runedmetal
	has_unique_girder = TRUE
	use_radial = TRUE

/obj/item/stack/sheet/runed_metal/get_ru_names()
	return alist(
		NOMINATIVE = "рунический металл",
		GENITIVE = "рунического металла",
		DATIVE = "руническому металлу",
		ACCUSATIVE = "рунический металл",
		INSTRUMENTAL = "руническим металлом",
		PREPOSITIONAL = "руническом металле"
	)

/obj/item/stack/sheet/runed_metal/interact(mob/user)
	if(!IS_CULTIST(user))
		to_chat(user, span_warning("Только обладающий запретными знаниями может работать с этим металлом..."))
		return FALSE

	var/turf/user_turf = get_turf(user)
	var/area/user_area = get_area(user)

	var/is_valid_turf = user_turf && (is_station_level(user_turf.z) || is_mining_level(user_turf.z))
	var/is_valid_area = user_area && (user_area.area_flags & CULT_PERMITTED)

	if(!is_valid_turf || !is_valid_area)
		to_chat(user, span_warning("Покров здесь недостаточно слаб."))
		return FALSE

	return ..()

/obj/item/stack/sheet/runed_metal/radial_check(mob/builder)
	return ..() && IS_CULTIST(builder)

/obj/item/stack/sheet/runed_metal/get_main_recipes()
	. = ..()
	. += GLOB.runed_metal_recipes

/obj/item/stack/sheet/runed_metal/fifty
	amount = 50

/obj/item/stack/sheet/runed_metal/ten
	amount = 10

/obj/item/stack/sheet/runed_metal/five
	amount = 5
