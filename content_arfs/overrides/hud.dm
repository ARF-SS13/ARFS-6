//fixes certain runtime errors when hovering your mouse over an inventory slot while controlling a simple mob with hands
/obj/screen/inventory/add_overlays()
	if(!istype(hud,/datum/hud))//Don't runtime if hud isn't a hud
		return

	var/mob/user = hud.mymob
	if(hud && user && slot_id)
		var/obj/item/holding = user.get_active_hand()

		if(!holding || user.get_equipped_item(slot_id))
			return

		var/image/item_overlay = image(holding)
		item_overlay.alpha = 92

		if(!holding.mob_can_equip(user, slot_id, disable_warning = TRUE))
			item_overlay.color = "#ff0000"
		else
			item_overlay.color = "#00ff00"

		object_overlays += item_overlay
		add_overlay(object_overlays)
