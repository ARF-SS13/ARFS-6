
/datum/trait/negative/speed_slow
	name = "Slowdown"
	desc = "Allows you to move slower on average than baseline."
	cost = -3
	var_changes = list("slowdown" = 0.5)

/datum/trait/negative/speed_slow_plus
	name = "Major Slowdown"
	desc = "Allows you to move MUCH slower on average than baseline."
	cost = -5
	var_changes = list("slowdown" = 1.0)

/datum/trait/negative/weakling
	name = "Weakling"
	desc = "Causes heavy equipment to slow you down more when carried."
	cost = -1
	var_changes = list("item_slowdown_mod" = 1.5)

/datum/trait/negative/weakling_plus
	name = "Major Weakling"
	desc = "Allows you to carry heavy equipment with much more slowdown."
	cost = -2
	var_changes = list("item_slowdown_mod" = 2.0)

/datum/trait/negative/endurance_low
	name = "Low Endurance"
	desc = "Reduces your maximum total hitpoints to 75."
	cost = -2
	var_changes = list("total_health" = 75)

/datum/trait/negative/endurance_low/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.setMaxHealth(S.total_health)

/datum/trait/negative/endurance_very_low
	name = "Extremely Low Endurance"
	desc = "Reduces your maximum total hitpoints to 50."
	cost = -3 //Teshari HP. This makes the person a lot more suseptable to getting stunned, killed, etc.
	var_changes = list("total_health" = 50)

/datum/trait/negative/endurance_very_low/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.setMaxHealth(S.total_health)

/datum/trait/negative/minor_brute_weak
	name = "Minor Brute Weakness"
	desc = "Increases damage from brute damage sources by 15%"
	cost = -1
	var_changes = list("brute_mod" = 1.15)

/datum/trait/negative/brute_weak
	name = "Brute Weakness"
	desc = "Increases damage from brute damage sources by 25%"
	cost = -2
	var_changes = list("brute_mod" = 1.25)

/datum/trait/negative/brute_weak_plus
	name = "Major Brute Weakness"
	desc = "Increases damage from brute damage sources by 50%"
	cost = -3
	var_changes = list("brute_mod" = 1.5)

/datum/trait/negative/minor_burn_weak
	name = "Minor Burn Weakness"
	desc = "Increases damage from burn damage sources by 15%"
	cost = -1
	var_changes = list("burn_mod" = 1.15)

/datum/trait/negative/burn_weak
	name = "Burn Weakness"
	desc = "Increases damage from burn damage sources by 25%"
	cost = -2
	var_changes = list("burn_mod" = 1.25)

/datum/trait/negative/burn_weak_plus
	name = "Major Burn Weakness"
	desc = "Increases damage from burn damage sources by 50%"
	cost = -3
	var_changes = list("burn_mod" = 1.5)

/datum/trait/negative/conductive
	name = "Conductive"
	desc = "Increases your susceptibility to electric shocks by 50%"
	cost = -2
	var_changes = list("siemens_coefficient" = 1.5) //This makes you a lot weaker to tasers.

/datum/trait/negative/conductive_plus
	name = "Major Conductive"
	desc = "Increases your susceptibility to electric shocks by 100%"
	cost = -3
	var_changes = list("siemens_coefficient" = 2.0) //This makes you extremely weak to tasers.

/datum/trait/negative/photosensitive
	name = "Photosensitive"
	desc = "Increases stun duration from flashes and other light-based stuns."
	cost = -1
	var_changes = list("flash_mod" = 2.0)

/datum/trait/negative/hollow
	name = "Hollow Bones/Aluminum Alloy"
	desc = "Your bones and robot limbs are much easier to break."
	cost = -2 //I feel like this should be higher, but let's see where it goes

/datum/trait/negative/hollow/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	for(var/obj/item/organ/external/O in H.organs)
		O.min_broken_damage *= 0.5
		O.min_bruised_damage *= 0.5

/datum/trait/negative/lightweight
	name = "Lightweight"
	desc = "Your light weight and poor balance make you very susceptible to unhelpful bumping. Think of it like a bowling ball versus a pin."
	cost = -2
	var_changes = list("lightweight" = 1)

/datum/trait/negative/photosensitive
	name = "Photosensitive"
	desc = "Increases stun duration from flashes and other light-based stuns."
	cost = -1
	var_changes = list("flash_mod" = 2.0)

/datum/trait/negative/photosensitive_plus
	name = "Major Photosensitive"
	desc = "Increases stun duration from flashes and other light-based stuns."
	cost = -2
	var_changes = list("flash_mod" = 3.0)

/datum/trait/negative/dual_weakness_weak
	name = "Dual Weakness (Minor)"
	desc = "Combines Minor Burn Weakness and Minor Brute Weakness. Does not return as many trait points as a trade off for freeing up a trait slot."
	cost = -1
	var_changes = list("burn_mod" = 1.15, "brute_mod" = 1.15)

/datum/trait/negative/dual_weakness
	name = "Dual Weakness"
	desc = "Combines Burn Weakness and Brute Weakness. Does not return as many trait points as a trade off for freeing up a trait slot."
	cost = -3
	var_changes = list("burn_mod" = 1.25, "brute_mod" = 1.25)

/datum/trait/negative/dual_weakness_plus
	name = "Dual Weakness (Major)"
	desc = "Combines Major Burn Weakness and Major Brute Weakness. Does not return as many trait points as a trade off for freeing up a trait slot."
	cost = -4
	var_changes = list("burn_mod" = 1.5, "brute_mod" = 1.5)

/datum/trait/negative/cancer
	name = "Late Stage Radiation Sickness"
	desc = "Why? Why would you do this to yourself? +50% damage from brute & burn, -50% health, 300% weakness to flashes, Makes bones much easier to break, Makes you twice as vulnerable to electric shock, and makes you easier to knock over."
	cost = -10
	var_changes = list("burn_mod" = 1.5, "brute_mod" = 1.5, "flash_mod" = 3.0, "lightweight" = 0, "siemens_coefficient" = 2.0, "total_health" = 50)

/datum/trait/negative/cancer/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.setMaxHealth(S.total_health)

/datum/trait/negative/cancer/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	for(var/obj/item/organ/external/O in H.organs)
		O.min_broken_damage *= 0.5
		O.min_bruised_damage *= 0.5
