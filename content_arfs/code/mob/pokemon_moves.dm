////MOVE GIVER////

/mob/living/simple_mob/animal/passive/pokemon/proc/give_moves(var/typetogive)
	if(!typetogive)
		if(!LAZYLEN(additional_moves))
			return FALSE
		else
			for(var/movetogive in additional_moves)//Give pokemon abilities not connected to their type
				src.verbs |= movetogive
	switch(typetogive)
		if(P_TYPE_ICE)
			src.minbodytemp = minbodytemp/4
			src.heat_damage_per_tick = max(0, (heat_damage_per_tick*2))
		if(P_TYPE_GRASS)
			src.heat_damage_per_tick = max(0, (heat_damage_per_tick*2))
		if(P_TYPE_FIRE)
			src.maxbodytemp = maxbodytemp*4
			src.cold_damage_per_tick = max(0, (heat_damage_per_tick/2))
		if(P_TYPE_WATER)
			src.aquatic_movement = 1
			src.heat_damage_per_tick = max(0, (heat_damage_per_tick/2))
		if(P_TYPE_FIGHT)
			src.melee_damage_lower += 3
			src.melee_damage_upper += 3
		if(P_TYPE_FLY)
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_fly
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_hover
		if(P_TYPE_POISON)
			src.max_tox += 9999 //can survive in a lot of phoron
		if(P_TYPE_DARK)
			src.see_in_dark += 4
		if(P_TYPE_PSYCH)
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_telepathy
		if(P_TYPE_GHOST)
			src.see_in_dark += 6
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_phase
		if(P_TYPE_ELEC)
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_shocking
		if(P_TYPE_FAIRY)
			src.verbs |= /mob/living/simple_mob/animal/passive/pokemon/proc/move_floral_healing
		if(P_TYPE_STEEL)
			src.max_tox += 99
			src.maxbodytemp = maxbodytemp*2
			src.minbodytemp = minbodytemp/2
			src.maxHealth = maxHealth*1.5 //50% more health
			src.health = health*1.5
			src.heat_damage_per_tick = max(0, (heat_damage_per_tick*2))//melty
		else
			return FALSE

////REST////

/mob/living/simple_mob/animal/passive/pokemon/proc/move_rest()	//Global move that every pokemon knows. Allows them to heal
	set name = "Rest"											//without needing complex medical code.
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

/mob/living/simple_mob/animal/passive/pokemon/proc/rest_regeneration()
	if(resting && stat < DEAD && health < maxHealth)
		//Add a healing effect
		add_overlay(heal_layer)
		//Actually heal the mob
		var/heal_amt = rand(0,resting_heal_max)//Average of 1 health per second for normal pmon. 2 for legendaries.
		adjustBruteLoss(-heal_amt)
		adjustOxyLoss(-heal_amt)
		adjustFireLoss(-heal_amt)
		adjustToxLoss(-heal_amt)
		if(health >= maxHealth)
			health = maxHealth
		return TRUE
	return FALSE

////FLY////

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

////TELEPATHY////

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
	custom_emote(1,"briefly glows with telepathic energy.")
	to_chat(src,"<span class='alien'><b>You telepathically say to [T]:</b> <i>[message]</i></span>")
	to_chat(T,"<span class='alien'><b>You hear [P]'s voice in your head:</b> <i>[message]</i></span>")
	for (var/mob/G in player_list)
		if (istype(G, /mob/new_player))
			continue
		else if(isobserver(G) && G.is_preference_enabled(/datum/client_preference/ghost_ears))
			if(is_preference_enabled(/datum/client_preference/whisubtle_vis) || G.client.holder)
				to_chat(G, "<span class='alien'><b>[src] telepathically says to [T]:</b> <i>[message]</i></span>")
	log_say("(POKETELEPATHY to [key_name(T)]) [message]", src)

////INVISIBILITY////

