#define O_PENIS "penis"
#define O_WOMB "womb"
#define O_VAGINA "vagina"
#define O_TESTICLES "testicles"
#define O_BREASTS "breasts"
#define O_ANUS "anus"

/obj/item/organ/external/genital
	parent_organ = BP_GROIN

	var/genital_size = 1 // Size to be translated.
	var/genital_name = "Human" // Sprite
	var/genital_type = SPECIES_HUMAN // Type like tapered, human, etc.
	var/sprite_suffix // suffix for which sprite is used [sprite]_suffix
	var/visibility_preference = GENITAL_HIDDEN_BY_CLOTHES // used to determine if it should be shown through clothing.
	var/aroused = AROUSAL_NONE // You can very much guess what this does B)
	var/uses_skintones = FALSE // be the color of the skin _tone_ the player has.
	var/uses_skin_color = FALSE // be the color of the skin the player has.
	var/genital_location = LOWER_TORSO // location, for clothing..?

//This translates the float size into a sprite string
/obj/item/organ/external/genital/proc/get_sprite_size_string()
	return 0

//This translates the float size into a sprite string
/obj/item/organ/external/genital/proc/update_sprite_suffix()
	sprite_suffix = "[get_sprite_size_string()]"

/obj/item/organ/external/genital/proc/get_description_string(datum/sprite_accessory/genital/gas)
	return "You see genitals"

/obj/item/organ/external/genital/proc/update_genital_icon_state()
	return

/obj/item/organ/external/genital/proc/set_size(size)
	genital_size = size
	update_sprite_suffix()

/obj/item/organ/external/genital/Initialize()
	. = ..()
	update_sprite_suffix()

/obj/item/organ/external/genital/replaced(var/mob/living/carbon/human/target,var/obj/item/organ/external/affected)
	if(target.client.prefs.disable_erp_preferences)
		return
	. = ..()

/obj/item/organ/external/genital/handle_organ_mod_special(var/removed = FALSE)
	. = ..()
	update_genital_icon_state()

/obj/item/organ/external/genital/proc/build_from_dna(datum/dna/DNA, associated_key)
	//var/datum/sprite_accessory/genital/accessory = GLOB.sprite_accessories[associated_key][DNA.mutant_bodyparts[associated_key][MUTANT_INDEX_NAME]]
	//genital_name = accessory.name
	//genital_type = accessory.icon_state
	//build_from_accessory(accessory, DNA)
	update_sprite_suffix()

/// for specific build_from_dna behavior that also checks the genital accessory.
/obj/item/organ/external/genital/proc/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	return

/obj/item/organ/external/genital/proc/is_exposed()
	if(!owner)
		return TRUE

	if(!ishuman(owner))
		return TRUE

	var/mob/living/carbon/human/human = owner

	switch(visibility_preference)
		if(GENITAL_ALWAYS_SHOW)
			return TRUE
		if(GENITAL_HIDDEN_BY_CLOTHES)
			if((human.w_uniform && human.w_uniform.body_parts_covered & genital_location) || (human.wear_suit && human.wear_suit.body_parts_covered & genital_location))
				return FALSE
			else
				return TRUE
		else
			return FALSE

// Penoos
/obj/item/organ/external/genital/penis
	name = "penis"
	desc = "A male reproductive organ."
	icon_state = "penis"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/penis.dmi'

	genital_location = LOWER_TORSO
	parent_organ = BP_GROIN

	organ_tag = O_PENIS
	body_part = LOWER_TORSO

	cannot_break = 1

	var/girth = 9
	var/sheath = SHEATH_NONE

/obj/item/organ/external/genital/penis/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = ""
	var/pname = lowertext(genital_name) == "nondescript" ? "" : lowertext(genital_name) + " "
	if(sheath != SHEATH_NONE && aroused != AROUSAL_FULL) //Hidden in sheath
		switch(sheath)
			if(SHEATH_NORMAL)
				returned_string = "You see a sheath."
			if(SHEATH_SLIT)
				returned_string = "You see a slit." ///Typo fix.
		if(aroused == AROUSAL_PARTIAL)
			returned_string += " There's a [pname]penis poking out of it."
	else
		returned_string = "You see a [pname]penis. You estimate it's [genital_size] inches long, and [girth] inches in circumference."
		switch(aroused)
			if(AROUSAL_NONE)
				returned_string += " It seems flaccid."
			if(AROUSAL_PARTIAL)
				returned_string += " It's partically erect."
			if(AROUSAL_FULL)
				returned_string += " It's fully erect."
	return returned_string

