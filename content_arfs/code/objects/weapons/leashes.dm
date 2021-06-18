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

    if(possible_victim == user)
        to_chat(user,"<span class='notice'>You can't leash yourself!</span>")
        return

    if(victim == possible_victim)
        deleash()
        return

    if(victim)
        to_chat(user,"<span class='notice'>You can't leash multiple people..!</span>")
        return

    if(ishuman(possible_victim))
        var/mob/living/carbon/human/HV = possible_victim //Human Victim

        var/canLeash = 0

        if(HV.w_uniform)
            var/obj/item/clothing/under/VC = HV.w_uniform // Victim's clothes

            // Very dumbass way to check for a collar being equipped, fuck off, I tried almost everything ; _;
            for(var/obj/item/clothing/accessory/collar/C in VC.contents)
                canLeash = 1
        
        if(canLeash)
            leashthatboi(HV,user)
        else
            to_chat(user,"<span class='notice'>They aren't wearing a collar, you can't find a good clipping point.</span>")
            return
    else
        leashthatboi(possible_victim, user)

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
    else
        victim.leashed = 0
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
