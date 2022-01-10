////////////////////////////////////////////////////////////////
// Sextoys!
////////////////////////////////////////////////////////////////

/obj/item/weapon/sextoy/dildo
	name = "dildo"
	desc = "This is a generic dildo, how surreal. How did you get this?"
	icon = 'content_arfs/icons/obj/weapon/kinky.dmi'
	icon_state = null
	force = 1
	throwforce = 0
	attack_verb = list("penetrated", "probed", "slapped", "poked")

/obj/item/weapon/sextoy/dildo/purple
	name = "dildo"
	desc = "Floppy!"
	icon_state = "dildopr"
	attack_verb = list("penetrated", "probed", "slapped", "poked")

/obj/item/weapon/sextoy/dildo/blue
	name = "dildo"
	desc = "Floppy!"
	icon_state = "dildobl"
	attack_verb = list("penetrated", "probed", "slapped", "poked")

/obj/item/weapon/sextoy/dildo/orange
	name = "dildo"
	desc = "Floppy!"
	icon_state = "dildoor"
	attack_verb = list("penetrated", "probed", "slapped", "poked")

/obj/item/weapon/sextoy/dildo/red
	name = "dildo"
	desc = "Floppy!"
	icon_state = "dildor"
	attack_verb = list("penetrated", "probed", "slapped", "poked")

/obj/item/weapon/sextoy/dildo/green
	name = "dildo"
	desc = "Floppy!"
	icon_state = "dildogr"
	attack_verb = list("penetrated", "probed", "slapped", "poked")

/obj/item/weapon/sextoy/dildo/psych
	name = "psychedelic dildo"
	desc = "Now with 20% more seizures!"
	item_state = "dildopsych"
	icon_state = "dildopsych"


/obj/item/weapon/sextoy/dildo/fleshlight
	name = "fleshlight"
	desc = "Somehow, it seems to be the perfect fit for any length. Very cool."
	icon_state = "fleshlight"
	item_state = "fleshlight"
	attack_verb = list("cuntslapped", "violated", "teased", "prodded")

/obj/item/weapon/sextoy/dildo/bulletvibe
	name = "bullet vibrator"
	desc = "A discreet, versatile vibrator, and don't you let its size fool you. Still one of the most popular vibes on the market."
	icon_state = "bulletvibe"
	item_state = "bulletvibe"
	attack_verb = list("pleasured", "vibrated", "violated", "teased", "poked")


/obj/item/weapon/sextoy/dildo/canine
	name = "canine dildo"
	desc = "It has a bulbous knot."
	icon_state = "canine"
	item_state = "canine"
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded", "knotted")

/obj/item/weapon/sextoy/dildo/purpledong
	name = "purple dildo"
	desc = "It's a playful shade of purple."
	icon_state = "purple-dong"
	item_state = "purple-dong"
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/sextoy/dildo/bigblackdick
	name = "big black dick"
	desc = "Bigger. Blacker. For when the real thing just doesn't cut it."
	icon_state = "bigblackdick"
	item_state = "bigblackdick"
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/sextoy/dildo/floppydick
	name = "floppy dick"
	desc = "The silicone on this toy is particularly soft and, well, kind of flaccid."
	icon_state = "floppydick"
	item_state = "floppydick"
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded")

/obj/item/weapon/sextoy/dildo/analbeads
	name = "Anal Beads"
	desc = "A set up pink beads on a small, light pink string. It seems perfect for all your anal bead needs!"
	icon_state = "anal_beads"
	item_state = "anal_beads"
	attack_verb = list("beadwhips", "beads")

/obj/item/weapon/sextoy/dildo/seadragon
	name = "seadragon dildo"
	desc = "A blue curved dildo of some sort.  Not a scimitar."
	icon_state = "seadragon"
	item_state = "seadragon"
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded",)

/obj/item/weapon/sextoy/dildo/equine
	name = "equine dildo"
	desc = "A. Big.  Black. Horse. Cock."
	icon_state = "equine"
	item_state = "equine"
	force = 2
	attack_verb = list("fucked", "probed", "violated", "teased", "prodded",)

