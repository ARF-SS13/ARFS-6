/obj/item/weapon/gun/projectile/automatic/stg44
	name = "StG.44"
	desc = "An ancient assault rifle used during the Terran conflict known as World War II. You're looking at a piece of history here, still just as deadly today as it was in 1944. Schmeisser Sturmgewehr 44. Uses 7.92x33mm Kurz rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "stg44"
	fire_delay = 1
	recoil = 1.5
//	fire_sound = 'sound/weapons/SVD_shot.ogg'
	move_delay = 1
	burst_delay = 2
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "stg44"
	w_class = ITEMSIZE_LARGE
	max_shells = 30
	caliber = "kurz"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_ILLEGAL = 6)
	magazine_type = /obj/item/ammo_magazine/stg44
	allowed_magazines = list(/obj/item/ammo_magazine/stg44)
	load_method = MAGAZINE
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=1,    burst_accuracy=list(0,-0.1,-0.2), dispersion=list(0.0, 0.2, 0.3))
		)

/obj/item/weapon/gun/projectile/automatic/stg44/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "stg44"
	else
		icon_state = "stg44-empty"

/obj/item/weapon/gun/projectile/shotgun/pump/rifle/mauser98
	name = "Mauser K98k"
	desc = "Diese Waffe ist wirklich eines zu sehen! Es fühlt sich einfach richtig nutzen zu können! Uses 7.92x57mm Mauser rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "kar98k"
	icon_override = 'content_arfs/icons/obj/weapon/weapons.dmi'
	fire_delay = 0
	recoil = 1
	move_delay = 0
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "kar98k"
	w_class = ITEMSIZE_LARGE
	max_shells = 5
	caliber = "mauser"
	ammo_type = /obj/item/ammo_casing/mauser57
	load_method = SINGLE_CASING|SPEEDLOADER
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 4)

/obj/item/weapon/gun/projectile/shotgun/pump/rifle/newmosin
	name = "Mosin Nagant M44"
	desc = "For when you need to kill one person in the room, set the others on fire, and make their buddies in the next room temporarily deaf! Uses 7.62x54mm R rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "mosin"
	icon_override = 'content_arfs/icons/obj/weapon/weapons.dmi'
	fire_delay = 0
	recoil = 1
	move_delay = 0
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "mosin"
	w_class = ITEMSIZE_LARGE
	max_shells = 5
	caliber = "7.62x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = SINGLE_CASING|SPEEDLOADER
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 4)


/obj/item/weapon/gun/projectile/automatic/mp40
	name = "MP-40"
	desc = "A Nazi mainstay submachinegun. Not known for it's durability. Avoid dropping or bashing. Für das Vaterland! Uses 9mm rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "mp40"
	icon_override = 'content_arfs/icons/obj/weapon/weapons.dmi'
	fire_delay = 1
	fire_sound = 'sound/weapons/gunshot_glock.ogg'
	recoil = 0.1
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	move_delay = 0
	item_state = "mp40"
	w_class = ITEMSIZE_NORMAL
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mp40
	allowed_magazines = list(/obj/item/ammo_magazine/mp40, /obj/item/ammo_magazine/mp40/rubber, /obj/item/ammo_magazine/mp40/sorrynotsorry)

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=0,    burst_accuracy=list(0,-0.1,-0.2), dispersion=list(0.0, 0.4, 0.5))
		)

/obj/item/weapon/gun/projectile/automatic/mp40/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "mp40"
	else
		icon_state = "mp40-empty"

/obj/item/weapon/gun/projectile/automatic/ppsh
	name = "PPSh-41"
	desc = "The PPSh-41 was a sub-machinegun used in WWII by the 1st USSR. It boasts a high rate of fire, and 71 round drum magazines. Uses 7.62x25mm TT rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "ppsh"
	fire_delay = 0
	recoil = 2 //It's a PPSH, fucker.
	fire_sound = 'sound/weapons/uzi.ogg'
	item_state = "ppsh"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	burst_delay = 1
	w_class = ITEMSIZE_NORMAL
	caliber = "tokarev"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/tokarev/ppsh
	allowed_magazines = list(/obj/item/ammo_magazine/tokarev/ppsh, /obj/item/ammo_magazine/tokarev/ppsh/rubber)

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=0, move_delay=0,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, fire_delay=0, move_delay=0, burst_accuracy = list(0,-1,-1,-1,-1), dispersion = list(0.0, 1.0, 1.5, 1.6, 1.8))
		)

