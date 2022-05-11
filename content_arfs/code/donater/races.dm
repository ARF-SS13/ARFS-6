// EEVEE RACE - Restricted to ThingPony
/datum/species/human/eevee
	name = "Eevee"
	name_plural = "Eevees"


	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)

	tail = "tail"
	icobase_tail = 1
	color_mult = 1
//	color_blend = 0
	darksight = 9
	slowdown = -0.2

	blurb = "Spce eevee? Space eevee!"
	secondary_langs = list(LANGUAGE_CANILUNZT)

	icobase = 'content_arfs/icons/mob/player/r_eevee_arf.dmi'    // Normal icon set.
	deform = 'content_arfs/icons/mob/player/r_eevee_arf.dmi' // Mutated icon set.

	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 100
	health_hud_intensity = 2
	num_alternate_languages = 3

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_EYE_COLOR

//	ckeyrestricted = "thingpony"


/datum/species/human/corgi
	name = "Corgi"
	name_plural = "Corgie's"


	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)

	tail = "tail"
	icobase_tail = 1
//	color_mult = 1
//	color_blend = 0

	blurb = "OMG it's a corgi!"
	secondary_langs = list(LANGUAGE_CANILUNZT)

	icobase = 'content_arfs/icons/mob/player/r_corgi_arf.dmi'    // Normal icon set.
	deform = 'content_arfs/icons/mob/player/r_corgi_arf.dmi' // Mutated icon set.
	male_scream_sound = 'sound/arfs/races/corgiscream.ogg'
	female_scream_sound = 'sound/arfs/races/corgiscream.ogg'

	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 100
	health_hud_intensity = 2
	num_alternate_languages = 3

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_EYE_COLOR

	inherent_verbs = list(/mob/living/carbon/human/proc/lick_wounds)


/datum/species/human/lopunny
	name = "Lopunny"
	name_plural = "Lopunnies"


	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)

	tail = "tail"
	icobase_tail = 1
//	color_mult = 1
//	color_blend = 0

	blurb = "Lopunny"
	secondary_langs = list(LANGUAGE_CANILUNZT)

	icobase = 'content_arfs/icons/mob/player/r_lopunny_arf.dmi'    // Normal icon set.
	deform = 'content_arfs/icons/mob/player/r_lopunny_arf.dmi' // Mutated icon set.
	//male_scream_sound = 'sound/arfs/races/corgiscream.ogg'
	//female_scream_sound = 'sound/arfs/races/corgiscream.ogg'

	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 100
	health_hud_intensity = 2
	num_alternate_languages = 3

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_EYE_COLOR

	inherent_verbs = list(/mob/living/carbon/human/proc/lick_wounds)

//Porting from Yawn


#define SPECIES_GREY_YW

