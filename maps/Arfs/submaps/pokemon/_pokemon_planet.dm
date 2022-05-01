// -- Datums -- //

/obj/effect/overmap/visitable/sector/pokemon_planet
	name = "Great Safari"
	desc = "The homeworld to most species of Pokemon. Features mostly moderate climates and a wide variety of pokemon species."
	scanner_desc = @{"[i]Stellar Body[/i]: Great Safari
[i]Class[/i]: M-Class Planet
[i]Habitability[/i]: High
[b]Notice[/b]: Request authorization from planetary authorities before attempting to construct settlements"}
	icon_state = "globe"
	in_space = 0
	initial_generic_waypoints = list("pokemon_e", "pokemon_c", "pokemon_nw")
	extra_z_levels = list(Z_LEVEL_pokemon_CAVE)
	known = TRUE
	icon_state = "desert"

	skybox_icon = 'icons/skybox/virgo4.dmi'
	skybox_icon_state = "v4"
	skybox_pixel_x = 0
	skybox_pixel_y = 0

//This is a special subtype of the thing that generates ores on a map
//It will generate more rich ores because of the lower numbers than the normal one
/datum/random_map/noise/ore/pokemon_planet
	descriptor = "pokemon planet ore distribution map"
	deep_val = 0.6 //More riches, normal is 0.7 and 0.8
	rare_val = 0.5

//The check_map_sanity proc is sometimes unsatisfied with how AMAZING our ores are
/datum/random_map/noise/ore/pokemon_planet/check_map_sanity()
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
	if(surface_count < 100)
		admin_notice("<span class='danger'>Insufficient surface minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else if(rare_count < 50)
		admin_notice("<span class='danger'>Insufficient rare minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else if(deep_count < 50)
		admin_notice("<span class='danger'>Insufficient deep minerals. Rerolling...</span>", R_DEBUG)
		return 0
	else
		return 1

// -- Objs -- //

//This object simply performs any map setup that needs to happen on our map if it loads.
//As with the above, you do need to place this object on the map somewhere.
/obj/away_mission_init/pokemon_planet
	name = "away mission initializer - pokemon_planet"

//In our case, it initializes the ores and random submaps in the beach's cave, then deletes itself
/obj/away_mission_init/pokemon_planet/Initialize()
	// Cave submaps are first.
	/*seed_submaps(list(z), 50, /area/tether_away/cave/unexplored/normal, /datum/map_template/surface/mountains/normal)
	seed_submaps(list(z), 50, /area/tether_away/cave/unexplored/deep, /datum/map_template/surface/mountains/deep)

	// Now for the tunnels.
	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_pokemon_CAVE, world.maxx, world.maxy)
	new /datum/random_map/noise/ore/pokemon_planet(null, 1, 1, Z_LEVEL_pokemon_CAVE, 64, 64)*/

	initialized = TRUE
	return INITIALIZE_HINT_QDEL

// Two mob spawners that are placed on the map that spawn some mobs!
// They keep track of their mob, and when it's dead, spawn another (only if nobody is looking)
// Note that if your map has step teleports, mobs may wander through them accidentally and not know how to get back
/obj/arfs_away_spawner/pokemon_outside
	name = "Beach Outside Spawner" //Just a name
	faction = "pokemon_out" //Sets all the mobs to this faction so they don't infight
	atmos_comp = TRUE //Sets up their atmos tolerances to work in this setting, even if they don't normally (20% up/down tolerance for each gas, and heat)
	prob_spawn = 100 //Chance of this spawner spawning a mob (once this is missed, the spawner is 'depleted' and won't spawn anymore)
	prob_fall = 25 //Chance goes down by this much each time it spawns one (not defining and prob_spawn 100 means they spawn as soon as one dies)
	//guard = 40 //They'll stay within this range (not defining this disables them staying nearby and they will wander the map (and through step teleports))
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/fennec = 300,
		/mob/living/simple_mob/animal/passive/snake/python = 100,
		/mob/living/simple_mob/vore/alienanimals/teppi = 10,
		/mob/living/simple_mob/vore/alienanimals/teppi/baby = 1
	)

/obj/arfs_away_spawner/pokemon_outside_friendly
	name = "Pokemon Spawner - All"
	faction = "neutral"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 25
	guard = 30
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/fennec
	)

/obj/arfs_away_spawner/pokemon_cave
	name = "Beach Cave Spawner"
	faction = "pokemon_cave"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 40
	//guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/frog = 6, //Frogs are 3x more likely to spawn than,
		/mob/living/simple_mob/vore/aggressive/deathclaw = 2, //these deathclaws are, with these values,
		/mob/living/simple_mob/animal/giant_spider = 4,
		/mob/living/simple_mob/vore/aggressive/giant_snake = 2,
		/mob/living/simple_mob/animal/giant_spider/webslinger = 2,
		/mob/living/simple_mob/vore/oregrub = 1
	)

