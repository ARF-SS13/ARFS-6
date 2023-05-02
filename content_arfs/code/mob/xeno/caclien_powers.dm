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

	var/datum/xeno_species/SD = species_datum
	if(!SD)
		return

	if(check_alien_ability(50,1))
		var/obj/O
		var/build_sound = pick(SD.resin_sounds)
		if(build_sound)
			playsound(src, build_sound, 40, 1)
		visible_message("<span class='alium'><B>[src] excretes a glowing node of weeds!</B></span>")
		O = new /obj/effect/alien/weeds/node(get_turf(src), null, species_datum.construct_color)
		O.color = SD.construct_color
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

/mob/living/simple_mob/caclien/proc/Resin()
	set name = "Secrete Resin (75)"
	set desc = "Secrete tough malleable resin."
	set category = "Abilities"

	var/datum/xeno_species/SD = species_datum
	if(!SD)
		return
//	var/list/options = list("resin door","resin wall","resin membrane","nest","resin blob") //Old options
	var/list/options = list("resin wall","resin membrane","nest")
	for(var/option in options)
		LAZYSET(options, option, new /image('icons/mob/alien.dmi', option))

	var/choice = show_radial_menu(src, src, options, radius = 42, require_near = TRUE)

	if(!choice || QDELETED(src) || src.incapacitated())
		return FALSE

	var/turf/targetLoc = get_step(src, dir)

	if(iswall(targetLoc))
		targetLoc = get_turf(src)

	for(var/obj/structure/alien/S in targetLoc.contents)
		to_chat(src, "<span class='warning'>There is already something built there!</span>")
		return FALSE
	for(var/obj/structure/bed/nest/N in targetLoc.contents)
		to_chat(src, "<span class='warning'>There is already something built there!</span>")
		return FALSE

	var/obj/O

	switch(choice)
		if("resin door")
			if(!check_alien_ability(75,1))
				return
			else O = new /obj/structure/simple_door/resin(targetLoc)
		if("resin wall")
			if(!check_alien_ability(75,1))
				return
			else O = new /obj/structure/alien/wall(targetLoc)
		if("resin membrane")
			if(!check_alien_ability(75,1))
				return
			else O = new /obj/structure/alien/membrane(targetLoc)
		if("nest")
			if(!check_alien_ability(75,1))
				return
			else O = new /obj/structure/bed/nest(targetLoc)
		if("resin blob")
			if(!check_alien_ability(75,1))
				return
			else O = new /obj/item/stack/material/resin(targetLoc)

	if(O)
		visible_message("<span class='warning'><B>[src] vomits up a thick substance and begins to shape it!</B></span>", "<span class='alium'>You shape a [choice].</span>")
		O.color = SD.construct_color
		var/build_sound = pick(SD.resin_sounds)
		if(build_sound)
			playsound(src, build_sound, 40, 1)

	return
