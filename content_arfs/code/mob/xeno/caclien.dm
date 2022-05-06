/mob/living/simple_mob/caclien
	name = "xenomorph drone"
	icon = 'content_arfs/icons/mob/mobs/alien.dmi'
	icon_state = "aliendrone"
	var/icon_husk = "aliendrone_husk"
	icon_rest = "aliendrone_sleep"
	icon_dead = "aliendrone_dead"
	icon_gib = "alien_gib"
	tt_desc = "xenomorph XX121"
//	hud_used = /datum/hud_data/caclien
	health = 100
	maxHealth = 100
	movement_cooldown = 2
	has_hands = TRUE
	see_in_dark = 7
	seedarkness = 0
	vore_active = TRUE
	min_oxy = 0
	max_co2 = 0
	max_tox = 0
	minbodytemp = 30
	melee_damage_upper = 25
	melee_damage_lower = 15
	var/datum/xeno_species/species_datum = null
	var/plasma = 0
	var/step_tracker = 0 //Increases by 1 when you move. Used to track movement sounds.
	var/breath_tracker = 0 //Used to track breathing sounds
	var/xeno_suffix = null
	var/xeno_prefix = null
	var/is_unique = FALSE //Won't override their name/desc/suffix/prefix/etc while evolving. Only set to true on specific subtypes.

//Wild enemy/antag aliens
/mob/living/simple_mob/caclien/wild
	faction = "xenomorph"

/mob/living/simple_mob/caclien/wild/drone
	species_datum = /datum/xeno_species/drone
	icon_state = "aliendrone"

/mob/living/simple_mob/caclien/wild/hunter
	species_datum = /datum/xeno_species/hunter
	icon_state = "alienhunter"

/mob/living/simple_mob/caclien/wild/sentinel
	species_datum = /datum/xeno_species/sentinel
	icon_state = "aliensentinel"

/mob/living/simple_mob/caclien/wild/runner
	species_datum = /datum/xeno_species/runner
	icon_state = "alienrunner"

/mob/living/simple_mob/caclien/wild/queen
	species_datum = /datum/xeno_species/queen
	icon_state = "alienqueen"

//Friendly or otherwise docile aliens
/mob/living/simple_mob/caclien/tamed
	faction = "neutral"
	is_unique = TRUE

/mob/living/simple_mob/caclien/tamed/drone
	species_datum = /datum/xeno_species/drone
	icon_state = "aliendrone"

/mob/living/simple_mob/caclien/tamed/hunter
	species_datum = /datum/xeno_species/hunter
	icon_state = "alienhunter"

/mob/living/simple_mob/caclien/tamed/sentinel
	species_datum = /datum/xeno_species/sentinel
	icon_state = "aliensentinel"

/mob/living/simple_mob/caclien/tamed/runner
	species_datum = /datum/xeno_species/runner
	icon_state = "alienrunner"

/mob/living/simple_mob/caclien/tamed/queen
	species_datum = /datum/xeno_species/queen
	icon_state = "alienqueen"

/mob/living/simple_mob/caclien/Initialize()
	if(species_datum == null)
		species_datum = new /datum/xeno_species/drone()
	else
		species_datum = new species_datum()
	var/datum/xeno_species/SD = species_datum
	UpdateSpeciesIcons() //Set living/dead/resting icons for its species
	mob_size = SD.size //Set the size var
	if(!is_unique)
		if(!xeno_suffix)
			xeno_suffix = " ([rand(1,2000)])"
		UpdateName(SD)
		resize(SD.default_size_mult) //Resize them if applicable
	for(var/A in SD.abilities)
		verbs |= A
	step_tracker = rand(0,1)
	breath_tracker = rand(0,4)
	movement_cooldown = SD.move_delay
	. = ..()

/mob/living/simple_mob/caclien/update_icon()
	. = ..()
	UpdateSpeciesIcons()
	if(stat == DEAD)
		if(fireloss > maxHealth/2)
			icon_state = "[icon_husk]"
		else
			icon_state = "[icon_dead]"
	else if(resting)
		icon_state = "[icon_rest]"
	else
		icon_state = "[icon_living]"

