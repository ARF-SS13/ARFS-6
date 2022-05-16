
#define Z_LEVEL_BEACH						13
#define Z_LEVEL_BEACH_CAVE					14
#define Z_LEVEL_AEROSTAT					15
#define Z_LEVEL_AEROSTAT_SURFACE			16
#define Z_LEVEL_DEBRISFIELD					17
#define Z_LEVEL_FUELDEPOT					18
#define Z_LEVEL_OFFMAP1						19
#define Z_LEVEL_XENOPRIME					20

//Keep gateway at the bottom since it generates last.
#define Z_LEVEL_GATEWAY						21

/datum/skybox_settings/stellar_delight
	icon_state = "space5"
	use_stars = FALSE

/datum/planet/virgo4
	expected_z_levels = list(Z_LEVEL_BEACH)

/datum/planet/xenoprime
	expected_z_levels = list(Z_LEVEL_XENOPRIME)
