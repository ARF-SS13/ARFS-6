// Author - GremlingSS

// TODO:
// Custom egg colors (totally didn't forget this)
// Allow custom insertion messages.
// Modify existing AI holders to support oviposition (spiders are gonna be kinda h o t now???)
// Enable oviposition on simple_mobs and other mobs.

// Global Reference data for every egg type.
var/global/list/ovi_eggs_list = list() // Stores a type reference of all eggs. 

/hook/startup/proc/init_ovi_eggs()
	var/types = typesof(/obj/item/weapon/storage/vore_egg)
	for(var/pathtype in types)
		var/obj/item/weapon/storage/vore_egg/egg = new pathtype()

		ovi_eggs_list[pathtype] = egg
	return 1

/* // Now using the vore_egg item types, as I thought they were only lockers :o
// Base egg, don't use this one..! Use the subtypes c:
/obj/item/weapon/storage/vore_egg
	name = "Egg"
	desc = "James May Special. Egg."
	icon = 'gurgs_content/icons/obj/ovieggs.dmi'
*/

/mob/living
	var/obj/item/weapon/storage/vore_egg/ovi_egg_type

/mob/living/proc/select_egg_type()
	set category = "Abilities"
	set name = "Select Egg Type"

	log_debug("Select Egg Type START")

	var/list/egglist = ovi_eggs_list.Copy()
	var/list/generated_list = list()
	for(var/E in egglist)
		var/obj/item/weapon/storage/vore_egg/OE = egglist[E]
		generated_list[OE.name] = E
	
	var/selected = tgui_input_list(src, "Select an egg", "Egg Selection", generated_list)
	log_debug("ovi: selected done")

	if(selected)
		log_debug("selected [selected]")
		ovi_egg_type = generated_list[selected]

	
	log_debug("ovi: select egg type - FINISHED")

/mob/living/carbon/proc/insert_egg_into_grabbed()
	set category = "Abilities"
	set name = "Insert Eggs"

	var/obj/item/weapon/grab/G = src.get_active_hand()

	if(!G)
		to_chat(src,"You need to grab someone!")
		return

	if(!G.affecting)
		return

	if(!G.state >= GRAB_AGGRESSIVE)
		to_chat(src,"You must have a better grip!")
		return
	
	if(G.affecting.vore_organs.len <= 0)
		to_chat(src, "There are no bellies to select!")
		return
	
	put_eggs_in_victim(G.affecting)

/mob/living/proc/put_eggs_in_victim(mob/living/target as mob)
	if(src.stat)
		log_debug("ovi: src.stat NOT false")
		return
	
	if(!target)
		log_debug("ovi: target NOT true")
		return
	
	if(!src.client) // If it's an AI.
		log_debug("ovi: AI insertion")
		var/targetBelly = pick(target.vore_organs) // select a random belly.
		var/obj/item/weapon/storage/vore_egg/egg = new ovi_egg_type()
		visible_message("[SPAN_WARNING("[src] is inserting a [egg.name] into [target.name]!")]", "[SPAN_WARNING("You begin inserting a [egg.name] into [target.name].")]")
		if(do_after(src, 5 SECONDS, src))
			egg.insert(targetBelly)
			visible_message("[SPAN_WARNING("[src] finished inserting a [egg.name] into [target.name]!")]", "[SPAN_WARNING("You finished inserting a [egg.name] into [target.name]")]")
	
	var/chosenBelly = tgui_input_list(usr, "Choose Belly", "Belly Choice", target.vore_organs)

	if(!chosenBelly)
		log_debug("ovi: chosenBelly NOT true")
		return
	
	var/obj/item/weapon/storage/vore_egg/egg = new ovi_egg_type()

	// TO DO: Customisable insertion messages. - Currently a placeholder while I get the main eggy bit in firstly c:
	visible_message("[SPAN_WARNING("[src] is inserting a [egg.name] into [target]!")]")
	if(do_after(src, 5 SECONDS, src))
		egg.insert(chosenBelly)
		visible_message("[SPAN_WARNING("[src] finished inserting a [egg.name] into [target]!")]")
	
	log_debug("ovi: finished")

/obj/item/weapon/storage/vore_egg/attack(mob/living/M, mob/living/user, target_zone, attack_modifier)
	if(user.a_intent == I_GRAB)
		if(M.vore_organs.len <= 0)
			return
		var/chosenBelly = tgui_input_list(usr, "Choose Belly", "Belly Choice", M.vore_organs)

		if(!chosenBelly)
			log_debug("ovi: chosenBelly NOT true")
			return
		
		user.visible_message("[SPAN_WARNING("[user.name] is inserting a [name] into [M.name]!")]")
		if(do_after(user, 5 SECONDS, user))
			insert(chosenBelly)
			user.visible_message("[SPAN_WARNING("[user.name] finished inserting a [name] into [M.name]!")]")

	. = ..()

/obj/item/weapon/storage/vore_egg/proc/insert(var/obj/belly/belly)

	/* If no sound is made, uncomment this.
	// Copying this code from /obj/belly/Entered() so that it's compatible to both sound files.
	if(belly.vore_sound && !belly.recent_sound)
		var/soundfile
		if(!fancy_vore)
			soundfile = classic_vore_sounds[belly.vore_sound]
		else
			soundfile = fancy_vore_sounds[belly.vore_sound]
		if(soundfile)
			playsound(src, soundfile, vol = 100, vary = 1, falloff = VORE_SOUND_FALLOFF, preference = /datum/client_preference/eating_noises, volume_channel = VOLUME_CHANNEL_VORE)
			belly.recent_sound = TRUE
	*/

	var/mob/living/M = loc
	if(istype(M))
		M.drop_item() // force the player to drop the egg if holding.
	
	forceMove(belly)
