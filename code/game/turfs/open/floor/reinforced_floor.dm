/turf/open/floor/engine
	name = "reinforced floor"
	desc = "Невероятно прочный."
	gender = MALE
	icon_state = "engine"
	holodeck_compatible = TRUE
	thermal_conductivity = 0.01
	heat_capacity = INFINITY
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_turf = FALSE
	rcd_proof = TRUE
	rust_resistance = RUST_RESISTANCE_REINFORCED
	floor_tile = /obj/item/stack/rods
	/// How many `floor_tile` do you get when you deconstruct the floor
	var/floor_tile_amount = 2

/turf/open/floor/engine/get_ru_names()
	return alist(
		NOMINATIVE = "укреплённый пол",
		GENITIVE = "укреплённого пола",
		DATIVE = "укреплённому полу",
		ACCUSATIVE = "укреплённый пол",
		INSTRUMENTAL = "укреплённым полом",
		PREPOSITIONAL = "укреплённом поле",
	)

/turf/open/floor/engine/examine(mob/user)
	. += ..()
	. += span_notice("Укрепляющая арматура надёжно <b>прикручена</b> на месте.")

/turf/open/floor/engine/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/engine/break_tile()
	return //unbreakable

/turf/open/floor/engine/burn_tile()
	return //unburnable

/turf/open/floor/engine/make_plating(force = FALSE)
	if(force)
		return ..()
	return //unplateable

/turf/open/floor/engine/try_replace_tile(obj/item/stack/tile/T, mob/user, list/modifiers)
	return

/turf/open/floor/engine/crowbar_act(mob/living/user, obj/item/I)
	return

/turf/open/floor/engine/wrench_act(mob/living/user, obj/item/I)
	..()
	to_chat(user, span_notice("Вы начинаете убирать арматуру..."))
	if(I.use_tool(src, user, 30, volume=80))
		if(!istype(src, /turf/open/floor/engine))
			return TRUE
		if(floor_tile)
			new floor_tile(src, floor_tile_amount)
		ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
	return TRUE

/turf/open/floor/engine/ex_act(severity, target)
	if(target == src)
		ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
		return TRUE
	if(is_explosion_shielded(severity))
		return FALSE

	switch(severity)
		if(EXPLODE_DEVASTATE)
			if(prob(80))
				if (!ispath(baseturf_at_depth(2), /turf/open/floor))
					attempt_lattice_replacement()
				else
					ScrapeAway(2, flags = CHANGETURF_INHERIT_AIR)
			else if(prob(50))
				ScrapeAway(2, flags = CHANGETURF_INHERIT_AIR)
			else
				ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
		if(EXPLODE_HEAVY)
			if(prob(50))
				ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

	return TRUE

// Contents *under* the reinforced flooring is protected from explosions (unless it's devastate level)
/turf/open/floor/engine/can_propagate_explosion(atom/movable/some_thing, severity)
	return severity == EXPLODE_DEVASTATE || !HAS_TRAIT(some_thing, TRAIT_UNDERFLOOR)

/turf/open/floor/engine/singularity_pull(atom/singularity, current_size)
	..()
	if(current_size >= STAGE_FIVE)
		if(floor_tile)
			if(prob(30))
				new floor_tile(src)
				make_plating(TRUE)
		else if(prob(30))
			attempt_lattice_replacement()

/turf/open/floor/engine/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)

//air filled floors; used in atmos pressure chambers

/turf/open/floor/engine/n2o
	article = "an"
	name = "N2O floor"
	initial_gas_mix = ATMOS_TANK_N2O

/turf/open/floor/engine/n2o/get_ru_names()
	return alist(
		NOMINATIVE = "пол N2O",
		GENITIVE = "пола N2O",
		DATIVE = "полу N2O",
		ACCUSATIVE = "пол N2O",
		INSTRUMENTAL = "полом N2O",
		PREPOSITIONAL = "поле N2O",
	)

/turf/open/floor/engine/co2
	name = "CO2 floor"
	initial_gas_mix = ATMOS_TANK_CO2

/turf/open/floor/engine/co2/get_ru_names()
	return alist(
		NOMINATIVE = "пол CO2",
		GENITIVE = "пола CO2",
		DATIVE = "полу CO2",
		ACCUSATIVE = "пол CO2",
		INSTRUMENTAL = "полом CO2",
		PREPOSITIONAL = "поле CO2",
	)

