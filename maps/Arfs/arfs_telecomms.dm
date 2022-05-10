/obj/machinery/telecomms/relay/preset/arfs/one
	id = "ARFS Deck 1 Relay"
	listening_level = Z_LEVEL_ARFS_ONE
	autolinkers = list("arfs_1_relay")

/obj/machinery/telecomms/relay/preset/arfs/two
	id = "ARFS Deck 2 Relay"
	listening_level = Z_LEVEL_ARFS_TWO
	autolinkers = list("arfs_2_relay")

/obj/machinery/telecomms/relay/preset/arfs/three
	id = "ARFS Deck 3 Relay"
	listening_level = Z_LEVEL_ARFS_THREE
	autolinkers = list("arfs_3_relay")

/obj/machinery/telecomms/relay/preset/arfs/serenity

/obj/machinery/telecomms/relay/preset/arfs/serenity/one
	id = "ARFS Serenity Deck 1 Relay"
	listening_level = Z_LEVEL_RESIDENTIAL_STATION_ARFS
	autolinkers = list("arfs_serenity_1_relay")

/obj/machinery/telecomms/relay/preset/arfs/serenity/two
	id = "ARFS Serenity Deck 2 Relay"
	listening_level = Z_LEVEL_RESIDENTIAL_ARFS
	autolinkers = list("arfs_serenity_2_relay")

/obj/machinery/telecomms/relay/preset/arfs/serenity/three
	id = "ARFS Serenity Deck 3 Relay"
	listening_level = Z_LEVEL_RESIDENTIAL_TWO_ARFS
	autolinkers = list("arfs_serenity_3_relay")

/obj/machinery/telecomms/relay/preset/arfs/serenity/four
	id = "ARFS Serenity Deck 4 Relay"
	listening_level = Z_LEVEL_RESIDENTIAL_MANSION_ARFS
	autolinkers = list("arfs_serenity_4_relay")

/obj/machinery/telecomms/relay/preset/arfs/mining_high
	id = "Asteroid Surface Relay"
	listening_level = Z_LEVEL_MINING_ARFS
	autolinkers = list("mining_high")

//Might not use this one, i dunno
/obj/machinery/telecomms/relay/preset/arfs/mining_low
	id = "Asteroid Interior Relay"
	listening_level = Z_LEVEL_MINING_DANGER_ARFS
	autolinkers = list("mining_low")

/obj/machinery/telecomms/relay/preset/arfs/residential
	id = "NCS Serenity Residential Relay"
	listening_level = Z_LEVEL_RESIDENTIAL_ARFS
	autolinkers = list("residential")

/obj/machinery/telecomms/hub/preset/arfs
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub",
		"arfs_1_relay", "arfs_2_relay", "arfs_3_relay", "mining_high", "mining_low", "residential",
		"c_relay", "m_relay", "r_relay", "sci_o_relay", "ud_relay", "shuttle_relay", "drake_relay", "s_relay",
		"science", "medical", "supply", "service", "common", "command", "engineering", "security", "explorer", "unused",
		"hb_relay", "receiverA", "broadcasterA", "arfs_serenity_1_relay", "arfs_serenity_2_relay", "arfs_serenity_3_relay", "arfs_serenity_4_relay"
	)

/obj/machinery/telecomms/receiver/preset_right/arfs
	freq_listening = list(AI_FREQ, SCI_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ, ENG_FREQ, SEC_FREQ, ENT_FREQ, EXP_FREQ)

/obj/machinery/telecomms/bus/preset_two/arfs
	freq_listening = list(SUP_FREQ, SRV_FREQ, EXP_FREQ)

/obj/machinery/telecomms/server/presets/service/arfs
	freq_listening = list(SRV_FREQ, EXP_FREQ)
	autolinkers = list("service", "explorer")

/datum/map/arfs/default_internal_channels()
	return list(
		num2text(PUB_FREQ) = list(),
		num2text(AI_FREQ)  = list(access_synth),
		num2text(ENT_FREQ) = list(),
		num2text(ERT_FREQ) = list(access_cent_specops),
		num2text(COMM_FREQ)= list(access_heads),
		num2text(ENG_FREQ) = list(access_engine_equip, access_atmospherics),
		num2text(MED_FREQ) = list(access_medical_equip),
		num2text(MED_I_FREQ)=list(access_medical_equip),
		num2text(SEC_FREQ) = list(access_security),
		num2text(SEC_I_FREQ)=list(access_security),
		num2text(SCI_FREQ) = list(access_tox,access_robotics,access_xenobiology),
		num2text(SUP_FREQ) = list(access_cargo),
		num2text(SRV_FREQ) = list(access_janitor, access_hydroponics),
		num2text(EXP_FREQ) = list(access_explorer)
	)

/obj/item/device/multitool/arfs_buffered
	name = "pre-linked multitool (Endeavor hub)"
	desc = "This multitool has already been linked to the Endeavor telecomms hub and can be used to configure one (1) relay."

/obj/machinery/telecomms/relay/preset/shuttle
	autolinkers = list("shuttle_relay")
	toggled = 0

/obj/machinery/telecomms/relay/preset/shuttle/drake
	id = "A.R.F.S. Drake Long Range Relay"
	produces_heat = 0
	autolinkers = list("drake_relay")

/obj/item/device/multitool/arfs_buffered/Initialize()
	. = ..()
	buffer = locate(/obj/machinery/telecomms/hub/preset/arfs)

/obj/machinery/exonet_node/relay
	name = "exonet relay"

/proc/can_telecomm(var/atom/A, var/atom/B, var/ad_hoc = FALSE)
	if(!A || !B)
		log_debug("can_telecomm(): Undefined endpoints!")
		return FALSE

	//Can't in this case, obviously!
	if(is_jammed(A) || is_jammed(B))
		return FALSE

	//Items don't have a Z when inside an object or mob
	var/turf/src_z = get_z(A)
	var/turf/dst_z = get_z(B)

	//Nullspace, probably.
	if(!src_z || !dst_z)
		return FALSE

	//We can do the simple check first, if you have ad_hoc radios.
	if(ad_hoc && src_z == dst_z)
		return TRUE
	
	if(src_z in using_map.get_map_levels(dst_z, TRUE, om_range = DEFAULT_OVERMAP_RANGE))
		return TRUE

	//Check the exonet relays
	for(var/obj/machinery/exonet_node/relay/R in machines)
		if(R && R.on && R.allow_external_communicators && R.z == src_z)
			return TRUE

	return FALSE

/proc/get_exonet_node()
	for(var/obj/machinery/exonet_node/E in machines)
		//Don't grab a relay
		if(E.type == /obj/machinery/exonet_node/relay)
			continue
		if(E.on)
			return E