/obj/item/organ/external/genital/penis/update_genital_icon_state()
	var/size_affix
	var/measured_size = FLOOR(genital_size,1)
	if(measured_size < 1)
		measured_size = 1
	switch(measured_size)
		if(1 to 10)
			size_affix = "1"
		if(11 to 15)
			size_affix = "2"
		if(16 to 24)
			size_affix = "3"
		else
			size_affix = "4"
	var/passed_string = "penis_[genital_type]_[size_affix]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/penis/get_sprite_size_string()
	if(aroused != AROUSAL_FULL && sheath != SHEATH_NONE) //Sheath time!
		var/poking_out = 0
		if(aroused == AROUSAL_PARTIAL)
			poking_out = 1
		return "[lowertext(sheath)]_[poking_out]"

	var/size_affix
	var/measured_size = FLOOR(genital_size,1)
	var/is_erect = 0
	if(aroused == AROUSAL_FULL)
		is_erect = 1
	if(measured_size < 1)
		measured_size = 1
	switch(measured_size)
		if(1 to 10)
			size_affix = "1"
		if(11 to 15)
			size_affix = "2"
		if(16 to 24)
			size_affix = "3"
		else
			size_affix = "4"
	var/passed_string = "[genital_type]_[size_affix]_[is_erect]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/penis/build_from_dna(datum/dna/DNA, associated_key)
	..()
	girth = owner.penis_girth
	uses_skin_color = owner.penis_uses_skincolor
	set_size(owner.penis_size)

/obj/item/organ/external/genital/penis/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	var/datum/sprite_accessory/genital/penis/snake = accessory
	if(snake.can_have_sheath)
		sheath = owner.penis_sheath
	if(owner.penis_uses_skintones)
		uses_skintones = accessory.has_skintone_shading

/obj/item/organ/external/genital/testicles
	name = "testicles"
	desc = "A male reproductive organ."
	icon_state = "testicles"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/testicles.dmi'
	
	parent_organ = BP_GROIN
	genital_location = LOWER_TORSO

	organ_tag = O_TESTICLES
	body_part = LOWER_TORSO

	cannot_break = 1

	aroused = AROUSAL_CANT

/obj/item/organ/external/genital/testicles/update_genital_icon_state()
	var/measured_size = clamp(genital_size, 1, 3)
	var/passed_string = "testicles_[genital_type]_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/testicles/get_description_string(datum/sprite_accessory/genital/gas)
	if(genital_name == "Internal") //Checks if Testicles are of Internal Variety
		visibility_preference = GENITAL_SKIP_VISIBILITY //Removes visibility if yes.
	else
		return "You see a pair of testicles, they look [lowertext(balls_size_to_description(genital_size))]."

/obj/item/organ/external/genital/testicles/build_from_dna(datum/dna/DNA, associated_key)
	..()
	uses_skin_color = owner.testicles_uses_skincolor
	set_size(owner.balls_size)

/obj/item/organ/external/genital/testicles/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(owner.testicles_uses_skintones)
		uses_skintones = accessory.has_skintone_shading

/obj/item/organ/external/genital/testicles/get_sprite_size_string()
	var/measured_size = FLOOR(genital_size,1)
	measured_size = clamp(measured_size, 0, 3)
	var/passed_string = "[genital_type]_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/vagina
	name = "vagina"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/vagina.dmi'
	icon_state = "vagina"

	parent_organ = BP_GROIN
	genital_location = LOWER_TORSO

	organ_tag = O_VAGINA
	body_part = LOWER_TORSO

	cannot_break = 1

