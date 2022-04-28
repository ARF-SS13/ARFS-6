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

//For mobs who don't have a pocket to store one in
/obj/item/device/communicator/simple_mob
	name = "bio-integrated communicator"
	desc = "A device used for long-range communications, able to be implanted into certain non-human animals."

// Proc: open_connection_to_ghost()
// Parameters: 2 (refer to base definition for arguments)
// Description: Synths don't use languages properly, so this is a bandaid fix until that can be resolved..
/obj/item/device/communicator/simple_mob/open_connection_to_ghost(user, candidate)
	..(user, candidate)
	spawn(1)
		for(var/mob/living/voice/V in contents)
			V.universal_speak = 1
			V.universal_understand = 1

// Verb: activate()
// Parameters: None
// Description: Lets synths use their communicators without hands.
/obj/item/device/communicator/simple_mob/verb/activate()
	set category = "Abilities"
	set name = "Use Communicator"
	set desc = "Utilizes your implanted bio-communicator."
	set src in usr

	if(usr.stat == 2)
		to_chat(usr, "You can't do that because you are dead!")
		return

	src.attack_self(usr)

//Arfs overwrite from loadout_utility.dm
/datum/gear/utility/communicator/New()
	..()
	var/list/communicators = list()
	for(var/obj/item/device/communicator_type as anything in typesof(/obj/item/device/communicator) - list(	/obj/item/device/communicator/integrated,
																											/obj/item/device/communicator/commlink,
																											/obj/item/device/communicator/simple_mob))
																											//VOREStation Edit - Remove Commlink
		communicators[initial(communicator_type.name)] = communicator_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(communicators))