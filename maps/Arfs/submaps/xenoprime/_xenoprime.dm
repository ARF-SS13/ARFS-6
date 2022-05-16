// -- Datums -- //

/obj/effect/overmap/visitable/sector/xenoprime
	name = "G-435 'Xenomorph Prime'"
	desc = "Homeworld of the alien species xenomorph XX121."
	scanner_desc = @{"[i]Stellar Body[/i]: G-435
[i]Class[/i]: M-Class Planet
[i]Habitability[/i]: Low (Dangerous Fauna, High Temperature, High CO2 Content, Low Biodiversity, Low Mineral Count)
[b]Notice[/b]: Exercise extreme caution when attempting to land or leave G-435. As per SG-16987416-S1.3, procuring live xenomorph XX121 specimen may only be performed by LEVEL-4 or higher scientific expedition crews with combat personnel present. Outbreaks will be met with lethal force."}
	in_space = 0
	initial_generic_waypoints = list("xenoprime_c")
	known = TRUE
	icon_state = "ruined"

	skybox_icon = 'icons/skybox/hiveworld.dmi'
	skybox_icon_state = "hiveworld"
	skybox_pixel_x = 0
	skybox_pixel_y = 0

//This is a special subtype of the thing that generates ores on a map
//It will generate more rich ores because of the lower numbers than the normal one
/datum/random_map/noise/ore/xenoprime
	descriptor = "xenomorph prime ore distribution map"
	deep_val = 0.875 //normal is 0.7 and 0.8
	rare_val = 0.95

//The check_map_sanity proc is sometimes unsatisfied with how AMAZING our ores are
/datum/random_map/noise/ore/xenoprime/check_map_sanity()
	var/rare_count = 0
	var/surface_count = 0
	var/deep_count = 0

	// Increment map sanity counters.
	for(var/value in map)
		if(value < rare_val)
			surface_count++
		else if(value < deep_val)
			rare_count++
		else
			deep_count++
	// Sanity check.
	if(surface_count < 50)
		admin_notice("<span class='danger'>Insufficient surface minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else if(rare_count < 25)
		admin_notice("<span class='danger'>Insufficient rare minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else if(deep_count < 25)
		admin_notice("<span class='danger'>Insufficient deep minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else
		return 1

// -- Objs -- //

//This object simply performs any map setup that needs to happen on our map if it loads.
//As with the above, you do need to place this object on the map somewhere.
/obj/away_mission_init/xenoprime
	name = "away mission initializer - xenomorph prime"

//In our case, it initializes the ores and random submaps in the beach's cave, then deletes itself
/obj/away_mission_init/xenoprime/Initialize()
	// Cave submaps are first.
	/*seed_submaps(list(z), 50, /area/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	seed_submaps(list(z), 50, /area/cave/unexplored/deep, /datum/map_template/surface/mountains/deep)

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_BEACH_CAVE, world.maxx, world.maxy)
	new /datum/random_map/noise/ore/beachmine(null, 1, 1, Z_LEVEL_BEACH_CAVE, 64, 64)*/

	initialized = TRUE
	return INITIALIZE_HINT_QDEL

// -- Turfs -- //

//Atmosphere properties
#define XENOPRIME_ONE_ATMOSPHERE	90 //kPa
#define XENOPRIME_AVG_TEMP			323.15 //kelvin

#define XENOPRIME_PER_N2		0.70 //percent
#define XENOPRIME_PER_O2		0.29
#define XENOPRIME_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define XENOPRIME_PER_CO2		0.1
#define XENOPRIME_PER_PHORON	0

//Math only beyond this point
#define XENOPRIME_MOL_PER_TURF		(XENOPRIME_ONE_ATMOSPHERE*CELL_VOLUME/(XENOPRIME_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define XENOPRIME_MOL_N2			(XENOPRIME_MOL_PER_TURF * XENOPRIME_PER_N2)
#define XENOPRIME_MOL_O2			(XENOPRIME_MOL_PER_TURF * XENOPRIME_PER_O2)
#define XENOPRIME_MOL_N2O			(XENOPRIME_MOL_PER_TURF * XENOPRIME_PER_N2O)
#define XENOPRIME_MOL_CO2			(XENOPRIME_MOL_PER_TURF * XENOPRIME_PER_CO2)
#define XENOPRIME_MOL_PHORON		(XENOPRIME_MOL_PER_TURF * XENOPRIME_PER_PHORON)

//Turfmakers
#define XENOPRIME_SET_ATMOS	nitrogen=XENOPRIME_MOL_N2;oxygen=XENOPRIME_MOL_O2;carbon_dioxide=XENOPRIME_MOL_CO2;phoron=XENOPRIME_MOL_PHORON;temperature=XENOPRIME_AVG_TEMP
#define XENOPRIME_TURF_CREATE(x)	x/xenoprime/nitrogen=XENOPRIME_MOL_N2;x/xenoprime/oxygen=XENOPRIME_MOL_O2;x/xenoprime/carbon_dioxide=XENOPRIME_MOL_CO2;x/xenoprime/phoron=XENOPRIME_MOL_PHORON;x/xenoprime/temperature=XENOPRIME_AVG_TEMP;x/xenoprime

/turf/simulated/shuttle/wall/voidcraft/green/xenoprime
	XENOPRIME_SET_ATMOS
	color = "#eacd7c"

/turf/simulated/shuttle/wall/voidcraft/green/xenoprime/nocol
	color = null

XENOPRIME_TURF_CREATE(/turf/unsimulated/wall/planetary)

XENOPRIME_TURF_CREATE(/turf/simulated/wall)
XENOPRIME_TURF_CREATE(/turf/simulated/wall/r_wall)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/plating)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/tiled/steel)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/bluegrid)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/tiled/techfloor)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/outdoors/newdirt_nograss)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/outdoors/mud)
XENOPRIME_TURF_CREATE(/turf/simulated/mineral)

