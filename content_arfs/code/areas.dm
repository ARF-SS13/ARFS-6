/area/virtual_reality
	name = "Virtual Reality"
	requires_power = 0
	dynamic_lighting = 1
	flags = RAD_SHIELDED
	sound_env = SMALL_ENCLOSED
	base_turf = /turf/simulated/floor/plating
	icon_state = "blue"

/area/virtual_reality/hub
	name = "VR Hub"

/area/virtual_reality/deathmatch
	name = "VR Deathmatch"
	icon_state = "red"

/area/virtual_reality/yacht
	name = "VR Yacht"


//Hallways//

//Deck 3 Hallways
/area/hallway/primary/deckthree/fore
	name = "\improper Deck 3 - Fore Primary Hallway"
	icon_state = "hallF"

/area/hallway/primary/deckthree/aft
	name = "\improper Deck 3 - Aft Primary Hallway"
	icon_state = "hallA"


/area/hallway/primary/deckthree/central
	name = "\improper Deck 3 - Central Primary Hallway"
	icon_state = "hallC1"

//OUTSIDE//
//In space, but on top of the plating which covers lower z levels.
//Allows gravity to exist when you're standing on top of the plating outside
/area/exterior
	name = "Ship Exterior"
	requires_power = 1
	always_unpowered = 1
	dynamic_lighting = 0
	ambience = AMBIENCE_SPACE
	has_gravity = TRUE

/area/exterior/deckone
	name = "Ship Exterior - Deck One"
/area/exterior/decktwo
	name = "Ship Exterior - Deck Two"
/area/exterior/deckthree
	name = "Ship Exterior - Deck Three"


//blueshield office
/area/bridge/blueshield
	name = "\improper Blueshield Office"
	icon_state = "bridge"
	music = null
	sound_env = MEDIUM_SOFTFLOOR

//mansion holodeck
/area/holodeck/mansion
	name = "\improper Holodeck - Mansion"
	requires_power = 0
	flags = RAD_SHIELDED
	icon = 'icons/turf/areas_yw.dmi'
	icon_state = "mansion"
	flags = AREA_FLAG_IS_NOT_PERSISTENT