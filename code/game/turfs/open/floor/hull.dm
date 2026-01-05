
/turf/open/floor/engine/hull
	name = "exterior hull plating"
	desc = "Прочная внешняя обшивка корпуса, отделяющая вас от безжалостного космического вакуума."
	gender = FEMALE
	icon_state = "regular_hull"
	initial_gas_mix = AIRLESS_ATMOS
	temperature = TCMB

/turf/open/floor/engine/hull/get_ru_names()
	return alist(
		NOMINATIVE = "внешняя обшивка корпуса",
		GENITIVE = "внешней обшивки корпуса",
		DATIVE = "внешней обшивке корпуса",
		ACCUSATIVE = "внешнюю обшивку корпуса",
		INSTRUMENTAL = "внешней обшивкой корпуса",
		PREPOSITIONAL = "внешней обшивке корпуса",
	)

/turf/open/floor/engine/hull/air
	name = "interior hull plating"
	desc = "Прочная внутренняя обшивка корпуса, отделяющая вас от нижнего этажа."
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	temperature = T20C

/turf/open/floor/engine/hull/air/get_ru_names()
	return alist(
		NOMINATIVE = "внутренняя обшивка корпуса",
		GENITIVE = "внутренней обшивки корпуса",
		DATIVE = "внутренней обшивке корпуса",
		ACCUSATIVE = "внутреннюю обшивку корпуса",
		INSTRUMENTAL = "внутренней обшивкой корпуса",
		PREPOSITIONAL = "внутренней обшивке корпуса",
	)

/turf/open/floor/engine/hull/ceiling
	name = "shuttle ceiling plating"

/turf/open/floor/engine/hull/ceiling/get_ru_names()
	return alist(
		NOMINATIVE = "обшивка потолка шаттла",
		GENITIVE = "обшивки потолка шаттла",
		DATIVE = "обшивке потолка шаттла",
		ACCUSATIVE = "обшивку потолка шаттла",
		INSTRUMENTAL = "обшивкой потолка шаттла",
		PREPOSITIONAL = "обшивке потолка шаттла",
	)

/turf/open/floor/engine/hull/reinforced
	name = "exterior reinforced hull plating"
	desc = "Чрезвычайно прочная внешняя обшивка корпуса, отделяющая вас от безжалостного космического вакуума."
	icon_state = "reinforced_hull"
	heat_capacity = INFINITY

/turf/open/floor/engine/hull/reinforced/get_ru_names()
	return alist(
		NOMINATIVE = "укреплённая внешняя обшивка корпуса",
		GENITIVE = "укреплённой внешней обшивки корпуса",
		DATIVE = "укреплённой внешней обшивке корпуса",
		ACCUSATIVE = "укреплённую внешнюю обшивку корпуса",
		INSTRUMENTAL = "укреплённой внешней обшивкой корпуса",
		PREPOSITIONAL = "укреплённой внешней обшивке корпуса",
	)

/turf/open/floor/engine/hull/reinforced/air
	name = "interior reinforced hull plating"
	desc = "Чрезвычайно прочная внутренняя обшивка корпуса, отделяющая вас от нижнего этажа."
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	temperature = T20C

/turf/open/floor/engine/hull/reinforced/air/get_ru_names()
	return alist(
		NOMINATIVE = "укреплённая внутренняя обшивка корпуса",
		GENITIVE = "укреплённой внутренней обшивки корпуса",
		DATIVE = "укреплённой внутренней обшивке корпуса",
		ACCUSATIVE = "укреплённую внутреннюю обшивку корпуса",
		INSTRUMENTAL = "укреплённой внутренней обшивкой корпуса",
		PREPOSITIONAL = "укреплённой внутренней обшивке корпуса",
	)
