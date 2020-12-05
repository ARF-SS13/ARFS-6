var/list/watch_player_sizes_list = list(
		"Macro" 	= RESIZE_HUGE,
		"Big" 		= RESIZE_BIG,
		"Normal" 	= RESIZE_NORMAL,
		"Small" 	= RESIZE_SMALL)

/obj/item/clothing/accessory/watch
	name = "Watch"
	desc = "A fine timepiece."
	icon = 'content_arfs/icons/obj/clothing/tie_obj.dmi'
	icon_state = "watch"
	item_state = "watch"
	var/time

/obj/item/clothing/accessory/watch/attack_self(mob/user as mob)
	if(!istype(user,/mob/living/carbon/human))														//If not a human, explain they must be human to use this item
		to_chat(user, "<span class='warning'>You must be human to use this item.</span>")
		return
	time = stationtime2text()    																		//Get world time
	to_chat(user, "<span class='notice'>You check the time on your watch. It is [time].</span>")
	return

/obj/item/clothing/accessory/watch/andy
	name = "Unusual Watch"
	desc = "A fine timepiece. It is slightly thicker then a normal watch."
	var/cooldown_timer = 300
	var/cooldown = 0

/obj/item/clothing/accessory/watch/andy/attack_self(mob/user as mob)

	if(!istype(user,/mob/living/carbon/human))														//If not a human, explain they must be human to use this item
		to_chat(user, "<span class='warning'>You must be human to use this item.</span>")
		return

	time = stationtime2text()    																		//Get world time
	var/mob/living/carbon/human/H = user
	var/watch_actions = list("Check Time", "Change Size")											//Make a list of possible actions for this watch as an admin.
	var/user_action = input(user, "Choose an action") in watch_actions

	if (user_action == "Check Time")
		to_chat(user, "<span class='notice'>You check the time on your watch. It is [time].</span>")

	else if (user_action == "Change Size")
		if (!cooldown)
			var/size_name = input(user, "Pick a Size") in watch_player_sizes_list
			if (size_name && watch_player_sizes_list[size_name] && !cooldown)
				if(size_name=="Macro" && H.size_multiplier == 2)
					return
				else if(size_name == "Big" && H.size_multiplier == 1.5)
					return
				else if(size_name == "Normal" && H.size_multiplier == 1)
					return
				else if(size_name == "Small" && H.size_multiplier == 0.5)
					return
				else
					cooldown = 1
					H.resize(watch_player_sizes_list[size_name])
					user.visible_message("<span class='notice'>[user] begins to change size!</span>", "<span class='notice'>You begin to change size! You are now [size_name].</span>")
					sleep(cooldown_timer)
					cooldown = 0
		else
			to_chat(user, "<span class='warning'>Your watch is still recharging.</span>")