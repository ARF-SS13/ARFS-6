//Pokemon!

//defines moved to arfs_defines.dm

/mob/living/simple_mob/animal/passive/pokemon
	name = "eevee"
	icon_state = "eevee"
	icon_living = "eevee"
	icon_dead = "eevee_d"
	icon_rest = ""
	desc = "Gotta catch 'em all!"
	icon = 'content_arfs/icons/mob/mobs/pokemon.dmi'
	pixel_x = -16
	default_pixel_x = -16
	health = 100
	maxHealth = 100
	max_co2 = 10 //Lets them go outside without dying of co2
	response_help = "pets"
	layer = MOB_LAYER
	vore_active = TRUE
	has_hands = FALSE
	movement_cooldown = 2
	meat_amount = 3
	makes_dirt = FALSE
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	melee_damage_lower = 3
	melee_damage_upper = 9
	universal_understand = TRUE //Until we can fix the inability to tell who is talking over radios and similar bugs, this will work
	var/list/p_types = list()
	var/list/additional_moves = list()
	var/resting_heal_max = 2
	var/is_ditto_transformed = FALSE
	var/on_manifest = FALSE
	var/list/active_moves = list()

/mob/living/simple_mob/animal/passive/pokemon/Initialize()
	. = ..()
	verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_rest
	verbs |= /mob/living/proc/set_flavor_text
	verbs |= /mob/living/proc/set_ooc_notes
	icon_rest = "[icon_state]_rest"
	if(!tt_desc)
		tt_desc = "[capitalize(initial(icon_state))]"//icon_state will be the species if tt_desc isn't set
	voice_name = name
	init_vore()
	add_language(LANGUAGE_GALCOM)
	add_language(LANGUAGE_POKEMON)
	set_default_language(GLOB.all_languages[LANGUAGE_GALCOM])
	give_moves()//Give innate moves/verbs from the additional_moves var
	if(p_types.len)//Give type specific verbs and such
		for(var/T in p_types)
			give_moves(T)

/mob/living/simple_mob/animal/passive/pokemon/Life()
	..()
	rest_regeneration()//Do healing
	updatehealth()//Update health overlay
	if(stat >= DEAD)
		return FALSE
	return TRUE

/mob/living/simple_mob/animal/passive/pokemon/proc/rest_regeneration()
	if(resting && stat < DEAD && health < maxHealth)
		var/heal_amt = rand(0,resting_heal_max)//Average of 1 health per second for normal pmon. 2 for legendaries.
		adjustBruteLoss(-heal_amt)
		adjustOxyLoss(-heal_amt)
		adjustFireLoss(-heal_amt)
		if(health > maxHealth)
			health = maxHealth
		return TRUE
	return FALSE

/mob/living/simple_mob/animal/passive/pokemon/Topic(href, href_list)
	if(href_list["ooc_notes"])
		src.Examine_OOC()
		return 1
	return ..()


/mob/living/simple_mob/animal/passive/pokemon/examine(mob/user)
	if(alpha <= EFFECTIVE_INVIS)
		return src.loc.examine(user) // Returns messages as if they examined wherever the mob was
	var/datum/gender/T = gender_datums[get_visible_gender()]
	var/list/msg = list("<span class='info'>*---------*","This is [bicon(src)] <EM>[src.name]</EM>, a <span class ='red'>Pokemon</span>")
	if(flavor_text)
		msg += "[print_flavor_text()]"
	else
		msg += "[desc]" //If it's just a regular mob, print its usual description instead
	if(ooc_notes)
		msg += "<span class = 'deptradio'>OOC Notes:</span> <a href='?src=\ref[src];ooc_notes=1'>\[View\]</a>"

	if(src.getBruteLoss())
		if(src.getBruteLoss() < 40)
			msg += "<span class='warning'>[T.He] looks bruised.</span>"
		else
			msg += "<span class='warning'><B>[T.He] looks severely bruised and bloodied!</B></span>"
	if(src.getFireLoss())
		if(src.getFireLoss() < 40)
			msg += "<span class='warning'>[T.He] looks burned.</span>"
		else
			msg += "<span class='warning'><B>[T.He] looks severely burned.</B></span>"

	msg += examine_bellies()

	if(client && ((client.inactivity / 10) / 60 > 10)) //10 Minutes
		msg += "\[Inactive for [round((client.inactivity/10)/60)] minutes\]"
	else if(disconnect_time)
		msg += "\[Disconnected/ghosted [round(((world.realtime - disconnect_time)/10)/60)] minutes ago\]"

	msg += "<span class='deptradio'><a href='?src=\ref[src];vore_prefs=1'>\[Mechanical Vore Preferences\]</a></span>"

	msg += "*---------*"

	return msg

