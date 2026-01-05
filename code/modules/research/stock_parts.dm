/**
 * MARK: Компоненты
 */

/*Элементы питания находятся в code\modules\power\cell.dm
Если вы создаёте уровни T5+, пожалуйста, проверьте mech_fabricator.dm.
Слишком хорошие детали могут привести к отрицательным значениям и созданию материалов из ниоткуда при печати.*/

/obj/item/stock_parts
	name = "stock part"
	desc = "Что? Ты это видишь? ЧТООООО ?!!?? Да не может БЫТЬ! Тут явно не замешаны говнокодеры, как ты об этом подумал?"
	icon = 'icons/obj/devices/stock_parts.dmi'
	///Общий категорийный тип, к которому принадлежит запчасть. Общие объекты, которые не должны инстанцироваться, должны иметь одинаковый type и abstract_type.
	abstract_type = /obj/item/stock_parts
	w_class = WEIGHT_CLASS_SMALL
	sound_vary = TRUE
	pickup_sound = SFX_GENERIC_DEVICE_PICKUP
	drop_sound = SFX_GENERIC_DEVICE_DROP
	var/rating = 1
	///Используется, когда базовая деталь имеет другое название по сравнению с деталями более высоких уровней. Например, каркасам машин нужен любой сервопривод, а не только микро-сервопривод.
	var/base_name
	var/energy_rating = 1

/obj/item/stock_parts/Initialize(mapload)
	. = ..()
	pixel_x = base_pixel_x + rand(-5, 5)
	pixel_y = base_pixel_y + rand(-5, 5)

/obj/item/stock_parts/get_part_rating()
	return rating

/**
 * MARK: ТИР 1
 */

/obj/item/stock_parts/capacitor
	name = "capacitor"
	desc = "Базовый конденсатор, используемый в конструкции различных устройств."
	icon_state = "capacitor"
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.5)

/obj/item/stock_parts/capacitor/get_ru_names()
	return alist(
		NOMINATIVE = "конденсатор",
		GENITIVE = "конденсатора",
		DATIVE = "конденсатору",
		ACCUSATIVE = "конденсатор",
		INSTRUMENTAL = "конденсатором",
		PREPOSITIONAL = "конденсаторе",
	)

/obj/item/stock_parts/scanning_module
	name = "scanning module"
	desc = "Компактный сканирующий модуль с высоким разрешением, используемый в конструкции некоторых устройств."
	icon_state = "scan_module"
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/scanning_module/get_ru_names()
	return alist(
		NOMINATIVE = "сканирующий модуль",
		GENITIVE = "сканирующего модуля",
		DATIVE = "сканирующему модулю",
		ACCUSATIVE = "сканирующий модуль",
		INSTRUMENTAL = "сканирующим модулем",
		PREPOSITIONAL = "сканирующем модуле",
	)

/obj/item/stock_parts/servo
	name = "micro-servo"
	desc = "Крошечный серводвигатель, используемый в конструкции некоторых устройств."
	icon_state = "micro_servo"
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3)
	base_name = "servo"

/obj/item/stock_parts/servo/get_ru_names()
	return alist(
		NOMINATIVE = "микросервопривод",
		GENITIVE = "микросервопривода",
		DATIVE = "микросервоприводу",
		ACCUSATIVE = "микросервопривод",
		INSTRUMENTAL = "микросервоприводом",
		PREPOSITIONAL = "микросервоприводе",
	)

/obj/item/stock_parts/micro_laser
	name = "micro-laser"
	desc = "Крошечный лазер, используемый в некоторых устройствах."
	icon_state = "micro_laser"
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.1, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/micro_laser/get_ru_names()
	return alist(
		NOMINATIVE = "микролазер",
		GENITIVE = "микролазера",
		DATIVE = "микролазеру",
		ACCUSATIVE = "микролазер",
		INSTRUMENTAL = "микролазером",
		PREPOSITIONAL = "микролазере",
	)

/obj/item/stock_parts/matter_bin
	name = "matter bin"
	desc = "Контейнер, предназначенный для хранения сжатого материала, ожидающего восстановления."
	icon_state = "matter_bin"
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.8)

/obj/item/stock_parts/matter_bin/get_ru_names()
	return alist(
		NOMINATIVE = "ёмкость материи",
		GENITIVE = "ёмкости материи",
		DATIVE = "ёмкости материи",
		ACCUSATIVE = "ёмкость материи",
		INSTRUMENTAL = "ёмкостью материи",
		PREPOSITIONAL = "ёмкости материи",
	)

