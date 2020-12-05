// Roxy!
/* //First take at Roxy code
/mob/living/simple_mob/animal/roxy
	name = "Roxy"
	icon_state = "maid"
	icon_living = "maid"
	icon_dead = "maid_dead"
	icon_rest = "maid_sleep"
	desc = "A friendly xenomorph maid!"
	icon = 'content_arfs/icons/mob/mobs/alien.dmi'
	pixel_x = -16
	default_pixel_x = -16
	health = 100
	maxHealth = 100
	max_co2 = 10 //Lets them go outside without dying of co2
	response_help = "hugs"
	layer = MOB_LAYER
	vore_active = TRUE
	has_hands = TRUE
	movement_cooldown = 2
	meat_amount = 3
	makes_dirt = FALSE
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	melee_damage_lower = 10
	melee_damage_upper = 15
	universal_understand = TRUE
*/
/mob/living/simple_mob/animal/space/alien/maid
	name = "alien hunter"
	desc = "Hiss!"
	icon = 'content_arfs/icons/mob/mobs/alien.dmi'
	icon_state = "maid"
	icon_living = "maid"
	icon_dead = "maid_dead"
	icon_gib = "syndicate_gib"
	icon_rest = "maid_sleep"
	has_hands = TRUE
	faction = "neutral"
	universal_understand = TRUE
	movement_cooldown = 2.1
	mob_class = MOB_CLASS_ABERRATION
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"

	maxHealth = 100
	health = 100

	harm_intent_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_sharp = TRUE
	attack_edge = TRUE

	attacktext = list("slashed")
	attack_sound = 'sound/weapons/bladeslice.ogg'

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/xenomeat

/mob/living/simple_mob/animal/space/alien/maid/roxy
	name = "Roxy"

/mob/living/simple_mob/animal/space/alien/maid/Initialize()
	..()

	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide
	verbs += /mob/living/proc/lick
	verbs += /mob/living/proc/smell
	verbs += /mob/living/proc/shred_limb
	verbs += /mob/living/simple_mob/proc/leap

	can_enter_vent_with += /obj/item/device/radio

	var/obj/item/device/radio/headset/mob_headset/R = new
	R.forceMove(src)
	mob_radio = R

	voice_name = name
	real_name = name

/mob/living/simple_mob/animal/space/alien/maid/say_quote(var/message, var/datum/language/speaking = null)
	var/verb = "hisses"
	var/ending = copytext(message, length(message))

	if(speaking && (speaking.name != "Galactic Common")) //this is so adminbooze xenos speaking common have their custom verbs,
		verb = speaking.get_spoken_verb(ending)          //and use normal verbs for their own languages and non-common languages
	else
		if(ending == "!")
			verb = "roars"
		else if(ending == "?")
			verb = "hisses curiously"
	return verb

