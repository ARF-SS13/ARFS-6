/mob/living/simple_mob/caclien
	name = "xenomorph drone"
	icon = 'content_arfs/icons/mob/mobs/alien.dmi'
	icon_state = "aliendrone"
	var/icon_husk = "aliendrone_husk"
	icon_rest = "aliendrone_sleep"
	icon_dead = "aliendrone_dead"
	icon_gib = "alien_gib"
	tt_desc = "xenomorph XX121"
	attack_sound = 'sound/weapons/rapidslice.ogg'
//	hud_used = /datum/hud_data/caclien
	health = 100
	maxHealth = 100
	attack_armor_pen = 0
	attack_sharp = TRUE
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
	sight = SEE_INFRA|SEE_MOBS|SEE_SELF
	var/datum/xeno_species/species_datum = null
	var/default_species = /datum/xeno_species/drone
	var/phoron_stored = 0
	var/step_tracker = 0 //Increases by 1 when you move. Used to track movement sounds.
	var/breath_tracker = 0 //Used to track breathing sounds
	var/xeno_suffix = null
	var/xeno_prefix = null
	var/is_unique = FALSE //Won't generate a random name for them. Only set to true on specific subtypes.
	var/tamed_hands = FALSE //Can we pick normal stuff up rather than just facehuggers and other xeno stuff.
//	var/can_pickup = list(/obj/item)
	var/spitting = FALSE
	var/last_spit = 0
	var/spit_name
	var/spit_projectile

//Wild enemy/antag aliens
/mob/living/simple_mob/caclien/wild
	faction = "xenomorph"
	name = "don't spawn me"

/mob/living/simple_mob/caclien/wild/drone
	default_species = /datum/xeno_species/drone
	icon_state = "aliendrone"
	name = "xenomorph drone"

/mob/living/simple_mob/caclien/wild/hunter
	default_species = /datum/xeno_species/hunter
	icon_state = "alienhunter"
	name = "xenomorph hunter"

/mob/living/simple_mob/caclien/wild/sentinel
	default_species = /datum/xeno_species/sentinel
	icon_state = "aliensentinel"
	name = "xenomorph sentinel"

/mob/living/simple_mob/caclien/wild/runner
	default_species = /datum/xeno_species/runner
	icon_state = "alienrunner"
	name = "xenomorph runner"

/mob/living/simple_mob/caclien/wild/queen
	default_species = /datum/xeno_species/queen
	icon_state = "alienqueen"
	name = "xenomorph queen"

//Friendly or otherwise docile aliens
/mob/living/simple_mob/caclien/tamed
	faction = "neutral"
	name = "don't spawn me"
	xeno_prefix = "tamed "
	tamed_hands = TRUE

/mob/living/simple_mob/caclien/tamed/drone
	default_species = /datum/xeno_species/drone
	icon_state = "aliendrone"
	name = "xenomorph drone"

/mob/living/simple_mob/caclien/tamed/hunter
	default_species = /datum/xeno_species/hunter
	icon_state = "alienhunter"
	name = "xenomorph hunter"

/mob/living/simple_mob/caclien/tamed/sentinel
	default_species = /datum/xeno_species/sentinel
	icon_state = "aliensentinel"
	name = "xenomorph sentinel"

/mob/living/simple_mob/caclien/tamed/runner
	default_species = /datum/xeno_species/runner
	icon_state = "alienrunner"
	name = "xenomorph runner"

/mob/living/simple_mob/caclien/tamed/queen
	default_species = /datum/xeno_species/queen
	icon_state = "alienqueen"
	name = "xenomorph queen"

/mob/living/simple_mob/caclien/Initialize()
	. = ..()
	step_tracker = rand(0,1)
	breath_tracker = rand(0,4)
	if(species_datum == null && default_species)
		species_datum = new default_species(src)
	var/datum/xeno_species/SD = species_datum
	if(SD)
		UpdateSpeciesIcons() //Set living/dead/resting icons for its species
		mob_size = SD.size //Set the size var
		if(!is_unique)
			if(!xeno_suffix)
				xeno_suffix = " ([rand(1,2000)])"
			UpdateName()
			resize(SD.default_size_mult) //Resize them if applicable
		for(var/A in SD.abilities)
			verbs |= A
		movement_cooldown = SD.move_delay
		melee_damage_upper = SD.melee_damage*1.25
		melee_damage_lower = SD.melee_damage*0.75

/mob/living/simple_mob/caclien/update_icon()
	. = ..()
	UpdateSpeciesIcons()
	if(stat == DEAD)
		if(fireloss > maxHealth/2)
			icon_state = "[icon_husk]"
		else
			icon_state = "[icon_dead]"
	else if(resting || sleeping)
		icon_state = "[icon_rest]"
	else
		icon_state = "[icon_living]"