/mob/living/simple_mob/animal/passive/pokemon/proc/move_invisibility()
	set name = "Invisibility (10s)"
	set desc = "Instantly mask your presence or reappear at will!"
	set category = "Abilities"

	if(move_cooldown)
		to_chat(src, "<span class='warning'>You need to wait before using another ability!</span>")
		return FALSE
	if((M_GHOSTED in active_moves) || stat || resting)
		to_chat(src, "<span class='warning'>You can't use this ability right now!</span>")
		return FALSE

	if(M_INVIS in active_moves)
		active_moves -= M_INVIS
		mouse_opacity = 1
		name = real_name
		//overlays.Cut()
		invisibility = initial(invisibility)
		see_invisible = initial(see_invisible)
		incorporeal_move = initial(incorporeal_move)
		update_icon()
		alpha = 0
		custom_emote(1,"suddenly appears!")
		alpha = initial(alpha)
		move_cooldown = TRUE //Start the cooldown after they shift back in
		spawn(move_cooldown_time)
			move_cooldown = FALSE
			to_chat(src,"<span class='green'>You're ready to use an ability again.</span>")
	else
		active_moves |= M_INVIS
		mouse_opacity = 0
		custom_emote(1,"suddenly disappears.")
		name = "Something"
		alpha = 0
		invisibility = INVISIBILITY_LEVEL_TWO
		see_invisible = INVISIBILITY_LEVEL_TWO
		//overlays.Cut()
		update_icon()
		alpha = 127

////PHASE SHIFT / GHOST ////

/mob/living/simple_mob/animal/passive/pokemon/proc/move_phase()
	set name = "Phase Shift (10s)"
	set desc = "Shift your body into an incorporeal state to pass through walls and other obstacles. Spooky!"
	set category = "Abilities"
	if(move_cooldown)
		to_chat(src, "<span class='warning'>You need to wait before using another ability!</span>")
		return FALSE
	var/turf/T = get_turf(src)
	if(!T.CanPass(src,T) || loc != T)
		to_chat(src,"<span class='warning'>You can't use that here!</span>")
		return FALSE
	if(resting && !(M_GHOSTED in active_moves))//Let them un-ghost if they're stuck resting and ghosted somehow
		to_chat(src,"<span class='warning'>You can't do that while resting!</span>")
		return FALSE
	if(stat)
		to_chat(src,"<span class='warning'>You can't do that in your condition!</span>")
		return FALSE
	if(M_INVIS in active_moves)
		to_chat(src,"<span class='warning'>You can't do that while invisible!</span>")
		return FALSE
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

		//Start the cooldown after they shift back in
		move_cooldown = TRUE
		spawn(move_cooldown_time)
			move_cooldown = FALSE
			to_chat(src,"<span class='green'>You're ready to use an ability again.</span>")

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

//// FLORAL HEALING ////

/mob/living/simple_mob/animal/passive/pokemon/proc/move_floral_healing()
	set name = "Floral Healing (20s)"
	set desc = "Heal a nearby creature."
	set category = "Abilities"

	if(stat)
		to_chat(src, "<span class='warning'>Can't use that ability in your state!</span>")
		return FALSE
	else if(M_GHOSTED in active_moves)
		to_chat(src, "<span class='warning'>You can't use that while phase shifted!</span>")
		return FALSE
	else if(move_cooldown)
		to_chat(src, "<span class='warning'>You need to wait before using another ability!</span>")
		return FALSE

	var/list/viewed = oview(1)
	var/list/targets = list()
	for(var/mob/living/L in viewed)
		targets += L
	if(!targets.len)
		to_chat(src,"<span class='warning'>Nobody nearby to mend!</span>")
		return FALSE

	var/mob/living/target = tgui_input_list(src,"Pick someone to mend:","Mend Other", targets)
	if(!target)
		return FALSE
	move_cooldown = TRUE
	spawn(move_cooldown_time*2)//Longer cooldown
		move_cooldown = FALSE
		to_chat(src,"<span class='green'>You're ready to use an ability again.</span>")
	target.add_modifier(/datum/modifier/pokemon/floral_healing,10 SECONDS)
	playsound(target, 'sound/effects/weather/wind/wind_5_1.ogg', 100, 1)
	visible_message("<span class='notice'>[src] and [target] briefly glow with pink fairy power before a swirling cloud of flower petals surrounds [target]...</span>")
	face_atom(target)
	return TRUE

/datum/modifier/pokemon/floral_healing
	name = "Floral Healing"
	desc = "Refreshing flower petals surround you."
	mob_overlay_state = "green_sparkles"

	on_created_text = "<span class='notice'>Flower petals sudenly swirl around you, filling you with reinvigorating energy.</span>"
	on_expired_text = "<span class='notice'>The flower petals suddenly fade away, leaving you feeling much better than before.</span>"
	stacks = MODIFIER_STACK_EXTEND

