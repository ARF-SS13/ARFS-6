//globals so the lists dont get generated more than once
var/global/list/pokemon_choices_list = list()//Referenced list for use in input()
var/global/list/pokemon_pods = list()//List of pods that ghosts can spawn at

//Pod to spawn in as pokemon or other mobs.
/obj/structure/ghost_pod/ghost_activated/pokemon
	name = "\improper Pokemon teleporter"
	desc = "A glowing pod which features a holographic display showing several animal companions. A Pokemon or similar creature may teleport in from here."
	description_info = "A ghost can click on this to spawn in as a Pokemon or similar mob."
	icon = 'icons/obj/structures.dmi'
	icon_state = "borg_pod_closed"
	icon_state_opened = "borg_pod_opened"
	anchored = TRUE
	var/datum/effect/effect/system/spark_spread/spk
	var/do_announcement = TRUE //FALSE won't give them a choice of announcing
	var/list/remove_paths = list(/mob/living/simple_mob/animal/passive/pokemon/leg, 		//Can tailor this list for different types of
						    /mob/living/simple_mob/animal/passive/pokemon,					//spawners down the line
						    /mob/living/simple_mob/animal/passive/pokemon/jolteon/bud,
							/mob/living/simple_mob/animal/passive/pokemon/leg/lugia/andy)

/obj/structure/ghost_pod/ghost_activated/pokemon/Initialize()
	. = ..()
	generate_lists()
	var/turf/T = get_turf(src)
	pokemon_pods["[T.loc]"] = src
	spk = new(src)
	spk.set_up(5, 0, src)
	spk.attach(src)

/obj/structure/ghost_pod/ghost_activated/pokemon/Destroy()//Remove from global list
	var/turf/T = get_turf(src)
	pokemon_pods -= pokemon_pods["[T.loc]"]
	. = ..()

/obj/structure/ghost_pod/ghost_activated/pokemon/proc/generate_lists()
	if(LAZYLEN(pokemon_choices_list))
		return FALSE	//The global list is already generated
	var/pokemon_choices_list_paths = typesof(/mob/living/simple_mob/animal/passive/pokemon) - remove_paths
	for (var/path in pokemon_choices_list_paths)//add the mobs to a list with their names referencing paths
		var/mob/living/simple_mob/animal/passive/pokemon/P = new path()
		pokemon_choices_list["[P.name]"] = P.type
		del(P)

/obj/structure/ghost_pod/manual/attack_hand(var/mob/user)
	//Inform curious minds about how to use this.
	to_chat(user, "<span class='notice'>You can't seem to find a way to interact with this from the outside.</span>")
	to_chat(user, "<span class='warning'>(<b>OOC:</b> Only observers may use [src])</span>")
	..()

/obj/structure/ghost_pod/ghost_activated/pokemon/attack_ghost(var/mob/observer/dead/user)
	if (ticker.current_state != GAME_STATE_PLAYING)
		to_chat(user, "<span class='warning'>The round either hasn't started yet or has ended.</span>")
		return
	if (!LAZYLEN(pokemon_choices_list))
		to_chat(user, "<span class='warning'>Pod configuration error. Report this to a developer.</span>")
		return
	create_occupant(user)

