// -- Shuttle -- //

/datum/shuttle/autodock/ferry/residential
	name = "Residential Shuttle"
	location = FERRY_LOCATION_STATION
	shuttle_area = /area/shuttle/residential
	docking_controller_tag = "residential_shuttle"
	landmark_offsite = "residential_residential"
	landmark_station = "residential_station"
	landmark_transition = "residential_transit"
	warmup_time = 5 //seconds
	move_time = 30 //seconds
	var/announcer = "Automated Traffic Control"


/datum/shuttle/autodock/ferry/residential/perform_shuttle_move()
	..()
	if (current_location == landmark_station)
		command_announcement.Announce("The Residential Shuttle has docked at ARFS Dallus.", announcer)
	if (current_location == landmark_offsite)
		command_announcement.Announce("The Residential Shuttle has docked at NCS Serenity Residential.", announcer)

/obj/effect/shuttle_landmark/premade/residential/residences
	name = "NCS Serenity Residential"
	landmark_tag = "residential_residential"
	docking_controller = "residential_shuttle_offsite"
	base_turf = /turf/space
	base_area = /area/space

/obj/effect/shuttle_landmark/premade/residential/transit
	name = "Space"
	landmark_tag = "residential_transit"

/obj/effect/shuttle_landmark/premade/residential/station
	name = "ARFS Dallus"
	landmark_tag = "residential_station"
	docking_controller = "residential_shuttle_station"
	base_turf = /turf/space
	base_area = /area/space
	special_dock_targets = list("Residential Shuttle" = "residential_shuttle_docking_left")


// -- Objs -- //

/obj/machinery/computer/shuttle_control/residential_shuttle
	name = "residential ferry control console"
	shuttle_tag = "Residential Shuttle"

/obj/structure/table/leadreinforcedwood
    icon_state = "reinf_preview"


/obj/structure/table/leadreinforcedwood/New()
    material = get_material_by_name("lead")
    reinforced = get_material_by_name("wood")
    ..()

/obj/machinery/alarm/cold/Initialize(mapload)
	. = ..()
	TLV["temperature"] = list(233.15, 253.15, 303, 323.15) // K
	target_temperature = 273.15 //0C

/obj/machinery/power/thermoregulator/zeroc
	name = "\improper Thermal Regulator - Cold"
	desc = "A mass produced thermal regulator designed to heat up or cool down the room it's installed in. This one is set to cool the room to 0 Celsius."
	icon = 'icons/obj/machines/wallthermal.dmi'
	icon_state = "lasergen"
	density = 0
	anchored = 1
	use_power = 0 //is powered directly from cables
	active_power_usage = 25 KILOWATTS  //Low Power
	idle_power_usage = 250
	target_temp = T0C
	circuit = null


// Spawn points

var/global/list/latejoin_residential = list()
/obj/effect/landmark/residential
	name = "JoinLateResidential"
	delete_me = 1

/obj/effect/landmark/residential/New()
	latejoin_residential += loc // Register this turf as tram latejoin.
	..()

/datum/spawnpoint/residential
	display_name = "NCS Serenity Residential"
	msg = "has arrived on the NCS Serenity Residential level"
	announce_channel = "Common"

/datum/spawnpoint/residential/New()
	..()
	turfs = latejoin_residential


/obj/machinery/cryopod/robot/door/residential
	name = "Residential Elevator"
	desc = "Wait aren't you already there?"
	spawnpoint_type = /datum/spawnpoint/residential
	announce_channel = "Common"
	on_store_message = "has left through the Residential area Elevator."
	on_store_name = "Residential Elevator"
	on_enter_visible_message = "makes their way into the"
	on_enter_occupant_message = "You hear cheery music."
	on_store_visible_message_1 = "hums as it moves"
	on_store_visible_message_2 = "into the elevator."



// -- Areas -- //

/area/shuttle/residential
	name = "\improper Residential Shuttle"
	base_turf = /turf/space

/area/residential
	icon = 'icons/turf/areas_yw.dmi'
	flags = RAD_SHIELDED
	name = "\improper Residential"
	requires_power = 0
	flags = AREA_FLAG_IS_NOT_PERSISTENT

/area/residential/docking_lobby
	name = "\improper Residential - Docking Lobby"
	icon_state = "docking_lobby"

/area/residential/corridors
	name = "\improper Residential - Corridors"
	icon_state = "corridors"

/area/residential/ship_bay
	name = "\improper Residential - Ship Bay"

