//lifeguard uniform (example)
/obj/item/clothing/under/swimsuit/lifeguard
	name = "lifeguard swimsuit"
	desc = "A bright red swimsuit marking the wearer as a lifeguard."
	icon = 'content_arfs/icons/obj/clothing/uniform_obj.dmi'
	icon_state = "lifeguard"
	icon_override = 'content_arfs/icons/mob/clothing/uniforms.dmi'
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)
/obj/item/clothing/under/cheongsam/pink
	name = "white and pink cheongsam"
	desc = "It is a white and pink cheongsam dress."
	icon_state = "white_pink"
	icon = 'content_arfs/icons/obj/clothing/uniform_obj.dmi'
	icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'

/obj/item/clothing/under/schoolgirl/red
	name = "School Girl Outfit"
	desc = "A red school girl outfit with a short skirt"
	icon_state = "schoolgirlred"
	icon = 'content_arfs/icons/obj/clothing/uniform_obj.dmi'
	icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'

/obj/item/clothing/under/schoolgirl/green
	name = "School Girl Outfit"
	desc = "A green school girl outfit with a short skirt"
	icon_state = "schoolgirlgreen"
	icon = 'content_arfs/icons/obj/clothing/uniform_obj.dmi'
	icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'

/obj/item/clothing/under/schoolgirl/orange
	name = "School Girl Outfit"
	desc = "A orange school girl outfit with a short skirt"
	icon_state = "schoolgirlorange"
	icon = 'content_arfs/icons/obj/clothing/uniform_obj.dmi'
	icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'

/obj/item/clothing/under/lobster
	name= "Lobster Costume"
	desc = "A costume that makes you look like a lobster. Stay away from the chef!"
	icon_state = "lobster"
	icon = 'content_arfs/icons/obj/clothing/uniform_obj.dmi'
	icon_override = 'content_arfs/icons/mob/clothing/custom_clothing_arf.dmi'

/obj/item/clothing/head/lobster
	name= "Lobster head"
	desc= "The hat to go with the lobster costume"
	icon_state = "lobster"
	icon = 'content_arfs/icons/obj/clothing/head_obj.dmi'
	icon_override = 'content_arfs/icons/mob/clothing/head.dmi'


//Nullsuits (Zero Suits)
/obj/item/clothing/under/rank/nullsuit //The base suit. Don't use this or spawn this one.
	name = "actually null nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. Actually none at all since it's invisible and should not be spawned!"
	sensor_mode = 3
	icon = 'content_arfs/icons/obj/clothing/nullsuits.dmi'
	icon_override = 'content_arfs/icons/obj/clothing/nullsuits.dmi'
	icon_state = ""
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/civ
	name = "civilian nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination."
	sensor_mode = 3
	icon_state = "nullsuit_civ"
	item_state = "nullsuit_civ"
	worn_state = "nullsuit_civ"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/cmd //Command version
	name = "command nullsuit"
	desc = ""
	icon_state = "nullsuit_cmd"
	item_state = "nullsuit_cmd"
	worn_state = "nullsuit_cmd"

/obj/item/clothing/under/rank/nullsuit/sec //Security version
	name = "security nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of padding."
	icon_state = "nullsuit_sec"
	item_state = "nullsuit_sec"
	worn_state = "nullsuit_sec"
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/sec/hos //HoS version
	name = "head of security nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the Head of Security. This particular variant has a tiny bit more padding."
	icon_state = "nullsuit_hos"
	item_state = "nullsuit_hos"
	worn_state = "nullsuit_hos"

/obj/item/clothing/under/rank/nullsuit/med //Medical version
	name = "medical nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of bio resistance."
	icon_state = "nullsuit_med"
	item_state = "nullsuit_med"
	worn_state = "nullsuit_med"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/nullsuit/med/cmo //Chief Medical Officer version
	name = "Chief Medical Officer nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the Chief Medical Officer. This particular variant has a tiny bit of bio resistance."
	icon_state = "nullsuit_cmo"
	item_state = "nullsuit_cmo"
	worn_state = "nullsuit_cmo"

/obj/item/clothing/under/rank/nullsuit/eng //Engineering version
	name = "engineering nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of radiation resistance."
	icon_state = "nullsuit_eng"
	item_state = "nullsuit_eng"
	worn_state = "nullsuit_eng"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 10)

/obj/item/clothing/under/rank/nullsuit/eng/ce //Chief Engineer version
	name = "chief engineer nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the Chief Engineer. This particular variant has a tiny bit of radiation resistance."
	icon_state = "nullsuit_ce"
	item_state = "nullsuit_ce"
	worn_state = "nullsuit_ce"

/obj/item/clothing/under/rank/nullsuit/sci //Science version
	name = "science nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination. This particular variant has a tiny bit of explosion resistance."
	icon_state = "nullsuit_sci"
	item_state = "nullsuit_sci"
	worn_state = "nullsuit_sci"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/under/rank/nullsuit/sci/rd //Research Director version
	name = "research director nullsuit"
	desc = "A skin-tight bodysuit that leaves little to the imagination with colors to distinguish the research director. This particular variant has a tiny bit of explosion resistance."
	icon_state = "nullsuit_rd"
	item_state = "nullsuit_rd"
	worn_state = "nullsuit_rd"

/obj/item/clothing/under/rank/nullsuit/cargo //Cargo
	name = "cargo nullsuit"
	desc = ""
	icon_state = "nullsuit_cargo"
	item_state = "nullsuit_cargo"
	worn_state = "nullsuit_cargo"