/obj/item/organ/external/genital/vagina/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "You see a [lowertext(genital_name)] vagina."
	if(lowertext(genital_name) == "cloaca")
		returned_string = "You see a cloaca." //i deserve a pipebomb for this
	switch(aroused)
		if(AROUSAL_NONE)
			returned_string += " It seems dry."
		if(AROUSAL_PARTIAL)
			returned_string += " It's glistening with arousal."
		if(AROUSAL_FULL)
			returned_string += " It's bright and dripping with arousal."
	return returned_string

/obj/item/organ/external/genital/vagina/get_sprite_size_string()
	var/is_dripping = 0
	if(aroused == AROUSAL_FULL)
		is_dripping = 1
	return "[genital_type]_[is_dripping]"

/obj/item/organ/external/genital/vagina/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = owner.vagina_uses_skincolor
	return ..() // will update the sprite suffix

/obj/item/organ/external/genital/vagina/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(owner.vagina_uses_skintones)
		uses_skintones = accessory.has_skintone_shading

/obj/item/organ/external/genital/womb
	name = "womb"
	desc = "A female reproductive organ."
	icon = 'modular_skyrat/master_files/icons/obj/genitals/vagina.dmi'
	icon_state = "womb"

	parent_organ = BP_GROIN
	genital_location = LOWER_TORSO

	organ_tag = O_WOMB
	body_part = LOWER_TORSO

	cannot_break = 1

	aroused = AROUSAL_CANT

	visibility_preference = GENITAL_SKIP_VISIBILITY

/obj/item/organ/external/genital/anus
	name = "anus"
	desc = "What do you want me to tell you?"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/anus.dmi'
	icon_state = "anus"
	mutantpart_key = "anus"

	genital_location = LOWER_TORSO
	parent_organ = BP_GROIN

	organ_tag = O_ANUS
	body_part = LOWER_TORSO

	cannot_break = 1
	mutantpart_info = list(MUTANT_INDEX_NAME = "Normal", MUTANT_INDEX_COLOR_LIST = list("FEB"))
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	genital_location = GROIN
	drop_when_organ_spilling = FALSE

/obj/item/organ/external/genital/anus/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "You see an [lowertext(genital_name)]."
	if(aroused == AROUSAL_PARTIAL)
		returned_string += " It looks tight."
	if(aroused == AROUSAL_FULL)
		returned_string += " It looks very tight."
	return returned_string