/area/residential/powerroom
	name = "\improper Residential - Power Room"

/area/residential/lobby
	name = "\improper Residential - Residential Lobby"

/area/residential/medbay
	name = "\improper Residential - Residential Medbay"

/area/residential/room1
	name = "\improper Residential - Room 1"
	icon_state = "room1"

/area/residential/room2
	name = "\improper Residential - Room 2"
	icon_state = "room2"

/area/residential/room3
	name = "\improper Residential - Room 3"
	icon_state = "room3"

/area/residential/room4
	name = "\improper Residential - Room 4"
	icon_state = "room4"

/area/residential/room5
	name = "\improper Residential - Room 5"
	icon_state = "room5"

/area/residential/room6
	name = "\improper Residential - Room 6"
	icon_state = "room6"

/area/residential/room6/bedroom
	name = "\improper Residential Bedroom- Room 6"
	icon_state = "room6"

/area/residential/room6/bathroom
	name = "\improper Residential Bathroom- Room 6"
	icon_state = "room6"

/area/residential/room7
	name = "\improper Residential - Room 7"
	icon_state = "room7"

/area/residential/room8
	name = "\improper Residential - Room 8"
	icon_state = "room8"

/area/residential/room9
	name = "\improper Residential - Room 9"
	icon_state = "room9"

/area/residential/room10
	name = "\improper Residential - Room 10"
	icon_state = "room10"

/area/residential/room11
	name = "\improper Residential - Room 11"
	icon_state = "room11"

/area/residential/room12
	name = "\improper Residential - Room 12"
	icon_state = "room12"

/area/residential/room13
	name = "\improper Residential - Room 13"
	icon_state = "room13"

/area/residential/room14
	name = "\improper Residential - Room 14"
	icon_state = "room14"


	//MEDIUMS

/area/residential/mroom1
	name = "\improper Residential - Medium Room 1"
	icon_state = "mediumroom1"

/area/residential/mroom1bed1
	name = "\improper Residential - Medium Room 1 Bedroom"
	icon_state = "mediumroom1"

/area/residential/mroom2
	name = "\improper Residential - Medium Room 2"
	icon_state = "mediumroom2"

/area/residential/mroom2bed1
	name = "\improper Residential - Medium Room 2 Bedroom A"
	icon_state = "mediumroom2"

/area/residential/mroom2bed2
	name = "\improper Residential - Medium Room 2 Bedroom B"
	icon_state = "mediumroom2"

/area/residential/mroom3
	name = "\improper Residential - Medium Room 3"
	icon_state = "mediumroom3"

/area/residential/mroom4
	name = "\improper Residential - Medium Room 4"
	icon_state = "mediumroom4"

/area/residential/mroom5
	name = "\improper Residential - Medium Room 5"
	icon_state = "mediumroom5"

/area/residential/mroom6
	name = "\improper Residential - Medium Room 6"
	icon_state = "mediumroom6"

/area/residential/mroom7
	name = "\improper Residential - Medium Room 7"

/area/residential/mroom8
	name = "\improper Residential - Medium Room 8"

/area/residential/mroom9
	name = "\improper Residential - Medium Room 9"

/area/residential/mroom10
	name = "\improper Residential - Medium Room 10"
/area/residential/mroom11
	name = "\improper Residential - Medium Room 11"

/area/residential/mansion
	name = "\improper Residential -  Mansion"
	icon_state = "mansion"

/area/residential/mansion_ballroom
	name = "\improper Residential -  Mansion BallRoom"
	icon_state = "mansion"

/area/residential/mansion_bed_1
	name = "\improper Mansion -  Bedroom Amber"
	icon_state = "mansion"

/area/residential/mansion_bed_2
	name = "\improper Mansion -  Bedroom Jake"
	icon_state = "mansion"

/area/residential/mansion_bed_3
	name = "\improper Mansion -  Bedroom Lilith"
	icon_state = "mansion"

/area/residential/mansion_bed_4
	name = "\improper Mansion -  Bedroom Dameon"
	icon_state = "mansion"

/area/residential/mansion_bed_5
	name = "\improper Mansion -  Bedroom Guest"
	icon_state = "mansion"

/area/residential/mansion_office
	name = "\improper Mansion - Dameon Office"
	icon_state = "mansion"

/area/residential/mansion_club
	name = "\improper Mansion - Club"
	icon_state = "mansion"

/area/residential/mansion_gameroom
	name = "\improper Mansion - Gameroom"
	icon_state = "mansion"