// These are step-teleporters, for map edge transitions
// This top one goes INTO the cave
/obj/effect/step_trigger/teleporter/away_pokemon_tocave/New()
	..()
	teleport_x = src.x //X is horizontal. This is a top of map transition, so you want the same horizontal alignment in the cave as you have on the beach
	teleport_y = 2 //2 is because it's putting you on row 2 of the map to the north
	teleport_z = z+1 //The cave is always our Z-level plus 1, because it's loaded after us

//This one goes OUT OF the cave
/obj/effect/step_trigger/teleporter/away_pokemon_tobeach/New()
	..()
	teleport_x = src.x //Same reason as bove
	teleport_y = world.maxy - 1 //This means "1 space from the top of the map"
	teleport_z = z-1 //Opposite of 'tocave', beach is always loaded as the map before us

// -- Turfs -- //

//These are just some special turfs for the beach water
/turf/simulated/floor/pokemon_planet/coastwater
	name = "Water"
	icon_state = "water"

/turf/simulated/floor/pokemon_planet/coastwater/New()
	..()
	add_overlay(image("icon"='icons/misc/beach.dmi',"icon_state"="water","layer"=MOB_LAYER+0.1))

// -- Areas -- //

/area/tether_away/beach
	name = "\improper Away Mission - Virgo 4 Beach"
	icon_state = "away"
	base_turf = /turf/simulated/floor/pokemon_planet/sand/outdoors //This is what the ground turns into if destroyed/bombed/etc
	dynamic_lighting = 1
	requires_power = 1

/area/tether_awaypokemon_planetpowershed
	name = "\improper Away Mission - Virgo 4 Coast PS"
	icon_state = "blue2"
	base_turf = /turf/simulated/floor/pokemon_planet/sand/outdoors

/area/tether_awaypokemon_planetcoast
	name = "\improper Away Mission - Virgo 4 Coast"
	icon_state = "blue2"
	base_turf = /turf/simulated/floor/pokemon_planet/coastline

/area/tether_awaypokemon_planetwater
	name = "\improper Away Mission - Virgo 4 Water"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/pokemon_planet/coastwater

/area/tether_awaypokemon_planetjungle
	name = "\improper Away Mission - Virgo 4 Desert"
	icon_state = "green"
	base_turf = /turf/simulated/floor/pokemon_planet/sand/desert/outdoors

/area/tether_awaypokemon_planetresort
	icon = 'icons/turf/areas_vr.dmi'
	icon_state = "yellow"
	base_turf = /turf/simulated/floor/pokemon_planet/sand/outdoors

/area/tether_awaypokemon_planetresort/kitchen
	name = "\improper Away Mission - Virgo 4 Kitchen"
	icon_state = "grewhicir"

/area/tether_awaypokemon_planetresort/lockermed
	name = "\improper Away Mission - Virgo 4 Utility Pavilion"
	icon_state = "cyawhicir"

/area/tether_awaypokemon_planetresort/janibar
	name = "\improper Away Mission - Virgo 4 Bar"
	icon_state = "purwhicir"

/area/tether_awaypokemon_planetresort/dorm1
	name = "\improper Away Mission - Virgo 4 Private Room 1"
	icon_state = "bluwhicir"
	flags = RAD_SHIELDED
/area/tether_awaypokemon_planetresort/dorm2
	name = "\improper Away Mission - Virgo 4 Private Room 2"
	icon_state = "bluwhicir"
	flags = RAD_SHIELDED
/area/tether_awaypokemon_planetresort/dorm3
	name = "\improper Away Mission - Virgo 4 Private Room 3"
	icon_state = "bluwhicir"
	flags = RAD_SHIELDED
/area/tether_awaypokemon_planetresort/dorm4
	name = "\improper Away Mission - Virgo 4 Private Room 4"
	icon_state = "bluwhicir"
	flags = RAD_SHIELDED

/area/tether_awaypokemon_planetcavebase
	name = "\improper Away Mission - Virgo 4 Mysterious Cave"
	icon = 'icons/turf/areas_vr.dmi'
	icon_state = "orawhicir"
	flags = RAD_SHIELDED

//Some areas for the cave, which are referenced by our init object to seed submaps and ores
/area/tether_away/cave
	flags = RAD_SHIELDED
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg')
	base_turf = /turf/simulated/mineral/floor/ignore_mapgen/cave

/area/tether_away/cave/explored/normal
	name = "\improper Away Mission - Virgo 4 Cave (E)"
	icon_state = "explored"

/area/tether_away/cave/unexplored/normal
	name = "\improper Away Mission - Virgo 4 Cave (UE)"
	icon_state = "unexplored"

/area/tether_away/cave/explored/deep
	name = "\improper Away Mission - Virgo 4 Cave Deep (E)"
	icon_state = "explored_deep"

/area/tether_away/cave/unexplored/deep
	name = "\improper Away Mission - Virgo 4 Cave Deep (UE)"
	icon_state = "unexplored_deep"
