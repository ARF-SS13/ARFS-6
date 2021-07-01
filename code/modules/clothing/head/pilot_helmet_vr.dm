<<<<<<< HEAD
//Overmap pilots. Same gear, without the dumb interface.

/obj/item/clothing/head/ompilot
	name = "pilot helmet"
	desc = "Standard pilot gear. Protects the head from impacts."
	icon_state = "pilot_helmet1"
	item_icons = list(slot_head_str = 'icons/mob/pilot_helmet.dmi')
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/mob/species/teshari/pilot_helmet.dmi'
		)
	flags = THICKMATERIAL
=======
//Pilot helmets
/obj/item/clothing/head/pilot_vr
	name = "standard pilot helmet"
	desc = "Standard pilot gear. Protects the head from impacts. This one has a retractable visor"
	icon = 'icons/obj/clothing/helmets_vr.dmi'
	icon_state = "pilot1"
>>>>>>> 7744a7d5cf8e1b6601b793f2cf1038c0d873a491
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 5, bomb = 10, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	w_class = ITEMSIZE_NORMAL
<<<<<<< HEAD

/obj/item/clothing/head/ompilot/alt
	name = "pilot helmet"
	desc = "Standard pilot gear. Protects the head from impacts. This one has a retractable visor"
	icon_state = "pilot_helmet2"
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/ompilot/alt/attack_self(mob/user as mob)
=======
	item_icons = list(slot_head_str = 'icons/mob/head_vr.dmi')
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/mob/species/teshari/helmet_vr.dmi'
		)
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/pilot_vr/attack_self(mob/user as mob)
	if(src.icon_state == initial(icon_state))
		src.icon_state = "[icon_state]up"
		to_chat(user, "You raise the visor on the pilot helmet.")
	else
		src.icon_state = initial(icon_state)
		to_chat(user, "You lower the visor on the pilot helmet.")
	update_clothing_icon() //so our mob-overlays update

/obj/item/clothing/head/pilot_vr/alt
	name = "colored pilot helmet"
	desc = "A colored version of the standard pilot helmet. Protects the head from impacts. This one has a retractable visor"
	icon_state = "pilot2"
	item_icons = list(slot_head_str = 'icons/mob/head_vr.dmi')
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/mob/species/teshari/helmet_vr.dmi'
		)
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/pilot_vr/alt/attack_self(mob/user as mob)
	if(src.icon_state == initial(icon_state))
		src.icon_state = "[icon_state]up"
		to_chat(user, "You raise the visor on the pilot helmet.")
	else
		src.icon_state = initial(icon_state)
		to_chat(user, "You lower the visor on the pilot helmet.")
	update_clothing_icon() //so our mob-overlays update

//////////Talon Pilot Headgear//////////

/obj/item/clothing/head/pilot_vr/talon
	name = "ITV pilot helmet"
	desc = "An ITV version of the standard pilot helmet. Protects the head from impacts. This one has a retractable visor"
	icon_state = "pilot3"
	item_icons = list(slot_head_str = 'icons/mob/head_vr.dmi')
	sprite_sheets = list(
		SPECIES_TESHARI = 'icons/mob/species/teshari/helmet_vr.dmi'
		)
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/pilot_vr/alt/attack_self(mob/user as mob)
>>>>>>> 7744a7d5cf8e1b6601b793f2cf1038c0d873a491
	if(src.icon_state == initial(icon_state))
		src.icon_state = "[icon_state]up"
		to_chat(user, "You raise the visor on the pilot helmet.")
	else
		src.icon_state = initial(icon_state)
		to_chat(user, "You lower the visor on the pilot helmet.")
<<<<<<< HEAD
	update_clothing_icon() //so our mob-overlays update
=======
	update_clothing_icon() //so our mob-overlays update
>>>>>>> 7744a7d5cf8e1b6601b793f2cf1038c0d873a491
