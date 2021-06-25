
/datum/trait/neutral/metabolism_up
	name = "Fast Metabolism"
	desc = "You process ingested and injected reagents faster, but get hungry faster (Teshari speed)."
	cost = 0
	var_changes = list("metabolic_rate" = 1.2, "hunger_factor" = 0.2, "metabolism" = 0.06) // +20% rate and 4x hunger (Teshari level)
	excludes = list(/datum/trait/neutral/metabolism_down, /datum/trait/neutral/metabolism_apex)

/datum/trait/neutral/metabolism_down
	name = "Slow Metabolism"
	desc = "You process ingested and injected reagents slower, but get hungry slower."
	cost = 0
	var_changes = list("metabolic_rate" = 0.8, "hunger_factor" = 0.04, "metabolism" = 0.0012) // -20% of default.
	excludes = list(/datum/trait/neutral/metabolism_up, /datum/trait/neutral/metabolism_apex)

/datum/trait/neutral/metabolism_apex
	name = "Apex Metabolism"
	desc = "Finally a proper excuse for your predatory actions. Essentially doubles the fast trait rates. Good for characters with big appetites."
	cost = 0
	var_changes = list("metabolic_rate" = 1.4, "hunger_factor" = 0.4, "metabolism" = 0.012) // +40% rate and 8x hunger (Double Teshari)
	excludes = list(/datum/trait/neutral/metabolism_up, /datum/trait/neutral/metabolism_down)

/datum/trait/neutral/cold_discomfort
	name = "Hot-Blooded"
	desc = "You are too hot at the standard 20C. 18C is more suitable. Rolling down your jumpsuit or being unclothed helps."
	cost = 0
	var_changes = list("heat_discomfort_level" = T0C+19)
	excludes = list(/datum/trait/neutral/hot_discomfort)

/datum/trait/neutral/hot_discomfort
	name = "Cold-Blooded"
	desc = "You are too cold at the standard 20C. 22C is more suitable. Wearing clothing that covers your legs and torso helps."
	cost = 0
	var_changes = list("cold_discomfort_level" = T0C+21)
	excludes = list(/datum/trait/neutral/cold_discomfort)

/datum/trait/neutral/autohiss_unathi
	name = "Autohiss (Unathi)"
	desc = "You roll your S's and x's"
	cost = 0
	var_changes = list(
	autohiss_basic_map = list(
			"s" = list("ss", "sss", "ssss")
		),
	autohiss_extra_map = list(
			"x" = list("ks", "kss", "ksss")
		),
	autohiss_exempt = list("Sinta'unathi"))

	excludes = list(/datum/trait/neutral/autohiss_tajaran)

/datum/trait/neutral/autohiss_tajaran
	name = "Autohiss (Tajaran)"
	desc = "You roll your R's."
	cost = 0
	var_changes = list(
	autohiss_basic_map = list(
			"r" = list("rr", "rrr", "rrrr")
		),
	autohiss_exempt = list("Siik"))
	excludes = list(/datum/trait/neutral/autohiss_unathi)

/datum/trait/neutral/bloodsucker
	name = "Bloodsucker"
	desc = "Makes you unable to gain nutrition from anything but blood. To compenstate, you get fangs that can be used to drain blood from prey."
	cost = 0
	var_changes = list("gets_food_nutrition" = 0) //The verb is given in human.dm

/datum/trait/neutral/bloodsucker/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/bloodsuck

/datum/trait/neutral/succubus_drain
	name = "Succubus Drain"
	desc = "Makes you able to gain nutrition from draining prey in your grasp."
	cost = 0

/datum/trait/neutral/succubus_drain/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/carbon/human/proc/succubus_drain
	H.verbs |= /mob/living/carbon/human/proc/succubus_drain_finalize
	H.verbs |= /mob/living/carbon/human/proc/succubus_drain_lethal

/datum/trait/neutral/hard_vore
	name = "Brutal Predation"
	desc = "Allows you to tear off limbs & tear out internal organs."
	cost = 0 //I would make this cost a point, since it has some in game value, but there are easier, less damaging ways to perform the same functions.

/datum/trait/neutral/hard_vore/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/shred_limb

/datum/trait/neutral/trashcan
	name = "Trash Can"
	desc = "Allows you to dispose of some garbage on the go instead of having to look for a bin or littering like an animal."
	cost = 0
	var_changes = list("trashcan" = 1)

/datum/trait/neutral/trashcan/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/eat_trash

/datum/trait/neutral/glowing_eyes
	name = "Glowing Eyes"
	desc = "Your eyes show up above darkness. SPOOKY! And kinda edgey too."
	cost = 0
	var_changes = list("has_glowing_eyes" = 1)

/datum/trait/neutral/glowing_body
	name = "Glowing Body"
	desc = "Your body glows about as much as a PDA light! Settable color and toggle in Abilities tab ingame."
	cost = 0
/datum/trait/neutral/glowing_body/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.verbs |= /mob/living/proc/glow_toggle
	H.verbs |= /mob/living/proc/glow_color

/*
/datum/trait/neutral/transform
	name = "Feral Transformation"
	desc = "Your body allows you to transform into a feral form!"
	cost = 0

/datum/trait/neutral/transform/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	..(S,H)
	H.add_spell(new/spell/shapeshift)
*/

/datum/trait/neutral/small_size
	name = "Small Size"
	desc = "Makes your mob size small, enabling you to be picked up easier!"
	cost = 0
	var_changes = list("mob_size" = MOB_SMALL)


/mob/living/carbon/human/proc/mob_size()
    set name = "Toggle Mob Size"
    set desc = "Toggle to allow being picked up.."
    set category = "Abilities"
    mob_size = MOB_SMALL

