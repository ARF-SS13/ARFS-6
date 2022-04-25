// Ported from paradise, attempted to port into borecode. - Gremling.

//FUCKING LOVE ME KILLBOW

//Added a new 'type' to make it a bit easier to code.
/obj/item/weapon/melee/dallus/
	icon = 'content_arfs/icons/obj/killbow_weapon.dmi'
	item_icons = list(
			slot_l_hand_str = 'content_arfs/icons/obj/killbow_weapon_inhand_left.dmi',
			slot_r_hand_str = 'content_arfs/icons/obj/killbow_weapon_inhand_right.dmi',
			)

/obj/item/weapon/material/twohanded/dallus
	icon = 'content_arfs/icons/obj/killbow_weapon.dmi'
	item_icons = list(
			slot_l_hand_str = 'content_arfs/icons/obj/killbow_weapon_inhand_left.dmi',
			slot_r_hand_str = 'content_arfs/icons/obj/killbow_weapon_inhand_right.dmi',
			)
	applies_material_colour = 0

//At last, you can master the sword forms of ending them rightly. ~TK
//If someone can find the variable to, or make the variable to, vary the click attack speed for these.  That'd be grand. ~TK
/obj/item/weapon/material/twohanded/dallus/longsword
	name = "longsword"
	desc = "A lengthy, hand-and-a-half bladed weapon. It is well balanced, and comfortable to wield."
	icon_state = "longsword"
	base_icon = "longsword"
	slot_flags = SLOT_BELT | SLOT_BACK
	force_unwielded = 20
	force_wielded = 25
	throwforce = 15
	sharp = 1
	embed_chance = 15
	throw_speed = 2
	throw_range = 4
	w_class = ITEMSIZE_HUGE
	hitsound = 'sound/weapons/bladeslice.ogg'
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("cut", "slashed", "sliced", "stabbed", "lacerated", "impaled", "gutted")

/obj/item/weapon/material/twohanded/required/dallus/zweihander
	name = "zweihander"
	desc = "An enormous, two-handed sword designed to fight pike formations, dragons, and rabid Vox."
	icon_state = "zweihander"
	base_icon = "zweihander"
	slot_flags = SLOT_BACK
	force_unwielded = 25
	force_wielded = 25
	throwforce = 20
	sharp = 1
	embed_chance = 15
	throw_speed = 2
	throw_range = 2
	hitsound = 'sound/weapons/bladeslice.ogg'
	w_class = ITEMSIZE_HUGE //HOPEFULLY this is big enough.
	origin_tech = list(TECH_COMBAT = 3)
	attack_verb = list("slashed", "chopped", "eviscerated", "disemboweled", "hacked", "maimed")

/obj/item/weapon/material/twohanded/required/dallus/halberd
	name = "halberd"
	desc = "A polearm. This long stick has an axehead on the end."
	icon_state = "halberd"
	base_icon = "halberd"
	slot_flags = SLOT_BACK
	force_unwielded = 25
	force_wielded = 25
	throwforce = 20
	sharp = 1
	throw_speed = 2
	throw_range = 2
	hitsound = 'sound/weapons/bladeslice.ogg'
	w_class = ITEMSIZE_HUGE
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("chopped", "stabbed", "slapped", "hacked", "poleaxed", "mauled")

/obj/item/weapon/material/twohanded/required/dallus/classicspear
	name = "spear"
	desc = "The long arm of the militia.  This is a weapon that even the most debased peasant should be able to master swiftly."
	icon_state = "classicspear"
	base_icon = "classicspear"
	slot_flags = SLOT_BACK
	force_unwielded = 20
	force_wielded = 20
	throwforce = 20
	throw_speed = 2
	throw_range = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	w_class = ITEMSIZE_HUGE
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("poked", "stabbed", "jabbed", "prodded", "impaled", "shafted")

/obj/item/weapon/material/twohanded/required/dallus/warhammer //This is another weapon that needs an attack speed var. ~TK
	name = "warhammer"
	desc = "An enormous, weaponized sledge-hammer.  There are not 40,000 of these."
	icon_state = "warhammer"
	base_icon = "warhammer"
	slot_flags = SLOT_BACK
	force_unwielded = 28
	force_wielded = 28
	throwforce = 25
	throw_speed = 2
	throw_range = 2
	w_class = ITEMSIZE_LARGE
	hitsound = 'sound/weapons/genhit3.ogg'
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("pounded", "pummeled", "slammed", "hammered", "bludgeoned", "battered", "crushed")

/obj/item/weapon/melee/dallus/shortsword
	name = "shortsword"
	desc = "A one-handed blade designed to chop, thrust, slice, dice, and sell melons."
	icon_state = "shortsword"
	slot_flags = SLOT_BELT
	force = 15
	throwforce = 10
	sharp = 1
	embed_chance = 15
	throw_speed = 2
	throw_range = 4
	w_class = ITEMSIZE_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("chopped", "stabbed", "sliced", "slashed", "lacerated", "diced", "impaled")

/obj/item/weapon/melee/dallus/gladius
	name = "gladius"
	desc = "A Roman style gladius, the blade looks good for slipping past armored plates."
	icon_state = "gladius"
	slot_flags = SLOT_BELT
	force = 15
	throwforce = 10
	sharp = 1
	embed_chance = 15
	throw_speed = 2
	throw_range = 4
	w_class = ITEMSIZE_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("chopped", "stabbed", "hacked", "sliced", "slashed", "legionairred")

/obj/item/weapon/melee/dallus/mace
	name = "mace"
	desc = "A pointed, weighted piece of metal on a stick.  Designed to crush armor, flesh, bone, and rats alike. "
	icon_state = "mace"
	item_state = "mace"
	slot_flags = SLOT_BELT
	force = 15
	throwforce = 10
	throw_speed = 2
	throw_range = 4
	w_class = ITEMSIZE_NORMAL
	hitsound = 'sound/weapons/genhit3.ogg'
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("pounded", "pummeled", "slammed", "hammered", "battered", "bludgeoned", "crushed")


/obj/item/weapon/melee/dallus/classicrapier
	name = "rapier"
	desc = "A thin, long sword designed for slashing and poking. En garde!"
	icon_state = "classicrapier"
	slot_flags = SLOT_BELT
	force = 15
	throwforce = 10
	sharp = 1
	embed_chance = 15
	throw_speed = 2
	throw_range = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	w_class = ITEMSIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("slashed", "poked", "sliced", "jabbed")