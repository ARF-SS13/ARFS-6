//Departmental collar, still working on making sure it all works.



/datum/gear/collar/department
	display_name = "collar selection"
	description = "Chose from a number of departmental collars to show your department pride."
	path = /obj/item/clothing/accessory/collar/departmental

/datum/gear/collar/department/New()
	..()
	var/collartype = list()
	collartype["Command"] = /obj/item/clothing/accessory/collar/departmental
	collartype["Science"] = /obj/item/clothing/accessory/collar/departmental/science
	collartype["Medical"] = /obj/item/clothing/accessory/collar/departmental/medical
	collartype["Engineering"] = /obj/item/clothing/accessory/collar/departmental/engineer
	collartype["Security"] = /obj/item/clothing/accessory/collar/departmental/security
	gear_tweaks += new/datum/gear_tweak/path(collartype)