/mob/living/simple_mob/animal/passive/pokemon/proc/move_rest()
	set name = "Rest"
	set category = "Abilities"
	set desc = "Lie down and rest in order to slowly heal or just relax."
	if(src.flying)
		to_chat(src,"<span class='warning'>You need to land if you want to rest.</span>")
		return
	if(M_GHOSTED in active_moves)
		to_chat(src,"<span class='warning'>You need to rematerialize to benefit from resting.</span>")
		return
	resting = !resting
	to_chat(src,"<span class='notice'>You are now [resting ? "resting" : "getting up"].</span>")
	if(resting && health < maxHealth)
		to_chat(src,"<span class='green'>You feel your wounds mending as you rest.</span>")
	update_canmove()
	update_icon()

/mob/living/simple_mob/animal/passive/pokemon/update_icon()
	. = ..()
	pixel_x = default_pixel_x //If they're somehow reset out of their offset, this will correct them. (grabs do this)

/mob/living/proc/set_ooc_notes()
	set name = "Set OOC Notes"
	set category = "OOC"
	set desc = "Edit your roleplaying preferences; your OOC notes."
	if(usr != src)
		to_chat(usr, "No.")
	var/msg = sanitize(input(usr,"Set your OOC notes. This should contain your roleplaying preferences.","OOC Notes",html_decode(ooc_notes)) as message|null, extra = 0)
	if(msg != null)
		ooc_notes = msg

/mob/living/proc/set_flavor_text()
	set name = "Set Flavortext"
	set category = "IC"
	set desc = "Edit your flavortext; a detailed description of your character."
	if(usr != src)
		to_chat(usr, "No.")
	var/msg = sanitize(input(usr,"Set your character's flavortext; a detailed description of their physical appearance.","Flavortext",html_decode(flavor_text)) as message|null, extra = 0)
	if(msg != null)
		flavor_text = msg

/mob/living/simple_mob/animal/passive/pokemon/is_incorporeal()
	if(M_GHOSTED in active_moves)
		return TRUE
	return ..()

/mob/living/simple_mob/animal/passive/pokemon/can_ztravel()
	if(M_GHOSTED in active_moves)
		return TRUE
	return ..()

/mob/living/simple_mob/animal/passive/pokemon/proc/give_moves(var/typetogive)
	if(!typetogive)
		if(!LAZYLEN(additional_moves))
			return FALSE
		else
			for(var/movetogive in additional_moves)//Give pokemon abilities not connected to their type
				src.verbs |= movetogive
	switch(typetogive)
		if(P_TYPE_ICE)
			src.minbodytemp = 100
			src.heat_damage_per_tick = max(0, (heat_damage_per_tick + 3))
		if(P_TYPE_FIRE)
			src.maxbodytemp = 1000
			src.cold_damage_per_tick = max(0, (heat_damage_per_tick - 3))
		if(P_TYPE_WATER)
			src.aquatic_movement = 1
			src.heat_damage_per_tick = max(0, (heat_damage_per_tick - 3))
		if(P_TYPE_FIGHT)
			src.melee_damage_lower += 3
			src.melee_damage_upper += 3
		if(P_TYPE_FLY)
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_fly
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_hover
		if(P_TYPE_POISON)
			src.max_tox += 199 //can survive in phoron up to 200 moles
		if(P_TYPE_DARK)
			src.see_in_dark += 4
		if(P_TYPE_PSYCH)
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_telepathy
		if(P_TYPE_GHOST)
			src.see_in_dark += 6
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_phase
		else
			return FALSE