/datum/modifier/pokemon/floral_healing/tick()
	if(!holder.getBruteLoss() && !holder.getFireLoss() && !holder.getToxLoss() && !holder.getOxyLoss() && !holder.getCloneLoss()) // No point existing if the spell can't heal.
		expire()
		return
	holder.adjustBruteLoss(-3)
	holder.adjustFireLoss(-3)
	holder.adjustToxLoss(-3)
	holder.adjustOxyLoss(-3)
	holder.adjustCloneLoss(-3)

//// SHOCKING ////

/mob/living/simple_mob/animal/passive/pokemon/proc/move_shocking()
	set name = "Toggle Shocking (10s)"
	set category = "Abilities"
	set desc = "Toggle your body's natural ability to discharge electricity into anyone who touches you."
	if(move_cooldown)
		to_chat(src, "<span class='warning'>You need to wait before using another ability!</span>")
		return FALSE
	move_cooldown = TRUE
	spawn(move_cooldown_time)
		move_cooldown = FALSE
		to_chat(src,"<span class='green'>You're ready to use an ability again.</span>")
	if (M_SHOCK in active_moves)
		active_moves -= M_SHOCK
		custom_emote(1,"is no longer bristling with electricity.")
	else
		active_moves |= M_SHOCK
		custom_emote(1,"is now bristling with electricity!")
	update_icon()

//// TRANSFORM ////

/mob/living/simple_mob/animal/passive/pokemon/proc/move_imposter()
	set name = "Transform (60s)"
	set desc = "Transform your body into the shape of another pokemon. Does not transfer special abilities."
	set category = "Abilities"
	if(!LAZYLEN(pokemon_choices_list))
		to_chat(src, "<span class='warning'>WARNING: No pokemon list found! This may be due to there being no pokemon teleporter anywhere on the map. Tell a developer!</span>")
		return
	if(move_cooldown)
		to_chat(src, "<span class='warning'>You need to wait before using another ability!</span>")
		return
	var/p_choice = input(src, "Choose your new form.", "[src.name]") as null|anything in pokemon_choices_list
	if(!p_choice || isnull(p_choice))
		to_chat(src, "<span class='notice'>Transformation aborted.</span>")
		return
	var/new_gender = input(src, "Choose your new form's gender appearance:", "gender selection", "neuter") as null|anything in list("neuter", "male", "female")
	if(isnull(new_gender))
		to_chat(src, "<span class='notice'>Transformation aborted.</span>")
		return
	var/new_size_mult = input(usr, "Input size multiplier. Default = 1, Previous size = [size_multiplier]", "Resize", size_multiplier) as num|null
	if(isnull(new_size_mult))
		to_chat(src, "<span class='notice'>Transformation aborted.</span>")
		return
	new_size_mult = clamp(new_size_mult, RESIZE_MINIMUM, RESIZE_MAXIMUM)
	p_choice = pokemon_choices_list["[p_choice]"]
	var/mob/living/simple_mob/animal/passive/pokemon/NP = new p_choice()
	gender 			= 	new_gender
	icon 			= 	NP.icon
	icon_state 		= 	NP.icon_state
	icon_living		=	NP.icon_living
	icon_dead		= 	"[NP.icon_state]_d"
	icon_rest		= 	"[NP.icon_state]_rest"
	tt_desc			=	NP.tt_desc
	resize(new_size_mult)
	if(islegendary(NP))
		pixel_x = -32
		default_pixel_x = -32
		old_x = -32
	else
		pixel_x = -16
		default_pixel_x = -16
		old_x = -16
	visible_message("<span class='notice'>[src] slowly transforms until they look just like a [NP.name]!</span>")
	to_chat(src,"<span class='green'><i>You've transformed to look like a [NP.name]! You can set your flavor text by using the Set Flavortext verb to match your new appearance.</i></span>")
	if(NP.type != src.type)//Did we transform into a non-ditto?
		active_moves |= M_TF //Add the transformed active move
	else
		active_moves -= M_TF //Otherwise remove it
	del(NP)
	move_cooldown = TRUE
	spawn(move_cooldown_time*6)//60s
		move_cooldown = FALSE
		to_chat(src,"<span class='green'>You're ready to use an ability again.</span>")