/mob/living/simple_mob/caclien/Life()
	if(species_datum)
		var/datum/xeno_species/SD = species_datum
		if(stat != DEAD)
			breath_tracker++
			if(breath_tracker >= 4 && SD)
				var/turf/T = get_turf(src)
				var/datum/gas_mixture/ourair = T.air
				if(T.air && ourair.total_moles)//Only make breathing sounds if there's air to breathe
					var/breathsound = pick(SD.breath_sounds)
					if(breathsound)
						var/sneakmod = 1
						if(m_intent == "walk")//Trying to be quiet
							sneakmod = SD.sneak_effectiveness
						playsound(src, breathsound, (SD.breath_sounds_vol)/(sneakmod), 0, (SD.breath_sounds_range)/(sneakmod), 1)
				breath_tracker = 0
			//Handle regenerating plasma and health while on weeds and not
//			var/turf/T = get_turf(src)
//			if(T)
			if(plasma < SD.plasma_max)
				plasma = clamp(plasma+SD.plasma_regen,0,SD.plasma_max)
	. = ..()

/mob/living/simple_mob/caclien/Moved(atom/old_loc, direction, forced = FALSE)
	. = ..()
	step_tracker++
	if(step_tracker >= 2 && !stat && species_datum)
		var/datum/xeno_species/SD = species_datum
		var/stepsound = pick(SD.move_sounds)
		if(stepsound && isturf(loc) && !is_floating)
			var/sneakmod = 1
			if(m_intent == "walk")//Trying to be quiet
				sneakmod = SD.sneak_effectiveness
			playsound(src, stepsound, (SD.move_sounds_vol)/(sneakmod), 0, (SD.move_sounds_range)/(sneakmod), 1)
		step_tracker = 0

//Override to stop attacking while grabbing
/mob/living/simple_mob/caclien/UnarmedAttack(var/atom/A, var/proximity)
	if(is_incorporeal())
		return 0

	if(!ticker)
		to_chat(src, "You cannot attack people before the game has started.")
		return 0

	if(stat)
		return 0

	if(istype(A,/obj/machinery/door/airlock) && (a_intent == I_GRAB || a_intent == I_DISARM))
		var/obj/machinery/door/airlock/D = A
		if(!D.locked && !D.welded && (D.can_open() || D.can_close()))
			playsound(D, 'sound/machines/door/airlock_creaking.ogg', 100, 1, volume_channel = VOLUME_CHANNEL_DOORS)
			custom_emote(1,"digs their claws into [D]...")
			if(do_after(src, 5 SECONDS, A))
				if(D.locked || D.welded)
					to_chat(src,"<span class='warning'>\the [D] won't budge!</span>")
					return
				else if(D.can_open())
					custom_emote(1,"pries open [A]!")
					D.open(1)
					return
				else if(D.can_close())
					custom_emote(1,"forces [A] closed!")
					D.close(1)
					return
			else
				return //You stopped opening/closing the airlock
		else
			to_chat(src,"<span class='warning'>[D] won't budge!</span>")
			return

	if(has_hands && istype(A,/obj) && a_intent != I_HURT)
		var/obj/O = A
		return O.attack_hand(src)

	switch(a_intent)
		if(I_HELP)
			if(isliving(A))
				custom_emote(1,"[pick(friendly)] \the [A]!")

		if(I_HURT)
			if(can_special_attack(A) && special_attack_target(A))
				return

			else if(melee_damage_upper == 0 && istype(A,/mob/living))
				custom_emote(1,"[pick(friendly)] \the [A]!")

			else
				attack_target(A)

		if(I_GRAB)
			if(has_hands)
				A.attack_hand(src)
			else
				if(isliving(A) && vore_active)//Don't attack what you're eating
					animal_nom(A)
				else
					attack_target(A)
		if(I_DISARM)
			if(has_hands)
				A.attack_hand(src)
			else
				attack_target(A)
	return 1

/mob/living/simple_mob/caclien/proc/UpdateSpeciesIcons()
	var/datum/xeno_species/SD = species_datum
	if(!SD)
		return
	icon_living = "alien[SD.sub_name]"
	icon_dead = "[icon_living]_dead"
	icon_rest = "[icon_living]_sleep"
	icon_husk = "[icon_living]_husked"
	return

/mob/living/simple_mob/caclien/proc/UpdateName(var/datum/xeno_species/XS)
	if(!XS || is_unique)
		return FALSE
	if(xeno_prefix)
		name = "[xeno_prefix][XS.species_name] [XS.sub_name]"
	if(xeno_suffix)
		name = "[name][xeno_suffix]"
	real_name = name