/turf/open/floor/engine/plasma
	name = "plasma floor"
	initial_gas_mix = ATMOS_TANK_PLASMA

/turf/open/floor/engine/plasma/get_ru_names()
	return alist(
		NOMINATIVE = "пол плазмы",
		GENITIVE = "пола плазмы",
		DATIVE = "полу плазмы",
		ACCUSATIVE = "пол плазмы",
		INSTRUMENTAL = "полом плазмы",
		PREPOSITIONAL = "поле плазмы",
	)

/turf/open/floor/engine/o2
	name = "O2 floor"
	initial_gas_mix = ATMOS_TANK_O2

/turf/open/floor/engine/o2/get_ru_names()
	return alist(
		NOMINATIVE = "пол O2",
		GENITIVE = "пола O2",
		DATIVE = "полу O2",
		ACCUSATIVE = "пол O2",
		INSTRUMENTAL = "полом O2",
		PREPOSITIONAL = "поле O2",
	)

/turf/open/floor/engine/n2
	article = "an"
	name = "N2 floor"
	initial_gas_mix = ATMOS_TANK_N2

/turf/open/floor/engine/n2/get_ru_names()
	return alist(
		NOMINATIVE = "пол N2",
		GENITIVE = "пола N2",
		DATIVE = "полу N2",
		ACCUSATIVE = "пол N2",
		INSTRUMENTAL = "полом N2",
		PREPOSITIONAL = "поле N2",
	)

/turf/open/floor/engine/bz
	name = "BZ floor"
	initial_gas_mix = ATMOS_TANK_BZ

/turf/open/floor/engine/bz/get_ru_names()
	return alist(
		NOMINATIVE = "пол BZ",
		GENITIVE = "пола BZ",
		DATIVE = "полу BZ",
		ACCUSATIVE = "пол BZ",
		INSTRUMENTAL = "полом BZ",
		PREPOSITIONAL = "поле BZ",
	)

/turf/open/floor/engine/freon
	name = "Freon floor"
	initial_gas_mix = ATMOS_TANK_FREON

/turf/open/floor/engine/freon/get_ru_names()
	return alist(
		NOMINATIVE = "пол фреона",
		GENITIVE = "пола фреона",
		DATIVE = "полу фреона",
		ACCUSATIVE = "пол фреона",
		INSTRUMENTAL = "полом фреона",
		PREPOSITIONAL = "поле фреона",
	)

/turf/open/floor/engine/halon
	name = "Halon floor"
	initial_gas_mix = ATMOS_TANK_HALON

/turf/open/floor/engine/halon/get_ru_names()
	return alist(
		NOMINATIVE = "пол галона",
		GENITIVE = "пола галона",
		DATIVE = "полу галона",
		ACCUSATIVE = "пол галона",
		INSTRUMENTAL = "полом галона",
		PREPOSITIONAL = "поле галона",
	)

/turf/open/floor/engine/healium
	name = "Healium floor"
	initial_gas_mix = ATMOS_TANK_HEALIUM

/turf/open/floor/engine/healium/get_ru_names()
	return alist(
		NOMINATIVE = "пол хилиума",
		GENITIVE = "пола хилиума",
		DATIVE = "полу хилиума",
		ACCUSATIVE = "пол хилиума",
		INSTRUMENTAL = "полом хилиума",
		PREPOSITIONAL = "поле хилиума",
	)

/turf/open/floor/engine/h2
	article = "an"
	name = "H2 floor"
	initial_gas_mix = ATMOS_TANK_H2

/turf/open/floor/engine/h2/get_ru_names()
	return alist(
		NOMINATIVE = "пол H2",
		GENITIVE = "пола H2",
		DATIVE = "полу H2",
		ACCUSATIVE = "пол H2",
		INSTRUMENTAL = "полом H2",
		PREPOSITIONAL = "поле H2",
	)

/turf/open/floor/engine/hypernoblium
	name = "Hypernoblium floor"
	initial_gas_mix = ATMOS_TANK_HYPERNOBLIUM

