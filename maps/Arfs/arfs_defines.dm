#define Z_LEVEL_ARFS_ONE					1
#define Z_LEVEL_ARFS_TWO					2
#define Z_LEVEL_ARFS_THREE					3
#define Z_LEVEL_CENTCOM_ARFS				4
#define Z_LEVEL_EMPTY_ARFS					5
#define Z_LEVEL_ABANDONED_ASTEROID_ARFS		6
#define Z_LEVEL_MINING_DANGER_ARFS			7
#define Z_LEVEL_MINING_ARFS					8
#define Z_LEVEL_RESIDENTIAL_MANSION_ARFS	9
#define Z_LEVEL_RESIDENTIAL_TWO_ARFS		10
#define Z_LEVEL_RESIDENTIAL_ARFS			11
#define Z_LEVEL_RESIDENTIAL_STATION_ARFS	12

#define Z_LEVEL_BOTTOM_DECK				Z_LEVEL_ARFS_ONE
#define Z_LEVEL_TOP_DECK				Z_LEVEL_ARFS_THREE

/datum/map/arfs
	name = "ARFS"
	full_name = "ARFS Dallus"
	path = "arfs"

	zlevel_datum_type = /datum/map_z_level/arfs

	lobby_icon = 'content_arfs/icons/misc/arfs_dallus.dmi'
	lobby_screens = list("arfs_dallus_new_anim")

	station_name  = "ARFS Dallus"
	station_short = "Dallus"
	dock_name     = "ARFS Flapjack"
	boss_name     = "ARF - Command"
	boss_short    = "ARF - Command"
	company_name  = "Alliance of Racial Federations"
	company_short = "ARF"
	starsys_name  = "Canis Majoris - Watermelonus Cluster IV"
	facility_type = "ship"

	shuttle_docked_message = "The scheduled shuttle to the %dock_name% has docked with the ship at docks one and two. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Crew Transfer Shuttle has left the ship. Estimate %ETA% until the shuttle docks at %dock_name%."
	shuttle_called_message = "A crew transfer to %Dock_name% has been scheduled. The shuttle has been called. Those leaving should procede to docks one and two in approximately %ETA%"
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The Emergency Shuttle has docked with the ship at dock one. You have approximately %ETD% to board the Emergency Shuttle."
	emergency_shuttle_leaving_dock = "The Emergency Shuttle has left the ship. Estimate %ETA% until the shuttle docks at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive at docks one and two in approximately %ETA%"
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."

	station_networks = list(
		NETWORK_CARGO,
		NETWORK_CIVILIAN,
		NETWORK_COMMAND,
		NETWORK_ENGINE,
		NETWORK_ENGINEERING,
		NETWORK_ENGINEERING_OUTPOST,
		NETWORK_DEFAULT,
		NETWORK_MEDICAL,
		NETWORK_MINE,
		NETWORK_NORTHERN_STAR,
		NETWORK_RESEARCH,
		NETWORK_RESEARCH_OUTPOST,
		NETWORK_ROBOTS,
		NETWORK_PRISON,
		NETWORK_SECURITY,
		NETWORK_INTERROGATION
	)

	allowed_spawns = list("Arrivals Shuttle","Gateway","Cryogenic Storage","Cyborg Storage","NCS Serenity Residential")
	// station_levels = list(
	// 	Z_LEVEL_ARFS_ONE,
	// 	Z_LEVEL_ARFS_TWO,
	// 	Z_LEVEL_ARFS_THREE
	// )
	// player_levels = list(
	// 	Z_LEVEL_ARFS_ONE,
	// 	Z_LEVEL_ARFS_TWO,
	// 	Z_LEVEL_ARFS_THREE,
	// 	Z_LEVEL_CENTCOM_ARFS,
	// 	Z_LEVEL_MINING_ARFS,
	// 	Z_LEVEL_MINING_DANGER_ARFS,
	// 	Z_LEVEL_RESIDENTIAL_STATION_ARFS,
	// 	Z_LEVEL_RESIDENTIAL_ARFS,
	// 	Z_LEVEL_RESIDENTIAL_TWO_ARFS,
	// 	Z_LEVEL_RESIDENTIAL_MANSION_ARFS
	// )
	// empty_levels = list(Z_LEVEL_EMPTY_ARFS)

	use_overmap = 1
	overmap_size = 35
	overmap_z = Z_LEVEL_CENTCOM_ARFS
	overmap_event_areas = 75

	lateload_z_levels = list(
		list("V3b Asteroid Field"),
		list("Desert Planet - Z1 Beach","Desert Planet - Z2 Cave"),
		list("Remmi Aerostat - Z1 Aerostat","Remmi Aerostat - Z2 Surface"),
		list("Debris Field - Z1 Space"),
		list("Fuel Depot - Z1 Space"),
		list("Offmap Ship - Talon V2")
		)

	lateload_gateway = list(
		list("Carp Farm"),
		list("Snow Field"),
		list("Listening Post"),
		list(list("Honleth Highlands A", "Honleth Highlands B")),
		list("Arynthi Lake Underground A","Arynthi Lake A"),
		list("Arynthi Lake Underground B","Arynthi Lake B"),
		list("Eggnog Town Underground","Eggnog Town"),
		list("Wild West")
		)

	lateload_overmap = list(
		list("Grass Cave")
		)

	planet_datums_to_make = list(/datum/planet/biodome,
								/datum/planet/virgo3b,
								/datum/planet/virgo4)

