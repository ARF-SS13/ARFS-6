//ABILITIES//

/mob/living/simple_mob/caclien/proc/check_alien_ability(var/cost,var/needs_foundation)	//Returns 1 if the ability is clear for usage.
	if(phoron_stored < cost)
		to_chat(src, "<span class='danger'>You don't have enough phoron stored to do that.</span>")
		return 0

	if(needs_foundation)
		var/turf/T = get_turf(src)
		var/has_foundation = TRUE
		if(T)
			if(istype(T,/turf/space) || istype(T,/turf/simulated/floor/water))
				has_foundation = FALSE
		if(!has_foundation)
			to_chat(src, "<span class='danger'>You need a solid foundation to do that on.</span>")
			return 0

	phoron_stored -= cost
	return 1


/mob/living/simple_mob/caclien/proc/Plant()
	set name = "Plant Weeds (50)"
	set desc = "Plants down a node which spreads alien weeds."
	set category = "Abilities"
	if(!species_datum)
		return
	if(check_alien_ability(50,1))
		visible_message("<span class='alium'><B>[src] excretes a glowing node of weeds!</B></span>")
		new /obj/effect/alien/weeds/node(get_turf(src), null, species_datum.construct_color)
	return

/mob/living/simple_mob/caclien/proc/Spit(var/atom/A)
	if((last_spit + 1 SECONDS) > world.time)
		to_chat(src, "<span class='warning'>You have not yet prepared your chemical glands. You must wait before spitting again.</span>")
		return
	else
		last_spit = world.time

	if(spitting && incapacitated(INCAPACITATION_DISABLED))
		to_chat(src, "You cannot spit in your current state.")
		spitting = FALSE
		return
	else if(spitting)
		if(!check_alien_ability(20,0))
			spitting = FALSE
			return
		visible_message("<span class='warning'>[src] spits [spit_name] at \the [A]!</span>", "<span class='alium'>You spit [spit_name] at \the [A].</span>")
		var/obj/item/projectile/P = new spit_projectile(get_turf(src))
		P.firer = src
		P.old_style_target(A)
		P.fire()
		playsound(src, 'sound/weapons/alien_spitacid.ogg', 25, 0)

/mob/living/simple_mob/caclien/proc/neurotoxin()
	set name = "Toggle Neurotoxic Spit (40)"
	set desc = "Readies a neurotoxic spit, which paralyzes the target for a short time if they are not wearing protective gear."
	set category = "Abilities"

	if(spitting)
		to_chat(src, "<span class='alium'>You stop preparing to spit.</span>")
		spitting = 0
		return

	if(!check_alien_ability(40,0,O_ACID))
		spitting = 0
		return

	else
		last_spit = world.time
		spitting = 1
		spit_projectile = /obj/item/projectile/energy/neurotoxin
		spit_name = "neurotoxin"
		to_chat(src, "<span class='alium'>You prepare to spit neurotoxin.</span>")

/mob/living/simple_mob/caclien/proc/acidspit()
	set name = "Toggle Acid Spit (50)"
	set desc = "Readies an acidic spit, which burns the target if they are not wearing protective gear."
	set category = "Abilities"

	if(spitting)
		to_chat(src, "<span class='alium'>You stop preparing to spit.</span>")
		spitting = 0
		return

	if(!check_alien_ability(50,0))
		spitting = 0
		return

	else
		last_spit = world.time
		spitting = 1
		spit_projectile = /obj/item/projectile/energy/acid
		spit_name = "acid"
		to_chat(src, "<span class='alium'>You prepare to spit acid.</span>")