// -- Areas -- //

/area/xenoprime
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "away"
	base_turf = /turf/simulated/floor/outdoors/newdirt_nograss/xenoprime //This is what the ground turns into if destroyed/bombed/etc
	requires_power = TRUE
	dynamic_lighting = TRUE
	flags = RAD_SHIELDED
	ambience = AMBIENCE_FOREBODING

/area/xenoprime/water
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/outdoors/mud/xenoprime

/area/xenoprime/explored
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "explored"
	flags = RAD_SHIELDED

/area/xenoprime/unexplored
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "unexplored"

/area/xenoprime/unexplored/outdoors
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "unexplored"

/area/xenoprime/unexplored/deep
	icon_state = "unexplored_deep"

/area/submap/xenoprime/crashed_ship_1
	name = "Xenomorph Prime G-435 (Crashed Shuttle)"


//         Planet stuff          //


var/datum/planet/xenoprime/planet_xenoprime = null

/datum/time/xenoprime
	seconds_in_day = 24 HOURS

/datum/planet/xenoprime
	name = "G-435"
	desc = "Homeworld of the alien species xenomorph XX121. Atmosphere is hot and barely breathable."
	current_time = new /datum/time/xenoprime()
	planetary_wall_type = /turf/unsimulated/wall/planetary/xenoprime

/datum/planet/xenoprime/New()
	..()
	planet_xenoprime = src
	weather_holder = new /datum/weather_holder/xenoprime(src)

/datum/planet/xenoprime/update_sun()
	..()
	var/datum/time/time = current_time
	var/length_of_day = time.seconds_in_day / 10 / 60 / 60
	var/noon = length_of_day / 2
	var/distance_from_noon = abs(text2num(time.show_time("hh")) - noon)
	sun_position = distance_from_noon / noon
	sun_position = abs(sun_position - 1)

	var/low_brightness = null
	var/high_brightness = null

	var/low_color = null
	var/high_color = null
	var/min = 0

	switch(sun_position)
		if(0 to 0.20) // Night
			low_brightness = 0.3
			low_color = "#000066"

			high_brightness = 0.5
			high_color = "#66004D"
			min = 0

		if(0.20 to 0.30) // Twilight
			low_brightness = 0.5
			low_color = "#66004D"

			high_brightness = 0.9
			high_color = "#CC3300"
			min = 0.40

		if(0.30 to 0.40) // Sunrise/set
			low_brightness = 0.9
			low_color = "#CC3300"

			high_brightness = 3.0
			high_color = "#FF9933"
			min = 0.50

		if(0.40 to 1.00) // Noon
			low_brightness = 3.0
			low_color = "#DDDDDD"

			high_brightness = 10.0
			high_color = "#FFFFFF"
			min = 0.70

	var/interpolate_weight = (abs(min - sun_position)) * 4
	var/weather_light_modifier = 1
	if(weather_holder && weather_holder.current_weather)
		weather_light_modifier = weather_holder.current_weather.light_modifier

	var/new_brightness = (LERP(low_brightness, high_brightness, interpolate_weight) ) * weather_light_modifier

	var/new_color = null
	if(weather_holder && weather_holder.current_weather && weather_holder.current_weather.light_color)
		new_color = weather_holder.current_weather.light_color
	else
		var/list/low_color_list = hex2rgb(low_color)
		var/low_r = low_color_list[1]
		var/low_g = low_color_list[2]
		var/low_b = low_color_list[3]

		var/list/high_color_list = hex2rgb(high_color)
		var/high_r = high_color_list[1]
		var/high_g = high_color_list[2]
		var/high_b = high_color_list[3]

		var/new_r = LERP(low_r, high_r, interpolate_weight)
		var/new_g = LERP(low_g, high_g, interpolate_weight)
		var/new_b = LERP(low_b, high_b, interpolate_weight)

		new_color = rgb(new_r, new_g, new_b)

	spawn(1)
		update_sun_deferred(new_brightness, new_color)