//Handles evolving into different species
/mob/living/simple_mob/caclien/proc/XenoEvolve(var/datum/xeno_species/XS)
	if(!XS)
		return
	var/datum/xeno_species/OXS = species_datum
	for(var/OA in OXS.abilities)
		verbs -= OA
	for(var/NA in XS.abilities)
		verbs |= NA
	if(plasma > XS.plasma_max)
		plasma = XS.plasma_max
	species_datum = XS

/datum/xeno_species
	var/species_name = "xenomorph"
	var/sub_name = "drone"
	var/size = MOB_MEDIUM
	var/default_size_mult = 1
	var/maxHealth = 100
	var/move_delay = 2 //Higher is slower. 2 is normal speed
	var/growth_max = 100 //Number of Life() procs before they can evolve
	var/evolves_into = list() //List of things this species can evolve into
	var/plasma_max = 100 //Amount of plasma (mana) they have for abilities
	var/plasma_regen = 10 //Amount of plasma regenerated per Life()
	var/move_sounds = list('content_arfs/sound/alien/effects/step1.ogg','content_arfs/sound/alien/effects/step2.ogg','content_arfs/sound/alien/effects/step3.ogg','content_arfs/sound/alien/effects/step4.ogg','content_arfs/sound/alien/effects/step5.ogg','content_arfs/sound/alien/effects/step6.ogg','content_arfs/sound/alien/effects/step7.ogg','content_arfs/sound/alien/effects/step8.ogg','content_arfs/sound/alien/effects/step9.ogg')
	var/move_sounds_vol = 25
	var/move_sounds_range = 0 // How much farther away or closer than 7 this sound can be heard
	var/death_sounds = list('sound/voice/hiss6.ogg')
	var/talk_sounds = list()
	var/attack_sounds = list()
	var/breath_sounds = list('content_arfs/sound/alien/voice/lowHiss1.ogg','content_arfs/sound/alien/voice/lowHiss2.ogg','content_arfs/sound/alien/voice/lowHiss3.ogg','content_arfs/sound/alien/voice/lowHiss4.ogg')
	var/breath_sounds_vol = 25
	var/breath_sounds_range = -3
	var/sneak_effectiveness = 2 //Divides sound range and volume by this much while walking/sneaking. Less than 1 will invert this effect. Don't do that.
	var/melee_damage = 20 //Average melee damage dealt. Varies up/down by 50%
	var/list/abilities = list(/mob/living/proc/ventcrawl)
	var/construct_color = "#39373D" //Color of weeds, walls, etc
	var/light_color = "#000000" //Color of the light that nodes give off
	var/body_color = "#000000" //Color of the xeno's bodies. Unused

/datum/xeno_species/drone
	sub_name = "drone"
	sneak_effectiveness = 1.5

/datum/xeno_species/hunter
	sub_name = "hunter"
	maxHealth = 150
	sneak_effectiveness = 2.5
	move_sounds_range = -2
	move_delay = 1.75

/datum/xeno_species/sentinel
	sub_name = "sentinel"
	maxHealth = 125
	sneak_effectiveness = 1.75

/datum/xeno_species/runner
	sub_name = "runner"
	maxHealth = 75
	sneak_effectiveness = 2.25
	move_sounds_range = -1
	move_delay = 1.5

/datum/xeno_species/queen
	sub_name = "queen"
	maxHealth = 200
	sneak_effectiveness = 1.25
	list/abilities = list()
	move_sounds_range = 7
	default_size_mult = 2
	move_delay = 3

/datum/hud_data/caclien
	icon = 'icons/mob/screen1_alien.dmi'
	has_a_intent =  1
	has_m_intent =  1
	has_warnings =  1
	has_hands =     1
	has_drop =      1
	has_throw =     1
	has_resist =    1
	has_pressure =  0
	has_nutrition = 0
	has_bodytemp =  0
	has_internals = 0

	gear = list(
		"storage1" =     list("loc" = ui_storage1,  "name" = "Left Pocket",  "slot" = slot_l_store,   "state" = "pocket"),
		"storage2" =     list("loc" = ui_storage2,  "name" = "Right Pocket", "slot" = slot_r_store,   "state" = "pocket"),
		) //Removed hat and outer slots, it caused too many problems that required admin intervention.