/mob/living/simple_mob/animal/passive/pokemon/proc/move_fly()
	set name = "Toggle Flight"
	set desc = "Start or stop flying."
	set category = "Abilities"

	var/mob/living/simple_mob/animal/passive/pokemon/P = src
	if(P.stat || P.resting)
		to_chat(src, "You cannot fly in this state!")
		return

	P.flying = !P.flying
	update_floating()
	to_chat(P, "<span class='notice'>You have [P.flying?"started":"stopped"] flying.</span>")

/mob/living/simple_mob/animal/passive/pokemon/proc/move_hover()
	set name = "Hover"
	set desc = "Allows you to stop gliding and hover."
	set category = "Abilities"

	var/mob/living/simple_mob/animal/passive/pokemon/P = src
	if(!P.flying)
		to_chat(P, "You must be flying to hover!")
		return
	if(P.stat || P.resting)
		to_chat(P, "You cannot hover in your current state!")
		return
	if(P.anchored)
		to_chat(P, "<span class='notice'>You are already hovering and/or anchored in place!</span>")
		return

	if(!P.anchored && !P.pulledby) //Not currently anchored, and not pulled by anyone.
		P.anchored = 1 //This is the only way to stop the inertial_drift.
		update_floating()
		to_chat(P, "<span class='notice'>You hover in place.</span>")
		spawn(6) //.6 seconds.
			P.anchored = 0
	else
		return

/mob/living/simple_mob/animal/passive/pokemon/proc/move_telepathy()
	set name = "Telepathy"
	set desc = "Speak directly to someone you can see, through their mind."
	set category = "Abilities"

	var/mob/living/simple_mob/animal/passive/pokemon/P = src
	if(P.stat)
		to_chat(src, "You can't do that right now!")
		return
	var/list/nearby_mobs = list()
	for(var/mob/living/M in view(P.loc))
		if(isliving(M) && M != P && M.alpha > EFFECTIVE_INVIS)//Living mobs nearby who aren't cloaked/invisible.
			nearby_mobs |= M
	if(!LAZYLEN(nearby_mobs))
		to_chat(P,"<span class='alien'>You focus on your telepathy, but there's nobody nearby to speak to.</span>")
		return
	var/mob/living/T = input(P, "Who would you like to speak telepathically to?", "Choose Target") as null|anything in nearby_mobs
	if(isnull(T) || !isliving(T))
		return
	var/message = sanitize(input(P,"What would you like to say to [T]?", "Telepathic Message") as message|null)
	if(!message)
		return
	if(get_dist(P, T) > world.view)
		to_chat(P,"<span class='alien'>You focus on your telepathy, but your target has moved too far away for them to hear you.</span>")
		return
	visible_message("[P]'s head glows with telepathic energy.", "<span class='alien'><b>You telepathically say to [T]:</b> <i>[message]</i></span>", "<span class='notice'>You hear a quiet humming sound.</span>")
	to_chat(T,"<span class='alien'><b>You hear [P]'s voice in your head:</b> <i>[message]</i></span>")
	log_say("(POKETELEPATHY to [key_name(T)]) [message]", src)

