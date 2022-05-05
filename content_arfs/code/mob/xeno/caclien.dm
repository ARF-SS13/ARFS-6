/mob/living/simple_mob/caclien
	name = "xenomorph drone"
	icon = 'content_arfs/icons/mob/mobs/alien.dmi'
	icon_state = "aliendrone"
	tt_desc = "xenomorph XX121"
	hud_used = /datum/hud_data/caclien
	health = 100
	maxHealth = 100
	movement_cooldown = 2
	var/base_icon_state = "alien" //Can make different colored aliens in the future. Or a single recolorable icon.
	var/xeno_species = "drone"
	var/datum/xeno_species/species_datum = null
	var/plasma = 0
	var/xeno_abilities = list()
	var/step_tracker = 0 //Increases by 1 when you move. Used to track movement sounds.

//Wild enemy/antag aliens
/mob/living/simple_mob/caclien/wild
	faction = "xenomorph"
/mob/living/simple_mob/caclien/wild/drone
	species_datum = /datum/xeno_species/drone
/mob/living/simple_mob/caclien/wild/hunter
	species_datum = /datum/xeno_species/hunter
/mob/living/simple_mob/caclien/wild/sentinel
	species_datum = /datum/xeno_species/sentinel
/mob/living/simple_mob/caclien/wild/runner
	species_datum = /datum/xeno_species/runner
/mob/living/simple_mob/caclien/wild/queen
	species_datum = /datum/xeno_species/queen

//Friendly or otherwise docile aliens
/mob/living/simple_mob/caclien/tamed
	faction = "neutral"
/mob/living/simple_mob/caclien/tamed/drone
	species_datum = /datum/xeno_species/drone
/mob/living/simple_mob/caclien/tamed/hunter
	species_datum = /datum/xeno_species/hunter
/mob/living/simple_mob/caclien/tamed/sentinel
	species_datum = /datum/xeno_species/sentinel
/mob/living/simple_mob/caclien/tamed/runner
	species_datum = /datum/xeno_species/runner
/mob/living/simple_mob/caclien/tamed/queen
	species_datum = /datum/xeno_species/queen

/mob/living/simple_mob/caclien/Initialize()
	UpdateSpeciesIcons() //Set living/dead/resting icons for its species
	if(!species_datum)
		species_datum = new /datum/xeno_species/drone(src)
	else
		species_datum = new(src)
	mob_size = species_datum.size//Calculate mob size
	. = ..()

/mob/living/simple_mob/caclien/update_icon()
	. = ..()

/mob/living/simple_mob/caclien/Life()
	if(species_datum)
		var/datum/xeno_species/SD = species_datum
		if(stat != DEAD)
			if(prob(33))
				var/breathsound = pick(SD.breath_sounds)
				if(breathsound)
					playsound(src, breathsound, SD.breath_sounds_vol, 0, SD.breath_sounds_range, 1)
			//Handle regenerating plasma and health while on weeds and not
//			var/turf/T = get_turf(src)
//			if(T)
			if(plasma < SD.plasma_max)
				plasma = clamp(plasma+SD.plasma_regen,0,SD.plasma_max)
	. = ..()

/mob/living/simple_mob/caclien/Moved(atom/old_loc, direction, forced = FALSE)
	. = ..()
	step_tracker++
	if(step_tracker%2 && !stat && species_datum)
		var/datum/xeno_species/SD = species_datum
		var/stepsound = pick(SD.move_sounds)
		if(stepsound)
			playsound(src, stepsound, SD.move_sounds_vol, 0, SD.move_sounds_range, 1)
	else
		step_tracker = 0

/mob/living/simple_mob/caclien/proc/UpdateSpeciesIcons()
	if(!xeno_species || xeno_species == "")
		xeno_species = "drone" //Fallback to drone just in case
	icon_living = "alien[xeno_species]"
	icon_dead = "[icon_living]_dead"
	return TRUE

//Handles evolving into different species
/mob/living/simple_mob/caclien/proc/XenoEvolve(var/datum/xeno_species/XS)
	if(!XS)
		return
	if(plasma > XS.plasma_max)
		plasma = XS.plasma_max
	species_datum = XS

/datum/xeno_species
	var/species_name = "xenomorph"
	var/species_sub_name = "drone"
	var/size = MOB_MEDIUM
	var/maxHealth = 100
	var/move_delay = 2 //Higher is slower. 2 is normal speed
	var/growth_max = 100 //Number of Life() procs before they can evolve
	var/evolves_into = list() //List of things this species can evolve into
	var/plasma_max = 100 //Amount of plasma (mana) they have for abilities
	var/plasma_regen = 10 //Amount of plasma regenerated per Life()
	var/move_sounds = list('content_arfs/sound/alien/effects/step1.ogg','content_arfs/sound/alien/effects/step2.ogg','content_arfs/sound/alien/effects/step3.ogg','content_arfs/sound/alien/effects/step4.ogg','content_arfs/sound/alien/effects/step5.ogg','content_arfs/sound/alien/effects/step6.ogg','content_arfs/sound/alien/effects/step7.ogg','content_arfs/sound/alien/effects/step8.ogg','content_arfs/sound/alien/effects/step9.ogg')
	var/move_sounds_vol = 33
	var/move_sounds_range = 3 // How much farther away or closer than 7 this sound can be heard
	var/death_sounds = list('sound/voice/hiss6.ogg')
	var/talk_sounds = list()
	var/attack_sounds = list()
	var/breath_sounds = list('content_arfs/sound/alien/voice/lowHiss1.ogg','content_arfs/sound/alien/voice/lowHiss2.ogg','content_arfs/sound/alien/voice/lowHiss3.ogg','content_arfs/sound/alien/voice/lowHiss4.ogg')
	var/breath_sounds_vol = 33
	var/breath_sounds_range = -3
	var/sneak_effectiveness = 2 //Divides sound range and volume by this much while walking/sneaking. Less than 1 will invert this effect. Don't do that.

/datum/xeno_species/drone
	species_sub_name = "drone"
	sneak_effectiveness = 1.5

/datum/xeno_species/hunter
	species_sub_name = "hunter"
	maxHealth = 150
	sneak_effectiveness = 2.5

/datum/xeno_species/sentinel
	species_sub_name = "sentinel"
	maxHealth = 125
	sneak_effectiveness = 1.75

/datum/xeno_species/runner
	species_sub_name = "runner"
	maxHealth = 75
	sneak_effectiveness = 2.25

/datum/xeno_species/queen
	species_sub_name = "queen"
	maxHealth = 200
	sneak_effectiveness = 1.25

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
