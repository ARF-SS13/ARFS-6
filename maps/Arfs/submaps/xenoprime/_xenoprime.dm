// -- Datums -- //

/obj/effect/overmap/visitable/sector/xenoprime
	name = "G-435 'Xenomorph Prime'"
	desc = "Homeworld of the alien species xenomorph XX121."
	scanner_desc = @{"[i]Stellar Body[/i]: G-435
[i]Class[/i]: M-Class Planet
[i]Habitability[/i]: Low (Dangerous Fauna, High Temperature, High CO2 Content, Low Biodiversity, Low Mineral Count)
[b]Notice[/b]: Exercise extreme caution when attempting to land or leave G-435. As per SG-16987416-S1.3, procuring live xenomorph XX121 specimen may only be performed by LEVEL-4 or higher scientific expedition crews with combat personnel present. Outbreaks will be met with lethal force."}
	in_space = 0
	initial_generic_waypoints = list("beach_e", "beach_c", "beach_nw")
	extra_z_levels = list(Z_LEVEL_BEACH_CAVE)
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
	deep_val = 0.75 //normal is 0.7 and 0.8
	rare_val = 0.9

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
	name = "away mission initializer - beachcave"

//In our case, it initializes the ores and random submaps in the beach's cave, then deletes itself
/obj/away_mission_init/xenoprime/Initialize()
	// Cave submaps are first.
	/*seed_submaps(list(z), 50, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	seed_submaps(list(z), 50, /area/tether_away/cave/unexplored/deep, /datum/map_template/surface/mountains/deep)

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_BEACH_CAVE, world.maxx, world.maxy)
	new /datum/random_map/noise/ore/beachmine(null, 1, 1, Z_LEVEL_BEACH_CAVE, 64, 64)*/

	initialized = TRUE
	return INITIALIZE_HINT_QDEL

// -- Turfs -- //

//Atmosphere properties
#define XENOPRIME_ONE_ATMOSPHERE	121.6 //kPa
#define XENOPRIME_AVG_TEMP			313.15 //kelvin

#define XENOPRIME_PER_N2		0.83 //percent
#define XENOPRIME_PER_O2		0.15
#define XENOPRIME_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define XENOPRIME_PER_CO2		2
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
#define XENOPRIME_TURF_CREATE(x)	x/xenoprime/nitrogen=XENOPRIME_MOL_N2;x/xenoprime/oxygen=XENOPRIME_MOL_O2;x/xenoprime/carbon_dioxide=XENOPRIME_MOL_CO2;x/xenoprime/phoron=XENOPRIME_MOL_PHORON;x/xenoprime/temperature=XENOPRIME_AVG_TEMP;x/xenoprime/color="#eacd7c"

/turf/simulated/shuttle/wall/voidcraft/green/xenoprime
	XENOPRIME_SET_ATMOS
	color = "#eacd7c"

/turf/simulated/shuttle/wall/voidcraft/green/xenoprime/nocol
	color = null

XENOPRIME_TURF_CREATE(/turf/unsimulated/wall/planetary)

XENOPRIME_TURF_CREATE(/turf/simulated/wall)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/plating)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/bluegrid)
XENOPRIME_TURF_CREATE(/turf/simulated/floor/tiled/techfloor)

XENOPRIME_TURF_CREATE(/turf/simulated/mineral)

// -- Areas -- //

/area/tether_away/xenoprime
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "away"
	base_turf = /turf/simulated/floor/outdoors/newdirt_nograss //This is what the ground turns into if destroyed/bombed/etc
	dynamic_lighting = 1
	requires_power = 1

/area/tether_away/xenoprime/water
	name = "\improper Away Mission - Xenomorph Prime Water"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/outdoors/mud

/area/tether_away/xenoprime/explored
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "explored"
	flags = RAD_SHIELDED

/area/tether_away/xenoprime/unexplored
	name = "\improper Away Mission - Xenomorph Prime G-435"
	icon_state = "unexplored"
	flags = RAD_SHIELDED
