	//Andyman105
/obj/item/device/communicator/andy
	icon = 'content_arfs/icons/obj/device/andy_communcator.dmi'

/obj/item/device/gps/owen
	gps_tag = "OWEN"
	desc = "A specialized extended range GPS device"
	long_range = TRUE
	hide_signal = FALSE
	can_hide_signal = TRUE

/* needs a rework, commented so the game compiles
/obj/item/weapon/commcard/owen
	name = "\improper Owen GPS cartridge"
	ui_templates = list(list("name" = "Integrated GPS", "template" = "arfs_gps_access.tmpl"))

/obj/item/weapon/commcard/owen/New()
	..()
	internal_devices |= new /obj/item/device/gps/owen(src)
	internal_devices |= new /obj/item/device/resizer(src)

/obj/item/weapon/commcard/owen/get_data()

	var/intgps[0] // Gps devices within the commcard -- Allow tag edits, turning on/off, etc
	var/extgps[0] // Gps devices not inside the commcard -- Print locations if a gps is on
	var/stagps[0] // Gps net status, location, whether it's on, if it's got long range
	var/obj/item/device/gps/cumulative = new(src)
	cumulative.tracking = FALSE
	cumulative.local_mode = TRUE // Won't detect long-range signals automatically
	cumulative.long_range = FALSE
	var/list/toggled_gps = list() // List of GPS units that are turned off before display_list() is called

	for(var/obj/item/device/gps/G in internal_devices)
		var/gpsdata[0]
		if(G.tracking && !G.emped)
			cumulative.tracking = TRUE // Turn it on
			if(G.long_range)
				cumulative.long_range = TRUE // It can detect long-range
				if(!G.local_mode)
					cumulative.local_mode = FALSE // It is detecting long-range

		gpsdata["ref"] = "\ref[G]"
		gpsdata["tag"] = G.gps_tag
		gpsdata["power"] = G.tracking
		gpsdata["local_mode"] = G.local_mode
		gpsdata["long_range"] = G.long_range
		gpsdata["hide_signal"] = G.hide_signal
		gpsdata["can_hide"] = G.can_hide_signal

		intgps[++intgps.len] = gpsdata // Add it to the list

		if(G.tracking)
			G.tracking = FALSE // Disable the internal gps units so they don't show up in the report
			toggled_gps += G

	var/list/remote_gps = cumulative.display_list() // Fetch information for all units except the ones inside of this device

	for(var/obj/item/device/gps/G in toggled_gps) // Reenable any internal GPS units
		G.tracking = TRUE

	stagps["enabled"] = cumulative.tracking
	stagps["long_range_en"] = (cumulative.long_range && !cumulative.local_mode)
	stagps["local_mode"] = cumulative.local_mode
	stagps["my_area_name"] = remote_gps["my_area_name"]
	stagps["curr_x"] = remote_gps["curr_x"]
	stagps["curr_y"] = remote_gps["curr_y"]
	stagps["curr_z"] = remote_gps["curr_z"]
	stagps["curr_z_name"] = remote_gps["curr_z_name"]

	extgps = remote_gps["gps_list"] // Compiled by the GPS

	qdel(cumulative) // Don't want spare GPS units building up in the contents

	return list(
			list("field" = "gps_access", "value" = intgps),
			list("field" = "gps_signal", "value" = extgps),
			list("field" = "gps_status", "value" = stagps)
			)

/obj/item/weapon/commcard/owen/Topic(href, href_list)
	// GPS units
	if(href_list["gps_target"])
		var/obj/item/device/gps/G = locate(href_list["gps_target"])

		if(!istype(G)) // Ref is no longer valid
			return

		if(G.loc != src) // No longer within the cartridge
			return

		switch(href_list["gps_action"])
			if("Power")
				G.tracking = text2num(href_list["value"])

			if("Long_Range")
				G.local_mode = text2num(href_list["value"])

			if("Hide_Signal")
				G.hide_signal = text2num(href_list["value"])

			if("Tag")
				var/mob/user = locate(href_list["user"])
				if(!istype(user)) // Ref no longer valid
					return

				var/newTag = input(user, "Please enter desired tag.", G.gps_tag) as text|null

				if(newTag)
					G.gps_tag = newTag

		if(href_list["active_category"])
			internal_data["supply_category"] = href_list["active_category"]

/obj/item/device/resizer
	name = "resizer"
	desc = "A hand-held body resizer"
	icon_state = "health"
	item_state = "healthanalyzer"
	throwforce = 3
	w_class = ITEMSIZE_SMALL
	var/cooldown_timer = 300
	var/cooldown = 0

/obj/item/device/resizer/New()
	..()

/obj/item/device/resizer/attack(mob/living/H, mob/living/user)
	if (!(ishuman(user) || ticker) && ticker.mode.name != "monkey")
		to_chat(usr, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return
	if (H != user)
		to_chat(usr, "<span class='warning'>You should really only use this on yourself...</span>")
		return
	if (!cooldown)
		var/size_name = input(user, "Pick a Size") in watch_player_sizes_list
		if (size_name && watch_player_sizes_list[size_name] && !cooldown)
			if(size_name=="Macro" && H.size_multiplier == 2)
				return
			else if(size_name == "Big" && H.size_multiplier == 1.5)
				return
			else if(size_name == "Normal" && H.size_multiplier == 1)
				return
			else if(size_name == "Small" && H.size_multiplier == 0.5)
				return
			else
				cooldown = 1
				H.resize(watch_player_sizes_list[size_name])
				user.visible_message("<span class='notice'>[user] begins to change size!</span>", "<span class='notice'>You begin to change size! You are now [size_name].</span>")
				sleep(cooldown_timer)
				cooldown = 0
	else
		to_chat(user, "<span class='warning'>Your resizer is still recharging.</span>")
*/
/datum/nifsoft/sizechange/andy
	name = "Extreme Mass Alteration"
	desc = "A system that allows one to change their size, through drastic mass rearrangement. Causes significant wear when installed."
	list_pos = NIF_SIZECHANGE
	cost = 10000
	wear = 0
	illegal = TRUE

