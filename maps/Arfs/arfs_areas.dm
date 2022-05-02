// Areas defined via tether used on arfs map

// Explorer shuttle
/area/shuttle/excursion
	requires_power = 1
	icon_state = "shuttle2"
	base_turf = /turf/simulated/floor/reinforced
/area/shuttle/excursion/general
	name = "\improper Excursion Shuttle"
/area/shuttle/excursion/medical
	name = "\improper Excursion Shuttle Medical"
/area/shuttle/excursion/cockpit
	name = "\improper Excursion Shuttle Cockpit"
/area/shuttle/excursion/cargo
	name = "\improper Excursion Shuttle Cargo"
/area/shuttle/excursion/power
	name = "\improper Excursion Shuttle Power"

// Andy shuttle
/area/shuttle/drake
	icon = 'icons/turf/areas_vr_talon.dmi'
	icon_state = "gray"
	requires_power = 1
	has_gravity = 1
/area/shuttle/drake/cabin
	name = "\improper Drake Cabin"
/area/shuttle/drake/engineering
	name = "\improper Drake Engineering"
	icon_state = "yellow"
/area/shuttle/drake/cockpit
	name = "\improper Drake Cockpit"
	icon_state = "blue"
/area/shuttle/drake/quarters1
	name = "\improper Drake Quarters 1"
	icon_state = "gray-p"
/area/shuttle/drake/quarters2
	name = "\improper Drake Quarters 2"
	icon_state = "gray-s"
/area/shuttle/drake/galley
	name = "\improper Drake Galley"
	icon_state = "dark-p"
/area/shuttle/drake/storage
	name = "\improper Drake Storage"
	icon_state = "dark-s"
/area/shuttle/drake/head
	name = "\improper Drake Bathroom"
	icon_state = "dark-p"
/area/shuttle/drake/medbay
	name = "\improper Drake Medbay"
	icon_state = "dark-p"
/area/shuttle/drake/office
	name = "\improper Drake Office"
	icon_state = "dark-s"
/area/shuttle/drake/dorm
	name = "\improper Drake Dorms"
	icon_state = "dark-s"
/area/shuttle/drake/port_hold
	name = "\improper Drake Port Hold"
	icon_state = "dark-p"
/area/shuttle/drake/star_hold
	name = "\improper Drake Starboard Hold"
	icon_state = "dark-s"

// antag
/area/shuttle/antag_ground/base
	name = "\improper Syndicate LC - Base"
	icon_state = "shuttle2"
/area/shuttle/antag_ground/transit
	name = "\improper Syndicate LC - Transit"
	icon_state = "shuttle2"

/area/shuttle/antag_ground/solars
	name = "\improper Syndicate LC - Solars"
	icon_state = "shuttle2"

// RND
/area/rnd/hallway
	name = "\improper Research Lower Hallway"
	icon_state = "research"

// AI
/area/ai/foyer
	name = "\improper AI Core Access"
/area/ai/outside
	name = "/improper AI Core Outside"

// CREWQUARTERS/DORM
/area/crew_quarters/sauna
	name = "\improper Sauna"
	icon_state = "recreation_area"

/area/crew_quarters/sleep/Dorm_1/holo
	name = "\improper Dorm 1 Holodeck"
	icon_state = "dk_yellow"

/area/crew_quarters/sleep/Dorm_3/holo
	name = "\improper Dorm 3 Holodeck"
	icon_state = "dk_yellow"

/area/crew_quarters/sleep/Dorm_5/holo
	name = "\improper Dorm 5 Holodeck"
	icon_state = "dk_yellow"

/area/crew_quarters/sleep/Dorm_7/holo
	name = "\improper Dorm 7 Holodeck"
	icon_state = "dk_yellow"

/area/crew_quarters/locker/upper
	name = "\improper Changing Room Foyer"
	icon_state = "locker"
	icon = 'icons/turf/areas.dmi'
/area/crew_quarters/locker/upper/room1
	name = "\improper Changing Room 1"
	icon_state = "locker"
	icon = 'icons/turf/areas.dmi'
/area/crew_quarters/locker/upper/room2
	name = "\improper Changing Room 2"
	icon_state = "locker"
	icon = 'icons/turf/areas.dmi'

