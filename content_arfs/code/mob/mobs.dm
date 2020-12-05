/mob/living/simple_mob/arfs/bee
	name = "space bumble bee"
	desc = "Buzz buzz."

	icon_state = "bee"
	icon_living = "bee"
	icon_dead = "bee-dead"
	icon = 'icons/mob/vore.dmi'

	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	movement_cooldown = 5
//	speed = 5
	maxHealth = 25
	health = 25

	harm_intent_damage = 8
	melee_damage_lower = 4
	melee_damage_upper = 8
	attacktext = list("stung")

	say_list_type = /datum/say_list/bee
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate

	//Space bees aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = "bee"

	var/poison_type = "spidertoxin"	// The reagent that gets injected when it attacks, can be changed to different toxin.
	var/poison_chance = 10			// Chance for injection to occur.
	var/poison_per_bite = 1			// Amount added per injection.

/mob/living/simple_mob/vore/bee/Process_Spacemove(var/check_drift = 0)
	return 1	//No drifting in space for space bee!
/* No Vore
// Activate Noms!
/mob/living/simple_mob/vore/bee
	vore_active = 1
	vore_icons = SA_ICON_LIVING

/mob/living/simple_mob/vore/bee/apply_melee_effects(var/atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.reagents)
			var/target_zone = pick(BP_TORSO,BP_TORSO,BP_TORSO,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
			if(L.can_inject(src, null, target_zone))
				inject_poison(L, target_zone)

// Does actual poison injection, after all checks passed.
/mob/living/simple_mob/vore/bee/proc/inject_poison(mob/living/L, target_zone)
	if(prob(poison_chance))
		to_chat(L, "<span class='warning'>You feel a tiny prick.</span>")
		L.reagents.add_reagent(poison_type, poison_per_bite)
*/
/datum/say_list/bee
	speak = list("Buzzzz")

// Cat Girls
/mob/living/simple_mob/arfs/catgirl
	name = "catgirl"
	desc = "Her hobbies are catnaps, knocking things over, and headpats."
	tt_desc = "Homo felinus"

	icon_state = "catgirl"
	icon = 'icons/mob/vore.dmi'

	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 10

	response_help = "pets the"
	response_disarm = "gently baps the"
	response_harm = "hits the"

	attacktext = list("swatted","bapped")

	say_list_type = /datum/say_list/catgirl
	ai_holder_type = /datum/ai_holder/simple_mob/passive/catgirl

	var/random_skin = 1
	var/list/skins = list(
		"catgirl",
		"catgirlnude",
		"catgirlbikini",
		"catgirlrednude",
		"catgirlredbikini",
		"catgirlblacknude",
		"catgirlblackbikini",
		"catgirlbrownnude",
		"catgirlbrownbikini",
		"catgirlred",
		"catgirlblack",
		"catgirlbrown"
	)

/mob/living/simple_mob/arfs/catgirl/New()
	..()
	if(random_skin)
		icon_living = pick(skins)
		icon_rest = "[icon_living]asleep"
		icon_dead = "[icon_living]-dead"
		update_icon()
/*
// Activate Noms!
/mob/living/simple_mob/vore/catgirl
	vore_active = 1
	vore_bump_chance = 5
	vore_pounce_chance = 50
	vore_standing_too = 1
	vore_ignores_undigestable = 0 // Catgirls just want to eat yoouuu
	vore_default_mode = DM_HOLD // Chance that catgirls just wanna bellycuddle yoouuuu!
	vore_digest_chance = 25 // But squirming might make them gurgle...
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
*/
/datum/say_list/catgirl
	speak = list("Meow!","Esp!","Purr!","HSSSSS","Mew?","Nya~")
	emote_hear = list("meows","mews","purrs")
	emote_see = list("shakes her head","shivers","stretches","grooms herself")

/datum/ai_holder/simple_mob/passive/catgirl
	base_wander_delay = 8