/obj/item/weapon/sextoy/dildo/chemicalkit
	name = "Bimbo Chemical Kit"
	desc = "All for your mind play needs! This special Kit is a delight in most space BDSM community, complete with all the chemical that you need for body alternation and a visor temporarily capable of altering the mind of its users to follow the instructions of another user! WARNING: The visor will actually install a failsafe as well for the user, remember consent when using! <3"
	icon_state = "chemkit"
	item_state = "chemkit"
	force = 0

////////////////////////////////////////////////////////////////
// Vibrating Sextoys!
////////////////////////////////////////////////////////////////

/datum/looping_sound/vibrator
	mid_sounds = list('sound/machines/sm/loops/calm.ogg'=1) // I need to find a buzzing sound reee
	mid_length = 1 SECOND
	volume = 10
	extra_range = 1
//	pref_check = /datum/client_preference/buzzbuzz // Maybe in the future have a pref for lewd sounds?


/obj/item/weapon/sextoy/dildo/vibrator
	name = "bullet vibrator"
	desc = "A discreet, versatile vibrator, and don't you let its size fool you. Still one of the most popular vibes on the market."
	icon_state = "bulletvibe"
	item_state = "bulletvibe"
	attack_verb = list("pleasured", "vibrated", "violated", "teased", "poked")

	var/enabled = 0

	var/datum/looping_sound/vibrator/soundloop

/obj/item/weapon/sextoy/dildo/vibrator/Initialize()
	soundloop = new(list(src), FALSE)
	return ..()

/obj/item/weapon/sextoy/dildo/vibrator/Destroy()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(soundloop)
	return ..()

/obj/item/weapon/sextoy/dildo/vibrator/process()
	update_sound()


/obj/item/weapon/sextoy/dildo/vibrator/proc/update_sound()
	var/datum/looping_sound/vibrator/loop = soundloop

	if(!enabled)
		loop.stop()
		return

	loop.start()

/obj/item/weapon/sextoy/dildo/vibrator/attack_self(var/mob/user)
	enabled = !enabled
	if(enabled)
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)
	update_icon()
	update_sound()

	to_chat(user, "<span class='notice'>[bicon(src)] You switch [enabled ? "on" : "off"] \the [src].</span>")


////////////////////////////////////////////////////////////////
// Plushies! Totally kinky!
////////////////////////////////////////////////////////////////

/obj/item/toy/plushie/bubblegum
	name = "bubblegum plushie"
	icon_state = "bubbleplush"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "rwer"

/obj/item/toy/plushie/plushvar
	name = "Ragvar plushie"
	icon_state = "plushvar"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "rwer"


/obj/item/toy/plushie/narplush
	name = "narsie plushie"
	icon_state = "narplush"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "rwer"

/obj/item/toy/plushie/snakeplush
	name = "snake plush"
	icon_state = "plush_snake"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "hiss"

/obj/item/toy/plushie/securityk9
	name = "security k9 plush"
	icon_state = "securityk9"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "halt!"

/obj/item/toy/plushie/drake
	name = "drake plush"
	icon_state = "drake"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "rawr"

/obj/item/toy/plushie/chibifox
	name = "fox"
	icon_state = "fox"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "geck"

/obj/item/toy/plushie/lamp
	name = "lamp plushie"
	icon_state = "plush_lamp"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "click"

/obj/item/toy/plushie/medihound
	name = "medihound plush"
	icon_state = "medihound"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "arf"

/obj/item/toy/plushie/scubpuppy
	name = "janitorborg plushie"
	icon_state = "scrubpuppy"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "arf"

/obj/item/toy/plushie/slaggy
	name = "slaggy"
	icon_state = "slaggy"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "arf"

/obj/item/toy/plushie/bucketplush
	name = "mr.bucket"
	icon_state = "mr_buckety"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "arf"

/obj/item/toy/plushie/scanner
	name = "scanner plushie"
	icon_state = "dr_scanny"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "arf"

/obj/item/toy/plushie/fermis
	name = "fermis"
	icon_state = "fermis"
	icon = 'content_arfs/icons/obj/misc.dmi'
	pokephrase = "arf"

/obj/item/toy/plushie/teshari/strix
	name = "Strix Hades"
	desc = "This is Strix Hades the plushie Avali. Very soft, with a pompom on the tail. The toy is made well, as if alive. Looks like he is sleeping. Shhh!"
	icon_state = "strixplush"
	item_state = "strixplush"
	slot_flags = SLOT_BACK | SLOT_HEAD
	pokephrase = "Weh!"
	icon = 'content_arfs/icons/obj/misc.dmi'
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_toys_yw.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_toys_yw.dmi',
		slot_back_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi',
		slot_head_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi')

