/datum/reagent/antacid
    name = "Antacid"
    id = "antacid"
    description = "A green liquid, for calming one's indigestion."
    reagent_state = LIQUID
    color = "#0E900E"
    overdose = REAGENTS_OVERDOSE
    metabolism = REM * 100 //Setting to 20 so it doesn't process for long

/datum/reagent/antacid/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
    for(var/obj/belly/B as anything in M.vore_organs)
        if(B.digest_mode == DM_DIGEST)
            spawn(100)
                B.digest_brute = B.digest_brute / 2
                B.digest_burn = B.digest_burn / 2
                B.digest_oxy = B.digest_oxy / 2
            spawn(200)
                B.digest_brute = B.digest_brute / 2
                B.digest_burn = B.digest_burn / 2
                B.digest_oxy = B.digest_oxy / 2
            spawn(300)
                B.digest_brute = 0
                B.digest_burn = 0
                B.digest_oxy = 0

/decl/chemical_reaction/instant/antacid
    name = "Antacid"
    id = "antacid"
    result = "antacid"
    required_reagents = list("oxygen" = 1, "hydrogen" = 1, "aluminum" = 1)
    result_amount = 3

/obj/item/weapon/reagent_containers/glass/bottle/antacid
    name = "antacid bottle"
    desc = "A small bottle of antacid."
    icon = 'icons/obj/chemical.dmi'
    icon_state = "bottle-3"
    prefill = list("antacid" = 60)

/obj/item/weapon/reagent_containers/pill/antacid
    name = "Antacid (10u)"
    desc = "Used to neutralise acid."
    icon_state = "pill3"

/obj/item/weapon/reagent_containers/pill/antacid/Initialize()
    . = ..()
    reagents.add_reagent("antacid", 10)
    color = reagents.get_color()

/obj/item/weapon/storage/pill_bottle/antacid
    starts_with = list(/obj/item/weapon/reagent_containers/pill/antacid = 14)