/**
 * MARK: ТИР 2
 */

/obj/item/stock_parts/capacitor/adv
	name = "advanced capacitor"
	desc = "Усовершенствованный конденсатор, используемый в конструкции различных устройств."
	icon_state = "adv_capacitor"
	rating = 2
	energy_rating = 3
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.5)

/obj/item/stock_parts/capacitor/adv/get_ru_names()
	return alist(
		NOMINATIVE = "улучшенный конденсатор",
		GENITIVE = "улучшенного конденсатора",
		DATIVE = "улучшенному конденсатору",
		ACCUSATIVE = "улучшенный конденсатор",
		INSTRUMENTAL = "улучшенным конденсатором",
		PREPOSITIONAL = "улучшенном конденсаторе",
	)

/obj/item/stock_parts/scanning_module/adv
	name = "advanced scanning module"
	desc = "Компактный сканирующий модуль с высоким разрешением, используемый в конструкции некоторых устройств."
	icon_state = "adv_scan_module"
	rating = 2
	energy_rating = 3
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/scanning_module/adv/get_ru_names()
	return alist(
		NOMINATIVE = "улучшенный сканирующий модуль",
		GENITIVE = "улучшенного сканирующего модуля",
		DATIVE = "улучшенному сканирующему модулю",
		ACCUSATIVE = "улучшенный сканирующий модуль",
		INSTRUMENTAL = "улучшенным сканирующим модулем",
		PREPOSITIONAL = "улучшенном сканирующем модуле",
	)

/obj/item/stock_parts/servo/nano
	name = "nano-servo"
	desc = "Крошечный серводвигатель, используемый в конструкции некоторых устройств."
	icon_state = "nano_servo"
	rating = 2
	energy_rating = 3
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3)

/obj/item/stock_parts/servo/nano/get_ru_names()
	return alist(
		NOMINATIVE = "конденнаносервоприводсатор",
		GENITIVE = "наносервопривода",
		DATIVE = "наносервоприводу",
		ACCUSATIVE = "наносервопривод",
		INSTRUMENTAL = "наносервоприводом",
		PREPOSITIONAL = "наносервоприводе",
	)

/obj/item/stock_parts/micro_laser/high
	name = "high-power micro-laser"
	desc = "Крошечный лазер, используемый в некоторых устройствах."
	icon_state = "high_micro_laser"
	rating = 2
	energy_rating = 3
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.1, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/micro_laser/high/get_ru_names()
	return alist(
		NOMINATIVE = "мощный микролазер",
		GENITIVE = "мощного микролазера",
		DATIVE = "мощному микролазеру",
		ACCUSATIVE = "мощный микролазер",
		INSTRUMENTAL = "мощным микролазером",
		PREPOSITIONAL = "мощном микролазере",
	)

/obj/item/stock_parts/matter_bin/adv
	name = "advanced matter bin"
	desc = "Контейнер, предназначенный для хранения сжатого материала, ожидающего восстановления."
	icon_state = "advanced_matter_bin"
	rating = 2
	energy_rating = 3
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.8)

/obj/item/stock_parts/matter_bin/adv/get_ru_names()
	return alist(
		NOMINATIVE = "улучшенная ёмкость материи",
		GENITIVE = "улучшенной ёмкости материи",
		DATIVE = "улучшенной ёмкости материи",
		ACCUSATIVE = "улучшенную ёмкость материи",
		INSTRUMENTAL = "улучшенной ёмкостью материи",
		PREPOSITIONAL = "улучшенной ёмкости материи",
	)

/**
 * MARK: ТИР 3
 */

/obj/item/stock_parts/capacitor/super
	name = "super capacitor"
	desc = "Конденсатор сверхвысокой емкости, используемый в конструкции различных устройств."
	icon_state = "super_capacitor"
	rating = 3
	energy_rating = 5
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.5)

/obj/item/stock_parts/capacitor/super/get_ru_names()
	return alist(
		NOMINATIVE = "суперконденсатор",
		GENITIVE = "суперконденсатора",
		DATIVE = "суперконденсатору",
		ACCUSATIVE = "суперконденсатор",
		INSTRUMENTAL = "суперконденсатором",
		PREPOSITIONAL = "суперконденсаторе",
	)

