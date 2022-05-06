/datum/preferences
	// The weiner part.
	var/penis		// penis ref 		// var/datum/sprite_accessory/genital/penis/none/default = /datum/sprite_accessory/genital/penis/none
	var/r_penis = 179					// Genital color
	var/g_penis = 148					// Genital color
	var/b_penis = 116					// Genital color

	var/emissive_penis = 0 // bool

	var/r_penis_emissive = 0 // int 0 - 255
	var/g_penis_emissive = 0 // int 0 - 255
	var/b_penis_emissive = 0 // int 0 - 255

	var/penis_uses_skincolor = 0 // bool
	var/penis_size = round((PENIS_MIN_LENGTH + PENIS_MAX_LENGTH) / 2)
	var/penis_girth = round((PENIS_MIN_LENGTH + PENIS_MAX_GIRTH) / 2)

	var/penis_taur = 0 // bool

	// The place to hide the weiner.
	var/penis_sheath = SHEATH_NONE // SHEATH_ Macro
	var/r_penis_sheath = 0 // int 0 - 255
	var/g_penis_sheath = 0 // int 0 - 255
	var/b_penis_sheath = 0 // int 0 - 255

	// it it spelt like testicles, or testicals 🤔
	var/testicles
	var/r_testicles = 179 // int 0 - 255
	var/g_testicles = 148 // int 0 - 255
	var/b_testicles = 116 // int 0 - 255

	var/testicles_uses_skincolor = 0 // bool

	var/emissive_testicles = 0 // bool

	var/r_testicles_emissive = 0 // int 0 - 255
	var/g_testicles_emissive = 0 // int 0 - 255
	var/b_testicles_emissive = 0 // int 0 - 255

	var/balls_size = 2 // int, idk why it aint a macro, what the fuck does 2 mean, 2 miles? 2 kilometers? yeah, huge difference bud.

	// gimme da poosy b0ss
	var/vagina
	var/r_vagina = 179 // int 0 - 255
	var/g_vagina = 148 // int 0 - 255
	var/b_vagina = 116 // int 0 - 255

	var/vagina_uses_skincolor = 0 // bool

	var/emissive_vagina = 0 // bool

	var/r_vagina_emissive = 0 // int 0 - 255
	var/g_vagina_emissive = 0 // int 0 - 255
	var/b_vagina_emissive = 0 // int 0 - 255

	var/womb // ..if you thought vagina was enough, wait till you see there's a womb included too!

	// succulent, moist, wait- moist? wtf? no???
	var/breasts
	var/r_breasts = 179 // int 0 - 255
	var/g_breasts = 148 // int 0 - 255
	var/b_breasts = 116 // int 0 - 255

	var/breasts_uses_skincolor = 0 // bool

	var/emissive_breasts = 0 // bool

	var/r_breasts_emissive = 0 // int 0 - 255
	var/g_breasts_emissive = 0 // int 0 - 255
	var/b_breasts_emissive = 0 // int 0 - 255


	// oh that's why it's moist, huh.
	var/breasts_lactation

	var/breasts_size = 4 // int

	// The forbidden gay 🍑, if you eat it you become gay. Or straight, whatever rocks your boat.
	var/anus


	// :fuckingdead: