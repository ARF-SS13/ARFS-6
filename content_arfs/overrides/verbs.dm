
#define RESPAWN_WAIT_TIME 1 * 600 //in deciseconds
//Respawn time to 60 seconds
/mob/abandon_mob()
	set category = "OOC"

	if (!( config.abandon_allowed ))
		to_chat(usr, "<span class='notice'>Respawn is disabled.</span>")
		return
	if ((stat != 2 || !( ticker )))
		to_chat(usr, "<span class='notice'><B>You must be dead to use this!</B></span>")
		return
	if (ticker.mode && ticker.mode.deny_respawn) //BS12 EDIT
		to_chat(usr, "<span class='notice'>Respawn is disabled for this roundtype.</span>")
		return
	else
		var/deathtime = world.time - src.timeofdeath
		if(istype(src,/mob/observer/dead))
			var/mob/observer/dead/G = src
			if(G.has_enabled_antagHUD == 1 && config.antag_hud_restricted)
				to_chat(usr, "<font color='blue'><B>By using the antagHUD you forfeit the ability to join the round.</B></font>")
				return
		var/deathtimeminutes = round(deathtime / 600)
		var/pluralcheck = "minute"
		if(deathtimeminutes == 0)
			pluralcheck = ""
		else if(deathtimeminutes == 1)
			pluralcheck = " [deathtimeminutes] minute and"
		else if(deathtimeminutes > 1)
			pluralcheck = " [deathtimeminutes] minutes and"
		var/deathtimeseconds = round((deathtime - deathtimeminutes * 600) / 10,1)
		to_chat(usr, "You have been dead for[pluralcheck] [deathtimeseconds] seconds.")

		if ((deathtime < RESPAWN_WAIT_TIME) && (ticker && ticker.current_state > GAME_STATE_PREGAME))
			to_chat(usr, "You must wait [RESPAWN_WAIT_TIME / 600] minute(s) to respawn!")
			return
		else
			to_chat(usr, "You can respawn now, enjoy your new life!")

	log_game("[usr.name]/[usr.key] used abandon mob.")

	to_chat(usr, "<font color='blue'><B>Please, roleplay correctly! If you didn't leave the round via cryopods, teleporter, shuttle, etc then play a different character until the next round!</B></font>")

	if(!client)
		log_game("[usr.key] AM failed due to disconnect.")
		return
	client.screen.Cut()
	client.screen += client.void
	if(!client)
		log_game("[usr.key] AM failed due to disconnect.")
		return

	announce_ghost_joinleave(client, 0)

	var/mob/new_player/M = new /mob/new_player()
	if(!client)
		log_game("[usr.key] AM failed due to disconnect.")
		qdel(M)
		return

	M.key = key
	if(M.mind)
		M.mind.reset()
	return

//Picking up items with the right click menu verb
/obj/item/verb_pickup()
	set src in oview(1)
	set category = "Object"
	set name = "Pick up"

	if(!(usr)) //BS12 EDIT
		return
	if(!usr.canmove || usr.stat || usr.restrained() || !Adjacent(usr))
		return
	if(istype(usr, /mob/living/carbon))//Is carbon
		var/mob/living/carbon/C = usr
		if(istype(usr, /mob/living/carbon/brain))//is not a brain
			to_chat(usr, "<span class='warning'>You can't pick things up!</span>")
			return
		if(usr.stat || usr.restrained())//Is not asleep/dead and is not restrained
			to_chat(usr, "<span class='warning'>You can't pick things up!</span>")
			return
		if(src.anchored) //Object isn't anchored
			to_chat(usr, "<span class='warning'>You can't pick that up!</span>")
			return
		if(C.get_active_hand()) //Hand is not full
			to_chat(usr, "<span class='warning'>Your hand is full.</span>")
			return
		if(!istype(src.loc, /turf)) //Object is on a turf
			to_chat(usr, "<span class='warning'>You can't pick that up!</span>")
			return
	else if(istype(usr, /mob/living/simple_mob))
		var/mob/living/simple_mob/SM = usr
		if(!SM.has_hands)
			to_chat(usr, "<span class='warning'>You can't pick things up!</span>")
			return
		if((SM.hand == 0 && SM.r_hand) || (SM.hand == 1 && SM.l_hand))
			to_chat(usr, "<span class='warning'>Your hand is full.</span>")
			return
	//All checks are done, time to pick it up!
	usr.UnarmedAttack(src)
	return