/obj/item/weapon/gun/projectile/automatic/ppsh/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ppsh"
	else
		icon_state = "ppsh-empty"

/obj/item/weapon/gun/projectile/automatic/dp28
	name = "DP-28"
	desc = "A very old light machinegun. Pretty reliable, and accurate, it's got a pretty weird design using 41 round disk mags, in a toploader configuration. Uses 7.62x54mm R rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "dp28"
	fire_delay = 3
	recoil = 1.5
	fire_sound = 'sound/weapons/gunshot_rifle.ogg'
	move_delay = 0
	burst_delay = 3
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "dp"
	w_class = ITEMSIZE_LARGE
	caliber = "7.62x54"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/dp28
	allowed_magazines = list(/obj/item/ammo_magazine/dp28)

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=4, burst_accuracy = list(0,0,0,-1,-1), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2))
		)

/obj/item/weapon/gun/projectile/automatic/dp28/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "dp28"
	else
		icon_state = "dp28-empty"

/obj/item/weapon/gun/projectile/automatic/pkm
	name = "Kalashnikov PKM"
	desc = "A Cold-war era Soviet GPMG. The PKM is a general purpose machinegun, used for laying down suppressive fire, and holding points down Due to it's rate of fire, and high caliber, it has no problem doing either of these.. Uses 7.62x54mm R"
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "pkm"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "pkm"
	w_class = ITEMSIZE_LARGE
	force = 15
	slot_flags = 0
	burst_delay = 2
	max_shells = 100
	caliber = "7.62x54"
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	slot_flags = SLOT_BACK
	ammo_type = "/obj/item/ammo_casing/a762x54"
	fire_sound = 'sound/weapons/gunshot_rifle.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/pkm
	allowed_magazines = list(/obj/item/ammo_magazine/pkm, /obj/item/ammo_magazine/pkm/ext)

	one_handed_penalty = 4

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=2, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=10, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2,0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2))
		)

/obj/item/weapon/gun/projectile/automatic/pkm/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "pkm"
	else
		icon_state = "pkm-empty"

/obj/item/weapon/gun/projectile/automatic/mg34
	name = "MG34 light machinegun"
	desc = "This thing sounds like a buzzsaw when it fires, because of it's incredibly high rate of fire. Useful for making an entire hallway of enemies into swiss cheese. Uses 7.92x57mm Mauser."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "l6closed100"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "mg"
	w_class = ITEMSIZE_LARGE
	force = 10
	slot_flags = 0
	burst_delay = 0.6
	max_shells = 100
	caliber = "mauser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	slot_flags = SLOT_BACK
	ammo_type = "/obj/item/ammo_casing/mauser57"
	fire_sound = 'sound/weapons/SVD_shot.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mg34
	allowed_magazines = list(/obj/item/ammo_magazine/mg34, /obj/item/ammo_magazine/mg34/ext)

	one_handed_penalty = 6

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=2, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=10, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2,0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2))
		)

	var/cover_open = 0