/datum/nifsoft/sizechange/andy/activate()
	if((. = ..()))
		var/new_size = input("Put the desired size", "Set Size", 300) as num

		if (new_size < 1)
			to_chat(nif.human,"<span class='notice'>The safety features of the NIF Program prevent you from choosing this size.</span>")
			return
		else
			nif.human.resize(new_size/100, TRUE, TRUE, TRUE)
			to_chat(nif.human,"<span class='notice'>You set the size to [new_size]%</span>")

		nif.human.visible_message("<span class='warning'>Swirling grey mist envelops [nif.human] as they change size!</span>","<span class='notice'>Swirling streams of nanites wrap around you as you change size!</span>")

		spawn(0)
			deactivate()

/datum/nifsoft/sizechange/andy/deactivate(force = FALSE)
	if((. = ..()))
		return TRUE

/datum/nifsoft/sizechange/andy/stat_text()
	return "Change Size"

/obj/item/weapon/disk/nifsoft/sizechange/andy
	name = "NIFSoft Uploader - Extreme Mass Alteration"
	desc = "Contains a specialized Mass Alteration NIFSoft.\n\
	It has a small label: \n\
	\"Portable NIFSoft Installation Media. \n\
	Align ocular port with eye socket and depress red plunger.\""
	icon_state = "engineering"
	stored = /datum/nifsoft/sizechange/andy

//
// Size Gun
//

/obj/item/weapon/gun/energy/sizegun/andy
	name = "modified size gun"
	desc = "A highly advanced ray gun with a knob on the side to adjust the size you desire. Warning: Do not insert into mouth."
	icon = 'icons/obj/gun_vr.dmi'
	icon_state = "sizegun-shrink100" // Someone can probably do better. -Ace
	item_state = null
	fire_sound = 'sound/weapons/wave.ogg'
	charge_cost = 240
	projectile_type = /obj/item/projectile/beam/sizelaser
	origin_tech = list(TECH_BLUESPACE = 4)
	modifystate = "sizegun-shrink"
	battery_lock = 1
	size_set_to = 1
	firemodes = list(
		list(mode_name		= "select size",
			projectile_type	= /obj/item/projectile/beam/sizelaser/,
			modifystate		= "sizegun-grow",
			fire_sound		= 'sound/weapons/pulse3.ogg'
		))

/obj/item/weapon/gun/energy/sizegun/andy/New()
	..()

/obj/item/weapon/gun/energy/sizegun/andy/attack_self(mob/user)
	andy_select_size()

