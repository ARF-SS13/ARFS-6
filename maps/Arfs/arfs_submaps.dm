
#define Z_LEVEL_BEACH						13
#define Z_LEVEL_BEACH_CAVE					14
#define Z_LEVEL_AEROSTAT					15
#define Z_LEVEL_AEROSTAT_SURFACE			16
#define Z_LEVEL_DEBRISFIELD					17
#define Z_LEVEL_FUELDEPOT					18
#define Z_LEVEL_OFFMAP1						19
#define Z_LEVEL_GATEWAY						20
#define Z_LEVEL_OM_ADVENTURE				21
#define Z_LEVEL_SPACE_ROCKS					22
//#define Z_LEVEL_CENTCOM						23



/datum/skybox_settings/stellar_delight
	icon_state = "space5"
	use_stars = FALSE

// /datum/planet/virgo3b
// 	expected_z_levels = list(Z_LEVEL_CENTCOM)
/datum/planet/virgo4
	expected_z_levels = list(Z_LEVEL_BEACH)

#include "../submaps/space_rocks/space_rocks.dm"
/datum/map_template/common_lateload/space_rocks
	name = "V3b Asteroid Field"
	desc = "Space debris is common in V3b's orbit due to the proximity of Virgo 3"
	mappath = 'maps/submaps/space_rocks/space_rocks.dmm'

	associated_map_datum = /datum/map_z_level/common_lateload/space_rocks

/datum/map_template/common_lateload/space_rocks/on_map_loaded(z)
	. = ..()
	seed_submaps(list(Z_LEVEL_SPACE_ROCKS), 60, /area/sdmine/unexplored, /datum/map_template/space_rocks)
	new /datum/random_map/automata/cave_system/no_cracks(null, 3, 3, Z_LEVEL_SPACE_ROCKS, world.maxx - 4, world.maxy - 4)
	new /datum/random_map/noise/ore/spacerocks(null, 1, 1, Z_LEVEL_SPACE_ROCKS, 64, 64)

/datum/map_z_level/common_lateload/space_rocks
	z = Z_LEVEL_SPACE_ROCKS
	name = "V3b Asteroid Field"
	base_turf = /turf/space
	flags = MAP_LEVEL_PLAYER|MAP_LEVEL_CONTACT|MAP_LEVEL_CONSOLES


#include "../expedition_vr/aerostat/_aerostat_science_outpost.dm"

/obj/effect/overmap/visitable/sector/virgo2/Initialize()
	for(var/obj/effect/overmap/visitable/ship/landable/excursion/sd in world)
		docking_codes = sd.docking_codes
	. = ..()

/datum/map_template/common_lateload/away_aerostat
	name = "Remmi Aerostat - Z1 Aerostat"
	desc = "The Virgo 2 Aerostat away mission."
	mappath = 'maps/expedition_vr/aerostat/aerostat_science_outpost.dmm'
	associated_map_datum = /datum/map_z_level/common_lateload/away_aerostat


#include "../offmap_vr/common_offmaps.dm"