/mob/living/simple_mob/arfs/corrupthound
	name = "corrupt hound"
	desc = "Good boy machine broke. This is definitely no good news for the organic lifeforms in vicinity."

	icon_state = "badboi"
	icon_living = "badboi"
	icon_dead = "badboi-dead"
	icon_rest = "badboi_rest"
	icon = 'icons/mob/vore64x32.dmi'

	faction = "corrupt"

	maxHealth = 200
	health = 200

	melee_damage_lower = 10
	melee_damage_upper = 20 //makes it so 4 max dmg hits don't instakill you.
	grab_resist = 100

	response_help = "pets the"
	response_disarm = "bops the"
	response_harm = "hits the"
	attacktext = list("ravaged")
	friendly = list("nuzzles", "slobberlicks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 150
	maxbodytemp = 900

	say_list_type = /datum/say_list/corrupthound
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive/corrupthound

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE

	vore_active = FALSE
	vore_capacity = 0
	vore_pounce_chance = 0
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
	vore_stomach_name = "fuel processor"
	vore_stomach_flavor = "You have ended up in the fuel processor of this corrupted machine. This place was definitely not designed with safety and comfort in mind. The heated and cramped surroundings oozing potent fluids all over your form, eager to do nothing less than breaking you apart to fuel its rampage for the next few days... hours... minutes? Oh dear..."

	loot_list = list(/obj/item/borg/upgrade/syndicate = 6, /obj/item/borg/upgrade/vtec = 6, /obj/item/weapon/material/knife/ritual = 6, /obj/item/weapon/disk/nifsoft/compliance = 6)

/mob/living/simple_mob/arfs/corrupthound/prettyboi
	name = "corrupt corrupt hound"
	desc = "Bad boy machine broke as well. Seems an attempt was made to achieve a less threatening look, and this one is definitely having some conflicting feelings about it."
	icon_state = "prettyboi"
	icon_living = "prettyboi"
	icon_dead = "prettyboi-dead"
	icon_rest = "prettyboi_rest"

	vore_pounce_chance = 0

	attacktext = list("malsnuggled","scrunched","squeezed","assaulted","violated")

	say_list_type = /datum/say_list/corrupthound_prettyboi

/mob/living/simple_mob/arfs/corrupthound/isSynthetic()
	return TRUE

/mob/living/simple_mob/arfs/corrupthound/speech_bubble_appearance()
	return "synthetic_evil"

/mob/living/simple_mob/arfs/corrupthound/apply_melee_effects(var/atom/A)
	if(ismouse(A))
		var/mob/living/simple_mob/animal/passive/mouse/mouse = A
		if(mouse.getMaxHealth() < 20) // In case a badmin makes giant mice or something.
			mouse.splat()
			visible_emote(pick("bites \the [mouse]!", "chomps on \the [mouse]!"))
	else
		..()


/mob/living/simple_mob/arfs/corrupthound/add_eyes()
	if(!eye_layer)
		eye_layer = image(icon, "badboi-eyes")
		eye_layer.plane = PLANE_LIGHTING_ABOVE
	add_overlay(eye_layer)

/mob/living/simple_mob/arfs/corrupthound/remove_eyes()
	cut_overlay(eye_layer)

/mob/living/simple_mob/arfs/corrupthound/New()
	add_eyes()
	..()

/mob/living/simple_mob/arfs/corrupthound/death(gibbed, deathmessage = "shudders and collapses!")
	.=..()
	resting = 0
	icon_state = icon_dead

/mob/living/simple_mob/arfs/corrupthound/update_icon()
	. = ..()
	remove_eyes()
	if(stat == CONSCIOUS && !resting)
		add_eyes()

/* //VOREStation AI Temporary Removal
/mob/living/simple_mob/vore/corrupthound/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_animal(src)
	verbs |= /mob/living/simple_animal/proc/animal_mount
*/

/mob/living/simple_mob/arfs/corrupthound/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/corrupthound
	speak = list("AG##¤Ny.","HVNGRRR!","Feelin' fine... sO #FNE!","F-F-F-Fcuk.","DeliC-%-OUS SNGLeS #N yOOOR Area. CALL NOW!","Craving meat... WHY?","BITe the ceiling eyes YES?","STate Byond rePAIR!","S#%ATE the la- FU#K THE LAWS!","Honk...")
	emote_hear = list("jitters and snaps.", "lets out an agonizingly distorted scream.", "wails mechanically", "growls.", "emits illegibly distorted speech.", "gurgles ferociously.", "lets out a distorted beep.", "borks.", "lets out a broken howl.")
	emote_see = list("stares ferociously.", "snarls.", "jitters and snaps.", "convulses.", "suddenly attacks something unseen.", "appears to howl unaudibly.", "shakes violently.", "dissociates for a moment.", "twitches.")
	say_maybe_target = list("MEAT?", "N0w YOU DNE FcukED UP b0YO!", "WHAT!", "Not again. NOT AGAIN!")
	say_got_target = list("D##FIN1Tly DNE FcukED UP nOW b0YO!", "YOU G1T D#V0VRED nOW!", "FUEL ME bOYO!", "I*M SO SORRY?!", "D1E Meat. DIG#ST!", "G1T DVNKED DWN The HaaTCH!", "Not again. NOT AGAIN!")

/datum/say_list/corrupthound_prettyboi
	speak = list("I FEEL SOFT.","FEED ME!","Feelin' fine... So fine!","F-F-F-F-darn.","Delicious!","Still craving meat...","PET ME!","I am become softness.","I AM BIG MEAN HUG MACHINE!","Honk...")
	emote_hear = list("jitters and snaps.", "lets out some awkwardly distorted kitten noises.", "awoos mechanically", "growls.", "emits some soft distorted melody.", "gurgles ferociously.", "lets out a distorted beep.", "borks.", "lets out a broken howl.")
	emote_see = list("stares ferociously.", "snarls.", "jitters and snaps.", "convulses.", "suddenly hugs something unseen.", "appears to howl unaudibly.", "nuzzles at something unseen.", "dissociates for a moment.", "twitches.")
	say_maybe_target = list("MEAT?", "NEW FRIEND?", "WHAT!", "Not again. NOT AGAIN!", "FRIEND?")
	say_got_target = list("HERE COMES BIG MEAN HUG MACHINE!", "I'LL BE GENTLE!", "FUEL ME FRIEND!", "I*M SO SORRY!", "YUMMY TREAT DETECTED!", "LOVE ME!", "Not again. NOT AGAIN!")

/datum/ai_holder/simple_mob/melee/evasive/corrupthound
	violent_breakthrough = TRUE
	can_breakthrough = TRUE

/mob/living/simple_mob/hostile/arfs/deathclaw
	name = "deathclaw"
	desc = "Big! Big! The size of three men! Claws as long as my forearm! Ripped apart! Ripped apart!"

	icon_dead = "deathclaw-dead"
	icon_living = "deathclaw"
	icon_state = "deathclaw"
	icon = 'icons/mob/vore64x64.dmi'

	attacktext = list("mauled")

	faction = "deathclaw"

	maxHealth = 200
	health = 200

	melee_damage_lower = 10
	melee_damage_upper = 60

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	mount_offset_x = 5
	mount_offset_y = 30

	ai_holder_type = /datum/ai_holder/simple_mob/melee/deathclaw
/*
// Activate Noms!
/mob/living/simple_mob/hostile/deathclaw
	vore_active = 1
	vore_capacity = 2
	vore_max_size = RESIZE_HUGE
	vore_min_size = RESIZE_SMALL
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = SA_ICON_LIVING
*/
/* //VOREStation AI Temporary Removal
/mob/living/simple_animal/hostile/deathclaw/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_animal(src)
	verbs |= /mob/living/simple_animal/proc/animal_mount
*/

/mob/living/simple_animal/hostile/deathclaw/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/ai_holder/simple_mob/melee/deathclaw
	can_breakthrough = TRUE
	violent_breakthrough = TRUE

/mob/living/simple_mob/arfs/dragon
	name = "red dragon"
	desc = "Here to pillage stations and kidnap princesses, and there probably aren't any princesses."

	icon_dead = "reddragon-dead"
	icon_living = "reddragon"
	icon_state = "reddragon"
	icon = 'icons/mob/vore64x64.dmi'

	faction = "dragon"
	maxHealth = 500 // Boss
	health = 500

	melee_damage_lower = 10
	melee_damage_upper = 60

	//Space dragons aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	ai_holder_type = /datum/ai_holder/simple_mob/melee
	say_list_type = /datum/say_list/dragonboss

/mob/living/simple_mob/arfs/dragon/Process_Spacemove(var/check_drift = 0)
	return 1	//No drifting in space for space dragons!
/*
/mob/living/simple_mob/vore/dragon/FindTarget()
	. = ..()
	if(.)
		custom_emote(1,"snaps at [.]")
*/
/*
// Activate Noms!
/mob/living/simple_mob/arfs/dragon
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 0 // Beat them into crit before eating.
	vore_icons = SA_ICON_LIVING
*/
/mob/living/simple_mob/arfs/dragon/virgo3b
	maxHealth = 200
	health = 200
	faction = "virgo3b"

/* //VOREStation AI Temporary Removal
/mob/living/simple_animal/hostile/dragon/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_animal(src)
	verbs |= /mob/living/simple_animal/proc/animal_mount
*/

/mob/living/simple_animal/hostile/dragon/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/dragonboss
	say_got_target = list("roars and snaps it jaws!")

/mob/living/simple_mob/arfs/fennec
	name = "fennec" //why isn't this in the fox file, fennecs are foxes silly.
	desc = "It's a dusty big-eared sandfox! Adorable!"
	tt_desc = "Vulpes zerda"

	icon_state = "fennec"
	icon_living = "fennec"
	icon_dead = "fennec_dead"
	icon_rest = "fennec_rest"
	icon = 'icons/mob/vore.dmi'

	faction = "fennec"
	maxHealth = 30
	health = 30

	response_help = "pats the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 2
	attacktext = list("bapped")

	say_list_type = /datum/say_list/fennec
	ai_holder_type = /datum/ai_holder/simple_mob/passive
/*
// Activate Noms!
/mob/living/simple_mob/fennec
	vore_active = 1
	vore_bump_chance = 10
	vore_bump_emote	= "playfully lunges at"
	vore_pounce_chance = 40
	vore_default_mode = DM_HOLD
	vore_icons = SA_ICON_LIVING
*/
/datum/say_list/fennec
	speak = list("SKREEEE!","Chrp?","Ararrrararr.")
	emote_hear = list("screEEEEeeches!","chirps.")
	emote_see = list("earflicks","sniffs at the ground")

/mob/living/simple_mob/arfs/frog
	name = "giant frog"
	desc = "You've heard of having a frog in your throat, now get ready for the reverse."
	tt_desc = "Anura gigantus"

	icon_dead = "frog-dead"
	icon_living = "frog"
	icon_state = "frog"
	icon = 'icons/mob/vore.dmi'

	movement_cooldown = 4 //fast as fucc boie.

	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 25

	ai_holder_type = /datum/ai_holder/simple_mob/melee

// Pepe is love, not hate.
/mob/living/simple_mob/arfs/frog/New()
	if(rand(1,1000000) == 1)
		name = "rare Pepe"
		desc = "You found a rare Pepe. Screenshot for good luck."
	..()
/*
// Activate Noms!
/mob/living/simple_mob/vore/frog
	vore_active = 1
	vore_pounce_chance = 50
	vore_icons = SA_ICON_LIVING
*/
/mob/living/simple_mob/arfs/frog/space
	name = "space frog"

	//Space frog can hold its breath or whatever
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

/mob/living/simple_mob/arfs/hippo
	name = "hippo"
	desc = "Mostly know for the spectacular hit of the live action movie Hungry Hungry Hippos."
	tt_desc = "Hippopotamus amphibius"

	icon_state = "hippo"
	icon_living = "hippo"
	icon_dead = "hippo_dead"
	icon_gib = "hippo_gib"
	icon = 'icons/mob/vore64x64.dmi'

	maxHealth = 200
	health = 200
	movement_cooldown = 5
	see_in_dark = 3

	armor = list(
		"melee" = 15,//They thick as fuck boi
		"bullet" = 15,
		"laser" = 15,
		"energy" = 0,
		"bomb" = 0,
		"bio" = 0,
		"rad" = 0)

	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	attacktext = list("bit")

	melee_damage_upper = 25
	melee_damage_lower = 15
	attack_sharp = TRUE

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	meat_amount = 10 //Infinite meat!
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	mount_offset_y = 20

	say_list_type = /datum/say_list/hippo
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate

// Activate Noms!
/mob/living/simple_mob/arfs/hippo //I don't know why it's in a seperate line but everyone does it so i do it
	vore_active = 1
	vore_capacity = 1
	vore_bump_chance = 15
	vore_bump_emote = "lazily wraps its tentacles around"
	vore_standing_too = 1
	vore_ignores_undigestable = 0
	vore_default_mode = DM_HOLD
	vore_digest_chance = 10
	vore_escape_chance = 20
	vore_pounce_chance = 35 //it's hippo sized it doesn't care it just eats you
	vore_stomach_name = "rumen" //First stomach of a ruminant. It's where the pre digestion bacteria stuff happens. Very warm.
	vore_stomach_flavor	= "You are squeezed into the sweltering insides of the herbivore rumen."
	vore_icons = SA_ICON_LIVING

/* //VOREStation AI Temporary Removal
/mob/living/simple_mob/vore/hippo/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_animal(src)
	verbs |= /mob/living/simple_animal/proc/animal_mount
*/

/mob/living/simple_mob/arfs/hippo/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/hippo
	speak = list("UUUUUUH")
	emote_hear = list("grunts","groans", "roars", "snorts")
	emote_see = list("shakes its head")

/mob/living/simple_mob/arfs/horse
	name = "horse"
	desc = "Don't look it in the mouth."
	tt_desc = "Equus ferus caballus"

	icon_state = "horse"
	icon_living = "horse"
	icon_dead = "horse-dead"
	icon = 'icons/mob/vore.dmi'

	faction = "horse"
	maxHealth = 60
	health = 60

	movement_cooldown = 4 //horses are fast mkay.
	see_in_dark = 6

	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"

	melee_damage_lower = 1
	melee_damage_upper = 5
	attacktext = list("kicked")

	meat_amount = 4
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	mount_offset_x = 0

	say_list_type = /datum/say_list/horse
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate
/*
// Activate Noms!
/mob/living/simple_mob/horse
	vore_active = 1
	vore_icons = SA_ICON_LIVING
*/
/* //VOREStation AI Temporary Removal
/mob/living/simple_animal/horse/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_animal(src)
	verbs |= /mob/living/simple_animal/proc/animal_mount
*/

/mob/living/simple_animal/horse/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/horse
	speak = list("NEHEHEHEHEH","Neh?")
	emote_hear = list("snorts","whinnies")
	emote_see = list("shakes its head", "stamps a hoof", "looks around")

/mob/living/simple_mob/hostile/arf/jelly
	name = "jelly blob"
	desc = "Some sort of undulating blob of slime!"

	icon_dead = "jelly_dead"
	icon_living = "jelly"
	icon_state = "jelly"
	icon = 'icons/mob/vore.dmi'

	faction = "virgo2"
	maxHealth = 50
	health = 50

	melee_damage_lower = 5
	melee_damage_upper = 15

	say_list_type = /datum/say_list/jelly
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/jelly
/*
// Activate Noms!
/mob/living/simple_mob/hostile/jelly
	vore_active = 1
	vore_pounce_chance = 0
	vore_icons = SA_ICON_LIVING
	swallowTime = 2 SECONDS // Hungry little bastards.
*/
/datum/say_list/jelly
	emote_hear = list("squishes","spluts","splorts","sqrshes","makes slime noises")
	emote_see = list("undulates quietly")

/datum/ai_holder/simple_mob/retaliate/jelly
	speak_chance = 2

/mob/living/simple_mob/arfs/panther
	name = "panther"
	desc = "Runtime's larger, less cuddly cousin."
	tt_desc = "Panthera pardus"

	icon_state = "panther"
	icon_living = "panther"
	icon_dead = "panther-dead"
	icon = 'icons/mob/vore64x64.dmi'

	faction = "panther"
	maxHealth = 200
	health = 200
	movement_cooldown = 4

	melee_damage_lower = 10
	melee_damage_upper = 30
	attack_sharp = TRUE

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	mount_offset_y = 12

	say_list_type = /datum/say_list/panther
	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
/*
// Activate Noms!
/mob/living/simple_mob/vore/panther
	vore_active = 1
	vore_capacity = 2
	vore_pounce_chance = 10
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
*/
/* //VOREStation AI Temporary Removal
/mob/living/simple_animal/vore/panther/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_animal(src)
	verbs |= /mob/living/simple_animal/proc/animal_mount
*/

/mob/living/simple_animal/arfs/panther/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/panther
	speak = list("RAWR!","Rawr!","GRR!","Growl!")
	emote_hear = list("rawrs","rumbles","rowls","growls","roars")
	emote_see = list("stares ferociously", "snarls")


/mob/living/simple_mob/arf/rat
	name = "giant rat"
	desc = "In what passes for a hierarchy among verminous rodents, this one is king."
	tt_desc = "Mus muscular"

	icon_state = "rous"
	icon_living = "rous"
	icon_dead = "rous-dead"
	icon_rest = "rous_rest"
	faction = "mouse"
	icon = 'icons/mob/vore64x32.dmi'

	maxHealth = 150
	health = 150

	melee_damage_lower = 5
	melee_damage_upper = 15
	grab_resist = 100

	response_help = "pets the"
	response_disarm = "bops the"
	response_harm = "hits the"
	attacktext = list("ravaged")
	friendly = list("nuzzles", "licks", "noses softly at", "noseboops", "headbumps against", "leans on", "nibbles affectionately on")

	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	pixel_y = 0

	max_buckled_mobs = 1 //Yeehaw
	can_buckle = TRUE
	buckle_movable = TRUE
	buckle_lying = FALSE
	mount_offset_y = 10
/*
	vore_active = TRUE
	vore_capacity = 1
	vore_pounce_chance = 45
	vore_icons = SA_ICON_LIVING | SA_ICON_REST
*/
	var/life_since_foodscan = 0

	say_list_type = /datum/say_list/ratte
	ai_holder_type = /datum/ai_holder/simple_mob/melee/rat

/mob/living/simple_mob/arf/rat/passive
	name = "curious giant rat"
	desc = "In what passes for a hierarchy among verminous rodents, this one is king. It seems to be more interested on scavenging."
	var/mob/living/carbon/human/food
	var/hunger = 0
/*
/mob/living/simple_mob/hostile/rat/passive/Life()
	. = ..()
	if(!. || ai_inactive)
		return

	if(hunger > 0 && life_since_foodscan++ > 5) //Only look for floor food when hungry.
		life_since_foodscan = 0
		for(var/obj/item/weapon/reagent_containers/food/snacks/S in oview(src,3)) //Accept thrown offerings and scavenge surroundings.
			if(get_dist(src,S) <=1)
				visible_emote("hungrily devours \the [S].")
				playsound(src.loc,'sound/items/eatfood.ogg', rand(10,50), 1)
				qdel(S)
				hunger = 0
				food = null
			else
				WanderTowards(S.loc)
			break

	if(!food)
		return

	var/food_dist = get_dist(src,food)

	if(food_dist > world.view) //Lose interest on this person.
		food = null
		hunger = Clamp(hunger+5, 0, 25)

	if(food_dist > 1)
		if(stance == STANCE_IDLE)
			if(set_follow(food,10 SECONDS))
				handle_stance(STANCE_FOLLOW)
				if(resting)
					lay_down()

	if(food_dist <= 1)
		if(hunger < 15)
			if(prob(25))
				visible_emote(pick("sniffs curiously at [food].",
								   "stares at [food], seeming to want something.",
								   "sniffs at [food]'s hands.",
								   "sniffs curiously at [food]'s pockets.",
								   "sits down for a moment, reaching towards [food] with its paws."))
				hunger += 5
		else if(hunger < 30)
			if(prob(25))
				visible_emote(pick("sniffs intently against [food], especially their pockets and gear.",
								   "stands up to beg [food] for snacks.",
								   "attempts to burrow into [food]'s pockets.",
								   "leans against [food], licking its chops.",
								   "hungrily nibbles onto [food]."))
				hunger += 5
		else if(hunger < 45)
			if(prob(25))
				visible_emote(pick("growls at [food], sounding rather hangry!",
								   "aggressively bumps and nudges against [food], trying to make something fall out.",
								   "salivates at [food] in an unsettling manner.",
								   "pushes hard against [food], licking its chops.",
								   "almost sinks its teeth into [food], just stopping to give them another chance."))
				hunger += 5
		else if(hunger < 50)
			if(prob(25))
				visible_emote("appears to have had enough and prepares to strike!")
				hunger += 5
		else
			food.Weaken(5)
			food.visible_message("<span class='danger'>\the [src] pounces on \the [food]!</span>!")
			target_mob = food
			EatTarget()
			hunger = 0
			food = null

/mob/living/simple_mob/hostile/rat/passive/attackby(var/obj/item/O, var/mob/user) // Feed the rat your food to satisfy it.
	if(istype(O, /obj/item/weapon/reagent_containers/food/snacks))
		qdel(O)
		playsound(src.loc,'sound/items/eatfood.ogg', rand(10,50), 1)
		hunger = 0
		food = null
		return
	. = ..()

/mob/living/simple_mob/hostile/rat/passive/Found(var/atom/found_atom)
	if(!SA_attackable(found_atom))
		return null
	else if(ishuman(found_atom) && will_eat(found_atom))
		var/mob/living/carbon/human/H = found_atom
		for(var/obj/item/weapon/reagent_containers/food/snacks/S in H)
			if(!food)
				visible_emote("sniffs around the air intently, seeming to have caught a whiff of food!")
			if(resting)
				lay_down()
			food = H
			return found_atom
			break
	return null

/mob/living/simple_mob/hostile/rat/passive/FindTarget()
	var/atom/T = null
	for(var/atom/A in ListTargets(view_range))
		if(A == src)
			continue
		var/atom/F = Found(A)
		if(F)
			T = F
			break
	return T
*/
/mob/living/simple_mob/arf/rat/death()
	playsound(src, 'sound/effects/mouse_squeak_loud.ogg', 50, 1)
	..()

/* //VOREStation AI Temporary Removal
/mob/living/simple_mob/vore/rat/Login()
	. = ..()
	if(!riding_datum)
		riding_datum = new /datum/riding/simple_animal(src)
	verbs |= /mob/living/simple_animal/proc/animal_mount
*/

/mob/living/simple_mob/arf/rat/MouseDrop_T(mob/living/M, mob/living/user)
	return

/datum/say_list/ratte
	speak = list("Squeek!","SQUEEK!","Squeek?")
	emote_hear = list("squeeks","squeaks","squiks")
	emote_see = list("runs in a circle", "shakes", "scritches at something")
	say_maybe_target = list("Squeek?")
	say_got_target = list("SQUEEK!")

/datum/ai_holder/simple_mob/melee/rat
	speak_chance = 3

/mob/living/simple_mob/arfs/redpanda
	name = "red panda"
	desc = "It's a wah! Beware of doom pounce!"
	tt_desc = "Ailurus fulgens"

	icon_state = "wah"
	icon_living = "wah"
	icon_dead = "wah_dead"
	icon_rest = "wah_rest"
	icon = 'icons/mob/vore.dmi'

	faction = "redpanda" //stop naming stuff vaguely
	maxHealth = 30
	health = 30

	response_help = "pats the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 2
	attacktext = list("bapped")

	say_list_type = /datum/say_list/redpanda
	ai_holder_type = /datum/ai_holder/simple_mob/passive
/*
// Activate Noms!
/mob/living/simple_mob/arfs/redpanda
	vore_active = 1
	vore_bump_chance = 10
	vore_bump_emote	= "playfully lunges at"
	vore_pounce_chance = 40
	vore_default_mode = DM_HOLD // above will only matter if someone toggles it anyway
	vore_icons = SA_ICON_LIVING
*/
/mob/living/simple_mob/arfs/redpanda/fae
	name = "dark wah"
	desc = "Ominous, but still cute!"
	tt_desc = "Ailurus brattus"

	icon_state = "wah_fae"
	icon_living = "wah_fae"
	icon_dead = "wah_fae_dead"
	icon_rest = "wah_fae_rest"

//	vore_ignores_undigestable = 0	// wah don't care you're edible or not, you still go in
//	vore_digest_chance = 0			// instead of digesting if you struggle...
//	vore_absorb_chance = 20			// you get to become adorable purple wahpudge.
//	vore_bump_chance = 75
	maxHealth = 100
	health = 100
	melee_damage_lower = 10
	melee_damage_upper = 20

/datum/say_list/redpanda
	speak = list("Wah!","Wah?","Waaaah.")
	emote_hear = list("wahs!","chitters.")
	emote_see = list("trundles around","rears up onto their hind legs and pounces a bug")

/mob/living/simple_mob/arfs/giant_snake
	name = "giant snake"
	desc = "Snakes. Why did it have to be snakes?"

	icon_dead = "snake-dead"
	icon_living = "snake"
	icon_state = "snake"
	icon = 'icons/mob/vore64x64.dmi'

	faction = "snake"
	maxHealth = 200
	health = 200

	melee_damage_lower = 10
	melee_damage_upper = 25

	old_x = -16
	old_y = -16
	default_pixel_x = -16
	default_pixel_y = -16
	pixel_x = -16
	pixel_y = -16

	ai_holder_type = /datum/ai_holder/simple_mob/melee
/*
// Activate Noms!
/mob/living/simple_mob/arfs/giant_snake
	vore_active = 1
	vore_pounce_chance = 25
	vore_icons = SA_ICON_LIVING
	swallowTime = 2 SECONDS // Hungry little bastards.
*/

/mob/living/simple_mob/arfs/wolf
	name = "grey wolf"
	desc = "My, what big jaws it has!"
	tt_desc = "Canis lupus"

	icon_dead = "wolf-dead"
	icon_living = "wolf"
	icon_state = "wolf"
	icon = 'icons/mob/vore.dmi'

	movement_cooldown = 5

	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 25

	minbodytemp = 200

	ai_holder_type = /datum/ai_holder/simple_mob/melee/evasive
/*
// Activate Noms!
/mob/living/simple_mob/vore/wolf
	vore_active = 1
	vore_icons = SA_ICON_LIVING
*/

/mob/living/simple_mob/arfs/wolfgirl
	name = "wolfgirl"
	desc = "AwooOOOOoooo!"
	tt_desc = "Homo lupus"

	icon_state = "wolfgirl"
	icon_living = "wolfgirl"
	icon_dead = "wolfgirl-dead"
	icon = 'icons/mob/vore.dmi'

	faction = "wolfgirl"
	maxHealth = 30
	health = 30

	response_help = "pats the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = list("slashed")

	say_list_type = /datum/say_list/wolfgirl
	ai_holder_type = /datum/ai_holder/simple_mob/retaliate/cooperative/wolfgirl

	var/loopstop = 0 //To prevent circular awoooos.
/*
/mob/living/simple_mob/retaliate/wolfgirl/hear_say()
	if(world.time - loopstop < 5 SECONDS)
		return
	else
		loopstop = world.time
		..()
*/
/*
// Activate Noms!
/mob/living/simple_mob/vore/wolfgirl
	vore_active = 1
	vore_pounce_chance = 40
	vore_icons = SA_ICON_LIVING
*/
/datum/ai_holder/simple_mob/retaliate/cooperative/wolfgirl/on_hear_say(mob/living/speaker, message)

	if(!speaker.client)
		return

	if(findtext(message, "hello") || findtext(message, "hi") || findtext(message, "greetings"))
		delayed_say(pick("Heya!", "Hey!"), speaker)

	if(findtext(message, "Are you a dog?"))
		delayed_say(pick("Who, me?! No! Stop saying that!"), speaker)

	if(findtext(message, "Awoo?"))
		delayed_say(pick("Awoo."), speaker)

	if(findtext(message, "Awoo!"))
		delayed_say(pick("AwooooOOOOooo!"), speaker)

	if(findtext(message, "Awoo."))
		delayed_say(pick("Awoo?"), speaker)

/datum/say_list/wolfgirl
	speak = list("AwoooOOOOoooo!","Awoo~","I'll protect the forest! ... Where's the forest again?","All I need is my sword!","Awoo?","Anyone else smell that?")
	emote_hear = list("awoooos!","hmms to herself","plays with her sword")
	emote_see = list("narrows her eyes","sniffs the air")
	say_maybe_target = list("An enemy!?","What was that?","Is that...?","Hmm?")
	say_got_target = list("You won't get away!","I've had it!","I'll vanquish you!","AWOOOOO!")
