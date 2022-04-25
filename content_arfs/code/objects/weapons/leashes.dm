// Leashes! Made by a idiot

// ------- *EXTERNAL EDITS* -------
// IF LEASHES SUDDENLY STOP WORKING AND YOU CAN MOVE WHEN LEASHED.
// ENSURE THAT THIS CODE IS IN code\modules\mob\living\living.dm JUST ABOVE if(lying)
/*
	if(leashed) 
		canmove = 0
*/
// Thanks c:


/mob/living/
    var/leashed = null

/mob/living/process_resist()
	. = ..()

	if(leashed)
		resist_leash()

/mob/living/proc/resist_leash()
	if(!pulledby)
		leashed = 0 // failsafe incase no one is pulling them.
		update_canmove()

	var/obj/item/weapon/leash/L
	for(var/obj/item/weapon/leash/Leash in pulledby)
		if(Leash.victim == src)
			L = Leash
	
	visible_message("<span class='danger'>[src] is trying to unclip the [L]!</span>",
		"<span class='warning'>You attempt to unclip the [L].</span>")
	if(do_after(src, 3 SECONDS, target = src))
		if(!pulledby || !leashed)
			update_canmove()
			return

		visible_message("<span class='danger'>[src] manages to unclip the [L]!</span>",
			"<span class='warning'>You successfully unclip the [L].</span>")
		
		L.victim = null
		leashed = 0

		update_canmove()

	else
		to_chat(src, "<span class='warning'>You fail to unclip the [L].</span>")

	return

/obj/item/weapon/leash
    name = "leash"
    desc = "When there's a leash, there's... a way?"

    icon_state = "leash"

    icon = 'content_arfs/icons/obj/weapon/kinky.dmi'

    var/mob/living/victim = null

/obj/item/weapon/leash/attack(mob/living/possible_victim, mob/living/user)
	if(user.stat || user.lying)
		return
	
	if(CanBeLeashed(possible_victim, user))
		if(ishuman(possible_victim))
			var/mob/living/carbon/human/HV = possible_victim //Human Victim

			var/canLeash = 0

			if(HV.w_uniform)
				var/obj/item/clothing/under/VC = HV.w_uniform // Victim's clothes

				// Very dumbass way to check for a collar being equipped, fuck off, I tried almost everything ; _;
				for(var/obj/item/clothing/accessory/collar/C in VC.contents)
					canLeash = 1
			if(istype(HV.wear_suit, /obj/item/clothing/accessory/collar))
				canLeash = 1
			
			if(canLeash)
				leashthatboi(HV,user)
			else // If there is no collar
				to_chat(user,"<span class='notice'>They aren't wearing a collar, you can't find a good clipping point.</span>")
				return
		else //For a simple mob living, the parameters handle making sure the mob is just a living animal instead.
			leashthatboi(possible_victim, user)

/obj/item/weapon/leash/proc/CanBeLeashed(mob/living/possible_victim,mob/user)
	if(possible_victim == user)
		to_chat(user,"<span class='notice'>You can't leash yourself!</span>")
		return

	if(victim == possible_victim)
		deleash()
		return

	if(victim)
		to_chat(user,"<span class='notice'>You can't leash multiple people..!</span>")
		return
	
	if(possible_victim.leashed)
		to_chat(user,"<span class='notice'>They're already leashed..!</span>")
		return
	
	return 1

/obj/item/weapon/leash/proc/leashthatboi(mob/living/poorfella as mob, mob/user as mob)
	user.visible_message("<span class='warning'>[user] starts to clip the [src] onto [poorfella]</span>")
	if(do_after(user, 30))

		if(in_range(user,poorfella))
			to_chat(user,"<span class='notice'>You clip the [src] onto [poorfella]</span>")
			to_chat(poorfella,"<span class='notice'>[user] clips the [src] onto you.</span>")

			victim = poorfella

			poorfella.leashed = user
			poorfella.update_canmove()

			playsound(src, 'sound/effects/seatbelt.ogg', 50, 1)

			user.start_pulling(poorfella)

			START_PROCESSING(SSobj,src)

/obj/item/weapon/leash/proc/deleash()
	if(isliving(loc))
		var/mob/living/leashholder = loc

		if(victim)
			to_chat(leashholder,"You unleash [victim]")
			to_chat(victim,"[leashholder] unclips the leash from you!")

			if(victim == leashholder.pulling)
				leashholder.stop_pulling()

			playsound(src, 'sound/effects/seatbelt.ogg', 50, 1)
			victim.leashed = 0
			victim.update_canmove()
			victim = null
			return
	else
		victim.leashed = 0
		victim = null
		return

/obj/item/weapon/leash/Destroy()
	deleash()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/weapon/leash/process()
	if(!victim)
		STOP_PROCESSING(SSobj,src)
		return

	if(!isliving(loc))
		deleash()
		return

	if(!victim.pulledby == loc || !victim.pulledby || !victim.leashed)
		deleash()
		return

/obj/item/weapon/leash/dropped()
	if(victim)
		deleash()
