#define BIODOME_ONE_ATMOSPHERE 101.325
#define BIODOME_AVG_TEMP       293.15

#define BIODOME_PER_N2         0.79
#define BIODOME_PER_O2         0.21
#define BIODOME_PER_N2O        0.00
#define BIODOME_PER_CO2        0.00
#define BIODOME_PER_PHORON     0.00

#define BIODOME_MOL_PER_TURF   (BIODOME_ONE_ATMOSPHERE*CELL_VOLUME/(BIODOME_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define BIODOME_MOL_N2         (BIODOME_MOL_PER_TURF*BIODOME_PER_N2)
#define BIODOME_MOL_O2         (BIODOME_MOL_PER_TURF*BIODOME_PER_O2)
#define BIODOME_MOL_N2O        (BIODOME_MOL_PER_TURF*BIODOME_PER_N2O)
#define BIODOME_MOL_CO2        (BIODOME_MOL_PER_TURF*BIODOME_PER_CO2)
#define BIODOME_MOL_PHORON     (BIODOME_MOL_PER_TURF*BIODOME_PER_PHORON)

#define BIODOME_SET_ATMOS	        nitrogen=BIODOME_MOL_N2;oxygen=BIODOME_MOL_O2;carbon_dioxide=BIODOME_MOL_CO2;phoron=BIODOME_MOL_PHORON;temperature=BIODOME_AVG_TEMP
#define BIODOME_TURF_CREATE(x)	    x/biodome/nitrogen=BIODOME_MOL_N2;x/biodome/oxygen=BIODOME_MOL_O2;x/biodome/carbon_dioxide=BIODOME_MOL_CO2;x/biodome/phoron=BIODOME_MOL_PHORON;x/biodome/temperature=BIODOME_AVG_TEMP;x/biodome/outdoors=TRUE;x/biodome/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define BIODOME_TURF_CREATE_UN(x)	x/biodome/nitrogen=BIODOME_MOL_N2;x/biodome/oxygen=BIODOME_MOL_O2;x/biodome/carbon_dioxide=BIODOME_MOL_CO2;x/biodome/phoron=BIODOME_MOL_PHORON;x/biodome/temperature=BIODOME_AVG_TEMP

var/datum/planet/biodome/biodome = null

/datum/time/biodome
	seconds_in_day = 24 HOURS

/datum/planet/biodome
	name = "ARFS Biodome"
	desc = "A biological dome in space, complete with simulated weather and lighting to make it feel more homely."
	current_time = new /datum/time/biodome()
	planetary_wall_type = /turf/unsimulated/wall/planetary/biodome

/datum/planet/biodome/New()
	..()
	biodome = src
	weather_holder = new /datum/weather_holder/biodome(src)

/datum/planet/biodome/update_sun()
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


/datum/weather_holder/biodome
	temperature = T0C
	allowed_weather_types = list(
		WEATHER_CLEAR		= new /datum/weather/biodome/clear(),
		WEATHER_OVERCAST	= new /datum/weather/biodome/overcast(),
		WEATHER_LIGHT_SNOW	= new /datum/weather/biodome/light_snow(),
		WEATHER_SNOW		= new /datum/weather/biodome/snow(),
		WEATHER_RAIN		= new /datum/weather/biodome/rain()
		)
	roundstart_weather_chances = list(
		WEATHER_CLEAR		= 70,
		WEATHER_OVERCAST	= 10,
		WEATHER_RAIN		= 10,
        WEATHER_LIGHT_SNOW  = 10
		)

/datum/weather/biodome
	name = "biodome"
	temp_high = 303.15 // 30c
	temp_low = 298.15  // 25c

/datum/weather/biodome/clear
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

/datum/weather/biodome/overcast
	name = "overcast"
	temp_high = 293.15 // 20c
	temp_low = 	288.15 // 15c
	light_modifier = 0.8
	transition_chances = list(
		WEATHER_CLEAR = 20,
		WEATHER_OVERCAST = 50,
		WEATHER_RAIN = 15,
        WEATHER_LIGHT_SNOW = 15
		)
	observed_message = "It is overcast, all you can see are clouds."
	transition_messages = list(
		"All you can see above are clouds.",
		"Clouds cut off your view of the sky.",
		"It's very cloudy."
		)

/datum/weather/biodome/light_snow
	name = "light snow"
	icon_state = "snowfall_light"
	temp_high = 268.15 // -5c
	temp_low = 	263.15 // -10c
	light_modifier = 0.7
	transition_chances = list(
        WEATHER_SNOW = 25,
		WEATHER_LIGHT_SNOW = 50,
        WEATHER_OVERCAST = 20,
        WEATHER_RAIN = 5
		)
	observed_message = "It is snowing lightly."
	transition_messages = list(
		"Small snowflakes begin to fall from above.",
		"It begins to snow lightly.",
		)

/datum/weather/biodome/snow
	name = "moderate snow"
	icon_state = "snowfall_med"
	temp_high = 268.15 // -5c
	temp_low = 	263.15 // -10c
	wind_high = 2
	wind_low = 0
	light_modifier = 0.5
	flight_failure_modifier = 5
	transition_chances = list(
        WEATHER_SNOW = 20,
		WEATHER_LIGHT_SNOW = 80
		)
	observed_message = "It is snowing."
	transition_messages = list(
		"It's starting to snow.",
		"The air feels much colder as snowflakes fall from above."
	)
	outdoor_sounds_type = /datum/looping_sound/weather/outside_snow
	indoor_sounds_type = /datum/looping_sound/weather/inside_snow

/datum/weather/biodome/rain
	name = "rain"
	icon_state = "rain"
	temp_high = 288.15 // 15c
	temp_low = 	283.15 // 10c
	wind_high = 2
	wind_low = 1
	light_modifier = 0.5
	effect_message = "<span class='warning'>Rain falls on you.</span>"

	transition_chances = list(
		WEATHER_OVERCAST = 50,
		WEATHER_RAIN = 50
		)
	observed_message = "It is raining."
	transition_messages = list(
		"The sky is dark, and rain falls down upon you."
	)

/datum/weather/biodome/rain/process_effects()
	..()
	for(var/mob/living/L in living_mob_list)
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



/turf/unsimulated/wall/planetary/biodome
	name = "wall"
	alpha = 0xFF
	BIODOME_SET_ATMOS

/obj/machinery/power/smes/buildable/offmap_spawn/empty/New()
	..(1)
	charge = 0
	RCon = TRUE
	input_level = input_level_max
	output_level = output_level_max
	input_attempt = TRUE