#if !defined(USING_MAP_DATUM)

// 1 = Subdeck, 2 = Main Deck, 3 = Centcomm, 4 = Empty, 5 = Hotel, 6 = Mining
	#include "arfs_turfs.dm"
	#include "arfs_submaps.dm"
	#include "arfs_defines.dm"
	#include "arfs_misc.dm"
	#include "arfs_areas.dm"
	#include "arfs_shuttles.dm"
	#include "arfs_underdark.dm"
	#include "arfs_telecomms.dm"

	#include "submaps/arfs_common_offmaps.dm"

	#include "residential/_residential_arf.dm"
	#include "residential/residential_keys_arf.dm"

	#include "arfs-1-deckone.dmm"
	#include "arfs-2-decktwo.dmm"
	#include "arfs-3-deckthree.dmm"
	#include "arfs-4-centcom.dmm"
	#include "arfs-5-space.dmm"
	#include "arfs-6-asteroid.dmm"
	#include "arfs-7-mining.dmm"
	#include "arfs-8-underdark.dmm"
	#include "residential/residential_station.dmm"
	#include "residential/residential_arf.dmm"
	#include "residential/residential_arf_two.dmm"
	#include "residential/residential_arf_mansion.dmm"

	#include "residential/_residential_arf.dm"
	#include "residential/residential_keys_arf.dm"

	#define USING_MAP_DATUM /datum/map/arfs

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring arfs

#endif

// ------------------------

// TO DO:
// Add in mist sprite to icons/effects/effects.dmi.
// add the lobby screen
// give jon kiss cause he's lonely :(

// ------------------------

// arfs-1.dmm MISSING:
// suitvendor
// clothingvendor
// hatvendor
// kinkvendor
// shoevendor
// lewd toys it seems.

// ------------------------

// arfs-2.dmm MISSING:
// nifsofts_arfs_command - fuck nif dont add this or i'll bite you
// nifsofts_arfs_security - fuck nif dont add this or i'll bite you
// nifsofts_arfs_security_synth - fuck nif dont add this or i'll bite you
// hatvendor
// clothingvendor
// suitvendor
// shoevendor
// kinkvendor
// lewd toys...smh
// nifsofts_arfs_mining - fuck nif dont add this or i'll bite you
// nifsofts_arfs_mining_synth - fuck nif dont add this or i'll bite you
// nifsofts_arfs_science - fuck nif dont add this or i'll bite you
// nifsofts_arfs_science_synth - fuck nif dont add this or i'll bite you
// nifsofts_arfs_medical - fuck nif dont add this or i'll bite you
// nifsofts_arfs_medical_synth - fuck nif dont add this or i'll bite you
// nifsofts_arfs_engineer - fuck nif dont add this or i'll bite you.
// Magical SME unit, cheaters.

// ------------------------