/obj/item/weapon/gun/projectile/automatic/mg34/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/mg34/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/mg34/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg34/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg34/update_icon()
	if(istype(/obj/item/ammo_magazine/mg34, /obj/item/ammo_magazine/mg34/ext))
		icon_state = "l6[cover_open ? "open" : "closed"]mag"
		item_state = icon_state
	else
		icon_state = "l6[cover_open ? "open" : "closed"][ammo_magazine ? round(ammo_magazine.stored_ammo.len, 25) : "-empty"]"
		item_state = "l6[cover_open ? "open" : "closed"][ammo_magazine ? "" : "-empty"]"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/mg34/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg34/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg34/plus
	name = "MG34 light machinegun"
	desc = "This thing sounds like a buzzsaw when it fires, because of it's incredibly high rate of fire. Useful for making an entire hallway of enemies into swiss cheese. You feel like using this on the fifth firing mode is a bad idea... Uses 7.92x57mm Mauser."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "l6closed100"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "mg"
	w_class = ITEMSIZE_LARGE
	force = 10
	slot_flags = 0
	burst_delay = 0.6
	max_shells = 100
	caliber = "mauser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	slot_flags = SLOT_BACK
	ammo_type = "/obj/item/ammo_casing/mauser57" // Is this really needed anymore?
	fire_sound = 'sound/weapons/SVD_shot.ogg'
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mg34/ext
	allowed_magazines = list(/obj/item/ammo_magazine/mg34, /obj/item/ammo_magazine/mg34/ext)

	one_handed_penalty = 6

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=0,    burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",	burst=5, move_delay=3, burst_accuracy = list(0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=10, move_delay=3, burst_accuracy = list(0,-1,-1,-2,-2,0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="magdump",	burst=50, move_delay=6, burst_accuracy = list(0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2)), //SO LOOONG. IN REGARDS TO THIS CODE SEGMENT, AND TO ANYONE WHO GETS SHOT WHILE THE GUN IS IN THIS MODE.
		list(mode_name="TOKI WO TOMARE?",	burst=100, move_delay=0, burst_accuracy = list(0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2,0,-1,-1,-2,-2), dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2, 0.6, 1.0, 1.0, 1.0, 1.2)) //end my suffering
		)

/obj/item/weapon/gun/projectile/automatic/akm
	name = "AKM"
	desc = "Rush B, cyka blyat. Uses 7.62x39mm rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "akm"
	fire_delay = 2
	fire_sound = 'sound/weapons/SVD_shot.ogg'
	recoil = 1
	move_delay = 0
	item_state = "akm"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	w_class = ITEMSIZE_LARGE
	caliber = "7.62x39"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4) //AKM's are still quite relevant, if a fucking combat shotgun can TECH_COMBAT = 5.
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/akm
	allowed_magazines = list(/obj/item/ammo_magazine/akm, /obj/item/ammo_magazine/akm/rubber)

	firemodes = list(
		list(mode_name="semiauto",       burst=1, burst_delay=0, fire_delay=1,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, burst_delay=1, fire_delay=null, move_delay=3,    burst_accuracy=list(0,-1,-2), dispersion=list(0.0, 0.6, 0.6))
		)

/obj/item/weapon/gun/projectile/automatic/akm/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "akm-30"
	else
		icon_state = "akm"

/obj/item/weapon/gun/projectile/automatic/akm/kawaii //i'm gonna die for this, i know it.
	name = "KAWAIISHNIKOV"
	desc = "Legend has it, this rifle originates from the 10th level of hell."  //it was so bad, i did't even know how to describe it
	icon_state = "kawaii"
	fire_sound = 'sound/machines/juicer.ogg' //kill me
	recoil = 3
	item_state = "kawaii"
	one_handed_penalty = 5 //fucking REEEEEEEEEEEE

/obj/item/weapon/gun/projectile/automatic/akm/kawaii/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "kawaii-30"
	else
		icon_state = "kawaii"

/obj/item/weapon/gun/projectile/automatic/aks
	name = "AKS-74u"
	desc = "Delet this. Uses 5.54x39mm rounds."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "aks"
	fire_delay = 0
	fire_sound = 'sound/weapons/gunshot_glock.ogg'
	recoil = 1
	move_delay = 0
	item_state = "aks"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	w_class = ITEMSIZE_NORMAL
	caliber = "5.54x39"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/aks
	allowed_magazines = list(/obj/item/ammo_magazine/aks, /obj/item/ammo_magazine/aks/ext, /obj/item/ammo_magazine/aks/rubber)

	firemodes = list(
		list(mode_name="semiauto",       burst=1, burst_delay=0, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, burst_delay=1, fire_delay=null, move_delay=1,    burst_accuracy=list(0,-1,-2), dispersion=list(0.0, 0.6, 0.6))
		)

