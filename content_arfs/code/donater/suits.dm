//Gozulio
/obj/item/clothing/suit/radiation/gozu
	name = "A.R.F Engineering Officers Radiation Suit"
	desc = "An A.R.F Engineering Officers Radiation Suit, for working around hazardous radioactive materials. This one has the name \"Glitterpaws\" printed acros it's back."
	icon = 'content_arfs/icons/obj/clothing/suit_obj.dmi'
	icon_state = "gozrad"
	icon_override = 'content_arfs/icons/mob/clothing/suit.dmi'
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)

//Disguiser
/obj/item/clothing/suit/fluff/rak_jacket
	name = "Wine Red Jacket"
	desc = "A nice comfterble jacket that sports a wine red coloration"
	icon = 'content_arfs/icons/obj/clothing/suit_obj.dmi'
	icon_state = "rak_jacket"
	icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)

//tk420634
/obj/item/clothing/head/helmet/space/void/retrotech
	name = "retrotech helmet"
	desc = "A clear green bowl style helmet made out of reinforced glass composite."
	icon = 'content_arfs/icons/mob/clothing/head.dmi'
	icon_state = "retrotech"
	icon_override = 'content_arfs/icons/mob/clothing/head.dmi'
	flags_inv = null
	item_state = "retrotech"
	armor = list(melee = 60, bullet = 70, laser = 10,energy = 0, bomb = 35, bio = 100, rad = 60)
	siemens_coefficient = 0.6
//	species_restricted = list("Tajara")

/obj/item/clothing/suit/space/void/retrotech
	name = "retrotech pressure suit"
	desc = "A white suit that resembles a softsuit, but is actually very well armored. Made from a ceramo-kevlar composite for maxium flexibility and protection."
	icon = 'content_arfs/icons/mob/clothing/suit.dmi'
	icon_state = "retrotech"
	icon_override = 'content_arfs/icons/mob/clothing/suit.dmi'
	item_state = "retrotech"
	slowdown = 0
	w_class = ITEMSIZE_NORMAL
	armor = list(melee = 70, bullet = 60, laser = 60, energy = 35, bomb = 35, bio = 100, rad = 60)
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/melee/energy/sword,/obj/item/weapon/handcuffs)
	siemens_coefficient = 0.6
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/items/clothing_lefthand.dmi',
		slot_r_hand_str ='content_arfs/icons/mob/items/clothing_righthand.dmi',
		)
//	species_restricted = list("Tajara")

/obj/item/clothing/under/hyperfiber/bluespace/admin

/obj/item/clothing/under/hyperfiber/bluespace/admin/bluespace_size(mob/usr as mob)
	if (!ishuman(usr))
		return

	var/mob/living/carbon/human/H = usr

	if (H.stat || H.restrained())
		return

	if (src != H.w_uniform)
		to_chat(H,"<span class='warning'>You must be WEARING the uniform to change your size.</span>")
		return

	var/new_size = input(usr, "Put the desired size.", "Set Size", 200) as num|null
	if(!new_size)
		return //cancelled

	//Check AGAIN because we accepted user input which is blocking.
	if (src != H.w_uniform)
		to_chat(H,"<span class='warning'>You must be WEARING the uniform to change your size.</span>")
		return

	if (H.stat || H.restrained())
		return

	if (isnull(H.size_multiplier)) // Why would this ever be the case?
		to_chat(H,"<span class='warning'>The uniform panics and corrects your apparently microscopic size.</span>")
		H.resize(RESIZE_NORMAL, ignore_prefs = TRUE)
		H.update_icons() //Just want the matrix transform
		return

	if (new_size < 1)
		to_chat(H,"<span class='notice'>The safety features of the uniform prevent you from choosing this size.</span>")
		return

	else if(new_size)
		if(new_size != H.size_multiplier)
			if(!original_size)
				original_size = H.size_multiplier
			H.resize(new_size/100, TRUE, TRUE, TRUE) // Ignores prefs because you can only resize yourself
			H.visible_message("<span class='warning'>The space around [H] distorts as they change size!</span>","<span class='notice'>The space around you distorts as you change size!</span>")
		else //They chose their current size.
			return