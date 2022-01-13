/datum/sprite_accessory/tail/taur/fatdrake
	name = "Fat Drake (Taur dual-color)"
	icon = 'content_arfs/icons/mob/vore/taurs_arfs.dmi'
	icon_state = "fatdrake_s"
	extra_overlay = "fatdrake_markings"

/datum/sprite_accessory/tail/taur/fatdrake/andy
	name = "Fat Drake (Taur dual-color) - Special"
	ckeys_allowed = list("dameonowen", "andyman105", "dwagin")

/datum/sprite_accessory/tail/taur/drake/andy
	name = "Drake (Taur) - Special"
	ckeys_allowed = list("dameonowen", "andyman105", "dwagin")

/datum/sprite_accessory/tail/dragon/andy
	name = "dragon, colorable - Special"
	ckeys_allowed = list("dameonowen", "andyman105", "dwagin")

/mob/living/carbon/human/proc/special_select_tail()
	set name = "Select Taur"
	set category = "Abilities"

	if(stat || world.time < last_special)
		return

	last_special = world.time + 10
	var/list/pretty_tail_styles = list("Normal" = /datum/sprite_accessory/tail/dragon/andy,
									"Normal Taur" = /datum/sprite_accessory/tail/taur/drake/andy,
									"Fat Taur" = /datum/sprite_accessory/tail/taur/fatdrake/andy)

	var/new_tail_style = input(src, "Pick a taur!", "Character Preference", tail_style ? tail_style.name : null) as null|anything in pretty_tail_styles
	if(!new_tail_style)
		return

	tail_style = tail_styles_list[pretty_tail_styles[new_tail_style]]
	var/current_pri_color = rgb(r_tail,g_tail,b_tail)
	var/current_sec_color = rgb(r_tail2,g_tail2,b_tail2)

	var/list/new_color_rgb_list = hex2rgb(current_pri_color)
	r_tail = new_color_rgb_list[1]
	g_tail = new_color_rgb_list[2]
	b_tail = new_color_rgb_list[3]

	new_color_rgb_list = hex2rgb(current_sec_color)
	r_tail2 = new_color_rgb_list[1]
	g_tail2 = new_color_rgb_list[2]
	b_tail2 = new_color_rgb_list[3]
	update_tail_showing()
	regenerate_icons()

//YW markings
/datum/sprite_accessory/marking/yw
	icon = 'content_arfs/icons/mob/player/markings_yw.dmi'

/datum/sprite_accessory/marking/yw/lizardsnoutsharp
	name = "Lizard snout (sharp)"
	icon_state = "lizard_snout_sharp"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/yw/lizard_snout_sharp_light
	name = "Lizard Snout (Sharp Light)"
	icon_state = "lizard_snout_sharp_light"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/yw/lizard_snout_round
	name = "Lizard Snout (Round)"
	icon_state = "lizard_snout_round"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/yw/lizard_snout_round_light
	name = "Lizard Snout (Round Light)"
	icon_state = "lizard_snout_round_light"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/yw/wolf_snout_light_round
	name = "Canine Snout (Light Round)"
	icon_state = "wolf_snout_light_round"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/yw/roundhumanoid
	name = "Round (Humanoid)"
	icon_state = "preg_tummy_humanoid"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_TORSO,BP_GROIN,BP_L_HAND,BP_R_HAND,BP_L_LEG,BP_R_LEG)

/datum/sprite_accessory/marking/yw/roundteshari
	name = "Round (Teshari)"
	icon_state = "preg_tummy_teshari"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_TORSO,BP_GROIN,BP_L_HAND,BP_R_HAND,BP_L_LEG,BP_R_LEG)

/datum/sprite_accessory/marking/yw/teshari_pattern_female
	name = "Teshari female pattern"
	icon_state = "tesh-pattern-fem"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD)

/datum/sprite_accessory/marking/yw/teshari_pattern_male
	name = "Teshari male pattern"
	icon_state = "tesh-pattern-male"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD)

/datum/sprite_accessory/marking/yw/teshari_large_eyes
	name = "Teshari large eyes"
	icon_state = "teshlarge_eyes"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/yw/teshari_coat
	name = "Teshari coat"
	icon_state = "tesh_coat"
	color_blend_mode = ICON_MULTIPLY
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_TORSO,BP_HEAD)

/datum/sprite_accessory/ears/single_horn
		name = "Colorable single horn"
		icon_state = "singlehorn"
		color_blend_mode = ICON_MULTIPLY
		do_colouration = 1

/datum/sprite_accessory/ears/wolf_ears_alt
		name = "Wolf Ears alt"
		icon_state = "wolf_ears"
		color_blend_mode = ICON_MULTIPLY
		do_colouration = 1

//Facial hair stuff
/datum/sprite_accessory/facial_hair/eevee_mane
	color_blend_mode = ICON_MULTIPLY
	name = "Eevee mane"
	icon = 'content_arfs/icons/mob/player/human_face_arfs.dmi'
	icon_state = "facial_eeveemane"
	gender = NEUTER
	species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_FENNEC, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE, SPECIES_WEREBEAST)