/mob/living/simple_mob/animal/passive/pokemon/proc/move_phase()
	set name = "Phase Shift"
	set desc = "Shift your body into an incorporeal state to pass through walls and other obstacles. Spooky!"
	set category = "Abilities"

	var/turf/T = get_turf(src)
	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,"<span class='warning'>You can't use that here!</span>")
		return FALSE
	if(resting)
		to_chat(src,"<span class='warning'>You can't do that while resting!</span>")
		return
	forceMove(T)
	var/original_canmove = canmove
	SetStunned(0)
	SetWeakened(0)
	if(buckled)
		buckled.unbuckle_mob()
	if(pulledby)
		pulledby.stop_pulling()
	stop_pulling()
	canmove = FALSE

	//Shifting in
	if(M_GHOSTED in active_moves)
		active_moves -= M_GHOSTED
		mouse_opacity = 1
		name = real_name
		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = initial(B.escapable)

		//overlays.Cut()
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		incorporeal_move = initial(incorporeal_move)
		density = initial(density)
		force_max_speed = initial(force_max_speed)
		update_icon()

		//Cosmetics mostly
		alpha = 0
		custom_emote(1,"suddenly materializes.")
		canmove = original_canmove
		alpha = initial(alpha)

		//Potential phase-in vore
		if(can_be_drop_pred) //Toggleable in vore panel
			var/list/potentials = living_mobs(0)
			if(potentials.len)
				var/mob/living/target = pick(potentials)
				if(istype(target) && vore_selected)
					target.forceMove(vore_selected)
					to_chat(target,"<span class='warning'>\The [src] suddenly appears around you, [vore_selected.vore_verb]ing you into their [vore_selected.name]!</span>")
	//Shifting out
	else
		active_moves |= M_GHOSTED
		mouse_opacity = 0
		custom_emote(1,"suddenly dematerializes.")
		name = "Something"

		for(var/belly in vore_organs)
			var/obj/belly/B = belly
			B.escapable = FALSE

		alpha = 0
		invisibility = INVISIBILITY_LEVEL_TWO
		see_invisible = INVISIBILITY_LEVEL_TWO
		//overlays.Cut()
		update_icon()
		alpha = 127

		canmove = original_canmove
		incorporeal_move = TRUE
		density = FALSE
		force_max_speed = TRUE

//Override to stop attacking while grabbing
/mob/living/simple_mob/animal/passive/pokemon/UnarmedAttack(var/atom/A, var/proximity)
	if(is_incorporeal())
		return 0

	if(!ticker)
		to_chat(src, "You cannot attack people before the game has started.")
		return 0

	if(stat)
		return 0

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

/////TEMPLATE/////
/*
/mob/living/simple_mob/animal/passive/pokemon
	name = ""
	icon_state = ""
	icon_living = ""
	icon_dead = ""
*/

/mob/living/simple_mob/animal/passive/pokemon/leg
	icon = 'content_arfs/icons/mob/mobs/legendary.dmi'
	pixel_x = -32
	default_pixel_x = -32
	health = 200
	maxHealth = 200
	meat_amount = 6
	resting_heal_max = 4

/mob/living/simple_mob/animal/passive/pokemon/leg/articuno
	name = "Articuno"
	icon_state = "articuno"
	icon_living = "articuno"
	icon_dead = "articuno_d"
	p_types = list(P_TYPE_ICE, P_TYPE_FLY)
	movement_cooldown = 1

/mob/living/simple_mob/animal/passive/pokemon/leg/rayquaza
	name = "Rayquaza"
	icon_state = "rayquaza"
	icon_living = "rayquaza"
	icon_dead = "rayquaza_d"
	p_types = list(P_TYPE_FLY)
	movement_cooldown = 1



///////////////////////
//ALPHABETICAL PLEASE//
///////////////////////



/mob/living/simple_mob/animal/passive/pokemon/absol
	name = "absol"
	icon_state = "absol"
	icon_living = "absol"
	icon_dead = "absol_d"
	p_types = list(P_TYPE_DARK)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/aggron
	name = "aggron"
	icon_state = "aggron"
	icon_living = "aggron"
	icon_dead = "aggron_d"
	p_types = list(P_TYPE_STEEL)
	movement_cooldown = 5

/mob/living/simple_mob/animal/passive/pokemon/alolanvulpix
	name = "alolan vulpix"
	icon_state = "alolanvulpix"
	icon_living = "alolanvulpix"
	icon_dead = "alolanvulpix_d"
	tt_desc = "Alolan Vulpix"
	p_types = list(P_TYPE_ICE)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/ampharos
	name = "ampharos"
	icon_state = "ampharos"
	icon_living = "ampharos"
	icon_dead = "ampharos_d"
	p_types = list(P_TYPE_ELEC)

