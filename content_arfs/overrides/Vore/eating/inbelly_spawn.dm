// Please keep up to date with code/modules/vore/eating/inbelly_spawn.dm
/mob/observer/dead/spawn_in_belly()
	set category = "Ghost"
	set name = "Spawn In Belly"
	set desc = "Spawn in someone's belly."

	if(!client)
		return

	// If any ghost-side restrictions are desired, they'll go here

	tgui_alert(src,{"
This verb allows you to spawn inside someone's belly when they are in round.
Make sure you to coordinate with your predator OOCly as well as roleplay approprietly.
You are considered to have been in the belly entire time the predator was around and are not added to crew lists.
This is not intended to be used for mechanical advantage or providing assistance, but for facilitating longterm scenes.
Please do not abuse this ability.
"},"OOC Warning")			// Warning.

	var/list/eligible_targets = list()

	for(var/mob/living/pred in living_mob_list)
		if(!istype(pred) || !pred.client)		// Ignore preds that aren't living mobs or player controlled
			continue
		if(pred.no_vore)						// No vore, no bellies, no inbelly spawning
			continue
		// if(!(get_z(pred) in using_map.station_levels))	// No explo reinforcements
		// 	continue
		if(ishuman(pred))
			var/mob/living/carbon/human/H = pred
			if(!H.allow_inbelly_spawning)
				continue
			eligible_targets += H
			continue
		if(issilicon(pred))
			var/mob/living/silicon/S = pred
			if(isAI(S))
				continue						// Sorry, AI buddies. Your vore works too differently.
			if(!S.allow_inbelly_spawning)
				continue
			eligible_targets += S
			continue
		if(istype(pred, /mob/living/simple_mob))
			var/mob/living/simple_mob/SM = pred
			if(!SM.vore_active)						// No vore, no bellies, no inbelly spawning
				continue
			if(!SM.allow_inbelly_spawning)
				continue
			eligible_targets += SM
			continue

		// Only humans, simple_mobs and non-AI silicons are included. Obscure stuff like bots is skipped.

	if(!eligible_targets.len)
		to_chat(src, "<span class=notice>No eligible preds were found.</span>")				// :(
		return

	var/mob/living/target = tgui_input_list(src, "Please specify which character you want to spawn inside of.", "Predator", eligible_targets)	// Offer the list of things we gathered.

	if(!target || !client)			// Did out target cease to exist? Or did we?
		return

	// Notify them that its now pred's turn
	to_chat(src, "<span class=notice>Inbelly spawn request sent to predator.</span>")
	target.inbelly_spawn_prompt(client)			// Hand reins over to them