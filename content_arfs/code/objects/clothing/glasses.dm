/obj/item/clothing/glasses/omnihud/visor
	name = "AR visor"
	desc = "The VZR-AR are a product based upon the classic AR Glasses, just more fashionable."
	icon_override = 'content_arfs/icons/obj/clothing/face.dmi'
	icon = 'content_arfs/icons/obj/clothing/face.dmi'
	icon_state = "visor_CIV"
	item_state = "visor_CIV"


/obj/item/clothing/glasses/omnihud/visor/rtgs
	name = "Rose tinted glasses"
	desc = "A set of RTGS, rose tinted glasses. Once set up they can lock to someone's face"
	color = "#DA50DA"

	var/linked_id

/obj/item/clothing/glasses/omnihud/visor/rtgs/proc/create_link(obj/item/ID)
	to_chat(usr,"Linked!") //src because user is not existing in this proc.
	linked_id = ID

/obj/item/clothing/glasses/omnihud/visor/rtgs/proc/toggle_lock()
	if(canremove)
		to_chat(usr, "<span class='warning'>You activate it's locking mechanism</span>")
	else
		to_chat(usr, "<span class='warning'>You decativate the locking mechanism</span>")
	canremove = !canremove

/obj/item/clothing/glasses/omnihud/visor/rtgs/attackby(obj/item/W, mob/user)
	..()
	if(istype(W,/obj/item/weapon/card/id))
		if(!linked_id)
			create_link(W)
			return

		if(W == linked_id)
			toggle_lock()