/mob/living/simple_mob/animal/passive/pokemon/braixen
	name = "braixen"
	icon_state = "braixen"
	icon_living = "braixen"
	icon_dead = "braixen_d"
	p_types = list(P_TYPE_FIRE)
	additional_moves = list(/mob/living/proc/hide)


/mob/living/simple_mob/animal/passive/pokemon/celebi
	name = "celebi"
	icon_state = "celebi"
	icon_living = "celebi"
	icon_dead = "celebi_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_GRASS)

/mob/living/simple_mob/animal/passive/pokemon/charmander
	name = "charmander"
	icon_state = "charmander"
	icon_living = "charmander"
	icon_dead = "charmander_d"
	p_types = list(P_TYPE_FIRE)

/mob/living/simple_mob/animal/passive/pokemon/ditto
	name = "ditto"
	icon_state = "ditto"
	icon_living = "ditto"
	icon_dead = "ditto_d"
	p_types = list(P_TYPE_NORM)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/dragonair
	name = "dragonair"
	desc = "A Dragonair stores an enormous amount of energy inside its body. It is said to alter the weather around it by loosing energy from the crystals on its neck and tail."
	icon_state = "dragonair"
	icon_living = "dragonair"
	icon_dead = "dragonair_d"
	p_types = list(P_TYPE_DRAGON)
	additional_moves = list(/mob/living/simple_mob/animal/passive/pokemon/proc/move_fly,
							/mob/living/simple_mob/animal/passive/pokemon/proc/move_hover)

/mob/living/simple_mob/animal/passive/pokemon/dragonite
	name = "dragonite"
	desc = "It can circle the globe in just 16 hours. It is a kindhearted Pok�mon that leads lost and foundering ships in a storm to the safety of land."
	icon_state = "dragonite"
	icon_living = "dragonite"
	icon_dead = "dragonite_d"
	p_types = list(P_TYPE_DRAGON, P_TYPE_FLY)

