//////////////////////////////////////////////////////////////
// Explore shuttle

// The 'shuttle' of the excursion shuttle
/datum/shuttle/autodock/overmap/excursion
	name = "Excursion Shuttle"
	warmup_time = 0
	current_location = "arfs_excursion_hangar"
	docking_controller_tag = "expshuttle_dock"
	shuttle_area = list(/area/shuttle/excursion/cockpit, /area/shuttle/excursion/general, /area/shuttle/excursion/cargo, /area/shuttle/excursion/power, /area/shuttle/excursion/medical)
	fuel_consumption = 3
	move_direction = NORTH
	move_time = 20

// The 'ship' of the excursion shuttle
/obj/effect/overmap/visitable/ship/landable/excursion
	name = "Excursion Shuttle"
	desc = "The traditional Excursion Shuttle. ARF Approved!"
	vessel_mass = 8000
	vessel_size = SHIP_SIZE_SMALL
	shuttle = "Excursion Shuttle"
	fore_dir = NORTH
	known = TRUE

/obj/machinery/computer/shuttle_control/explore/excursion
	name = "short jump console"
	shuttle_tag = "Excursion Shuttle"
	req_one_access = list(access_pilot)

// Exclusive landmark for docking *inside* the station
/obj/effect/shuttle_landmark/arfs/deck3/excursion
	name = "A.R.F.S. Dallus - Excursion Hanger"
	landmark_tag = "arfs_excursion_hangar"
	docking_controller = "expshuttle_dock"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/exploration/hanger

/obj/effect/shuttle_landmark/arfs/deck3/dockarm
	base_turf = /turf/space
	base_area = /area/space

/obj/effect/shuttle_landmark/arfs/deck3/dockarm/north
	name = "ARFS Dallus - Docking Arm North"
	landmark_tag = "arfs_dock_north"
	docking_controller = "dallus_port_arm_n"

/obj/effect/shuttle_landmark/arfs/deck3/dockarm/south
	name = "ARFS Dallus - Docking Arm South"
	landmark_tag = "arfs_dock_south"
	docking_controller = "dallus_port_arm_s"

/obj/effect/shuttle_landmark/arfs/deck3/dockarm/west
	name = "ARFS Dallus - Docking Arm West"
	landmark_tag = "arfs_dock_west"
	docking_controller = "dallus_port_arm_w"

/obj/effect/shuttle_landmark/arfs/deck3/dockarm/north/starboard
	name = "ARFS Dallus - Docking Arm North - Starboard"
	landmark_tag = "arfs_dock_north_starboard"
	docking_controller = "dallus_port_arm_n_s"

/obj/effect/shuttle_landmark/arfs/deck3/dockarm/south/starboard
	name = "ARFS Dallus - Docking Arm South - Starboard"
	landmark_tag = "arfs_dock_south_starboard"
	docking_controller = "dallus_port_arm_s_s"

/obj/effect/shuttle_landmark/arfs/deck3/space
	base_turf = /turf/space
	base_area = /area/space

/obj/effect/shuttle_landmark/arfs/deck3/space/sw
	name = "South West of ARFS Dallus"
	landmark_tag = "dallus_space_sw"

/obj/effect/shuttle_landmark/arfs/deck3/space/ne
	name = "North East of ARFS Dallus"
	landmark_tag = "dallus_space_ne"

/obj/effect/shuttle_landmark/arfs/deck3/space/se
	name = "South East of ARFS Dallus"
	landmark_tag = "dallus_space_se"

/obj/effect/shuttle_landmark/arfs/deck3/space/nw
	name = "North West of ARFS Dallus"
	landmark_tag = "dallus_space_nw"

