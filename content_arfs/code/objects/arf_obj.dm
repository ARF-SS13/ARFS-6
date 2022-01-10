/obj/item/weapon/reagent_containers/food/drinks/bluespace_coffee
	name = "bluespace coffee"
	desc = "Dreamt up in a strange feverish dream, this coffee cup seems to have been heavily modified with a variety of unlikely parts and wires, and never seems to run out of coffee. Truly the differance between madmen and genius is success."
	icon = 'icons/obj/coffee.dmi'
	icon_state = "bluespace_coffee"
	center_of_mass = list("x"=15, "y"=10)
	volume = 50

/obj/item/weapon/reagent_containers/food/drinks/bluespace_coffee/Initialize()
	..()
	reagents.add_reagent("coffee", 50)

//Infinite Coffee
/obj/item/weapon/reagent_containers/food/drinks/bluespace_coffee/attack(mob/M as mob, mob/user as mob, def_zone)
	..()
	src.reagents.add_reagent("coffee", 50)

/obj/item/weapon/storage/backpack/holding/satchel
    name = "satchel of holding"
    icon = 'content_arfs/icons/obj/clothing/backpack.dmi'
    icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'
    icon_state = "satchel-holding"

/obj/item/weapon/storage/backpack/holding/satchel/alt
    name = "satchel of holding"
    icon = 'content_arfs/icons/obj/clothing/backpack.dmi'
    icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'
    icon_state = "satchel-holding_alt"