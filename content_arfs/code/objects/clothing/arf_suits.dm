/obj/item/weapon/rig/vox/civilian
	name = "matte alien control module"
	suit_type = "sinister alien"
	icon_state = "voxstealth_rig"
	desc = "A light alien rig for repairs and maintenance to the outside of habitats and vessels."
	armor = list(melee = 30, bullet = 10, laser = 20,energy = 25, bomb = 20, bio = 100, rad = 100) //Standard Engineering Suit Values

	req_access = list()
	req_one_access = list()
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit)
	offline_vision_restriction = 1

	initial_modules = list(
		)

/obj/item/clothing/suit/stripper/stripper_pink/arf
	icon = 'content_arfs/icons/obj/clothing/suit_obj.dmi'

/obj/item/clothing/suit/stripper/stripper_green/arf
	icon = 'content_arfs/icons/obj/clothing/suit_obj.dmi'

/obj/item/clothing/suit/browncoat/arf
	icon = 'content_arfs/icons/obj/clothing/suit_obj.dmi'

/obj/item/clothing/suit/neocoat/arf
	icon = 'content_arfs/icons/obj/clothing/suit_obj.dmi'