/obj/item/weapon/reagent_containers/food/snacks/variable/cookie/curious
	desc = "An odd cookie"
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/variable/cookie/curious/Initialize()
	. = ..()

/obj/item/weapon/reagent_containers/food/snacks/variable/cookie/curious/attack(mob/living/M as mob, mob/user as mob, def_zone)
	. = ..()
	if (M == user)
		var/list/playerpowers = list(/datum/power/changeling/arm_blade, /datum/power/changeling/darksight, /datum/power/changeling/extractdnaplayer, /datum/power/changeling/metaextractdna, \
						     /datum/power/changeling/player_transform, /datum/power/changeling/fleshmend, /datum/power/changeling/panacea, /datum/power/changeling/rapid_regen, \
						     /datum/power/changeling/endoarmor, /datum/power/changeling/MetaEngorgedGlands, /datum/power/changeling/self_respiration, /datum/power/changeling/space_suit, \
						     /datum/power/changeling/visible_camouflage, /datum/power/changeling/recursive_enhancement, /datum/power/changeling/metafleshmend, \
							 /datum/power/changeling/size_change)
		var/list/datum/power/changeling/playerpowerinstances = list()
		M.make_playable_changeling(playerpowers, playerpowerinstances)
		M.drop_from_inventory(src)
		qdel(src)

/obj/item/weapon/reagent_containers/food/snacks/variable/cookie/dubious
	desc = "An odd cookie"
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/variable/cookie/dubious/Initialize()
	. = ..()

/obj/item/weapon/reagent_containers/food/snacks/variable/cookie/dubious/attack(mob/living/M as mob, mob/user as mob, def_zone)
	. = ..()
	if (M == user)
		var/list/playerpowers = list(/datum/power/changeling/size_change)
		var/list/datum/power/changeling/playerpowerinstances = list()
		M.make_playable_changeling(playerpowers, playerpowerinstances)
		M.drop_from_inventory(src)
		qdel(src)