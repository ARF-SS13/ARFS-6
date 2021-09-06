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
		"c_relay", "m_relay", "r_relay", "sci_o_relay", "ud_relay",
		"science", "medical", "supply", "service", "common", "command", "engineering", "security", "explorer", "unused",
		"hb_relay", "receiverA", "broadcasterA"
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

/obj/item/device/multitool/arfs_buffered/Initialize()
	. = ..()
	buffer = locate(/obj/machinery/telecomms/hub/preset/arfs)