/datum/species/grey

	name = "Grey"
	name_plural = "Gray"
	icobase = 'content_arfs/icons/mob/player/r_grey.dmi'
	deform = 'content_arfs/icons/mob/player/r_grey.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)
	blurb = "Greys are a species of aliens that are more weak than humans physically, but possesses\
	the ability to talk telephatically with themselves and other species, Due to this, Grey have no\
	naming scheme or language, having names only to make easier communication with other species.\
	<br>\The Grey have unknown origin even to themselves, scientists believes they came from\
	another galaxy, greys have chosen mauna-b to act as their home planet due to high amount of grey\
	residing in there."
	wikilink = "https://yawn.izac.live/index.php?title=Grey"
	num_alternate_languages = 3
	species_language = LANGUAGE_PSIONIC
	secondary_langs = list(LANGUAGE_PSIONIC)
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)
	flesh_color = "#a598ad"
	blood_color = "#A200FF"
	brute_mod = 1.25
	flash_mod = 1.15
	darksight = 5
	min_age = 18
	max_age = 130


	health_hud_intensity = 1.5

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

	has_organ = list(
		O_HEART =		/obj/item/organ/internal/heart,
		O_LUNGS =		/obj/item/organ/internal/lungs,
		O_VOICE = 		/obj/item/organ/internal/voicebox,
		O_LIVER =		/obj/item/organ/internal/liver,
		O_KIDNEYS =		/obj/item/organ/internal/kidneys,
		O_BRAIN =		/obj/item/organ/internal/brain,
		O_APPENDIX = 	/obj/item/organ/internal/appendix,
		O_SPLEEN = 		/obj/item/organ/internal/spleen,
		O_EYES =		/obj/item/organ/internal/eyes,
		O_STOMACH =		/obj/item/organ/internal/stomach,
		O_INTESTINE =	/obj/item/organ/internal/intestine
		)

	has_limbs = list(
		BP_TORSO =	list("path" = /obj/item/organ/external/chest),
		BP_GROIN =	list("path" = /obj/item/organ/external/groin),
		BP_HEAD =	list("path" = /obj/item/organ/external/head/grey),
		BP_L_ARM =	list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =	list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =	list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =	list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

	inherent_verbs = list(/mob/living/carbon/human/proc/telepathy)

/datum/species/grey/handle_environment_special(var/mob/living/carbon/human/H)
	if(H.fire_stacks < 0 && H.get_water_protection() <= 0.5)	// If over half your body is soaked, you're melting.
		H.adjustFireLoss(max(0,(3 - (3 * H.get_water_protection()))))	// Tripled because 0.5 is miniscule, and fire_stacks are capped in both directions.

/mob/living/carbon/human/grey/New(var/new_loc) //makes grey spawnable
	..(new_loc, SPECIES_GREY_YW)


/mob/living/carbon/human/proc/telepathy(mob/M as mob in oview())
	set name = "Project mind"
	set desc = "Talk telepathically to someone over a distance."
	set category = "Abilities"

	var/msg = sanitize(input("Message:", "Project mind") as text|null)
	if(msg)
		var/mob/living/carbon/human/H = M
		log_say("(GreyTP to [key_name(M)]) [msg]", src)
		if(ishuman(M))
			if(H.species.name == src.species.name)
				to_chat(M, "<font color='purple'>you hear [src.name]'s voice: <i>[msg]</i></font>")
				to_chat(src, "<font color='purple'>you said: \"[msg]\" to [M]</font>")
			else
				to_chat(M, "<font color='purple'>you hear a voice echo in your head... <i>[msg]</i></font>")
				to_chat(src, "<font color='purple'>you said: \"[msg]\" to [M]</font>")
		else
			to_chat(M, "<font color='purple'>you hear a voice echo in your head... <i>[msg]</i></font>")
			to_chat(src, "<font color='purple'>you said: \"[msg]\" to [M]</font>")

	return


/obj/item/organ/external/head/grey
	eye_icon_location = 'content_arfs/icons/mob/player/human_face_yw.dmi'
	eye_icon = "eyes_grey"

#define SPECIES_GHOST_ARF

/datum/species/ghost

	name = "Ghost"
	name_plural = "Ghosties"
	icobase = 'icons/mob/human_races/r_human.dmi'
	deform = 'icons/mob/human_races/r_human.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch)
	blurb = "Something goes here."
	num_alternate_languages = 6
	species_language = LANGUAGE_SOL_COMMON
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)
	spawn_flags		 = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	flesh_color = "#a598ad"
	blood_color = "#A200FF"
	brute_mod = 1.25
	flash_mod = 6
	darksight = 10
	min_age = 18
	max_age = 5000
	remains_type = /obj/effect/decal/cleanable/ash
	death_message = "dissolves into ash..."
	has_organ = list()
	breath_type = null
	poison_type = null
	inherent_verbs = list(
		/mob/living/carbon/human/proc/shapeshifter_select_shape,
		/mob/living/carbon/human/proc/shapeshifter_select_colour,
		/mob/living/carbon/human/proc/shapeshifter_select_hair,
		/mob/living/carbon/human/proc/shapeshifter_select_eye_colour,
		/mob/living/carbon/human/proc/shapeshifter_select_hair_colors,
		/mob/living/carbon/human/proc/shapeshifter_select_gender,
		/mob/living/carbon/human/proc/regenerate,
		/mob/living/simple_mob/animal/passive/pokemon/proc/move_phase
		)
	cold_level_1 = -1	//Immune to cold
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 9000	//Immune to heat
	heat_level_2 = 9000
	heat_level_3 = 9000
	speech_bubble_appearance = "ghost"
	water_breather = TRUE
/*	var/list/ghost_abilities = list(/datum/power/shadekin/phase_shift,
									   /datum/power/shadekin/regenerate_other,
									   /datum/power/shadekin/create_shade)
	var/list/shadekin_ability_datums = list()
	var/kin_type
	var/energy_light = 0.25
	var/energy_dark = 0.75 */
