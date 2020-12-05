/*
/datum/gear/fluff/testhorn
	path = /obj/item/weapon/bikehorn
	display_name = "Airhorn - Example Item" //Don't use the same as another item
	description = "An example item that you probably shouldn't see!"
	ckeywhitelist = list("broman2000")
	allowed_roles = list("Station Engineer")	//Don't include this if the item is not role restricted
	character_name = list("shitfacemcgee")	//Character name. this variable is required, or the item doesn't show in loadout. Change to "character_name = null" if not character restricted.
*/

// D CKEYS
//disguiser
//Rak Woodrow
/datum/gear/fluff/rak_1
	path = /obj/item/clothing/under/rank/security/fluff/rak
	display_name = "Security Kilt"
	description = "A customized security uniform"
	ckeywhitelist = list("disguiser")
	character_name = list("Rak Woodrow")
	allowed_roles = list("Security Officer")
/datum/gear/fluff/rak_2
    path = /obj/item/clothing/under/fluff/rak_skirt
    display_name = "Blouse and Skirt"
    description = "Blue blouse with skirt"
    ckeywhitelist = list("disguiser")
    character_name = list("Rak Woodrow")
/datum/gear/fluff/rak_3
    path = /obj/item/clothing/suit/fluff/rak_jacket
    display_name = "Wine Red Jacket"
    description = "Red whine jacket"
    ckeywhitelist = list("disguiser")
    character_name = list("Rak Woodrow")
/datum/gear/fluff/rak_4
    path = /obj/item/clothing/shoes/fluff/rak
    display_name = "Vans"
    description = "WAHT ARE THOOOOOOOOOOOOOOOOOOOOOOOOOOOOOSE"
    ckeywhitelist = list("disguiser")
    character_name = list("Rak Woodrow")