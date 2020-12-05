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
	landmark_transition = "engineering_transit"
	docking_controller_tag = "engineering_shuttle"
	move_direction = NORTH

/obj/effect/shuttle_landmark/premade/engineering/asteroid
	name = "Outpost - Engineering Dock"
	landmark_tag = "engineering_asteroid"
	docking_controller = "edock_airlock"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/premade/engineering/station
	name = "ARFS Dallus - Engineering Dock"
	landmark_tag = "engineering_station"
	docking_controller = "engineering_dock_airlock"
	base_area = /area/space
	base_turf = /turf/space



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

// Heist
/datum/shuttle/autodock/multi/skipjack
	name = "Skipjack"
	warmup_time = 0
	origin = /area/skipjack_station/start
	interim = /area/skipjack_station/transit
	can_cloak = TRUE
	cloaked = TRUE
	destinations = list(
		"Fore Starboard Solars" = /area/skipjack_station/northeast_solars,
		"Fore Port Solars" = /area/skipjack_station/northwest_solars,
		"Aft Starboard Solars" = /area/skipjack_station/southeast_solars,
		"Aft Port Solars" = /area/skipjack_station/southwest_solars,
		"Mining Station" = /area/skipjack_station/mining
		)
	announcer = "Automated Traffic Control"

/datum/shuttle/autodock/multi/skipjack/New()
	arrival_message = "Attention.  Unidentified object approaching the colony."
	departure_message = "Attention.  Unidentified object exiting local space.  Unidentified object expected to escape Kara gravity well with current velocity."
	..()

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