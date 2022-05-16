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
	#include "arfs-7-underdark.dmm"
	#include "arfs-8-mining.dmm"
	#include "residential/residential_arf_mansion.dmm"
	#include "residential/residential_arf_two.dmm"
	#include "residential/residential_arf.dmm"
	#include "residential/residential_station.dmm"

	#define USING_MAP_DATUM /datum/map/arfs

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring arfs

#endif
