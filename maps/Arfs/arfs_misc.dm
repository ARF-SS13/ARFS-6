// WINDOWS

/obj/structure/window/reinforced/full
	dir = 5
	icon_state = "fwindow"
	maxhealth = 60
	fulltile = TRUE

/obj/structure/window/reinforced/polarized/full
	dir = 5
	icon_state = "fwindow"
	maxhealth = 60
	fulltile = TRUE

// SUPPLY CRATES
/obj/structure/closet/crate/engineering/antimatter
	name = "Antimatter Engine crate"
	starts_with = list(
		/obj/item/weapon/am_containment = 2,
		/obj/item/device/am_shielding_container = 9,
		/obj/item/stack/cable_coil = 2,
		/obj/item/device/multitool
		)

//
// Holodorms
//
/obj/machinery/computer/HolodeckControl/holodorm
	name = "Don't use this one!!!"
	powerdown_program = "Off"
	default_program = "Off"

	//Smollodeck
	active_power_usage = 500
	item_power_usage = 100

	supported_programs = list(
	"Off"			= new/datum/holodeck_program(/area/holodeck/holodorm/source_off),
	"Basic Dorm"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_basic),
	"Table Seating"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_seating),
	"Beach Sim"		= new/datum/holodeck_program(/area/holodeck/holodorm/source_beach),
	"Desert Area"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_desert),
	"Snow Field"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_snow),
	"Flower Garden"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_garden),
	"Space Sim"		= new/datum/holodeck_program(/area/holodeck/holodorm/source_space),
	"Boxing Ring"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_boxing)
	)

/obj/machinery/computer/HolodeckControl/holodorm/one
	name = "dorm one holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_1/holo

/obj/machinery/computer/HolodeckControl/holodorm/three
	name = "dorm three holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_3/holo

/obj/machinery/computer/HolodeckControl/holodorm/five
	name = "dorm five holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_5/holo

/obj/machinery/computer/HolodeckControl/holodorm/seven
	name = "dorm seven holodeck control"
	projection_area = /area/crew_quarters/sleep/Dorm_7/holo



//
// Copied from tether_turfs.dm
//

//Simulated
/*
/turf/simulated/open/virgo3b
	edge_blending_priority = 0.5 //Turfs which also have e_b_p and higher than this will plop decorative edges onto this turf
/turf/simulated/open/virgo3b/New()
	..()
	outdoor_turfs.Add(src)

/turf/simulated/floor
/turf/simulated/floor/virgo3b/New()
	..()
	outdoor_turfs.Add(src)
*/

/turf/unsimulated/wall/dungeonwall
	oxygen = 0
	nitrogen = 0
	carbon_dioxide = 0
	phoron = 0
	temperature = T20C

//teleporter
/obj/effect/step_trigger/teleporter/to_underdark
	icon = 'icons/obj/structures/multiz.dmi'
	icon_state = "stair_l"
	invisibility = 0
	layer = 3.2

/obj/effect/step_trigger/teleporter/to_underdark/Initialize()
	. = ..()
	teleport_x = x
	teleport_y = y
	for(var/z_num in using_map.zlevels)
		var/datum/map_z_level/Z = using_map.zlevels[z_num]
		if(Z.name == "Asteroid Underdark")
			teleport_z = Z.z

/obj/effect/step_trigger/teleporter/from_underdark
	icon = 'icons/obj/structures/multiz.dmi'
	icon_state = "stair_u"
	invisibility = 0
	layer = 3.2

/obj/effect/step_trigger/teleporter/from_underdark/Initialize()
	. = ..()
	teleport_x = x
	teleport_y = y
	for(var/z_num in using_map.zlevels)
		var/datum/map_z_level/Z = using_map.zlevels[z_num]
		if(Z.name == "Asteroid Topside")
			teleport_z = Z.z


//Landmark Definitions
/obj/effect/landmark/map_data/arfs
	height = 3

/obj/effect/landmark/map_data/serenity
    height = 4

/obj/effect/landmark/map_data/mining
    height = 2

//Mist like on the Endeavour
/obj/effect/mist/mapped
	name = "mist"
	icon = 'content_arfs/icons/misc/effects.dmi'
	icon_state = "mist"

/obj/effect/mist/mapped/moving
	icon_state = "mist_moving"

//Trash piles should be below the items you find in them
/obj/structure/trash_pile
	layer = 2.9
//Dance pole
/obj/structure/dancepole
	name = "dance pole"
	desc = "Engineered for your entertainment"
	icon = 'icons/obj/objects_vr.dmi'
	icon_state = "dancepole"
	density = 0
	anchored = 1

/obj/structure/dancepole/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(O.is_wrench())
		anchored = !anchored
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
		if(anchored)
			to_chat(user, "<font color='blue'>You secure \the [src].</font>")
		else
			to_chat(user, "<font color='blue'>You unsecure \the [src].</font>")


//Chemistry 'chemavator'
// /obj/machinery/smartfridge/chemistry/chemvator
// 	name = "\improper Smart Chemavator - Upper"
// 	desc = "A refrigerated storage unit for medicine and chemical storage. Now sporting a fancy system of pulleys to lift bottles up and down."
// 	var/obj/machinery/smartfridge/chemistry/chemvator/attached

// /obj/machinery/smartfridge/chemistry/chemvator/down/Destroy()
// 	attached = null
// 	return ..()

// /obj/machinery/smartfridge/chemistry/chemvator/down
// 	name = "\improper Smart Chemavator - Lower"

// /obj/machinery/smartfridge/chemistry/chemvator/down/Initialize()
// 	. = ..()
// 	var/obj/machinery/smartfridge/chemistry/chemvator/above = locate(/obj/machinery/smartfridge/chemistry/chemvator,get_zstep(src,UP))
// 	if(istype(above))
// 		above.attached = src
// 		attached = above
// 		item_records = attached.item_records
// 	else
// 		to_chat(world,"<span class='danger'>[src] at [x],[y],[z] cannot find the unit above it!</span>")