/area/holodeck/holodorm/source_basic
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_desert
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_seating
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_beach
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_garden
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_boxing
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_snow
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_space
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_off
	name = "\improper Holodeck Source"


//HALLWAYS

/area/hallway/station
	icon_state = "hallC1"
/area/hallway/station/port
	name = "\improper Main Port Hallway"
/area/hallway/station/starboard
	name = "\improper Main Starboard Hallway"
/area/hallway/station/upper
	name = "\improper Main Upper Hallway"
/area/hallway/station/docks
	name = "\improper Docks Hallway"
/area/hallway/station/residentialdock
	name = "\improper Residential Dock"
	icon_state = "gutsdorms"
	icon = 'maps/Arfs/arfs_areas.dmi'
/area/hallway/station/docking_hall
	name = "\improper Deck Three - Port Docking Arm Hallway"
/area/hallway/station/docking_hall_airlock_n
	name = "\improper Deck Three - Port Docking Arm, Fore Airlock"
/area/hallway/station/docking_hall_airlock_s
	name = "\improper Deck Three - Port Docking Arm, Aft Airlock"
/area/hallway/station/docking_hall_airlock_w
	name = "\improper Deck Three - Port Docking Arm, Port Airlock"
/area/hallway/station/docking_hall_starboard
	name = "\improper Deck Three - Starboard Docking Arm Hallway"
/area/hallway/station/docking_hall_starboard_airlock_n
	name = "\improper Deck Three - Starboard Docking Arm, Fore Airlock"
/area/hallway/station/docking_hall_starboard_airlock_s
	name = "\improper Deck Three - Starboard Docking Arm, Aft Airlock"

//MAINT

/area/maintenance/station
	icon_state = "fsmaint"
/area/maintenance/station/bridge
	name = "\improper Bridge Maintenance"
/area/maintenance/station/eng_lower
	name = "\improper Engineering Lower Maintenance"
/area/maintenance/station/eng_upper
	name = "\improper Engineering Upper Maintenance"
/area/maintenance/station/medbay
	name = "\improper Medbay Maintenance"
/area/maintenance/station/cargo
	name = "\improper Cargo Maintenance"
/area/maintenance/station/elevator
	name = "\improper Elevator Maintenance"
/area/maintenance/station/sec_lower
	name = "\improper Security Lower Maintenance"
/area/maintenance/station/sec_upper
	name = "\improper Security Upper Maintenance"
/area/maintenance/station/micro
	name = "\improper Micro Maintenance"
/area/maintenance/station/virology
	name = "\improper Virology Maintenance"
/area/maintenance/game_room
	name = "Game Room"
	icon_state = "amaint"
/area/maintenance/station/deck_three/port_docking_arm
	name = "\improper Deck Three - Port Docking Arm Maintenance"

//Underbelly Maintenance

/area/maintenance/guts
	name = "Underbelly Maintenance"
	icon = 'maps/arfs/arfs_areas.dmi'
	icon_state = "gutsnorth"
/area/maintenance/guts/stairs
	name = "GUTS Stairs"
	icon_state = "gutsstairs"
/area/maintenance/guts/SMES
	name = "GUTS SMES"
	icon_state = "gutssmes"
/area/maintenance/guts/medical
	name = "Maintenance Medical"
	icon_state = "gutsmed"
/area/maintenance/guts/science
	name = "Maintenance Science"
	icon_state = "gutssci"
/area/maintenance/guts/north
	name = "Maintenance Northern Hallways"
/area/maintenance/guts/south
	name = "Maintenance Southern Hallways"
	icon_state = "gutssouth"
/area/maintenance/guts/dorms/
	name = "Maintenance Dorms"
	icon_state = "gutsdorms"
/area/maintenance/guts/dorms/roomone
	name = "Maintenance Dorm 1"
/area/maintenance/guts/dorms/roomtwo
	name = "Maintenance Dorm 2"
/area/maintenance/guts/dorms/roomthree
	name = "Maintenance Dorm 3"
/area/maintenance/guts/bar
	name = "Maintenance Bar"
	icon_state = "gutsbar"
/area/maintenance/guts/arcade
	name = "Maintenance Arcade"
	icon_state = "gutsarcade"
