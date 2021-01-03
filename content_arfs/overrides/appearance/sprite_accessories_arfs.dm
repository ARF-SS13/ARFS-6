/datum/sprite_accessory/tail/taur/fatdrake
	name = "Fat Drake (Taur dual-color)"
	icon = 'content_arfs/icons/mob/vore/taurs_arfs.dmi'
	icon_state = "fatdrake_s"
	extra_overlay = "fatdrake_markings"

/datum/sprite_accessory/tail/taur/fatdrake/andy
	name = "Fat Drake (Taur dual-color) - Special"
	ckeys_allowed = list("dameonowen")

/datum/sprite_accessory/tail/taur/drake/andy
	name = "Drake (Taur) - Special"
	ckeys_allowed = list("dameonowen")

/datum/sprite_accessory/tail/dragon/andy
	name = "dragon, colorable - Special"
	ckeys_allowed = list("dameonowen")

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