/obj/structure/ghost_pod/ghost_activated/pokemon/create_occupant(var/mob/M)
	var/m_ckey = M.ckey
	var/client/C
	var/datum/preferences/Prefs
	if(M.client)
		C = M.client
		Prefs = C.prefs
	var/turf/T
	var/area/A
	var/newname
	var/new_gender
	var/new_flavor_text
	var/new_ooc_notes
	var/new_size_mult
	var/p_choice = input(M, "What would you like to spawn in as?", "[src.name]") as null|anything in pokemon_choices_list
	if(!p_choice || isnull(p_choice))
		to_chat(M, "<span class='notice'>Spawning aborted.</span>")
		return
	p_choice = pokemon_choices_list["[p_choice]"]
	//Ask if they have a character slot set up for this.
	var/import_from_slot = input(M, "Would you like to import your currently selected character slot's information for this mob? This will apply their name, gender, vore preferences, flavor text, size, and OOC notes to your Pokemon character (Limb-based flavor text not supported). Select no to configure them manually. Select cancel to abort spawning process.", "[src.name]") as null|anything in list("Yes","No")
	if(isnull(import_from_slot))
		to_chat(M, "<span class='notice'>Spawning aborted.</span>")
		return
	if(import_from_slot == "No")
		newname = input(M, "Would you like to change your name or use the default one? Enter nothing to use the default name. Canceling will stop the spawning process.", "Name Change") as null|text
		if(isnull(newname))
			to_chat(M, "<span class='notice'>Spawning aborted.</span>")
			return
		newname = sanitize(newname, MAX_NAME_LEN)//Sanitize the name afterwards, so we know if they hit cancel or input an empty string
		new_gender = input(M, "Choose your Pokemon's gender:", "Character Preference", "neuter") as null|anything in list("neuter", "male", "female")
		if(isnull(new_gender))
			to_chat(M, "<span class='notice'>Spawning aborted.</span>")
			return
		new_size_mult = input(usr, "Input size multiplier. Default = 1", "Resize", 1) as num|null
		if(isnull(new_size_mult))
			to_chat(M, "<span class='notice'>Spawning aborted.</span>")
			return
		new_size_mult = clamp(new_size_mult, RESIZE_MINIMUM, RESIZE_MAXIMUM)
		new_flavor_text = sanitize(input(M,"Set your character's flavortext; a detailed description of their physical appearance.","Flavortext", null) as message|null, extra = 0)
		new_ooc_notes = sanitize(input(M,"Set your OOC notes. This should contain your roleplaying preferences.","OOC Notes", null) as message|null, extra = 0)
		//End mob configuration
	var/announce_choice = FALSE
	if(do_announcement)
		announce_choice = input(M, "Would you like to announce your arrival over the common radio channel? Select cancel to abort spawning process.", "[src.name]") as null|anything in list("Yes","No")
		if(isnull(announce_choice))
			to_chat(M, "<span class='notice'>Spawning aborted.</span>")
			return
		if(announce_choice == "Yes")
			announce_choice = TRUE
		else
			announce_choice = FALSE
	T = get_turf(src)
	A = T.loc
	var/mob/living/simple_mob/animal/passive/pokemon/P = new p_choice(T)
	if(import_from_slot == "Yes")//If importing, set the needed vars now
		newname = Prefs.real_name
		new_gender = Prefs.identifying_gender
		new_ooc_notes = Prefs.metadata
		new_flavor_text = Prefs.flavor_texts["general"] //Limb flavor text not supported
		new_size_mult = Prefs.size_multiplier

	if(newname)//Still not empty after sanitization
		P.name = newname
		P.voice_name = P.name
	P.real_name = P.name
	if(new_gender)
		P.gender = new_gender
	if(new_size_mult)
		P.resize(new_size_mult)
	if(new_flavor_text)
		P.flavor_text = new_flavor_text
	if(new_ooc_notes)
		P.ooc_notes = new_ooc_notes
	if(M.mind)
		M.mind.transfer_to(P)
	if(m_ckey)
		P.ckey = m_ckey

	if(import_from_slot == "Yes")
		P.copy_from_prefs_vr()//Copy vore prefs over once they're in the mob

	P.on_manifest = TRUE //Have them show up on the crew manifest since they aren't wild
	if(data_core)
		data_core.ResetPDAManifest() //Reset the manifest

	var/obj/item/device/radio/headset/mob_headset/R = new(P)
	P.mob_radio = R //Implant a mob radio on them so they can communicate over a distance and hear what's going on. Being left in the dark isn't fun.

	var/obj/item/device/communicator/simple_mob/COM = new(P)
	P.communicator = COM //Give them an implanted communicator so they can see the crew manifest, text chats, weather, etc

	P.ai_holder.wander = 0 //Disables wandering if the player ghosts or is otherwise removed from their mob

	log_and_message_admins("used \the [src] and became \an [P.tt_desc] named [P.name].")

	to_chat(P, "<span class='warning'>(OOC: Please remember to roleplay correctly. If you used this pod to respawn, you may not have all of \
				the same memories as before you died. If you spawned at the incorrect location, or just want to traverse between the different \
				parts of the map which may be inaccessible to you as a non-humanoid, you may click on any of these pods (non-help intent) to teleport between them. \
				Additionally, you may set your OOC Notes and Flavortext with the <b>\"Set OOC Notes\"</b> and <b>\"Set Flavortext\"</b> verbs.)</span>")

	visible_message("<span class='notice'>[src] dings and hisses before its doors slowly open and \the [P.name] steps out!</span>")
	playsound(src, 'sound/machines/kitchen/microwave/microwave-end.ogg', 100)

	P.forceMove(T)

	//Announce the pokemon spawning.
	if(announce_choice && P.z)//We aren't in nullspace
		AnnounceArrivalSimple("[P.name]", "\an [capitalize(P.tt_desc)]", "has arrived from an offsite gateway at [A]", "Common", P.z)

//Pokemon can teleport between the pods, so they can travel between the station and residential
/obj/structure/ghost_pod/ghost_activated/pokemon/attack_generic(var/mob/user, var/damage)
	user.setClickCooldown(user.get_attack_speed())
	if(ispokemon(user))
		var/sel = input(user, "Where would you like to teleport to?", "Choose Location") as null|anything in pokemon_pods
		if(isnull(sel))
			to_chat(user, "<span class='notice'>You decide not to teleport anywhere.</span>")
			return 0
		if(!Adjacent(user))
			to_chat(user, "<span class='warning'>Get closer!</span>")
			return 0

		var/obj/structure/ghost_pod/ghost_activated/pokemon/pod = pokemon_pods[sel]

		if(pod == src)
			to_chat(user, "<span class='notice'>You're already here!</span>")
			return 0

		phase_out(user,get_turf(user))
		visible_message("<span class='notice'>[src] hums lowly before [user] phases out in a flash!</span>")
		user.forceMove(get_turf(pod))
		phase_in(user,get_turf(user))
		visible_message("<span class='notice'>[src] hums lowly and a bright light shines out from its window before it opens and [user] steps out.</span>")

		return 1
	..()

/obj/structure/ghost_pod/ghost_activated/pokemon/proc/phase_out(var/mob/M,var/turf/T)
	if(!M || !T)
		return
	spk.set_up(5, 0, M)
	spk.attach(M)
	playsound(T, "sparks", 50, 1)
	anim(T,M,'icons/mob/mob.dmi',,"phaseout",,M.dir)

/obj/structure/ghost_pod/ghost_activated/pokemon/proc/phase_in(var/mob/M,var/turf/T)
	if(!M || !T)
		return
	spk.start()
	playsound(T, 'sound/effects/phasein.ogg', 25, 1)
	playsound(T, 'sound/effects/sparks2.ogg', 50, 1)
	anim(T,M,'icons/mob/mob.dmi',,"phasein",,M.dir)
	spk.set_up(5, 0, src)
	spk.attach(src)
