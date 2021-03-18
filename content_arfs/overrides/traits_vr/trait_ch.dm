/datum/trait
	var/special_env = FALSE

/datum/trait/proc/handle_environment_special(var/mob/living/carbon/human/H)
	return

/datum/trait/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	ASSERT(S)
	if(var_changes)
		for(var/V in var_changes)
			S.vars[V] = var_changes[V]
	if(special_env)
		S.env_traits += src
	return
/datum/trait/remove(var/datum/species/S)
	ASSERT(S)
	if(special_env)
		S.env_traits -= src
	return

/mob/living/carbon/human
	var/gender_change_cooldown = 0 // A cooldown for gender and gender indentify changing procs to make it easy to avoid spam of gender change
	var/loneliness_stage = 0
	var/next_loneliness_time = 0


/datum/species
	var/list/env_traits = list()
	var/dirtslip = FALSE
	var/photosynthesizing = FALSE
	var/grows = FALSE
	var/shrinks = FALSE
	var/rad_levels = list("safe" = 2.5, "danger_1" = 50, "danger_2" = 75, "danger_3" = 150)
	var/rad_removal_mod = 1
	var/bite_mod = 1
	var/grab_resist_divisor_victims = 1
	var/grab_resist_divisor_self = 1
	var/grab_power_victims = 0
	var/grab_power_self = 0
	var/waking_speed = 1
	var/mudking = FALSE

/datum/species/handle_environment_special(var/mob/living/carbon/human/H)
	for(var/datum/trait/env_trait in env_traits)
		env_trait.handle_environment_special(H)
	return




/mob/living/proc/succubus_bite()
	set name = "Inject Prey"
	set desc = "Bite prey and inject them with various toxins."
	set category = "Abilities"

	if(last_special > world.time)
		return

	if(!ishuman(src))
		return //If you're not a human you don't have permission to do this.

	var/mob/living/carbon/human/C = src

	var/obj/item/weapon/grab/G = src.get_active_hand()

	if(!istype(G))
		to_chat(C, "<span class='warning'>You must be grabbing a creature in your active hand to bite them.</span>")
		return

	var/mob/living/carbon/human/T = G.affecting

	if(!istype(T) || T.isSynthetic())
		to_chat(src, "<span class='warning'>\The [T] is not able to be bitten.</span>")
		return

	if(G.state != GRAB_NECK)
		to_chat(C, "<span class='warning'>You must have a tighter grip to bite this creature.</span>")
		return

	var/choice = input(src, "What do you wish to inject?") as null|anything in list("Aphrodisiac", "Numbing", "Paralyzing")

	last_special = world.time + 600

	if(!choice)
		return

	src.visible_message("<font color='red'><b>[src] moves their head next to [T]'s neck, seemingly looking for something!</b></font>")

	if(do_after(src, 300, T)) //Thrirty seconds.
		if(choice == "Aphrodisiac")
			src.show_message("<span class='warning'>You sink your fangs into [T] and inject your aphrodisiac!</span>")
			src.visible_message("<font color='red'>[src] sinks their fangs into [T]!</font>")
			T.bloodstr.add_reagent("succubi_aphrodisiac",100)
			return 0
		else if(choice == "Numbing")
			src.show_message("<span class='warning'>You sink your fangs into [T] and inject your poison!</span>")
			src.visible_message("<font color='red'>[src] sinks their fangs into [T]!</font>")
			T.bloodstr.add_reagent("numbing_enzyme",20) //Poisons should work when more units are injected
		else if(choice == "Paralyzing")
			src.show_message("<span class='warning'>You sink your fangs into [T] and inject your poison!</span>")
			src.visible_message("<font color='red'>[src] sinks their fangs into [T]!</font>")
			T.bloodstr.add_reagent("succubi_paralize",20) //Poisons should work when more units are injected
		else
			return //Should never happen