/area/maintenance/guts/shower
	name = "Maintenance Shower"
	icon_state = "gutsshower"
/area/maintenance/guts/jani
	name = "Maintenance Janitor"
	icon_state = "gutsjanitalia"
/area/maintenance/guts/dungeon
	name = "Spare Room"
	icon_state = "gutsdungeon"
/area/maintenance/guts/radio
	name = "GUTS Radio Room"
	icon_state = "gutsradio"
/area/maintenance/guts/strip
	name = "Stripclub"
	icon_state = "gutsstrip"
/area/maintenance/guts/eva
	name = "GUTS EVA"
	icon_state = "gutseva"
/area/maintenance/guts/meeting
	name = "Meeting Room"
	icon_state = "gutsmeeting"
/area/maintenance/guts/lounge
	name = "Lounge"
	icon_state = "gutslounge"
/area/maintenance/guts/storage
	name = "GUTS Secure Storage"
	icon_state = "gutsstorage"

//Research Outpost
/area/outpost/research/solars
	name = "Research Outpost solars"
	dynamic_lighting = 0

//Mining Outpost
/area/outpost/mining_main/solars
	name = "Mining Outpost solars"
	dynamic_lighting = 0

//underdark
/area/outpost/mining_main/lower_outpost
	name = "Lower Asteroid Outpost"

//Engineering Gravity
/area/engineering/gravity
	name= "\improper Gravity Generator"
	icon_state = "engineering"
	icon = 'icons/turf/areas.dmi'

//Engineering Engine Room
/area/engineering/thrusters
	name= "\improper Engine Thrusters"
	icon_state = "engineering"
	icon = 'icons/turf/areas.dmi'

//Engineering Shuttle Dock
/area/engineering/shuttle_dock
	name= "\improper Engineering - Shuttle Dock"
	icon_state = "engineering"
	icon = 'icons/turf/areas.dmi'

//Upstairs Kitchen
/area/crew_quarters/kitchen/upper
	name= "\improper Upstairs Kitchen"
	icon_state = "kitchen"
	icon = 'icons/turf/areas.dmi'
/area/crew_quarters/dining_hall/upper
	name= "\improper Upstairs Dining Hall"
	icon_state = "cafeteria"
	icon = 'icons/turf/areas.dmi'

//Chapel areas
/area/crew_quarters/instrument_room
	name = "\improper Music Room"
	icon_state = "gutslounge"
	icon = 'maps/arfs/arfs_areas.dmi'

/area/crew_quarters/wedding_chapel
	name = "\improper Wedding Chapel"
	icon_state = "gutslounge"
	icon = 'maps/arfs/arfs_areas.dmi'

/area/crew_quarters/wedding_chapel_changing_room
	name = "\improper Wedding Chapel Changing Room"
	icon_state = "gutslounge"
	icon = 'maps/arfs/arfs_areas.dmi'

/area/crew_quarters/fishing_area
	name = "\improper Fishing Area"
	icon_state = "gutslounge"
	icon = 'maps/arfs/arfs_areas.dmi'

/area/exploration/pathfinder_office
	name = "\improper Pathfinder Office"
	icon_state = "exploration"
	icon = 'maps/arfs/arfs_areas.dmi'

/area/exploration/gear
	name = "\improper Exploration Gear Room"
	icon_state = "exploration"
	icon = 'maps/arfs/arfs_areas.dmi'

/area/exploration/hallway
	name = "\improper Exploration Hallway"
	icon_state = "exploration"
	icon = 'maps/arfs/arfs_areas.dmi'

/area/exploration/hanger
	name = "\improper Explorationn Hanger"
	icon_state = "exploration"
	icon = 'maps/arfs/arfs_areas.dmi'


/area/exploration/waiting_room
	name = "\improper Explorationn Waiting Room"
	icon_state = "exploration"
	icon = 'maps/arfs/arfs_areas.dmi'

//checkpoints
/area/security/checkpoint/starboard
	name = "\improper Security Checkpoint - Starboard Docking Arm"

/area/security/checkpoint/port
	name = "\improper Security Checkpoint - Port Docking Arm"

//Medbay
/area/medical/medbay/autoresleever
	name = "\improper Auto-resleeving Lab"