/obj/item/weapon/gun/projectile/automatic/aks/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "aks"
	else
		icon_state = "aks-empty"

/obj/item/weapon/gun/projectile/tokarev
	name = "Tokarev TT mod.1933"
	desc = "For its time Tokarev TT was a formidable weapon, with good penetration and effective range. It was of good reliability and easy to maintain. Better than Nazi peestol! Uses 7.62x25mm TT."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	fire_delay = 0
	move_delay = 0
	icon_state = "tokarev"
	item_state = "tokarev"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	w_class = ITEMSIZE_NORMAL
	fire_sound = 'sound/weapons/pistol.ogg'

	caliber = "tokarev"
	ammo_type = /obj/item/ammo_casing/tokarev
	magazine_type = /obj/item/ammo_magazine/tokarev
	allowed_magazines = list(/obj/item/ammo_magazine/tokarev, /obj/item/ammo_magazine/tokarev/rubber)
	load_method = MAGAZINE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)

/obj/item/weapon/gun/projectile/tokarev/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "tokarev"
	else
		icon_state = "tokarev-e"

/obj/item/weapon/gun/projectile/lugeralt
	name = "P08 Luger"
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	desc = "A legitimate, non-reproduction P08 luger, from Nazi Germany. Perfect for a military officer. Uses 9mm rounds."
	icon_state = "p08"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	caliber = "9mm"
	load_method = MAGAZINE
	fire_sound = 'sound/weapons/holdout.ogg'
	magazine_type = /obj/item/ammo_magazine/m9mm
	allowed_magazines = list(/obj/item/ammo_magazine/m9mm)

/obj/item/weapon/gun/projectile/lugeralt/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "luger"
	else
		icon_state = "luger-e"

/obj/item/weapon/gun/projectile/automatic/m4a1
	name = "M4A1"
	desc = "An assault rifle from the late 20th century. The M4 has served as the basis for many modern assault rifles and weapon platforms. Uses 5.56x41mm."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "m4"
	fire_delay = 1
	fire_sound = 'sound/weapons/SVD_shot.ogg'
	recoil = 1
	move_delay = 0
	item_state = "m4"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	w_class = ITEMSIZE_NORMAL
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4) //AKM's are still quite relevant, if a fucking combat shotgun can TECH_COMBAT = 5.
	slot_flags = SLOT_BELT
	load_method = MAGAZINE
	magazine_type =/obj/item/ammo_magazine/m45tommy
	allowed_magazines = list(/obj/item/ammo_magazine/m45tommy)

	firemodes = list(
		list(mode_name="semiauto",       burst=1, burst_delay=0, fire_delay=0,    move_delay=null, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, burst_delay=1, fire_delay=null, move_delay=1,    burst_accuracy=list(0,-1,-2), dispersion=list(0.0, 0.6, 0.6))
		)

/obj/item/weapon/gun/projectile/automatic/m4a1/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m4"
	else
		icon_state = "m4-empty"

///obj/item/weapon/gun/energy/gun/burst/energyshotgun
//	name = "WKC-GPES Mk.I"
//	desc = "Have you ever wanted to use a shotgun that has little recoil, hits instantly, and penetrates armor like it doesn't exist? Yes? Then this is the gun for you! The newest weapon from the ever-growing WKC company."
//	icon = 'icons/obj/gun_arfs.dmi'
//	icon_state = "eshotgun100"
//	item_state = "bullpup"
//	burst = 10
//	burst_delay = 0
//	projectile_type = /obj/item/projectile/beam/shotgun
//	modifystate = "eshotgun"
//	fire_sound='sound/weapons/lasercannonfire.ogg'
//	charge_cost = 25
//	force = 15
//	w_class = ITEMSIZE_NORMAL
//	fire_delay = 0
//	origin_tech = list(TECH_COMBAT = 7, TECH_MAGNET = 6, TECH_ILLEGAL = 6)
//	one_handed_penalty = 0
//
//	firemodes = list(
//		list(mode_name="standard", burst=10, burst_delay = 0, fire_delay=null, move_delay=0, burst_accuracy=list(0,0,0), dispersion=list(0.0, 1.0, 1.5), projectile_type=/obj/item/projectile/beam/shotgun, fire_sound='sound/weapons/lasercannonfire.ogg'),
//		list(mode_name="concentrated", burst=5, burst_delay = 0, fire_delay=null, move_delay=0, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.2, 0.3), projectile_type=/obj/item/projectile/beam/shotgun, fire_sound='sound/weapons/lasercannonfire.ogg')
//		)

