// Leashes! Made by a idiot
/mob/living/
    var/leashed = null

/*
/mob/living/stop_pulling()
    if(isliving(pulling))
        var/mob/living/freedvictim = pulling
        if(freedvictim.leashed)
            to_chat(src,"You unleash [freedvictim]")
            to_chat(freedvictim,"[src] unclips the leash from you!")
            freedvictim.leashed = null
    . = ..()
*/

/obj/item/weapon/leash
    name = "leash"
    desc = "When there's a leash, there's... a way?"

    icon_state = "leash"

    icon = 'content_arfs/icons/obj/weapon/kinky.dmi'

    var/mob/living/victim = null

/obj/item/weapon/leash/attack(mob/possible_victim as mob, mob/user as mob)
    if(user.stat || user.lying)
        return

    if(victim == possible_victim)
        deleash()
        return

    if(victim)
        to_chat(user,"You can't clip multiple people? You some kinda sadist magician, what the fuck how, we still have covid yknow, gotta let them have their distance. . w.")
        return

    if(ishuman(possible_victim))
        var/mob/living/carbon/human/HV //Human Victim
        if(istype(HV.wear_mask,/obj/item/clothing/accessory/collar) || HV.w_uniform.contents.Find(/obj/item/clothing/accessory/collar))
            leashthatboi(HV)
            return
        else
            to_chat(user,"They aren't wearing a collar, how can you clip this leash onto them dummy??!!?!!?!?!?!?!?!?")
            return
    else
        leashthatboi(possible_victim, user)

/obj/item/weapon/leash/proc/leashthatboi(mob/living/poorfella as mob, mob/user as mob)
    visible_message("[user] starts to clip the [src] onto [poorfella]")
    if(do_after(user, 40))
        to_chat(user,"You clip the [src] onto [poorfella]")
        to_chat(poorfella,"[user] clips the [src] onto you.")

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

            victim.update_canmove()
            victim = null
    else
        victim = null

/obj/item/weapon/leash/Destroy()
    deleash()
    STOP_PROCESSING(SSobj, src)
    return ..()

/obj/item/weapon/leash/process()
    if(!victim)
        STOP_PROCESSING(SSobj,src)

    if(!victim.pulledby == loc || !victim.pulledby)
        deleash()

/obj/item/weapon/leash/dropped()
    if(victim)
        deleash()
