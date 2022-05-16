#if MAP_TEST
#include "crashed_ship_1.dmm"
#endif

//Points of Interest that spawn on Xenomorph Prime

//Outdoor PoIs
/datum/map_template/xenoprime/outdoors
	name = "POI - Xenomorph Prime Surface"
	desc = "A map template. On Xenomorph Prime."


/datum/map_template/xenoprime/outdoors/crashed_ship_one
	name = "Abandoned Relay"
	desc = "An unregistered comms relay, abandoned to the elements."
	mappath = 'maps/Arfs/submaps/xenoprime/pois/crashed_ship_1.dmm'
	cost = 5

//PoIs in caves
/datum/map_template/xenoprime/cave
	name = "POI - Xenomorph Prime Underground"
	desc = "A map template. Beneath Xenomorph Prime's surface."