/obj/item/weapon/gun/energy/captain/retrotech
	name = "Retrotech laser rifle"
	desc = "THEY ARE NOW IN SPACE"
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "retrotech"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "retrotech"

	force = 5
	fire_sound = 'sound/weapons/pshwowow.ogg'
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_NORMAL
	projectile_type = /obj/item/projectile/beam/retrotech
	origin_tech = null
	fire_delay = 1
	charge_cost = 200
	self_recharge = 1
	recharge_time = 1
	charge_delay = 100 //it takes a bit to recharge, but when the delay is up, it charges up quick as fuck
	firemodes = list(
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam/retrotech, charge_cost = 200),
		list(mode_name="disable", projectile_type=/obj/item/projectile/beam/disable/retro, charge_cost = 100),
		)

/obj/item/weapon/gun/energy/captain/wkcpistol
	name = "WKC-CBCP-E"
	desc = "Like it's non-energy counterpart, this weapon has a silver finish and a comfortable grip. It fires highly concentrated blasts of energy to kill, or stun. Very powerful. Clearly intended for someone higher up, it's manufactured by White Kryten Cybernetics."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "ejssr"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	item_state = "tokarev"
	force = 5
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_SMALL
	fire_sound = 'sound/weapons/laser3.ogg'
	projectile_type = /obj/item/projectile/beam/xray
	origin_tech = null
	fire_delay = 0
	self_recharge = 1
	recharge_time = 5
	charge_delay = 100
	firemodes = list(
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam/xray, fire_sound='sound/weapons/Laser3.ogg', charge_cost = 200),
		list(mode_name="disable", projectile_type=/obj/item/projectile/beam/disable/retro, fire_sound='sound/weapons/eLuger.ogg', charge_cost = 100),
		)

/obj/item/weapon/gun/projectile/wkcpistol
	name = "WKC-CBCP .454"
	desc = "It's a unique handgun, with a comfy grip, crisp action, and polished silver finish. Clearly intended for someone higher up, it's manufactured by White Kryten Cybernetics. Uses .454 Casull."
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	fire_delay = 0
	move_delay = 0
	icon_state = "jssr"
	item_state = "tokarev"
	item_icons = list(
		slot_l_hand_str = 'content_arfs/icons/mob/inhands/lefthand_guns_arfs.dmi',
		slot_r_hand_str = 'content_arfs/icons/mob/inhands/righthand_guns_arfs.dmi',
		)
	w_class = ITEMSIZE_SMALL
	fire_sound = 'sound/weapons/deagle.ogg'

	caliber = ".454"
	ammo_type = /obj/item/ammo_casing/a454
	magazine_type = /obj/item/ammo_magazine/a454
	allowed_magazines = list(/obj/item/ammo_magazine/a454, /obj/item/ammo_magazine/a454/rubber, /obj/item/ammo_magazine/a454/ap)
	load_method = MAGAZINE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)

/obj/item/weapon/gun/projectile/wkcpistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "jssr"
	else
		icon_state = "jssr-e"

//ammo and magazines. or dakka points and dakka point containers, if you're autistic.

/obj/item/projectile/beam/disable/retro
    name = "disabler beam"
    icon_state = "omnilaser"
    nodamage = 1
    taser_effect = 1
    agony = 52 //two shot stun?!?!?!!?!
    damage_type = HALLOSS
    light_color = "#00CECE"

//    muzzle_type = /obj/effect/projectile/laser_omni/muzzle
//    tracer_type = /obj/effect/projectile/laser_omni/tracer
//   impact_type = /obj/effect/projectile/laser_omni/impact

