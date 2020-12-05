/obj/item/weapon/reagent_containers/food/snacks/cookie/curious
	desc = "An odd cookie"
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/cookie/curious/Initialize()
	. = ..()

/obj/item/weapon/reagent_containers/food/snacks/cookie/curious/attack(mob/living/M as mob, mob/user as mob, def_zone)
	. = ..()
	if (M == user)
		M.make_playable_changeling()
		M.drop_from_inventory(src)
		qdel(src)