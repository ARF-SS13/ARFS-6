// Author - GremlingSS

// So! Ovipositions, where to start, what to do.
// Multiple approaches we can take.

// Trait allowing players to select an egg type, grab a player and click on a verb to insert eggs into a choice menu of bellies.
// Specific tails will provide the verbs to place eggs in. - Nah.
// Eh, I like this enough anyway, having a living mob verb and a egg type variable with carbons having a more refined verb.

/datum/trait/neutral/oviposition
	name = "Ovipositor"
	desc = "Eggs, eggs, EGGS!"
	cost = 0
	custom_only = FALSE

/datum/trait/neutral/oviposition/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/select_egg_type
	H.verbs |= /mob/living/carbon/proc/insert_egg_into_grabbed