/obj/item/projectile/beam/retrotech
	name = "green laser"
	icon_state = "xray"
	damage = 20
	agony = 25
	armor_penetration = 10
	light_color = "#00CC33"

	muzzle_type = /obj/effect/projectile/muzzle/xray
	tracer_type = /obj/effect/projectile/tracer/xray
	impact_type = /obj/effect/projectile/impact/xray

/obj/item/ammo_magazine/mp40
	name = "magazine (9mm)"
	icon = 'content_arfs/icons/obj/weapon/weapons.dmi'
	icon_state = "mp40mag"
	caliber = "9mm"
	multiple_sprites = 1
	w_class = ITEMSIZE_SMALL
	ammo_type = /obj/item/ammo_casing/a454
	max_ammo = 30
	mag_type = MAGAZINE

/obj/item/ammo_magazine/mp40/rubber
	name = "magazine (9mm rubber)"
	icon_state = "mp40magrubber"
	ammo_type = /obj/item/ammo_casing/a454

/obj/item/ammo_magazine/mp40/sorrynotsorry
	name = "magazine (9mm rubber)"
	desc = "These don't look like rubber bullets. But the mag is marked that they're rubber. Hmmmm..." //[insert nazi joke here]
	ammo_type = /obj/item/ammo_casing/a9mm


/obj/item/ammo_magazine/stg44
	name = "magazine (7.92x33mm Kurz)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "stg_mag"
	caliber = "kurz"
	w_class = ITEMSIZE_SMALL
	ammo_type = /obj/item/ammo_casing/stg/old
	max_ammo = 30
	mag_type = MAGAZINE

/obj/item/ammo_casing/stg/old
	desc = "A 7.92x33mm Kurz casing. This one is quite old."
	icon_state = "rifle-casing"
	caliber = "kurz"
	projectile_type = /obj/item/projectile/bullet/rifle/a762

/obj/item/ammo_magazine/stg44/empty
	initial_ammo = 0

/obj/item/ammo_magazine/clip/mauser
	name = "ammo clip (7.92x57mm Mauser)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "kclip"
	w_class = ITEMSIZE_TINY
	caliber = "mauser"
	ammo_type = /obj/item/ammo_casing/mauser57
	matter = list(DEFAULT_WALL_MATERIAL = 1000)
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_casing/mauser57
	desc = "A 7.92x57mm Mauser casing. Very old, yet still deadly."
	icon_state = "rifle-casing"
	caliber = "mauser"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/ap

/obj/item/ammo_magazine/clip/mauser/empty
	initial_ammo = 0

/obj/item/ammo_magazine/tokarev
	name = "magazine (7.62x25mm TT)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "tokarevmag"
	multiple_sprites = 1
	caliber = "tokarev"
	w_class = ITEMSIZE_TINY
	ammo_type = /obj/item/ammo_casing/tokarev
	max_ammo = 8
	mag_type = MAGAZINE

/obj/item/ammo_magazine/tokarev/ppsh
	name = "drum magazine (7.62x25mm TT)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "ppshmag"
	w_class = ITEMSIZE_SMALL
	caliber = "tokarev"
	ammo_type = /obj/item/ammo_casing/tokarev
	max_ammo = 71
	mag_type = MAGAZINE

/obj/item/ammo_magazine/tokarev/ppsh/rubber
	name = "drum magazine (7.62x25mm TT rubber)"
	desc = "Some people call these the 'PAIN TRAIN' mags. 71 rubber bullets might do a little more than hurt, though."
	icon_state = "ppshmagrubber"
	ammo_type = /obj/item/ammo_casing/tokarev/rubber

/obj/item/ammo_casing/tokarev
	desc = "A 7.62x25mm TT casing."
	icon_state = "s-casing"
	caliber = "tokarev"
	projectile_type = /obj/item/projectile/bullet/pistol/medium/ap

/obj/item/ammo_magazine/tokarev/empty
	initial_ammo = 0

