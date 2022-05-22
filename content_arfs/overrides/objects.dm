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

// medkit
/obj/item/weapon/storage/firstaid/regular
	starts_with = list(
		/obj/item/device/healthanalyzer, //ARFS EDIT
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment,
		/obj/item/stack/medical/ointment,
		/obj/item/weapon/storage/pill_bottle/paracetamol )

//Fuzzy cuffs. Why normal timer?
/obj/item/weapon/handcuffs/fuzzy
	desc = "Plastic and easy to break cuffs with soft fuzz on them. Wow, kinky!"
	breakouttime = 100

// Proc: update_active_camera_screen()
// Parameters: None
// Description: This refreshes the camera location
/obj/item/device/communicator/update_active_camera_screen()
	if(!video_source?.can_use())
		show_static()
		return

	var/newturf = get_turf(video_source)
	if(!(get_z(newturf) in using_map.get_map_levels(get_z(src), TRUE)))
		show_static()
		return

	var/obj/item/device/communicator/communicator = video_source.loc
	if(istype(communicator))
		if(communicator.selfie_mode)
			var/mob/target = get(communicator, /mob)
			if(istype(target))
				cam_screen.vis_contents = list(target)
			else
				cam_screen.vis_contents = list(communicator)
			cam_background.fill_rect(1, 1, 1, 1)
			cam_background.icon_state = "clear"
			local_skybox.cut_overlays()
			return

	// If we're not forcing an update for some reason and the cameras are in the same location,
	// we don't need to update anything.
	if(last_camera_turf == newturf)
		return

	// We get a new turf in case they've moved in the last half decisecond (it's BYOND, it might happen)
	last_camera_turf = get_turf(video_source)

	if(!(get_z(last_camera_turf) in using_map.get_map_levels(get_z(src), TRUE)))
		show_static()
		return

	var/list/visible_turfs = list()
	var/list/visible_things = view(video_range, last_camera_turf)
	for(var/turf/visible_turf in visible_things)
		visible_turfs += visible_turf

	cam_screen.vis_contents = visible_turfs
	cam_background.icon_state = "clear"
	cam_background.fill_rect(1, 1, (video_range * 2), (video_range * 2))

	local_skybox.cut_overlays()
	local_skybox.add_overlay(SSskybox.get_skybox(get_z(last_camera_turf)))
	local_skybox.scale_to_view(video_range * 2)
	local_skybox.set_position("CENTER", "CENTER", (world.maxx>>1) - last_camera_turf.x, (world.maxy>>1) - last_camera_turf.y)

/obj/item/weapon/rig/pathfinder
	allowed = list(
		/obj/item/device/flashlight,
		/obj/item/weapon/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/device/t_scanner,
		/obj/item/weapon/pickaxe,
		/obj/item/weapon/rcd,
		/obj/item/weapon/storage/backpack,
		/obj/item/device/bluespaceradio,
		/obj/item/device/defib_kit
		)


//Makes occupied mechs count as hostiles
//Overrides mob_spawner_vr.dm file
/obj/structure/mob_spawner/scanner/process()
	if(!can_spawn())
		return
	if(world.time > last_spawn + spawn_delay)
		var/turf/mainloc = get_turf(src)
		for(var/mob/living/A in range(range,mainloc))
			if ((A.faction != mob_faction) && (A.move_speed < 12))
				var/chosen_mob = choose_spawn()
				if(chosen_mob)
					do_spawn(chosen_mob)
		for(var/obj/mecha/M in range(range,mainloc))
			if(M.occupant)
				var/chosen_mob = choose_spawn()
				if(chosen_mob)
					do_spawn(chosen_mob)