/datum/map/arfs/perform_map_generation()
	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_MINING_ARFS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_MINING_ARFS, world.maxx, world.maxy)         // Create the mining ore distribution map.

	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_ABANDONED_ASTEROID_ARFS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_ABANDONED_ASTEROID_ARFS, world.maxx, world.maxy)         // Create the mining ore distribution map.

	seed_submaps(list(Z_LEVEL_MINING_DANGER_ARFS), 300, /area/mine/unexplored, /datum/map_template/underdark)
	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_MINING_DANGER_ARFS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_MINING_DANGER_ARFS, world.maxx, world.maxy)         // Create the mining ore distribution map.

	new /datum/random_map/automata/cave_system/no_cracks(null, 1, 1, Z_LEVEL_SPACE_ROCKS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_SPACE_ROCKS, 64, 64)         // Create the mining ore distribution map.


	return 1

// /datum/map/arfs/get_map_levels(var/srcz, var/long_range = TRUE, var/om_range = DEFAULT_OVERMAP_RANGE)
// 	if (long_range && (srcz in map_levels))
// 		return map_levels
// 	else if (srcz >= Z_LEVEL_MINING_ARFS && srcz <= Z_LEVEL_MINING_DANGER_ARFS)
// 		return list(
// 			Z_LEVEL_MINING_ARFS,
// 			Z_LEVEL_MINING_DANGER_ARFS)
// 	else if (srcz >= Z_LEVEL_BOTTOM_DECK && srcz <= Z_LEVEL_TOP_DECK)
// 		return list(
// 			Z_LEVEL_ARFS_ONE,
// 			Z_LEVEL_ARFS_TWO,
// 			Z_LEVEL_ARFS_THREE)
// 	else if (srcz >= Z_LEVEL_RESIDENTIAL_STATION_ARFS && srcz <= Z_LEVEL_RESIDENTIAL_MANSION_ARFS)
// 		return list(
// 			Z_LEVEL_RESIDENTIAL_STATION_ARFS,
// 			Z_LEVEL_RESIDENTIAL_ARFS,
// 			Z_LEVEL_RESIDENTIAL_TWO_ARFS,
// 			Z_LEVEL_RESIDENTIAL_MANSION_ARFS,)
// 	else
// 		return ..()

/datum/map/arfs/get_map_levels(var/srcz, var/long_range = FALSE, var/om_range = -1)
	//Get what sector we're in
	var/obj/effect/overmap/visitable/O = get_overmap_sector(srcz)
	if(istype(O) && O.type != /obj/effect/overmap/visitable/ship/arfs)
		//Just the sector we're in
		if(om_range == -1)
			return O.map_z.Copy()

		//Otherwise every sector we're on top of
		var/list/connections = list()
		var/turf/T = get_turf(O)
		var/turfrange = long_range ? max(0, om_range) : om_range
		for(var/obj/effect/overmap/visitable/V in range(turfrange, T))
			connections += V.map_z // Adding list to list adds contents
		return connections

	//Traditional behavior, if not in an overmap sector
	else
		//If long range, and they're at least in contact levels, return contact levels.
		if (long_range && (srcz in contact_levels))
			return contact_levels.Copy()
		//If in station levels, return station levels
		else if (srcz in station_levels)
			return station_levels.Copy()
		//Anything in multiz then (or just themselves)
		else
			return GetConnectedZlevels(srcz)