//////////////////////////////////////////////////////////////
// Andy's shuttle
/obj/effect/overmap/visitable/ship/landable/drake
	name = "A.R.F.S. Drake"
	scanner_desc = @{"[i]Registration[/i]: A.R.F.S. Drake
[i]Class[/i]: Corvette
[i]Transponder[/i]: Transmitting (CIV), non-hostile
[b]Notice[/b]: Multirole independent vessel, owned by A.R.F.S. Joint Chief Dameon Owen"}
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_LARGE
	fore_dir = EAST
	known = TRUE
	shuttle = "Drake"

/obj/effect/shuttle_landmark/arfs/serenity/drake
	name = "Mansion Hanger"
	landmark_tag = "arfs_mansion_hanger"
	docking_controller = "mansionshuttle_dock"
	base_turf = /turf/simulated/floor/reinforced
	base_area = /area/residential/mansion

/datum/shuttle/autodock/overmap/drake
	name = "Drake"
	current_location = "arfs_mansion_hanger"
	docking_controller_tag = "mansionshuttle_dock"
	shuttle_area = list(
		/area/shuttle/drake/cabin,
		/area/shuttle/drake/engineering,
		/area/shuttle/drake/cockpit,
		/area/shuttle/drake/quarters1,
		/area/shuttle/drake/quarters2,
		/area/shuttle/drake/galley,
		/area/shuttle/drake/storage,
		/area/shuttle/drake/head,
		/area/shuttle/drake/medbay,
		/area/shuttle/drake/office,
		/area/shuttle/drake/dorm,
		/area/shuttle/drake/port_hold,
		/area/shuttle/drake/star_hold
	)
	fuel_consumption = 5
	flags = SHUTTLE_FLAGS_PROCESS

// The shuttle's 'shuttle' computer
/obj/machinery/computer/shuttle_control/explore/drake
	name = "short jump console"
	shuttle_tag = "Drake"
	req_one_access = list()

//////////////////////////////////////////////////////////////
// Serenity

/obj/effect/overmap/visitable/sector/serenity
	name = "ARFS Serenity"
	desc = "The A.R.F.S. Serenity Biodome and all levels."
	scanner_desc = @{"[i]Stellar Body[/i]: A.R.F.S. Serenity
[i]Class[/i]: Biodome
[i]Habitability[/i]: High"}
	icon_state = "globe"
	in_space = 0
	initial_generic_waypoints = list("arfs_mansion_hanger")
	extra_z_levels = list(Z_LEVEL_RESIDENTIAL_ARFS, Z_LEVEL_RESIDENTIAL_TWO_ARFS, Z_LEVEL_RESIDENTIAL_MANSION_ARFS)
	known = TRUE

	skybox_icon = 'icons/skybox/virgo4.dmi'
	skybox_icon_state = "v2"
	skybox_pixel_x = 0
	skybox_pixel_y = 0

	initial_restricted_waypoints = list("Drake" = list("arfs_mansion_hanger"),)

//////////////////////////////////////////////////////////////
// Escape shuttle
/datum/shuttle/autodock/ferry/emergency/escape
	name = "Escape"
	location = FERRY_LOCATION_OFFSITE // At offsite
	warmup_time = 10
	docking_controller_tag = "escape_shuttle"
	shuttle_area = /area/shuttle/escape
	landmark_offsite = "escape_centcom"
	landmark_station = "escape_station"
	landmark_transition = "escape_transit"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN
	ceiling_type = /turf/simulated/shuttle/floor/white

/obj/effect/shuttle_landmark/premade/escape/centcom
	name = "ARFS Flapjack"
	landmark_tag = "escape_centcom"
	docking_controller = "centcom_dock"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/premade/escape/transit
	name = "Space"
	landmark_tag = "escape_transit"
	base_area = /area/space
	base_turf = /turf/space/transit/north

/obj/effect/shuttle_landmark/premade/escape/station
	name = "ARFS Dallus"
	landmark_tag = "escape_station"
	docking_controller = "escape_dock"
	base_area = /area/space
	base_turf = /turf/space

//////////////////////////////////////////////////////////////
// Supply shuttle
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	location = FERRY_LOCATION_OFFSITE
	warmup_time = 10
	shuttle_area = /area/shuttle/supply
	landmark_offsite = "supply_centcom"
	landmark_station = "supply_station"
	docking_controller_tag = "supply_shuttle"
	flags = SHUTTLE_FLAGS_PROCESS|SHUTTLE_FLAGS_SUPPLY
	ceiling_type = /turf/simulated/shuttle/floor/white

/obj/effect/shuttle_landmark/premade/supply/centcom
	name = "ARFS Flapjack"
	landmark_tag = "supply_centcom"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/premade/supply/station
	name = "ARFS Dallus"
	landmark_tag = "supply_station"
	docking_controller = "cargo_bay"
	base_area = /area/space
	base_turf = /turf/space

//////////////////////////////////////////////////////////////
// ERT Shuttle
/datum/shuttle/autodock/ferry/specialops
	name = "Special Operations"
	location = FERRY_LOCATION_STATION
	warmup_time = 10
	shuttle_area = /area/shuttle/specops
	landmark_station = "specops_cc"
	landmark_offsite = "specops_station"
	docking_controller_tag = "specops_shuttle_port"
	ceiling_type = /turf/simulated/shuttle/floor/black

/obj/effect/shuttle_landmark/premade/specops/centcom
	name = "ARFS Flapjack"
	landmark_tag = "specops_cc"
	docking_controller = "centcom_shuttle_bay"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/premade/specops/station
	name = "ARFS Dallus"
	landmark_tag = "specops_station"
	docking_controller = "centcom_shuttle_dock_airlock"
	special_dock_targets = list("Special Operations" = "specops_shuttle_fore")
	base_area = /area/space
	base_turf = /turf/space

//////////////////////////////////////////////////////////////
// Mining Shuttle (Leads to asteroid mining level)

/datum/shuttle/autodock/ferry/mining
	name = "Mining"
	location = FERRY_LOCATION_STATION
	warmup_time = 5
	shuttle_area = /area/shuttle/mining
	landmark_station = "mining_station"
	landmark_offsite = "mining_asteroid"
	landmark_transition = "mining_transit"
	docking_controller_tag = "mining_shuttle"
	move_direction = WEST

/obj/effect/shuttle_landmark/premade/mining/asteroid
	name = "Mining Outpost"
	landmark_tag = "mining_asteroid"
	docking_controller = "mining_outpost_airlock"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/premade/mining/station
	name = "ARFS Dallus - Mining Dock"
	landmark_tag = "mining_station"
	docking_controller = "mining_dock_airlock"
	base_area = /area/space
	base_turf = /turf/space


//////////////////////////////////////////////////////////////
// Research Shuttle (Leads to asteroid mining level)

/datum/shuttle/autodock/ferry/research
	name = "Research"
	location = FERRY_LOCATION_STATION
	warmup_time = 5
	shuttle_area = /area/shuttle/research
	landmark_station = "research_station"
	landmark_offsite = "research_asteroid"
	landmark_transition = "research_transit"
	docking_controller_tag = "research_shuttle"
	move_direction = SOUTH

/obj/effect/shuttle_landmark/premade/research/asteroid
	name = "Research Outpost"
	landmark_tag = "research_asteroid"
	docking_controller = "research_outpost_dock"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/premade/research/station
	name = "ARFS Dallus - Research Dock"
	landmark_tag = "research_station"
	docking_controller = "research_dock_airlock"
	base_area = /area/space
	base_turf = /turf/space

//////////////////////////////////////////////////////////////
// Engineering Shuttle (Construction?)

/datum/shuttle/autodock/ferry/engineering
	name = "Engineering"
	location = FERRY_LOCATION_STATION
	warmup_time = 5
	shuttle_area = /area/shuttle/constructionsite
	landmark_station = "engineering_station"
	landmark_offsite = "engineering_asteroid"
	docking_controller_tag = "engi_shuttle"
	move_direction = NORTH

/obj/effect/shuttle_landmark/premade/engineering/asteroid
	name = "Outpost - Engineering Dock"
	landmark_tag = "engineering_asteroid"
	docking_controller = "engi_mine_dock"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/premade/engineering/station
	name = "ARFS Dallus - Engineering Dock"
	landmark_tag = "engineering_station"
	docking_controller = "engi_dallus_dock"
	base_area = /area/space
	base_turf = /turf/space

/obj/machinery/computer/shuttle_control/engineering
	name = "\improper Engineering Shuttle Console"
	req_one_access = list(access_engine, access_construction, access_atmospherics)

/* OLD SHUTTLES BELOW HERE. THEY'RE HERE TEMPORARILY SO THEY CAN BE RE-ADDED WITH LANDMARK SHUTTLE CODE
//Medivac
/datum/shuttle/autodock/ferry/overmap/medivac
	name = "Medivac Shuttle"
	warmup_time = 0
	current_location = "tether_medivac_dock"
	docking_controller_tag = "medivac_docker"
	shuttle_area = list(/area/shuttle/medivac/cockpit, /area/shuttle/medivac/general, /area/shuttle/medivac/engines)
	fuel_consumption = 1
	move_direction = EAST

/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	location = 1
	warmup_time = 10
	area_offsite = /area/supply/dock
	area_station = /area/supply/station
	docking_controller_tag = "supply_shuttle"
	dock_target_station = "cargo_bay"
	flags = SHUTTLE_FLAGS_PROCESS|SHUTTLE_FLAGS_SUPPLY

// The "Elevators"
/datum/shuttle/autodock/ferry/engineering
	name = "Engineering"
	warmup_time = 10
	area_offsite = /area/shuttle/constructionsite/site
	area_station = /area/shuttle/constructionsite/station
	docking_controller_tag = "engineering_shuttle"
	dock_target_station = "engineering_dock_airlock"
	dock_target_offsite = "edock_airlock"

/datum/shuttle/autodock/ferry/mining
	name = "Mining"
	warmup_time = 10
	area_offsite = /area/shuttle/mining/outpost
	area_station = /area/shuttle/mining/station
	docking_controller_tag = "mining_shuttle"
	dock_target_station = "mining_dock_airlock"
	dock_target_offsite = "mining_outpost_airlock"

/datum/shuttle/autodock/ferry/research
	name = "Research"
	warmup_time = 10
	area_offsite = /area/shuttle/research/outpost
	area_station = /area/shuttle/research/station
	docking_controller_tag = "research_shuttle"
	dock_target_station = "research_dock_airlock"
	dock_target_offsite = "research_outpost_dock"

// Admin shuttles.
/datum/shuttle/autodock/ferry/centcom
	name = "Centcom"
	location = 1
	warmup_time = 10
	area_offsite = /area/shuttle/transport1/centcom
	area_station = /area/shuttle/transport1/station
	docking_controller_tag = "centcom_shuttle"
	dock_target_station = "centcom_shuttle_dock_airlock"
	dock_target_offsite = "centcom_shuttle_bay"

/datum/shuttle/autodock/ferry/administration
	name = "Administration"
	location = 1
	warmup_time = 10	//want some warmup time so people can cancel.
	area_offsite = /area/shuttle/administration/centcom
	area_station = /area/shuttle/administration/station
	docking_controller_tag = "admin_shuttle"
	dock_target_station = "admin_shuttle_dock_airlock"
	dock_target_offsite = "admin_shuttle_bay"

// Heist / Skipjack
/datum/shuttle/autodock/multi/heist
	name = "Skipjack"
	warmup_time = 8
	move_time = 60
	can_cloak = TRUE
	cloaked = TRUE
	current_location = "skipjack_base"
	landmark_transition = "skipjack_transit"
	shuttle_area = /area/shuttle/skipjack
	destination_tags = list(
		"dallus_space_nw"
		)
	//docking_controller_tag = ??? doesn't have one?
	announcer = "Automated Traffic Control"
	arrival_message = "Attention. An unregistered vessel is approaching Virgo-3B."
	departure_message = "Attention. A unregistered vessel is now leaving Virgo-3B."
	defer_initialisation = TRUE
	move_direction = NORTH

/datum/shuttle/autodock/multi/specops/ert
	name = "Special Operations"
	location = 0
	warmup_time = 10
	area_offsite = /area/shuttle/specops/station	//centcom is the home station, the Exodus is offsite
	area_station = /area/shuttle/specops/centcom
	docking_controller_tag = "specops_shuttle_port"
	docking_controller_tag_station = "specops_shuttle_port"
	docking_controller_tag_offsite = "specops_shuttle_fore"
	dock_target_station = "specops_centcom_dock"
	dock_target_offsite = "specops_dock_airlock"
*/