/mob/living/simple_mob/caclien/Life()
	if(stat != DEAD)
		nutrition = 3000
		if(sleeping > 0)
			sleeping = max(0, sleeping--)

	if(species_datum)
		var/datum/xeno_species/SD = species_datum
		var/turf/T = get_turf(src)
		var/datum/gas_mixture/ourair = T.air
		if(stat != DEAD)
			breath_tracker++
			if(breath_tracker >= 4 && SD && prob(50))
				if(T.air && ourair.total_moles)//Only make breathing sounds if there's air to breathe
					var/breathsound = pick(SD.breath_sounds)
					if(breathsound)
						var/sneakmod = 1
						if(m_intent == "walk")//Trying to be quiet
							sneakmod = SD.sneak_effectiveness
						playsound(src, breathsound, (SD.breath_sounds_vol)/(sneakmod), 0, (SD.breath_sounds_range)/(sneakmod), 1)
				breath_tracker = 0
			//Handle regenerating phoron and health while on weeds and not
			if(phoron_stored < SD.phoron_max || health < maxHealth)
				var/on_weeds = FALSE
				var/phoron_mod = 0.25 //No weeds = 0.25, Weeds = 1
				var/health_mod = 0.25
				if(!istype(T, /turf/space) && T && T.contents.Find(/obj/effect/alien/weeds))
					on_weeds = TRUE
				if(on_weeds)
					phoron_mod = 1
					health_mod = 1
				if(ourair.gas[phoron] >= 0.5)
					phoron_mod = phoron_mod*2
				if(resting || sleeping)
					health_mod = health_mod*2
				phoron_stored = clamp(phoron_stored+(SD.phoron_regen*phoron_mod),0,SD.phoron_max)
				if(bodytemperature < maxbodytemp*1.5)//Don't heal if we're burning alive
					health = clamp(health+(SD.healthRegen*health_mod),-maxHealth, maxHealth)
	. = ..()

/mob/living/simple_mob/caclien/Moved(atom/old_loc, direction, forced = FALSE)
	. = ..()
	step_tracker++
	if(step_tracker >= 2 && !stat && species_datum)
		var/datum/xeno_species/SD = species_datum
		var/stepsound
		if(isturf(loc) && !is_floating)
			if(istype(loc,/turf/simulated/floor/water))//Walking through water
				stepsound = pick(SD.move_sounds_water)
			else//fallback to a normal step sound
				stepsound = pick(SD.move_sounds)
		if(istype(loc,/obj/machinery/atmospherics) && step_tracker >= 8)
			stepsound = pick(SD.move_sounds_vent)
		if(stepsound)
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
		if(D.isElectrified())
			if(!D.justzap)
				if(D.shock(src, 100))
					to_chat(src, "<span class='danger'>You feel a powerful shock course through your body!</span>")
					D.justzap = 1
					spawn (10)
						D.justzap = 0
					return
			else
				return
		if(!D.locked && !D.welded && !D.operating)
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

/mob/living/simple_mob/caclien/proc/UpdateName()
	var/datum/xeno_species/SD = species_datum
	if(!SD)
		return
	name = "[SD.species_name] [SD.sub_name]"
	if(xeno_prefix)
		name = "[xeno_prefix][name]"
	if(xeno_suffix)
		name = "[name][xeno_suffix]"
	real_name = name

//Handles evolving into different species
/mob/living/simple_mob/caclien/proc/XenoEvolve(var/datum/xeno_species/XS)
	if(!XS)
		return
	var/datum/xeno_species/OXS = species_datum
	species_datum = new XS()
	for(var/OA in OXS.abilities)
		verbs -= OA
	for(var/NA in XS.abilities)
		verbs |= NA
	if(phoron_stored > XS.phoron_max)
		phoron_stored = XS.phoron_max
	species_datum = XS

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

//Adjusts the weird purple color to a more black/blue one
/obj/structure/alien
	color = "#39373d"
/obj/structure/bed/nest
	color = "#39373d"
/obj/structure/alien/membrane
	color = "#39373d"
/obj/structure/alien/wall
	color = "#39373d"
/obj/effect/alien/weeds/node
	color = "#39373d"
	set_color = "#39373d"
/obj/effect/alien/weeds
	color = "#39373d"

/obj/effect/alien/weeds/node/Initialize(var/mapload, var/node, var/newcolor)
	. = ..()
	if(isspace(loc))
		return INITIALIZE_HINT_QDEL

	linked_node = node
	if(newcolor)
		color = newcolor

	if(icon_state == "weeds")
		icon_state = pick("weeds", "weeds1", "weeds2")
	playsound(src, pick(X_SOUND_WEED_GROW), 50, 1)
	fullUpdateWeedOverlays()

/obj/effect/alien/weeds/Initialize(var/mapload, var/node, var/newcolor)
	. = ..()
	if(isspace(loc))
		return INITIALIZE_HINT_QDEL

	linked_node = node
	if(newcolor)
		color = newcolor

	if(icon_state == "weeds")
		icon_state = pick("weeds", "weeds1", "weeds2")

	playsound(src, pick(X_SOUND_WEED_GROW), 50, 1)
	fullUpdateWeedOverlays()

/obj/effect/alien/weeds/Destroy()
	var/turf/T = get_turf(src)
	loc = null
	for (var/obj/effect/alien/weeds/W in range(1,T))
		W.updateWeedOverlays()
	linked_node = null
	playsound(src, pick(X_SOUND_RESINHIT), 50, 1)
	return ..()

/obj/structure/alien/Destroy()
	playsound(src, pick(X_SOUND_RESINHIT), 50, 1)
	..()