/obj/item/ammo_magazine/tokarev/rubber
	name = "magazine (7.62x25mm TT rubber)"
	icon_state = "tokarevmagrubber"
	ammo_type = /obj/item/ammo_casing/tokarev/rubber

/obj/item/ammo_casing/tokarev/rubber
	desc = "A rubber 7.62x25mm TT casing."
	icon_state = "r-casing"
	caliber = "tokarev"
	projectile_type = /obj/item/projectile/bullet/pistol/rubber/tokarev

/obj/item/ammo_magazine/tokarev/rubber/empty
	initial_ammo = 0

/obj/item/projectile/bullet/pistol/rubber/tokarev
	name = "rubber bullet"
	damage = 6
	agony = 50
	embed_chance = 0
	sharp = 0
	check_armour = "melee"

/obj/item/ammo_magazine/dp28
	name = "disk magazine (7.62x54mm R)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "dpdisk"
	caliber = "7.62x54"
	w_class = ITEMSIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 41
	mag_type = MAGAZINE

/obj/item/ammo_magazine/mg34
	name = "drum magazine (7.92x57mm Mauser)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "mg34"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "mauser"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	ammo_type = /obj/item/ammo_casing/mauser57
	w_class = ITEMSIZE_NORMAL
	max_ammo = 50

/obj/item/ammo_magazine/mg34/ext
	name = "extended drum magazine (7.92x57mm Mauser)"
	icon_state = "mg34"
	matter = list(DEFAULT_WALL_MATERIAL = 20000)
	max_ammo = 100

/obj/item/ammo_magazine/dp28/empty
	initial_ammo = 0

/obj/item/ammo_magazine/clip/mosin
	name = "ammo clip (7.62x54mm R)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "clip"
	w_class = ITEMSIZE_TINY
	caliber = "7.62x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	matter = list(DEFAULT_WALL_MATERIAL = 1000)
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_casing/a762x54
	desc = "A 7.62x54mm R casing."
	icon_state = "rifle-casing"
	caliber = "7.62x54"
	projectile_type = /obj/item/projectile/bullet/rifle/a762

/obj/item/ammo_magazine/akm
	name = "magazine (7.62x39mm)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "akmmag"
	multiple_sprites = 1
	caliber = "7.62x39"
	w_class = ITEMSIZE_SMALL
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 30
	mag_type = MAGAZINE

/obj/item/ammo_magazine/akm/rubber
	name = "magazine (7.62x39mm rubber)"
	icon_state = "akmmagrubber"
	ammo_type = /obj/item/ammo_casing/a762x39/rubber

/obj/item/ammo_magazine/aks
	name = "magazine (5.54x39mm)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "aksmag"
	multiple_sprites = 1
	caliber = "5.54x39"
	w_class = ITEMSIZE_SMALL
	ammo_type = /obj/item/ammo_casing/aks
	max_ammo = 30
	mag_type = MAGAZINE

/obj/item/ammo_magazine/aks/ext
	name = "extended magazine (5.54x39mm)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "aksmagext"
	multiple_sprites = 1
	caliber = "5.54x39"
	w_class = ITEMSIZE_SMALL
	ammo_type = /obj/item/ammo_casing/aks
	max_ammo = 45
	mag_type = MAGAZINE

/obj/item/ammo_magazine/aks/rubber
	name = "magazine (5.54x39mm rubber)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "aksmagrubber"
	multiple_sprites = 1
	caliber = "5.54x39"
	w_class = ITEMSIZE_SMALL
	ammo_type = /obj/item/ammo_casing/aks/rubber
	max_ammo = 30
	mag_type = MAGAZINE

/obj/item/ammo_magazine/dp28/empty
	initial_ammo = 0

/obj/item/ammo_casing/a762x39
	desc = "A 7.62x39mm casing. Smells like Cosmoline."
	icon_state = "rifle-casing"
	caliber = "7.62x39"
	projectile_type = /obj/item/projectile/bullet/rubber/akm

/obj/item/ammo_casing/a762x39/rubber
	desc = "A 7.62x39mm rubber casing. Smells like Cosmoline and police brutality."
	icon_state = "rifle-casing"
	caliber = "7.62x39"
	projectile_type = /obj/item/projectile/bullet/rubber/akm