/obj/item/stock_parts/scanning_module/phasic
	name = "phasic scanning module"
	desc = "Компактный модуль фазового сканирования с высоким разрешением, используемый в конструкции некоторых устройств."
	icon_state = "super_scan_module"
	rating = 3
	energy_rating = 5
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/scanning_module/phasic/get_ru_names()
	return alist(
		NOMINATIVE = "фазовый сканирующий модуль",
		GENITIVE = "фазового сканирующего модуля",
		DATIVE = "фазовому сканирующему модулю",
		ACCUSATIVE = "фазовый сканирующий модуль",
		INSTRUMENTAL = "фазовым сканирующим модулем",
		PREPOSITIONAL = "фазовом сканирующем модуле",
	)

/obj/item/stock_parts/servo/pico
	name = "pico-servo"
	desc = "Крошечный серводвигатель, используемый в конструкции некоторых устройств."
	icon_state = "pico_servo"
	rating = 3
	energy_rating = 5
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3)

/obj/item/stock_parts/servo/pico/get_ru_names()
	return alist(
		NOMINATIVE = "пикосервопривод",
		GENITIVE = "пикосервопривода",
		DATIVE = "пикосервоприводу",
		ACCUSATIVE = "пикосервопривод",
		INSTRUMENTAL = "пикосервоприводом",
		PREPOSITIONAL = "пикосервоприводе",
	)

/obj/item/stock_parts/micro_laser/ultra
	name = "ultra-high-power micro-laser"
	desc = "Крошечный лазер, используемый в некоторых устройствах."
	icon_state = "ultra_high_micro_laser"
	rating = 3
	energy_rating = 5
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.1, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/micro_laser/ultra/get_ru_names()
	return alist(
		NOMINATIVE = "сверхмощный микролазер",
		GENITIVE = "сверхмощного микролазера",
		DATIVE = "сверхмощному микролазеру",
		ACCUSATIVE = "сверхмощный микролазер",
		INSTRUMENTAL = "сверхмощным микролазером",
		PREPOSITIONAL = "сверхмощном микролазере",
	)

/obj/item/stock_parts/matter_bin/super
	name = "super matter bin"
	desc = "Контейнер, предназначенный для хранения сжатого материала, ожидающего восстановления."
	icon_state = "super_matter_bin"
	rating = 3
	energy_rating = 5
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.8)

/obj/item/stock_parts/matter_bin/super/get_ru_names()
	return alist(
		NOMINATIVE = "суперёмкость материи",
		GENITIVE = "суперёмкости материи",
		DATIVE = "суперёмкости материи",
		ACCUSATIVE = "суперёмкость материи",
		INSTRUMENTAL = "суперёмкостью материи",
		PREPOSITIONAL = "суперёмкости материи",
	)

/**
 * MARK: ТИР 4
 */

/obj/item/stock_parts/capacitor/quadratic
	name = "quadratic capacitor"
	desc = "Емкостный конденсатор, используемый в конструкции самых разных устройств."
	icon_state = "quadratic_capacitor"
	rating = 4
	energy_rating = 10
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.5)

/obj/item/stock_parts/capacitor/quadratic/get_ru_names()
	return alist(
		NOMINATIVE = "квадратичный конденсатор",
		GENITIVE = "квадратичного конденсатора",
		DATIVE = "квадратичному конденсатору",
		ACCUSATIVE = "квадратичный конденсатор",
		INSTRUMENTAL = "квадратичным конденсатором",
		PREPOSITIONAL = "квадратичном конденсаторе",
	)

/obj/item/stock_parts/scanning_module/triphasic
	name = "triphasic scanning module"
	desc = "Компактный трехфазный сканирующий модуль со сверхвысоким разрешением, используемый в конструкции некоторых устройств."
	icon_state = "triphasic_scan_module"
	rating = 4
	energy_rating = 10
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/scanning_module/triphasic/get_ru_names()
	return alist(
		NOMINATIVE = "трёхфазный сканирующий модуль",
		GENITIVE = "трёхфазного сканирующего модуля",
		DATIVE = "трёхфазному сканирующему модулю",
		ACCUSATIVE = "трёхфазный сканирующий модуль",
		INSTRUMENTAL = "трёхфазным сканирующим модулем",
		PREPOSITIONAL = "трёхфазном сканирующем модуле",
	)

/obj/item/stock_parts/servo/femto
	name = "femto-servo"
	desc = "Крошечный серводвигатель, используемый в конструкции некоторых устройств."
	icon_state = "femto_servo"
	rating = 4
	energy_rating = 10
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3)

