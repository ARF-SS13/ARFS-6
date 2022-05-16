//Overrides the broken proc normally found in simple_mob_vr with this working one
/mob/living/simple_mob/handle_message_mode(message_mode, message_pieces, verb, used_radios, whispering)
	if(mob_radio)
		switch(message_mode)
			if("intercom")
				for(var/obj/item/device/radio/intercom/I in view(1, null))
					I.talk_into(src, message_pieces, null, verb)
			if("headset")
				if(mob_radio && istype(mob_radio,/obj/item/device/radio/headset/mob_headset))
					mob_radio.talk_into(src, message_pieces,null,verb)
					used_radios += mob_radio
			else
				if(message_mode)
					if(mob_radio && istype(mob_radio,/obj/item/device/radio/headset/mob_headset))
						mob_radio.talk_into(src, message_pieces, message_mode, verb)
						used_radios += mob_radio
	else
		..()


// Fixing the slimes so they aren't so deadly
/mob/living/simple_mob/slime
	melee_damage_lower = 5
	melee_damage_upper = 7