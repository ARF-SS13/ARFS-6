/*
//	General loadout items go here
*/

/datum/gear/tennis
	display_name = "tennisball selection"
	path = /obj/item/toy/tennis

/datum/gear/tennis/New()
	..()
	var/list/tennisballs = list()
	for(var/tennis in typesof(/obj/item/toy/tennis))
		var/obj/item/toy/tennis/tennis_type = tennis
		tennisballs[initial(tennis_type.name)] = tennis_type
	gear_tweaks += new/datum/gear_tweak/path(sortAssoc(tennisballs))


// Blind Sight Implant
/obj/item/weapon/implant/blindsight
	name = "blindsight implant"
	desc = "Implant which allows the blind to see emotes"
	icon_state = "implant_evil"
	var/active = TRUE


/obj/item/weapon/implant/blindsight/get_data()
	var/dat = {"
<b>Implant Specifications:</b><BR>
<b>Name:</b>OWEN Industries Blindsight Implant<BR>
<b>Life:</b>1-2 weeks after implanting<BR>
<HR>
<b>Function:</b> Allows a blind host to have a general idea of what is going on around them<BR>"}
	return dat


/obj/item/weapon/implant/blindsight/see_emote(mob/living/M, message, m_type)
	if(m_type == 1)
		if(is_blind(imp_in))
			imp_in.show_message(message, 2)


/obj/item/weapon/implanter/blindsight
	name = "blindsight implant"
	desc = "Implant which allows the blind to see emotes"
	description_info = {"Only effective for blind users."}

/obj/item/weapon/implanter/blindsight/New()
	src.imp = new /obj/item/weapon/implant/blindsight(src)
	..()
	update()
	return