	//Andyman105
/obj/item/device/communicator/andy
	icon = 'content_arfs/icons/obj/device/andy_communcator.dmi'

/obj/item/device/gps/owen
	gps_tag = "OWEN"
	desc = "A specialized extended range GPS device"
	long_range = TRUE
	hide_signal = FALSE
	can_hide_signal = TRUE

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

/datum/nifsoft/sizechange/andy
	name = "Extreme Mass Alteration"
	desc = "A system that allows one to change their size, through drastic mass rearrangement. Causes significant wear when installed."
	list_pos = NIF_SIZECHANGE
	cost = 10000
	wear = 0
	illegal = TRUE

	activate()
		if((. = ..()))
			var/new_size = input("Put the desired size (25-300%)", "Set Size", 300) as num

			if (!ISINRANGE(new_size,25,300))
				to_chat(nif.human,"<span class='notice'>The safety features of the NIF Program prevent you from choosing this size.</span>")
				return
			else
				nif.human.resize(new_size/100)
				to_chat(nif.human,"<span class='notice'>You set the size to [new_size]%</span>")

			nif.human.visible_message("<span class='warning'>Swirling grey mist envelops [nif.human] as they change size!</span>","<span class='notice'>Swirling streams of nanites wrap around you as you change size!</span>")

			spawn(0)
				deactivate()

	deactivate()
		if((. = ..()))
			return TRUE

	stat_text()
		return "Change Size"

/obj/item/weapon/disk/nifsoft/sizechange/andy

	name = "NIFSoft Uploader - Extreme Mass Alteration"

	desc = "Contains a specialized Mass Alteration NIFSoft.\n\

	It has a small label: \n\

	\"Portable NIFSoft Installation Media. \n\

	Align ocular port with eye socket and depress red plunger.\""


	icon_state = "engineering"

	stored = /datum/nifsoft/sizechange/andy