/turf/open/floor/engine/hypernoblium/get_ru_names()
	return alist(
		NOMINATIVE = "пол гиперноблия",
		GENITIVE = "пола гиперноблия",
		DATIVE = "полу гиперноблия",
		ACCUSATIVE = "пол гиперноблия",
		INSTRUMENTAL = "полом гиперноблия",
		PREPOSITIONAL = "поле гиперноблия",
	)

/turf/open/floor/engine/miasma
	name = "Miasma floor"
	initial_gas_mix = ATMOS_TANK_MIASMA

/turf/open/floor/engine/miasma/get_ru_names()
	return alist(
		NOMINATIVE = "пол миазмов",
		GENITIVE = "пола миазмов",
		DATIVE = "полу миазмов",
		ACCUSATIVE = "пол миазмов",
		INSTRUMENTAL = "полом миазмов",
		PREPOSITIONAL = "поле миазмов",
	)

/turf/open/floor/engine/nitrium
	name = "nitrium floor"
	initial_gas_mix = ATMOS_TANK_NITRIUM

/turf/open/floor/engine/nitrium/get_ru_names()
	return alist(
		NOMINATIVE = "пол нитрия",
		GENITIVE = "пола нитрия",
		DATIVE = "полу нитрия",
		ACCUSATIVE = "пол нитрия",
		INSTRUMENTAL = "полом нитрия",
		PREPOSITIONAL = "поле нитрия",
	)

/turf/open/floor/engine/pluoxium
	name = "Pluoxium floor"
	initial_gas_mix = ATMOS_TANK_PLUOXIUM

/turf/open/floor/engine/pluoxium/get_ru_names()
	return alist(
		NOMINATIVE = "пол плюоксия",
		GENITIVE = "пола плюоксия",
		DATIVE = "полу плюоксия",
		ACCUSATIVE = "пол плюоксия",
		INSTRUMENTAL = "полом плюоксия",
		PREPOSITIONAL = "поле плюоксия",
	)

/turf/open/floor/engine/proto_nitrate
	name = "Proto-Nitrate floor"
	initial_gas_mix = ATMOS_TANK_PROTO_NITRATE

/turf/open/floor/engine/proto_nitrate/get_ru_names()
	return alist(
		NOMINATIVE = "пол прото-нитрата",
		GENITIVE = "пола прото-нитрата",
		DATIVE = "полу прото-нитрата",
		ACCUSATIVE = "пол прото-нитрата",
		INSTRUMENTAL = "полом прото-нитрата",
		PREPOSITIONAL = "поле прото-нитрата",
	)

/turf/open/floor/engine/tritium
	name = "Tritium floor"
	initial_gas_mix = ATMOS_TANK_TRITIUM

/turf/open/floor/engine/tritium/get_ru_names()
	return alist(
		NOMINATIVE = "пол трития",
		GENITIVE = "пола трития",
		DATIVE = "полу трития",
		ACCUSATIVE = "пол трития",
		INSTRUMENTAL = "полом трития",
		PREPOSITIONAL = "поле трития",
	)

/turf/open/floor/engine/h2o
	article = "an"
	name = "H2O floor"
	initial_gas_mix = ATMOS_TANK_H2O

/turf/open/floor/engine/h2o/get_ru_names()
	return alist(
		NOMINATIVE = "пол H2O",
		GENITIVE = "пола H2O",
		DATIVE = "полу H2O",
		ACCUSATIVE = "пол H2O",
		INSTRUMENTAL = "полом H2O",
		PREPOSITIONAL = "поле H2O",
	)

/turf/open/floor/engine/zauker
	name = "Zauker floor"
	initial_gas_mix = ATMOS_TANK_ZAUKER

/turf/open/floor/engine/zauker/get_ru_names()
	return alist(
		NOMINATIVE = "пол заукера",
		GENITIVE = "пола заукера",
		DATIVE = "полу заукера",
		ACCUSATIVE = "пол заукера",
		INSTRUMENTAL = "полом заукера",
		PREPOSITIONAL = "поле заукера",
	)

/turf/open/floor/engine/helium
	name = "Helium floor"
	initial_gas_mix = ATMOS_TANK_HELIUM

/turf/open/floor/engine/helium/get_ru_names()
	return alist(
		NOMINATIVE = "пол гелия",
		GENITIVE = "пола гелия",
		DATIVE = "полу гелия",
		ACCUSATIVE = "пол гелия",
		INSTRUMENTAL = "полом гелия",
		PREPOSITIONAL = "поле гелия",
	)