/obj/item/toy/plushie/teshari/strix/rename_plushie()
	set name = "Name Plushie"
	set category = "Object"
	set desc = "Give your plushie a cute name!"
	var/mob/M = usr
	if(!M.mind)
		return 0

	if(src && !M.stat && in_range(M,src))
		to_chat(M, "You cannot rename Strix Hades! You hug him anyway.")
		return 1

/obj/item/toy/plushie/teshari/eili
	name = "Eili"
	desc = "This is a plushie that resembles an Avali named Eili. The ammount of detail makes it almost look lifelike! Looks like she is sleeping. Shhh!"
	icon_state = "jeans_eiliplush"
	item_state = "jeans_eiliplush"
	slot_flags = SLOT_BACK | SLOT_HEAD
	pokephrase = "Weh!"
	icon = 'content_arfs/icons/obj/misc.dmi'
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_toys_yw.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_toys_yw.dmi',
		slot_back_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi',
		slot_head_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi')


/obj/item/toy/plushie/teshari/eili/rename_plushie()
	set name = "Name Plushie"
	set category = "Object"
	set desc = "Give your plushie a cute name!"
	var/mob/M = usr
	if(!M.mind)
		return 0

	if(src && !M.stat && in_range(M,src))
		to_chat(M, "You cannot rename Eili! You hug her anyway.")
		return 1

/obj/item/toy/plushie/teshari/_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_brown"
	item_state = "teshariplushie_brown"
	pokephrase = "Rya!"
	slot_flags = SLOT_BACK | SLOT_HEAD
	icon = 'content_arfs/icons/obj/misc.dmi'
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_toys_yw.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_toys_yw.dmi',
		slot_back_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi',
		slot_head_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi')

/obj/item/toy/plushie/teshari/w_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_white"
	item_state = "teshariplushie_white"
	pokephrase = "Rya!"
	slot_flags = SLOT_BACK | SLOT_HEAD
	icon = 'content_arfs/icons/obj/misc.dmi'
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_toys_yw.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_toys_yw.dmi',
		slot_back_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi',
		slot_head_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi')

/obj/item/toy/plushie/teshari/b_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_black"
	item_state = "teshariplushie_black"
	pokephrase = "Rya!"
	slot_flags = SLOT_BACK | SLOT_HEAD
	icon = 'content_arfs/icons/obj/misc.dmi'
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_toys_yw.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_toys_yw.dmi',
		slot_back_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi',
		slot_head_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi')

/obj/item/toy/plushie/teshari/y_yw
	name = "lifelike teshari plush"
	desc = "This is a plush teshari. Very soft. The ammount of detail makes it almost look lifelike! Looks like it is sleeping. Shhh!"
	icon_state = "teshariplushie_yellow"
	item_state = "teshariplushie_yellow"
	pokephrase = "Rya!"
	slot_flags = SLOT_BACK | SLOT_HEAD
	icon = 'content_arfs/icons/obj/misc.dmi'
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_toys_yw.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_toys_yw.dmi',
		slot_back_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi',
		slot_head_str = 'content_arfs/icons/mob/items/toy_worn_yw.dmi')

/obj/item/toy/plushie/jeans
	name = "Chocodoggo"
	desc = "This plushie looks like a puppified version of Jeanne Petite. It seems as though it is watching you intently..."
	icon_state = "Jeans_plushie"
	item_state = "Jeans_plushie"
	slot_flags = SLOT_HEAD
	pokephrase = "pokerface"
	icon = 'content_arfs/icons/obj/custom_items_yw.dmi'
	item_icons = list(
		slot_head_str = 'icons/vore/custom_onmob_yw.dmi')


/obj/item/toy/plushie/jeans/rename_plushie()
	set name = "Name Plushie"
	set category = "Object"
	set desc = "Give your plushie a cute name!"
	var/mob/M = usr
	if(!M.mind)
		return 0

	if(src && !M.stat && in_range(M,src))
		to_chat(M, "You cannot rename Jeans! You hug her anyway.")
		return 1

