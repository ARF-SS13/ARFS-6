#define Z_LEVEL_ARFS_ONE					1
#define Z_LEVEL_ARFS_TWO					2
#define Z_LEVEL_ARFS_THREE					3
#define Z_LEVEL_CENTCOM_ARFS				4
#define Z_LEVEL_EMPTY_ARFS					5
#define Z_LEVEL_ABANDONED_ASTEROID_ARFS		6
#define Z_LEVEL_MINING_ARFS					7
#define Z_LEVEL_MINING_DANGER_ARFS			8
#define Z_LEVEL_RESIDENTIAL_STATION_ARFS	9
#define Z_LEVEL_RESIDENTIAL_ARFS			10
#define Z_LEVEL_RESIDENTIAL_TWO_ARFS		11
#define Z_LEVEL_RESIDENTIAL_MANSION_ARFS	12

#define Z_LEVEL_BOTTOM_DECK				Z_LEVEL_ARFS_ONE
#define Z_LEVEL_TOP_DECK				Z_LEVEL_ARFS_THREE

/datum/map/arfs
	name = "ARFS"
	full_name = "ARFS Dallus"
	path = "arfs"

	zlevel_datum_type = /datum/map_z_level/arfs

	lobby_icon = 'content_arfs/icons/misc/arfs_dallus.dmi'
	lobby_screens = list("arfs_dallus")

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
	planet_datums_to_make = list(/datum/planet/biodome)
	map_levels = list(
		Z_LEVEL_ARFS_ONE,
		Z_LEVEL_ARFS_TWO,
		Z_LEVEL_ARFS_THREE,
		Z_LEVEL_CENTCOM_ARFS,
		Z_LEVEL_MINING_ARFS,
		Z_LEVEL_MINING_DANGER_ARFS,
		Z_LEVEL_RESIDENTIAL_STATION_ARFS,
		Z_LEVEL_RESIDENTIAL_ARFS,
		Z_LEVEL_RESIDENTIAL_TWO_ARFS,
		Z_LEVEL_RESIDENTIAL_MANSION_ARFS)

	use_overmap = 1
	overmap_size = 35
	overmap_z = Z_LEVEL_CENTCOM_ARFS;

/datum/map/arfs/perform_map_generation()
	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_MINING_ARFS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_MINING_ARFS, world.maxx, world.maxy)         // Create the mining ore distribution map.

	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_ABANDONED_ASTEROID_ARFS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_ABANDONED_ASTEROID_ARFS, world.maxx, world.maxy)         // Create the mining ore distribution map.

	seed_submaps(list(Z_LEVEL_MINING_DANGER_ARFS), 300, /area/mine/unexplored, /datum/map_template/underdark)
	new /datum/random_map/automata/cave_system(null, 1, 1, Z_LEVEL_MINING_DANGER_ARFS, world.maxx, world.maxy) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, Z_LEVEL_MINING_DANGER_ARFS, world.maxx, world.maxy)         // Create the mining ore distribution map.

	return 1

/datum/map/arfs/get_map_levels(var/srcz, var/long_range = TRUE, var/om_range = DEFAULT_OVERMAP_RANGE)
	if (long_range && (srcz in map_levels))
		return map_levels
	else if (srcz >= Z_LEVEL_MINING_ARFS && srcz <= Z_LEVEL_MINING_DANGER_ARFS)
		return list(
			Z_LEVEL_MINING_ARFS,
			Z_LEVEL_MINING_DANGER_ARFS)
	else if (srcz >= Z_LEVEL_BOTTOM_DECK && srcz <= Z_LEVEL_TOP_DECK)
		return list(
			Z_LEVEL_ARFS_ONE,
			Z_LEVEL_ARFS_TWO,
			Z_LEVEL_ARFS_THREE)
	else if (srcz >= Z_LEVEL_RESIDENTIAL_STATION_ARFS && srcz <= Z_LEVEL_RESIDENTIAL_MANSION_ARFS)
		return list(
			Z_LEVEL_RESIDENTIAL_STATION_ARFS,
			Z_LEVEL_RESIDENTIAL_ARFS,
			Z_LEVEL_RESIDENTIAL_TWO_ARFS,
			Z_LEVEL_RESIDENTIAL_MANSION_ARFS,)
	else
		return ..()

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
	flags = MAP_LEVEL_STATION|MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN
	base_turf = /turf/simulated/mineral/floor

/datum/map_z_level/arfs/mine/top
	z = Z_LEVEL_MINING_ARFS
	name = "Asteroid Topside"
	transit_chance = 30
	flags = MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/mine/bottom
	z = Z_LEVEL_MINING_DANGER_ARFS
	name = "Asteroid Underdark"
	flags = MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential
	z = Z_LEVEL_RESIDENTIAL_ARFS
	name = "ARFS Residential level two"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential_station
	z = Z_LEVEL_RESIDENTIAL_STATION_ARFS
	name = "ARFS Residential Station"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential_arf_two
	z = Z_LEVEL_RESIDENTIAL_TWO_ARFS
	name = "ARFS Residential level three"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/map_z_level/arfs/residential_arf_mansion
	z = Z_LEVEL_RESIDENTIAL_MANSION_ARFS
	name = "ARFS Residential level four"
	flags = MAP_LEVEL_CONTACT|MAP_LEVEL_PLAYER|MAP_LEVEL_VORESPAWN

/datum/planet/biodome
	expected_z_levels = list(
		Z_LEVEL_RESIDENTIAL_STATION_ARFS,
		Z_LEVEL_RESIDENTIAL_MANSION_ARFS
	)

/obj/effect/overmap/visitable/ship/arfs
	name = "ARFS Dallus"	// Name of the location on the overmap.
	desc = "Placeholder desc"

	scanner_desc = @{"[i]Registration[/i]: ARFS Dallus
[i]Class[/i]: Placeholder
[i]Transponder[/i]: Transmitting (CIV), NanoTrasen IFF
[b]Notice[/b]: NanoTrasen Vessel, authorized personnel only"}

	icon_state = "ship"
	vessel_mass = 100000
	burn_delay = 2 SECONDS
	fore_dir = NORTH	// Which direction the ship/z-level is facing.  It will move dust particles from that direction when moving.
	base = TRUE		// Honestly unsure what this does but it seems the main sector or "Map" we're at has this so here it stays
	// The waypoints that are avaliable once you are at this Navpoint
	initial_generic_waypoints = list("arfs_excursion_hangar")

	initial_restricted_waypoints = list(
		"Excursion Shuttle" = list("arfs_excursion_hangar"),
		)

	known = TRUE;

	unowned_areas = list(/area/shuttle/excursion)