/datum/map_z_level/arfs/ship
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/ship/one
	z = Z_LEVEL_ARFS_ONE
	name = "ARFS Deck 1"
	base_turf = /turf/space
	transit_chance = 20

/datum/map_z_level/arfs/ship/two
	z = Z_LEVEL_ARFS_TWO
	name = "ARFS Deck 2"
	base_turf = /turf/simulated/open
	transit_chance = 20

/datum/map_z_level/arfs/ship/three
	z= Z_LEVEL_ARFS_THREE
	name = "ARFS Deck 3"
	base_turf = /turf/simulated/open
	transit_chance = 20

/datum/map_z_level/arfs/centcom
	z = Z_LEVEL_CENTCOM_ARFS
	name = "Centcom"
	flags = MAP_LEVEL_ADMIN|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/empty
	z = Z_LEVEL_EMPTY_ARFS
	name = "Empty Space"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	transit_chance = 50

/datum/map_z_level/arfs/abandoned
	z = Z_LEVEL_ABANDONED_ASTEROID_ARFS
	name = "Empty Space"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	transit_chance = 10

/datum/map_z_level/arfs/mine
	name = "Asteroid"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/mineral/floor

/datum/map_z_level/arfs/mine/top
	z = Z_LEVEL_MINING_ARFS
	name = "Asteroid Topside"
	transit_chance = 30
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/mine/bottom
	z = Z_LEVEL_MINING_DANGER_ARFS
	name = "Asteroid Underdark"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential
	z = Z_LEVEL_RESIDENTIAL_ARFS
	name = "ARFS Residential level two"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential_station
	z = Z_LEVEL_RESIDENTIAL_STATION_ARFS
	name = "ARFS Residential Station"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential_arf_two
	z = Z_LEVEL_RESIDENTIAL_TWO_ARFS
	name = "ARFS Residential level three"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential_arf_mansion
	z = Z_LEVEL_RESIDENTIAL_MANSION_ARFS
	name = "ARFS Residential level four"
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/planet/biodome
	expected_z_levels = list(
		Z_LEVEL_RESIDENTIAL_STATION_ARFS,
		Z_LEVEL_RESIDENTIAL_MANSION_ARFS
	)

/obj/effect/overmap/visitable/ship/arfs
	name = "ARFS Dallus"	// Name of the location on the overmap.
	desc = "A three-deck research and civilian vessel controlled by the Alliance of Racial Federations."

	scanner_desc = @{"[i]Registration[/i]: ARFS Dallus
[i]Class[/i]: Research Frigate, Dallus Class
[i]Transponder[/i]: Transmitting (CIV), ARF IFF
[b]Notice[/b]: ARF Vessel, authorized personnel only"}

	icon_state = "ship"
	vessel_mass = 100000
	burn_delay = 2 SECONDS
	fore_dir = NORTH	// Which direction the ship/z-level is facing.  It will move dust particles from that direction when moving.
	base = TRUE		// Honestly unsure what this does but it seems the main sector or "Map" we're at has this so here it stays
	// The waypoints that are avaliable once you are at this Navpoint
	initial_generic_waypoints = list(
		"arfs_excursion_hangar",
		"arfs_dock_south", 				//Deck 3, Port Arm, South Dock
		"arfs_dock_north", 				//Deck 3, Port Arm, North Dock
		"arfs_dock_west",   			//Deck 3, Port Arm, West Dock
		"arfs_dock_south_starboard", 	//Deck 3, Port Arm, South Dock
		"arfs_dock_north_starboard",	//Deck 3, Port Arm, North Dock
		"arfs_space_nw", 				//Deck 3, NW space
		"arfs_space_ne", 				//Deck 3, NE space
		"arfs_space_sw", 				//Deck 3, SW space
		"arfs_space_se"  				//Deck 3, SE space
		)

	initial_restricted_waypoints = list(
		"Excursion Shuttle" = list("arfs_excursion_hangar"),
		)

	known = TRUE;
	unowned_areas = list(/area/shuttle/excursion)