/obj/item/organ/external/genital/breasts
	name = "breasts"
	desc = "Female milk producing organs."
	icon_state = "breasts"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/breasts.dmi'

	genital_location = LOWER_TORSO
	parent_organ = BP_GROIN

	organ_tag = O_PENIS
	body_part = LOWER_TORSO

	cannot_break = 1
	genital_type = "pair"

	mutantpart_key = "breasts"
	mutantpart_info = list(MUTANT_INDEX_NAME = "Pair", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	genital_location = CHEST
	drop_when_organ_spilling = FALSE
	var/lactates = FALSE

/obj/item/organ/external/genital/breasts/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "You see a [lowertext(genital_name)] of breasts."
	var/size_description
	var/translation = breasts_size_to_cup(genital_size)
	switch(translation)
		if("Flatchested")
			size_description = " They are small and flat, however."
		if("beyond measurement")
			size_description = " Their size is enormous, you estimate they're around [genital_size] inches in diameter."
		else
			size_description = " You estimate they are [translation]-cups."
	returned_string += size_description
	if(aroused == AROUSAL_FULL)
		if(lactates)
			returned_string += " The nipples seem hard, perky and are leaking milk."
		else
			returned_string += " Their nipples look hard and perky."
	return returned_string

/obj/item/organ/external/genital/breasts/update_genital_icon_state()
	var/max_size = 5
	var/current_size = FLOOR(genital_size, 1)
	if(current_size < 0)
		current_size = 0
	else if (current_size > max_size)
		current_size = max_size
	var/passed_string = "breasts_pair_[current_size]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/breasts/get_sprite_size_string()
	var/max_size = 5
	if(genital_type == "pair")
		max_size = 16
	var/current_size = FLOOR(genital_size, 1)
	if(current_size < 0)
		current_size = 0
	else if (current_size > max_size)
		current_size = max_size
	var/passed_string = "[genital_type]_[current_size]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/breasts/build_from_dna(datum/dna/DNA, associated_key)
	..()
	lactates = DNA.features["breasts_lactation"]
	uses_skin_color = DNA.features["breasts_uses_skincolor"]
	set_size(DNA.features["breasts_size"])

/obj/item/organ/external/genital/breasts/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["breasts_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/proc/breasts_size_to_cup(number)
	if(number < 0)
		number = 0
	var/returned = GLOB.breasts_size_translation["[number]"]
	if(!returned)
		returned = "beyond measurement"
	return returned

/proc/breasts_cup_to_size(cup)
	for(var/key in GLOB.breasts_size_translation)
		if(GLOB.breasts_size_translation[key] == cup)
			return text2num(key)
	return 0

/proc/balls_size_to_description(number)
	if(number < 0)
		number = 0
	var/returned = GLOB.balls_size_translation["[number]"]
	if(!returned)
		returned = "beyond measurement"
	return returned

/proc/balls_description_to_size(cup)
	for(var/key in GLOB.balls_size_translation)
		if(GLOB.balls_size_translation[key] == cup)
			return text2num(key)
	return 0

/mob/living/carbon/human/verb/toggle_genitals()
	set category = "IC"
	set name = "Expose/Hide genitals"
	set desc = "Allows you to toggle which genitals should show through clothes or not."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't toggle genitals visibility right now..."))
		return

	var/list/genital_list = list()
	for(var/obj/item/organ/external/genital/G in internal_organs)
		if(!G.visibility_preference == GENITAL_SKIP_VISIBILITY)
			genital_list += G
	if(!genital_list.len) //There is nothing to expose
		return
	//Full list of exposable genitals created
	var/obj/item/organ/external/genital/picked_organ
	picked_organ = input(src, "Choose which genitalia to expose/hide", "Expose/Hide genitals") as null|anything in genital_list
	if(picked_organ && (picked_organ in internal_organs))
		var/list/gen_vis_trans = list("Never show" = GENITAL_NEVER_SHOW,
												"Hidden by clothes" = GENITAL_HIDDEN_BY_CLOTHES,
												"Always show" = GENITAL_ALWAYS_SHOW
												)
		var/picked_visibility = input(src, "Choose visibility setting", "Expose/Hide genitals") as null|anything in gen_vis_trans
		if(picked_visibility && picked_organ && (picked_organ in internal_organs))
			picked_organ.visibility_preference = gen_vis_trans[picked_visibility]
			update_body()
	return

//Removing ERP IC verb depending on config
/mob/living/carbon/human/Initialize()
	. = ..()
	if(CONFIG_GET(flag/disable_erp_preferences))
		verbs -= /mob/living/carbon/human/verb/toggle_genitals

/mob/living/carbon/human/verb/toggle_arousal()
	set category = "IC"
	set name = "Toggle Arousal"
	set desc = "Allows you to toggle how aroused your private parts are."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't toggle arousal right now..."))
		return

	var/list/genital_list = list()
	for(var/obj/item/organ/external/genital/G in internal_organs)
		if(!G.aroused == AROUSAL_CANT)
			genital_list += G
	if(!genital_list.len) //There is nothing to expose
		return
	//Full list of exposable genitals created
	var/obj/item/organ/external/genital/picked_organ
	picked_organ = input(src, "Choose which genitalia to change arousal", "Expose/Hide genitals") as null|anything in genital_list
	if(picked_organ && (picked_organ in internal_organs))
		var/list/gen_arous_trans = list("Not aroused" = AROUSAL_NONE,
												"Partly aroused" = AROUSAL_PARTIAL,
												"Very aroused" = AROUSAL_FULL
												)
		var/picked_arousal = input(src, "Choose arousal", "Toggle Arousal") as null|anything in gen_arous_trans
		if(picked_arousal && picked_organ && (picked_organ in internal_organs))
			picked_organ.aroused = gen_arous_trans[picked_arousal]
			picked_organ.update_sprite_suffix()
			update_body()
	return

//Removing ERP IC verb depending on config
/mob/living/carbon/human/Initialize()
	. = ..()
	if(CONFIG_GET(flag/disable_erp_preferences))
		verbs -= /mob/living/carbon/human/verb/toggle_arousal