/mob/living/simple_mob/animal/passive/pokemon/dratini
	name = "dratini"
	desc = "A Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels."
	icon_state = "dratini"
	icon_living = "dratini"
	icon_dead = "dratini_d"
	movement_cooldown = 3
	p_types = list(P_TYPE_DRAGON)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/eevee
	name = "eevee"
	desc = "Eevee has an unstable genetic makeup that suddenly mutates due to its environment. Radiation from various stones causes this Pok�mon to evolve."
	icon_state = "eevee"
	icon_living = "eevee"
	icon_dead = "eevee_d"
	p_types = list(P_TYPE_NORM)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/espeon
	name = "espeon"
	desc = "Espeon is extremely loyal to any trainer it considers to be worthy. It is said to have developed precognitive powers to protect its trainer from harm."
	icon_state = "espeon"
	icon_living = "espeon"
	icon_dead = "espeon_d"
	p_types = list(P_TYPE_PSYCH)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/fennekin
	name = "fennekin"
	icon_state = "fennekin"
	icon_living = "fennekin"
	icon_dead = "fennekin_d"
	p_types = list(P_TYPE_FIRE)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/flaaffy
	name = "flaaffy"
	icon_state = "flaaffy"
	icon_living = "flaaffy"
	icon_dead = "flaaffy_d"
	p_types = list(P_TYPE_ELEC)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/flareon
	name = "flareon"
	desc = "Flareon's fluffy fur releases heat into the air so that its body does not get excessively hot. Its body temperature can rise to a maximum of 1,650 degrees F."
	icon_state = "flareon"
	icon_living = "flareon"
	icon_dead = "flareon_d"
	p_types = list(P_TYPE_FIRE)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/furret
	name = "furret"
	icon_state = "furret"
	icon_living = "furret"
	icon_dead = "furret_d"
	p_types = list(P_TYPE_NORM)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/gallade
	name = "gallade"
	icon_state = "gallade"
	icon_living = "gallade"
	icon_dead = "gallade_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FIGHT)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/gardevoir
	name = "gardevoir"
	icon_state = "gardevoir"
	icon_living = "gardevoir"
	icon_dead = "gardevoir_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FAIRY)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/gastly
	name = "gastly"
	desc = "Almost invisible, this gaseous Pok�mon cloaks the target and puts it to sleep without notice."
	icon_state = "gastly"
	icon_living = "gastly"
	icon_dead = "gastly_d"
	p_types = list(P_TYPE_GHOST, P_TYPE_POISON)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/gengar
	name = "gengar"
	desc = "It hides in shadows. It is said that if Gengar is hiding, it cools the area by nearly 10 degrees F."
	icon_state = "gengar"
	icon_living = "gengar"
	icon_dead = "gengar_d"
	p_types = list(P_TYPE_GHOST, P_TYPE_POISON)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/glaceon
	name = "glaceon"
	desc = "By controlling its body heat, it can freeze the atmosphere around it to make a diamond-dust flurry."
	icon_state = "glaceon"
	icon_living = "glaceon"
	icon_dead = "glaceon_d"
	p_types = list(P_TYPE_ICE)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/haunter
	name = "haunter"
	desc = "If you get the feeling of being watched in darkness when nobody is around, Haunter may be there."
	icon_state = "haunter"
	icon_living = "haunter"
	icon_dead = "haunter_d"
	p_types = list(P_TYPE_GHOST, P_TYPE_POISON)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/jolteon
	name = "jolteon"
	desc = "Its cells generate weak power that is amplified by its fur's static electricity to drop thunderbolts. The bristling fur is made of electrically charged needles."
	icon_state = "jolteon"
	icon_living = "jolteon"
	icon_dead = "jolteon_d"
	var/charge_cooldown_time = 100
	var/charge_cooldown = 0
	p_types = list(P_TYPE_ELEC)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/jolteon/attack_hand(mob/user)
	..()
	if(!stat)
		electrocute_mob(user, get_area(src), src, 1)

/mob/living/simple_mob/animal/passive/pokemon/jolteon/attackby(obj/item/weapon/W, mob/user, params)
	electrocute_mob(user, get_area(src), src, W.siemens_coefficient)
	if(!stat && istype(W, /obj/item/weapon/cell))
		var/obj/item/weapon/cell/C = W
		if(charge_cooldown)
			to_chat(user,"<span class='red'>\the [src.name] is recharging!</span>")
			return
		if(C.charge == C.maxcharge)
			to_chat(user,"<span class='red'>[C] is already fully charged!</span>")
			return
		electrocute_mob(user, get_area(src), src, W.siemens_coefficient)
		to_chat(user,"<span class='green'>You charge [C] using [src].</span>")
		var/chargetogive = rand(50,250)
		C.give(chargetogive)
		C.update_icon()
		charge_cooldown = 1
		spawn(charge_cooldown_time)
			charge_cooldown = 0
		return
	..()

/mob/living/simple_mob/animal/passive/pokemon/jolteon/bud
	name = "Bud"

/mob/living/simple_mob/animal/passive/pokemon/kirlia
	name = "kirlia"
	icon_state = "kirlia"
	icon_living = "kirlia"
	icon_dead = "kirlia_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FAIRY)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/larvitar
	name = "larvitar"
	desc = "It is born deep underground. It can't emerge until it has entirely consumed the soil around it."
	icon = 'content_arfs/icons/mob/mobs/pokemon.dmi'
	icon_state = "larvitar"
	icon_living = "larvitar"
	icon_dead = "larvitar_d"
	p_types = list(P_TYPE_ROCK, P_TYPE_GROUND)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/leafeon
	name = "leafeon"
	icon_state = "leafeon"
	icon_living = "leafeon"
	icon_dead = "leafeon_d"
	p_types = list(P_TYPE_GRASS)

