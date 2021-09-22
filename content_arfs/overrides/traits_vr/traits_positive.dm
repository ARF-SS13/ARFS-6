
/datum/trait/positive/speed_fast
	name = "Haste"
	desc = "Allows you to move faster on average than baseline."
	cost = 3
	var_changes = list("slowdown" = -0.5)

/datum/trait/positive/speed_fast_plus
	name = "Major Haste"
	desc = "Allows you to move MUCH faster on average than baseline."
	cost = 5
	var_changes = list("slowdown" = -1.0)

/datum/trait/positive/hardy
	name = "Hardy"
	desc = "Allows you to carry heavy equipment with less slowdown."
	cost = 1
	var_changes = list("item_slowdown_mod" = 0.5)

/datum/trait/positive/hardy_plus
	name = "Major Hardy"
	desc = "Allows you to carry heavy equipment with almost no slowdown."
	cost = 2
	var_changes = list("item_slowdown_mod" = 0.1)

/datum/trait/positive/endurance_high
	name = "High Endurance"
	desc = "Increases your maximum total hitpoints to 125"
	cost = 2
	var_changes = list("total_health" = 125)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		H.setMaxHealth(S.total_health)

/datum/trait/positive/endurance_very_high
	name = "Very High Endurance"
	desc = "Increases your maximum total hitpoints to 150"
	cost = 3
	var_changes = list("total_health" = 150)

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		H.setMaxHealth(S.total_health)

/datum/trait/positive/nonconductive
	name = "Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by a 25% amount."
	cost = 2 //This effects tasers!
	var_changes = list("siemens_coefficient" = 0.75)

/datum/trait/positive/nonconductive_plus
	name = "Major Non-Conductive"
	desc = "Decreases your susceptibility to electric shocks by a 50% amount."
	cost = 3 //Let us not forget this effects tasers!
	var_changes = list("siemens_coefficient" = 0.5)

/datum/trait/positive/darksight
	name = "Darksight"
	desc = "Allows you to see a short distance in the dark."
	cost = 1
	var_changes = list("darksight" = 3)

/datum/trait/positive/darksight_plus
	name = "Darksight (Major)"
	desc = "Allows you to see in the dark for the whole screen."
	cost = 2
	var_changes = list("darksight" = 7)

/datum/trait/positive/melee_attack
	name = "Sharp Melee"
	desc = "Provides sharp melee attacks that do slightly more damage."
	cost = 1
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp))

/datum/trait/positive/melee_attack_fangs
	name = "Sharp Melee & Numbing Fangs"
	desc = "Provides sharp melee attacks that do slightly more damage, along with fangs that makes the person bit unable to feel their body or pain."
	cost = 2
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp, /datum/unarmed_attack/bite/sharp/numbing))

/datum/trait/positive/minor_brute_resist
	name = "Minor Brute Resist"
	desc = "Adds 15% resistance to brute damage sources."
	cost = 1
	var_changes = list("brute_mod" = 0.85)

/datum/trait/positive/brute_resist
	name = "Brute Resist"
	desc = "Adds 25% resistance to brute damage sources."
	cost = 2
	var_changes = list("brute_mod" = 0.75)

/datum/trait/positive/brute_resist_plus
	name = "Major Brute Resist"
	desc = "Adds 50% resistance to brute damage sources."
	cost = 3
	var_changes = list("brute_mod" = 0.5)

/datum/trait/positive/minor_burn_resist
	name = "Minor Burn Resist"
	desc = "Adds 15% resistance to burn damage sources."
	cost = 1
	var_changes = list("burn_mod" = 0.85)

/datum/trait/positive/burn_resist
	name = "Burn Resist"
	desc = "Adds 25% resistance to burn damage sources."
	cost = 2
	var_changes = list("burn_mod" = 0.75)

/datum/trait/positive/burn_resist_plus
	name = "Major Burn Resist"
	desc = "Adds 50% resistance to burn damage sources."
	cost = 3
	var_changes = list("burn_mod" = 0.5)

/datum/trait/positive/photoresistant
	name = "Photoresistant"
	desc = "Decreases stun duration from flashes and other light-based stuns and disabilities by 50%"
	cost = 1
	var_changes = list("flash_mod" = 0.5)

/datum/trait/positive/winged_flight
	name = "Winged Flight"
	desc = "Allows you to fly by using your wings."
	cost = 2 //Some in game value.

/datum/trait/positive/winged_flight/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/flying_toggle
	H.verbs |= /mob/living/proc/start_wings_hovering

/datum/trait/positive/hardfeet
	name = "Hard Feet"
	desc = "Makes your nice clawed, scaled, hooved, armored, or otherwise just awfully calloused feet immune to glass shards."
	cost = 1
	var_changes = list("flags" = NO_MINOR_CUT) //Checked the flag is only used by shard stepping.
/*
/datum/trait/positive/thermal_vision
	name = "Thermal Vision"
	desc = "Allows you to see heat. Neat!"
	cost = 3

/datum/trait/positive/thermal_vision/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	spawn(5) //Yay, race conditions
		if(!H.vis_enabled)
			H.vis_enabled = list()
		if(H.plane_holder)
			H.plane_holder.set_vis(1, TRUE) //VIS_FULLBRIGHT
			H.plane_holder.set_vis(23, TRUE) //VIS_CLOAKED
			H.vis_enabled += 1
			H.vis_enabled += 23
		if(H.species)
			H.species.flash_mod = H.species.flash_mod += 1
*/