/turf/open/floor/engine/antinoblium
	name = "Antinoblium floor"
	initial_gas_mix = ATMOS_TANK_ANTINOBLIUM

/turf/open/floor/engine/antinoblium/get_ru_names()
	return alist(
		NOMINATIVE = "пол антиноблия",
		GENITIVE = "пола антиноблия",
		DATIVE = "полу антиноблия",
		ACCUSATIVE = "пол антиноблия",
		INSTRUMENTAL = "полом антиноблия",
		PREPOSITIONAL = "поле антиноблия",
	)

/turf/open/floor/engine/air
	name = "air floor"
	initial_gas_mix = ATMOS_TANK_AIRMIX

/turf/open/floor/engine/air/get_ru_names()
	return alist(
		NOMINATIVE = "пол воздуха",
		GENITIVE = "пола воздуха",
		DATIVE = "полу воздуха",
		ACCUSATIVE = "пол воздуха",
		INSTRUMENTAL = "полом воздуха",
		PREPOSITIONAL = "поле воздуха",
	)

/turf/open/floor/engine/xenobio
	name = "xenobio bz floor"
	initial_gas_mix = XENOBIO_BZ

/turf/open/floor/engine/xenobio/get_ru_names()
	return alist(
		NOMINATIVE = "пол ксено-BZ",
		GENITIVE = "пола ксено-BZ",
		DATIVE = "полу ксено-BZ",
		ACCUSATIVE = "пол ксено-BZ",
		INSTRUMENTAL = "полом ксено-BZ",
		PREPOSITIONAL = "поле ксено-BZ",
	)

/turf/open/floor/engine/cult
	name = "engraved floor"
	desc = "Воздух над этим зловещим полом пахнет странно."
	icon_state = "cult"
	floor_tile = null
	var/obj/effect/cult_turf/realappearance

/turf/open/floor/engine/cult/get_ru_names()
	return alist(
		NOMINATIVE = "гравированный пол",
		GENITIVE = "гравированного пола",
		DATIVE = "гравированному полу",
		ACCUSATIVE = "гравированный пол",
		INSTRUMENTAL = "гравированным полом",
		PREPOSITIONAL = "гравированном поле",
	)

/turf/open/floor/engine/cult/Initialize(mapload)
	. = ..()
	icon_state = "plating" //we're redefining the base icon_state here so that the Conceal/Reveal Presence spell works for cultists

	if (!mapload)
		new /obj/effect/temp_visual/cult/turf/floor(src)

	realappearance = new /obj/effect/cult_turf(src)
	realappearance.linked = src

/turf/open/floor/engine/cult/Destroy()
	be_removed()
	return ..()

/turf/open/floor/engine/cult/ChangeTurf(path, new_baseturfs, flags)
	if(path != type)
		be_removed()
	return ..()

/turf/open/floor/engine/cult/proc/be_removed()
	QDEL_NULL(realappearance)

/turf/open/floor/engine/cult/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/engine/vacuum
	name = "vacuum floor"
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/engine/vacuum/get_ru_names()
	return alist(
		NOMINATIVE = "вакуумный пол",
		GENITIVE = "вакуумного пола",
		DATIVE = "вакуумному полу",
		ACCUSATIVE = "вакуумный пол",
		INSTRUMENTAL = "вакуумным полом",
		PREPOSITIONAL = "вакуумном поле",
	)

/turf/open/floor/engine/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/engine/insulation
	name = "hyper-insulated floor"
	desc = "Прочный и полностью термостойкий пол."
	icon_state = "insulation"
	thermal_conductivity = 0
	floor_tile = /obj/item/stack/sheet/mineral/plastitanium
	floor_tile_amount = 1 // Made with 1 sheet, deconstructs into 1 sheet

/turf/open/floor/engine/insulation/get_ru_names()
	return alist(
		NOMINATIVE = "термоизолированный пол",
		GENITIVE = "термоизолированного пола",
		DATIVE = "термоизолированному полу",
		ACCUSATIVE = "термоизолированный пол",
		INSTRUMENTAL = "термоизолированным полом",
		PREPOSITIONAL = "термоизолированном поле",
	)