/obj/item/ammo_casing/aks
	desc = "A 5.54x39mm casing. Smells like Vodka."
	icon_state = "rifle-casing"
	caliber = "5.54x39"
	projectile_type = /obj/item/projectile/bullet/rubber/akm

/obj/item/ammo_casing/aks/rubber
	desc = "A 5.54x39mm rubber bullet casing. Smells like Vodka and police brutality."
	icon_state = "rifle-casing"
	caliber = "5.54x39"
	projectile_type = /obj/item/projectile/bullet/rubber/aks

/obj/item/projectile/bullet/rubber/akm //WHY THE FUCK NOT, RIGHT?!
	name = "rubber rifle bullet"
	damage = 8 //It's 7.62x39mm.
	agony = 60 //Look up, fucker.
	embed_chance = 0
	sharp = 0
	check_armour = "melee"

/obj/item/projectile/bullet/rubber/aks //WHY THE FUCK NOT, RIGHT?!
	name = "rubber rifle bullet"
	damage = 7 //It's still 5.54x39mm.
	agony = 50 //Still pretty ouch.
	embed_chance = 0
	sharp = 0
	check_armour = "melee"

/obj/item/ammo_magazine/pkm
	name = "box magazine (7.62x54mm R)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "pkm"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "7.62x54"
	matter = list(DEFAULT_WALL_MATERIAL = 10000)
	ammo_type = /obj/item/ammo_casing/a762x54
	w_class = ITEMSIZE_NORMAL
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/pkm/ext
	name = "large box magazine (7.62x54mm R)"
	icon_state = "pkm"
	matter = list(DEFAULT_WALL_MATERIAL = 20000)
	max_ammo = 200

/obj/item/projectile/beam/shotgun
	name = "energy scattergun bolt"
	damage = 8
	light_color = "#0066FF"
	armor_penetration = 100
	icon_state = "omnilaser"
	muzzle_type = /obj/effect/projectile/muzzle/laser_omni
	tracer_type = /obj/effect/projectile/tracer/laser_omni
	impact_type = /obj/effect/projectile/impact/laser_omni

/obj/item/ammo_magazine/a454
	name = "magazine (.454 Casull)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "9x39"
	caliber = ".454"
	w_class = ITEMSIZE_TINY
	ammo_type = /obj/item/ammo_casing/a454
	max_ammo = 10
	mag_type = MAGAZINE

/obj/item/ammo_magazine/a454/ap
	name = "magazine (.454 Casull AP)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "9x39"
	caliber = ".454"
	w_class = ITEMSIZE_TINY
	ammo_type = /obj/item/ammo_casing/a454/ap
	max_ammo = 10
	mag_type = MAGAZINE

/obj/item/ammo_magazine/a454/rubber
	name = "magazine (.454 Casull rubber)"
	icon = 'content_arfs/icons/obj/weapon/ammo_arfs.dmi'
	icon_state = "9x39"
	caliber = ".454"
	w_class = ITEMSIZE_TINY
	ammo_type = /obj/item/ammo_casing/a454/rubber
	max_ammo = 10
	mag_type = MAGAZINE

/obj/item/ammo_casing/a454
	desc = "A .454 casing."
	icon_state = "s-casing"
	caliber = ".454"
	projectile_type = /obj/item/projectile/bullet/pistol/mild

/obj/item/ammo_casing/a454/rubber
	desc = "A .454 rubber casing."
	icon_state = "r-casing"
	caliber = ".454"
	projectile_type = /obj/item/projectile/bullet/rubber/akm

/obj/item/ammo_casing/a454/ap
	desc = "A .454 AP casing."
	icon_state = "s-casing"
	caliber = ".454"
	projectile_type = /obj/item/projectile/bullet/pistol/mild/ap

/obj/item/projectile/bullet/pistol/mild/ap
	damage = 45
	armor_penetration = 30

/obj/item/projectile/bullet/pistol/mild //for the .454 Casull
	damage = 50
