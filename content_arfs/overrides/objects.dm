/obj/item/weapon/gripper
	can_hold = list(
		/obj/item/weapon/cell,
		/obj/item/weapon/airlock_electronics,
		/obj/item/weapon/tracker_electronics,
		/obj/item/weapon/module/power_control,
		/obj/item/weapon/stock_parts,
		/obj/item/frame,
		/obj/item/weapon/camera_assembly,
		/obj/item/weapon/tank,
		/obj/item/weapon/circuitboard,
		/obj/item/weapon/smes_coil,
		/obj/item/weapon/fuel_assembly						//Lets drones and cyborgs start the R-UST engine
		)

//Lets any mob that knows galcom read papers
/obj/item/weapon/paper/show_content(var/mob/user, var/forceshow=0)
	if(!((GLOB.all_languages[LANGUAGE_GALCOM] in user.languages) || istype(user, /mob/observer/dead) || istype(user, /mob/living/silicon)) && !forceshow)
		user << browse("<HTML><HEAD><TITLE>[name]</TITLE></HEAD><BODY>[stars(info)][stamps]</BODY></HTML>", "window=[name]")
		onclose(user, "[name]")
	else
		user << browse("<HTML><HEAD><TITLE>[name]</TITLE></HEAD><BODY>[info][stamps]</BODY></HTML>", "window=[name]")
		onclose(user, "[name]")

//Lets mobs walk across these tables at the expense of a missing sprite if they flip them. Oh no.
/obj/structure/table/darkglass
	flipped = 0
/obj/structure/table/fancyblack
	flipped = 0