/obj/item/weapon/gun/energy/sizegun/andy/consume_next_projectile()
	. = ..()
	var/obj/item/projectile/beam/andysizelaser/G = .
	if(istype(G))
		G.set_size = size_set_to

/obj/item/weapon/gun/energy/sizegun/andy/proc/andy_select_size()
	set name = "Select Size"
	set category = "Object"
	set src in view(1)

	var/size_select = input("Put the desired size", "Set Size", size_set_to * 100) as num
	if(size_select < 1)
		to_chat(usr, "<span class='notice'>Invalid size.</span>")
		return
	size_set_to = (size_select/100)
	to_chat(usr, "<span class='notice'>You set the size to [size_select]%</span>")

//
// Beams for size gun
//

/obj/item/projectile/beam/andysizelaser
	name = "size beam"
	icon_state = "xray"
	nodamage = 1
	damage = 0
	check_armour = "laser"
	var/set_size = 1 //Let's default to 100%

	muzzle_type = /obj/effect/projectile/muzzle/xray
	tracer_type = /obj/effect/projectile/tracer/xray
	impact_type = /obj/effect/projectile/impact/xray

/obj/item/projectile/beam/andysizelaser/on_hit(var/atom/target)
	var/mob/living/M = target
	if(istype(M))
		M.resize(set_size, TRUE, TRUE, FALSE)
		to_chat(M, "<font color='blue'> The beam fires into your body, changing your size!</font>")
		M.updateicon()
		return
	return 1

/obj/item/projectile/beam/andysizelaser/shrink
	set_size = 0.5 //50% of current size

/obj/item/projectile/beam/andysizelaser/grow
	set_size = 2.0 //200% of current size

/obj/item/projectile/beam/andysizelaser/extremegrow
	set_size = 3.0 //300% of current size

/obj/item/projectile/beam/andysizelaser/massivegrow
	set_size = 4.0 //400% of current size

/obj/item/weapon/gun/energy/gun/fluff/dominator/andy
	name = "The Dominator"
	desc = "A heavily modified MWPSB Dominator, with a self-recharging power cell. The weapon can only be fired by the owner and is alert-level locked."
	cell_type = /obj/item/weapon/cell/device/weapon/recharge/alien


/obj/item/weapon/rig/light/hacker/fluff/andy
	name = "oversized cybersuit control module"
	desc = "An oversized RIG suit with custom enhancements for giant individuals. Developed by Dameon Owen for the Owen family."
	req_access = list()
	cell_type = /obj/item/weapon/cell/hyper
	w_class = 4
	rigsuit_max_pressure = 20 * ONE_ATMOSPHERE
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10)
	boot_type = /obj/item/clothing/shoes/magboots/rig/light
	initial_modules = list(
		/obj/item/rig_module/power_sink,
		/obj/item/rig_module/vision/multi,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/rescue_pharm/andy,
		/obj/item/rig_module/sprinter,
		/obj/item/rig_module/teleporter
	)

/obj/item/weapon/rig/light/hacker/fluff/andy/New()
	..()
	cell.self_recharge = 1
	START_PROCESSING(SSobj, cell)

/obj/item/rig_module/rescue_pharm/andy

	max_reagent_volume = 30 //Regen to this volume
	chems_to_use = 5 //Per injection

	charges = list(
		list("Anti-Toxin", "anti_toxin",  0, 30),
		list("Alkysine", "alkysine", 0, 30),
		list("Bicaridine", "bicaridine", 0, 30),
		list("Carthatoline", "carthatoline", 0, 30),
		list("Dermaline", "dermaline", 0, 30),
		list("Dexalin Plus", "dexalinp", 0, 30),
		list("Hyronalin", "hyronalin", 0, 30),
		list("Imidazoline", "imidazoline", 0, 30),
		list("Inaprovaline", "inaprovaline", 0, 30),
		list("Kelotane", "kelotane", 0, 30),
		list("Myelamine", "myelamine", 0, 30),
		list("Oxycodone", "oxycodone", 0, 30),
		list("Peridaxon", "peridaxon", 0, 30),
		list("Spaceacillin", "spaceacillin", 0, 30),
		list("Traumadol", "tramadol", 0, 30),
		list("Tricordrazine", "tricordrazine", 0, 30)
	)