/mob/living/simple_mob/animal/passive/pokemon/growlithe
	name = "growlithe"
	icon_state = "growlithe"
	icon_living = "growlithe"
	icon_dead = "growlithe_d"
	p_types = list(P_TYPE_FIRE)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/mareep
	name = "mareep"
	icon_state = "mareep"
	icon_living = "mareep"
	icon_dead = "mareep_d"
	p_types = list(P_TYPE_ELEC)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/mightyena
	name = "mightyena"
	icon_state = "mightyena"
	icon_living = "mightyena"
	icon_dead = "mightyena"
	p_types = list(P_TYPE_DARK)

/mob/living/simple_mob/animal/passive/pokemon/miltank
	name = "miltank"
	icon_state = "miltank"
	icon_living = "miltank"
	icon_dead = "miltank_d"
	p_types = list(P_TYPE_NORM)
	var/datum/reagents/udder = null
	movement_cooldown = 3

/mob/living/simple_mob/animal/passive/pokemon/miltank/Initialize()
	udder = new(50)
	udder.my_atom = src
	..()

/mob/living/simple_mob/animal/passive/pokemon/miltank/Life()
	. = ..()
	if(stat == CONSCIOUS)
		if(udder && prob(5))
			udder.add_reagent("milk", rand(5, 10))

/mob/living/simple_mob/animal/passive/pokemon/miltank/attackby(var/obj/item/O as obj, var/mob/user as mob)
	var/obj/item/weapon/reagent_containers/glass/G = O
	if(stat == CONSCIOUS && istype(G) && G.is_open_container())
		user.visible_message("<span class='notice'>[user] milks [src] using \the [O].</span>")
		var/transfered = udder.trans_id_to(G, "milk", rand(5,10))
		if(G.reagents.total_volume >= G.volume)
			user << "<font color='red'> The udder is dry. Wait a bit longer... </font>"
		if(!transfered)
			user << "<font color='red'> The udder is dry. Wait a bit longer... </font>"
		..()

/mob/living/simple_mob/animal/passive/pokemon/poochyena
	name = "poochyena"
	icon_state = "poochyena"
	icon_living = "poochyena"
	icon_dead = "poochyena_d"
	p_types = list(P_TYPE_DARK)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/sylveon
	name = "sylveon"
	desc = "Sylveon, the Intertwining Pok�mon. Sylveon affectionately wraps its ribbon-like feelers around its Trainer's arm as they walk together."
	icon_state = "sylveon"
	icon_living = "sylveon"
	icon_dead = "sylveon_d"
	response_help  = "pets"
	response_harm   = "hits"
	p_types = list(P_TYPE_FAIRY)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/umbreon
	name = "umbreon"
	icon_state = "umbreon"
	icon_dead = "umbreon_d"
	icon_living = "umbreon"
	p_types = list(P_TYPE_DARK)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/vulpix
	name = "vulpix"
	icon_state = "vulpix"
	icon_living = "vulpix"
	icon_dead = "vulpix_d"
	p_types = list(P_TYPE_FIRE)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/tentacruel
	name = "tentacruel"
	icon_state = "tentacruel"
	icon_living = "tentacruel"
	icon_dead = "tentacruel_d"
	movement_cooldown = 3
	p_types = list(P_TYPE_WATER)

/mob/living/simple_mob/animal/passive/pokemon/ninetales
	name = "ninetales"
	icon_state = "ninetales"
	icon_living = "ninetales"
	icon_dead = "ninetales_d"
	p_types = list(P_TYPE_FIRE)
	additional_moves = list(/mob/living/simple_mob/animal/passive/pokemon/proc/move_telepathy)

/mob/living/simple_mob/animal/passive/pokemon/ponyta
	name = "ponyta"
	icon_state = "ponyta"
	icon_living = "ponyta"
	icon_dead = "ponyta_d"
	p_types = list(P_TYPE_FIRE)

/mob/living/simple_mob/animal/passive/pokemon/zubat
	name = "zubat"
	icon_state = "zubat"
	icon_living = "zubat"
	icon_dead = "zubat_d"
	desc = "Even though it has no eyes, it can sense obstacles using ultrasonic waves it emits from its mouth."
	p_types = list(P_TYPE_FLY, P_TYPE_POISON)