/obj/item/stock_parts/servo/femto/get_ru_names()
	return alist(
		NOMINATIVE = "фемтосервопривод",
		GENITIVE = "фемтосервопривода",
		DATIVE = "фемтосервоприводу",
		ACCUSATIVE = "фемтосервопривод",
		INSTRUMENTAL = "фемтосервоприводом",
		PREPOSITIONAL = "фемтосервоприводе",
	)

/obj/item/stock_parts/micro_laser/quadultra
	name = "quad-ultra micro-laser"
	desc = "Крошечный лазер, используемый в некоторых устройствах."
	icon_state = "quadultra_micro_laser"
	rating = 4
	energy_rating = 10
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.1, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.2)

/obj/item/stock_parts/micro_laser/quadultra/get_ru_names()
	return alist(
		NOMINATIVE = "квадроультра микролазер",
		GENITIVE = "квадроультра микролазера",
		DATIVE = "квадроультра микролазеру",
		ACCUSATIVE = "квадроультра микролазер",
		INSTRUMENTAL = "квадроультра микролазером",
		PREPOSITIONAL = "квадроультра микролазере",
	)

/obj/item/stock_parts/matter_bin/bluespace
	name = "bluespace matter bin"
	desc = "Контейнер, предназначенный для хранения сжатого материала, ожидающего восстановления."
	icon_state = "bluespace_matter_bin"
	rating = 4
	energy_rating = 10
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.8)

/obj/item/stock_parts/matter_bin/bluespace/get_ru_names()
	return alist(
		NOMINATIVE = "блюспейс ёмкость материи",
		GENITIVE = "блюспейс ёмкости материи",
		DATIVE = "блюспейс ёмкости материи",
		ACCUSATIVE = "блюспейс ёмкость материи",
		INSTRUMENTAL = "блюспейс ёмкостью материи",
		PREPOSITIONAL = "блюспейс ёмкости материи",
	)

/**
 * MARK: Подпространство
 */

/obj/item/stock_parts/subspace
	name = "subspace stock part"
	abstract_type = /obj/item/stock_parts/subspace

/obj/item/stock_parts/subspace/ansible
	name = "subspace ansible"
	icon_state = "subspace_ansible"
	desc = "Компактный модуль, способный распознавать внепространственную активность."
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.1)

/obj/item/stock_parts/subspace/ansible/get_ru_names()
	return alist(
		NOMINATIVE = "ансибл подпространства",
		GENITIVE = "ансибла подпространства",
		DATIVE = "ансиблу подпространства",
		ACCUSATIVE = "ансибл подпространства",
		INSTRUMENTAL = "ансиблом подпространства",
		PREPOSITIONAL = "ансибле подпространства",
	)

/obj/item/stock_parts/subspace/filter
	name = "hyperwave filter"
	icon_state = "hyperwave_filter"
	desc = "Крошечное устройство, способное фильтровать и преобразовывать сверхинтенсивные радиоволны."
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.1)

/obj/item/stock_parts/subspace/filter/get_ru_names()
	return alist(
		NOMINATIVE = "фильтр гиперволны",
		GENITIVE = "фильтра гиперволны",
		DATIVE = "фильтру гиперволны",
		ACCUSATIVE = "фильтр гиперволны",
		INSTRUMENTAL = "фильтром гиперволны",
		PREPOSITIONAL = "фильтре гиперволны",
	)

/obj/item/stock_parts/subspace/amplifier
	name = "subspace amplifier"
	icon_state = "subspace_amplifier"
	desc = "Компактная микромашина, способная усиливать слабые подпространственные передачи."
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.1)

/obj/item/stock_parts/subspace/amplifier/get_ru_names()
	return alist(
		NOMINATIVE = "усилитель подпространства",
		GENITIVE = "усилителя подпространства",
		DATIVE = "усилителю подпространства",
		ACCUSATIVE = "усилитель подпространства",
		INSTRUMENTAL = "усилителем подпространства",
		PREPOSITIONAL = "усилителе подпространства",
	)

/obj/item/stock_parts/subspace/treatment
	name = "subspace treatment disk"
	icon_state = "treatment_disk"
	desc = "Компактная микромашина, способная излучать сверхсжатые радиоволны."
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.1)