/datum/trait/neutral/small_size/apply(var/datum/species/S,var/mob/living/carbon/human/H)
	H.verbs |= /mob/living/carbon/human/proc/mob_size

	var/mob/living/carbon/human/C = src
	C.mob_size = !C.mob_size

//Accents
//the way this works, okay, if you're just replacing one letter those will go first; top to bottom no matter list placement.  If there are multiple instances of the same letter being changed the longest instance takes precendenced.
//Players can have either autohiss or one accent.
//1) compiles big list of replacements to look for
//2) takes long replacements and puts them in separate list
//3) replaces the list of long bois
//4) replaces list of short ones
//5) each list is done top to bottom
//6) if you add a new accent add it to ACCENTS_LIST_ALL below with no spaces.  Defines are funky.
//7
//  ~Dictated via TK from Cactus
// "" = list(""), ~Tk made this for anyone who wants to have a set copy/paste bit of code to add lots of accents in.

#define ACCENTS_LIST_ALL list(/datum/trait/neutral/autohiss_unathi,/datum/trait/neutral/autohiss_tajaran,/datum/trait/autohiss_vassilian,/datum/trait/neutral/accent_swedish,/datum/trait/neutral/accent_japenese,/datum/trait/neutral/accent_irish,/datum/trait/neutral/accent_french,/datum/trait/neutral/accent_scottish)

/datum/trait/neutral/accent_swedish
	name = "Accent (Swedish)"
	desc = "You have a noticeable Swedish accent. Uses the autohiss function, which must be enabled in-game with Toggle-Auto-Hiss. Excludes: Other accents/auto-hisses"
	cost = 0
	excludes = ACCENTS_LIST_ALL
	custom_only = FALSE
	var_changes = list(autohiss_basic_map = list(
		"j" = list("y"),
		"ch" = list("sh"),
		"hu" = list("yu"),
		"hoo" = list("yu")
		),

	autohiss_extra_map = list(
		" your " = list(" din "),
		" you " = list(" du "),
		" you'll " = list(" du kommer "),
		" you've " = list(" du har "),
		" and " = list(" och "),
		" or " = list(" eller "),
		" but " = list(" men "), // haha butt men ~TK
		" so " = list(" sa ") //Should be så, but Byond a shit ~TK
		))

/datum/trait/neutral/accent_japenese
	name = "Accent (Japanese)"
	desc = "You have a noticeable Japanese accent. Uses the autohiss function, which must be enabled in-game with Toggle-Auto-Hiss. Excludes: Other accents/auto-hisses"
	cost = 0
	custom_only = FALSE
	var_changes = list(autohiss_basic_map = list(
		"l" = list("r"),
		"v" = list("b"),
		"f" = list("hu"),
		"'t" = list(""),
		" I " = list(" ai "),
		"th" = list("z"),
		"is" = list("izu"),
		"ow" = list("au"),
		"are" = list("aa"),
		"ay" = list("ayu"),
		"ea" = list("ii"),
		"ch" = list("chi")
		))
	excludes = ACCENTS_LIST_ALL


/datum/trait/neutral/accent_irish
	name = "Accent (Irish)"
	desc = "You have a noticeable Irish accent. Uses the autohiss function, which must be enabled in-game with Toggle-Auto-Hiss. Excludes: Other accents/auto-hisses"
	cost = 0
	custom_only = FALSE
	var_changes = list(autohiss_basic_map = list(
		"ing" = list("eng"),
		"i" = list("ei"),
		"th" = list("d"),
		"r" = list("er"),
		"'l" = list("ll")
		),

	autohiss_extra_map = list(
		" youer " = list(" do "),
		" you " = list(" tú "),
		" you've " = list(" tá tú "),
		" and " = list(" agus "),
		" or " = list("  nó "),
		" but " = list(" ach "),
		" so " = list(" mar sin ")
		))
	excludes = ACCENTS_LIST_ALL

/datum/trait/neutral/accent_french
	name = "Accent (French)"
	desc = "You have a noticeable French accent. Uses the autohiss function, which must be enabled in-game with Toggle-Auto-Hiss. Excludes: Other accents/auto-hisses"
	cost = 0
	custom_only = FALSE
	var_changes = list(autohiss_basic_map = list(
		"th" = list("zh"),
		"s" = list("z"),
		"r" = list("rr"),
		"h" = list("'"),
		"i" = list("e", "ee", "i")
		),

	autohiss_extra_map = list(
		" yourr " = list(" votre "),
		" you " = list(" toi "),
		" you'll " = list(" tu vas "),
		" you've " = list(" vous avez "),
		" and " = list(" et "),
		" orr " = list(" ou "), //Or -> Orr -> Ou
		" but " = list(" mais "),
		" zo " = list(" donc ") //So -> Zo -> Donc
		))
	excludes = ACCENTS_LIST_ALL


/datum/trait/neutral/accent_scottish
	name = "Accent (Scottish)"
	desc = "You have a noticeable Scottish accent. Uses the autohiss function, which must be enabled in-game with Toggle-Auto-Hiss. Excludes: Other accents/auto-hisses"
	cost = 0
	custom_only = FALSE
	var_changes = list(autohiss_basic_map = list(
		"h" = list("'"),
		"g" = list("'"),
		" of " = list(" o' ")
		),

	autohiss_extra_map = list(
		" your " = list(" yer "),
		" you " = list(" ye "),
		" you'll " = list(" ye'll "),
		" you've " = list(" ye've "),
		" and " = list(" agus "),
		" or " = list("  no "),
		" but " = list(" ach "),
		" so " = list(" mar sin "),
		" of " = list(" o' ")
		))
	excludes = ACCENTS_LIST_ALL


//accents go above this ^
#undef ACCENTS_LIST_ALL