/mob/living/simple_mob/animal/passive/pokemon/tangela
	name = "tangela"
	icon_state = "tangela"
	icon_living = "tangela"
	icon_dead = "tangela_d"
	p_types = list(P_TYPE_GRASS, P_TYPE_POISON)

/mob/living/simple_mob/animal/passive/pokemon/pinsir
	name = "pinsir"
	icon_state = "pinsir"
	icon_living = "pinsir"
	icon_dead = "pinsir_d"
	p_types = list(P_TYPE_BUG)

/mob/living/simple_mob/animal/passive/pokemon/omanyte
	name = "omanyte"
	icon_state = "omanyte"
	icon_living = "omanyte"
	icon_dead = "omanyte_d"
	movement_cooldown = 3
	p_types = list(P_TYPE_ROCK, P_TYPE_WATER)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/magamar
	name = "magamar"
	icon_state = "magamar"
	icon_living = "magamar"
	icon_dead = "magamar_d"
	movement_cooldown = 3
	p_types = list(P_TYPE_FIRE)

/mob/living/simple_mob/animal/passive/pokemon/magicarp
	name = "magicarp"
	icon_state = "magicarp"
	icon_living = "magicarp"
	icon_dead = "magicarp_d"
	movement_cooldown = 5
	p_types = list(P_TYPE_WATER)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/lapras
	name = "lapras"
	icon_state = "lapras"
	icon_living = "lapras"
	icon_dead = "lapras_d"
	movement_cooldown = 3
	p_types = list(P_TYPE_WATER)

/mob/living/simple_mob/animal/passive/pokemon/kabuto
	name = "kabuto"
	icon_state = "Kabuto"
	icon_living = "Kabuto"
	icon_dead = "Kabuto_d"
	p_types = list(P_TYPE_ROCK, P_TYPE_WATER)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/aerodactyl
	name = "aerodactyl"
	icon_state = "Aerodactyl"
	icon_living = "Aerodactyl"
	icon_dead = "Aerodactyl_d"
	p_types = list(P_TYPE_ROCK, P_TYPE_FLY)

/mob/living/simple_mob/animal/passive/pokemon/lickitung
	name = "lickitung"
	icon_state = "lickitung"
	icon_living = "lickitung"
	icon_dead = "lickitung_d"
	p_types = list(P_TYPE_NORM)

/mob/living/simple_mob/animal/passive/pokemon/cubone
	name = "cubone"
	icon_state = "cubone"
	icon_living = "cubone"
	icon_dead = "cubone_d"
	p_types = list(P_TYPE_GROUND)
	additional_moves = list(/mob/living/proc/hide)

/mob/living/simple_mob/animal/passive/pokemon/mewtwo
	name = "mewtwo"
	icon_state = "mewtwo"
	icon_living = "mewtwo"
	icon_dead = "mewtwo_d"
	p_types = list(P_TYPE_PSYCH)
	additional_moves = list(/mob/living/simple_mob/animal/passive/pokemon/proc/move_fly,
							/mob/living/simple_mob/animal/passive/pokemon/proc/move_hover)

/mob/living/simple_mob/animal/passive/pokemon/ralts
	name = "ralts"
	icon_state = "ralts"
	icon_living = "ralts"
	icon_dead = "ralts_d"
	p_types = list(P_TYPE_PSYCH, P_TYPE_FAIRY)

/mob/living/simple_mob/animal/passive/pokemon/snorlax
	name = "snorlax"
	icon_state = "snorlax"
	icon_living = "snorlax"
	icon_dead = "snorlax_d"
	p_types = list(P_TYPE_NORM)

/mob/living/simple_mob/animal/passive/pokemon/vaporeon
	name = "vaporeon"
	icon_state = "vaporeon"
	icon_living = "vaporeon"
	icon_dead = "vaporeon_d"
	p_types = list(P_TYPE_WATER)

///////////////////////
//ALPHABETICAL PLEASE//
///////////////////////