/obj/item/stock_parts/subspace/treatment/get_ru_names()
	return alist(
		NOMINATIVE = "диск лечения подпространства",
		GENITIVE = "диска лечения подпространства",
		DATIVE = "диску лечения подпространства",
		ACCUSATIVE = "диск лечения подпространства",
		INSTRUMENTAL = "диском лечения подпространства",
		PREPOSITIONAL = "диске лечения подпространства",
	)

/obj/item/stock_parts/subspace/analyzer
	name = "subspace wavelength analyzer"
	icon_state = "wavelength_analyzer"
	desc = "Сложный анализатор, способный анализировать загадочные длины волн в подпространстве."
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.3, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.1)

/obj/item/stock_parts/subspace/analyzer/get_ru_names()
	return alist(
		NOMINATIVE = "анализатор длины волны подпространства",
		GENITIVE = "анализатора длины волны подпространства",
		DATIVE = "анализатору длины волны подпространства",
		ACCUSATIVE = "анализатор длины волны подпространства",
		INSTRUMENTAL = "анализатором длины волны подпространства",
		PREPOSITIONAL = "анализаторе длины волны подпространства",
	)

/obj/item/stock_parts/subspace/crystal
	name = "ansible crystal"
	icon_state = "ansible_crystal"
	desc = "Кристалл из чистого стекла, используемый для передачи лазерных данных в подпространство."
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.5)

/obj/item/stock_parts/subspace/crystal/get_ru_names()
	return alist(
		NOMINATIVE = "кристалл ансибл",
		GENITIVE = "кристалла ансибл",
		DATIVE = "кристаллу ансибл",
		ACCUSATIVE = "кристалл ансибл",
		INSTRUMENTAL = "кристаллом ансибл",
		PREPOSITIONAL = "кристалле ансибл",
	)

/obj/item/stock_parts/subspace/transmitter
	name = "subspace transmitter"
	icon_state = "subspace_transmitter"
	desc = "Большое оборудование, используемое для открытия окна в подпространственное измерение."
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5)

/obj/item/stock_parts/subspace/transmitter/get_ru_names()
	return alist(
		NOMINATIVE = "передатчик подпространства",
		GENITIVE = "передатчика подпространства",
		DATIVE = "передатчику подпространства",
		ACCUSATIVE = "передатчик подпространства",
		INSTRUMENTAL = "передатчиком подпространства",
		PREPOSITIONAL = "передатчике подпространства",
	)

/**
 * MARK: Разное
 */

/obj/item/stock_parts/card_reader
	name = "card reader"
	icon_state = "card_reader"
	desc = "Небольшой считыватель магнитных карт, используемый для устройств, которые принимают и передают голокарты."
	custom_materials = list(/datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5, /datum/material/glass=SMALL_MATERIAL_AMOUNT*0.1)

/obj/item/stock_parts/card_reader/get_ru_names()
	return alist(
		NOMINATIVE = "картридер",
		GENITIVE = "картридера",
		DATIVE = "картридеру",
		ACCUSATIVE = "картридер",
		INSTRUMENTAL = "картридером",
		PREPOSITIONAL = "картридере",
	)

/obj/item/stock_parts/water_recycler
	name = "water recycler"
	icon_state = "water_recycler"
	desc = "Химический восстановительный компонент, который служит для повторного накопления и фильтрации воды с течением времени."
	custom_materials = list(/datum/material/plastic=SMALL_MATERIAL_AMOUNT * 2, /datum/material/iron=SMALL_MATERIAL_AMOUNT*0.5)

/obj/item/stock_parts/water_recycler/get_ru_names()
	return alist(
		NOMINATIVE = "рециркулятор воды",
		GENITIVE = "рециркулятора воды",
		DATIVE = "рециркулятору воды",
		ACCUSATIVE = "рециркулятор воды",
		INSTRUMENTAL = "рециркулятором воды",
		PREPOSITIONAL = "рециркуляторе воды",
	)

/obj/item/research//Makes testing much less of a pain -Sieve
	name = "research"
	icon = 'icons/obj/devices/stock_parts.dmi'
	icon_state = "capacitor"
	desc = "Элемент отладки для исследования."

/obj/item/research/get_ru_names()
	return alist(
		NOMINATIVE = "исследование",
		GENITIVE = "исследования",
		DATIVE = "исследованию",
		ACCUSATIVE = "исследование",
		INSTRUMENTAL = "исследованием",
		PREPOSITIONAL = "исследовании",
	)