/datum/weather_holder/xenoprime
	temperature = T0C
	allowed_weather_types = list(
		WEATHER_CLEAR		= new /datum/weather/xenoprime/clear(),
		WEATHER_OVERCAST	= new /datum/weather/xenoprime/overcast(),
		WEATHER_RAIN		= new /datum/weather/xenoprime/rain(),
		WEATHER_STORM		= new /datum/weather/xenoprime/storm(),
		)
	roundstart_weather_chances = list(
		WEATHER_CLEAR		= 50,
		WEATHER_OVERCAST	= 25,
		WEATHER_RAIN		= 25
		)

/datum/weather/xenoprime
	name = "xenoprime"
	temp_high = 323.15
	temp_low =  303.15

/datum/weather/xenoprime/clear
	name = "clear"
	transition_chances = list(
		WEATHER_CLEAR = 75,
		WEATHER_OVERCAST = 25)
	transition_messages = list(
		"The sky clears up.",
		"The sky is visible.",
		"The weather is calm."
		)
	sky_visible = TRUE
	observed_message = "The sky is clear."
	light_modifier = 0.8

/datum/weather/xenoprime/overcast
	name = "overcast"
	temp_high = 323.15
	temp_low = 	303.15
	light_modifier = 0.6
	transition_chances = list(
		WEATHER_CLEAR = 30,
		WEATHER_OVERCAST = 30,
		WEATHER_RAIN = 15
		)
	observed_message = "It is overcast, all you can see are clouds."
	transition_messages = list(
		"All you can see above are clouds.",
		"Clouds cut off your view of the sky.",
		"It's very cloudy."
		)

/datum/weather/xenoprime/rain
	name = "rain"
	icon_state = "rain"
	temp_high = 323.15
	temp_low = 	303.15
	wind_high = 2
	wind_low = 1
	light_modifier = 0.4
	effect_message = "<span class='warning'>Rain falls on you.</span>"

	transition_chances = list(
		WEATHER_OVERCAST = 25,
		WEATHER_RAIN = 50
		)
	observed_message = "It is raining."
	transition_messages = list(
		"The sky is dark, and rain falls down upon you."
	)

/datum/weather/xenoprime/rain/process_effects()
	..()
	for(var/mob/living/L as anything in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.is_outdoors())
				continue // They're indoors, so no need to rain on them.

			// If they have an open umbrella, it'll guard from rain
			var/obj/item/weapon/melee/umbrella/U = L.get_active_hand()
			if(!istype(U) || !U.open)
				U = L.get_inactive_hand()

			if(istype(U) && U.open)
				if(show_message)
					to_chat(L, "<span class='notice'>Rain patters softly onto your umbrella.</span>")
				continue

			L.water_act(1)
			if(show_message)
				to_chat(L, effect_message)

/datum/weather/xenoprime/storm
	name = "storm"
	icon_state = "storm"
	wind_high = 4
	wind_low = 2
	light_modifier = 0.2
	flight_failure_modifier = 10
	effect_message = "<span class='warning'>Rain falls on you, drenching you in water.</span>"

	var/next_lightning_strike = 0 // world.time when lightning will strike.
	var/min_lightning_cooldown = 5 SECONDS
	var/max_lightning_cooldown = 1 MINUTE
	observed_message = "An intense storm pours down over the region."
	transition_messages = list(
		"You feel intense winds hit you as the weather takes a turn for the worst.",
		"Loud thunder is heard in the distance.",
		"A bright flash heralds the approach of a storm."
	)


	transition_chances = list(
		WEATHER_STORM = 50,
		WEATHER_RAIN = 25
		)

/datum/weather/xenoprime/storm/process_effects()
	..()
	for(var/mob/living/L as anything in living_mob_list)
		if(L.z in holder.our_planet.expected_z_levels)
			var/turf/T = get_turf(L)
			if(!T.is_outdoors())
				continue // They're indoors, so no need to rain on them.

			// If they have an open umbrella, it'll guard from rain
			var/obj/item/weapon/melee/umbrella/U = L.get_active_hand()
			if(!istype(U) || !U.open)
				U = L.get_inactive_hand()

			if(istype(U) && U.open)
				if(show_message)
					to_chat(L, "<span class='notice'>Rain showers loudly onto your umbrella!</span>")
				continue


			L.water_act(2)
			if(show_message)
				to_chat(L, effect_message)

	handle_lightning()

// This gets called to do lightning periodically.
// There is a seperate function to do the actual lightning strike, so that badmins can play with it.
/datum/weather/xenoprime/storm/proc/handle_lightning()
	if(world.time < next_lightning_strike)
		return // It's too soon to strike again.
	next_lightning_strike = world.time + rand(min_lightning_cooldown, max_lightning_cooldown)
	var/turf/T = pick(holder.our_planet.planet_floors) // This has the chance to 'strike' the sky, but that might be a good thing, to scare reckless pilots.
	lightning_strike(T)
