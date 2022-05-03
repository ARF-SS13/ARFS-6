/datum/trait/autohiss_unathi
    excludes = list(/datum/trait/autohiss_tajaran, /datum/trait/autohiss_vassilian)

/datum/trait/autohiss_tajaran
    excludes = list(/datum/trait/autohiss_unathi, /datum/trait/autohiss_vassilian)

// YW addition
/datum/trait/autohiss_vassilian
	name = "Autohiss (Vassilian)"
	desc = "You buzz your S's, F's, Th's, and R's."
	cost = 0
	var_changes = list(
	autohiss_basic_map = list(
        "s" = list("sz", "z", "zz"),
        "f" = list("zk")
		),
	autohiss_extra_map = list(
		"th" = list("zk", "szk"),
        "r" = list("rk")
	),
	autohiss_exempt = list("Vespinae"))
	excludes = list(/datum/trait/autohiss_tajaran, /datum/trait/autohiss_unathi)
// YW Addition end

//I'm sorry.
/datum/trait/autohiss_gibberish
	name = "Autohiss (Gibberish)"
	desc = "Your character is very hard, if not impossible, to understand."
	cost = 0
	var_changes = list(
	autohiss_basic_map = list(
        "s" = list("sz", "z", "zz","zzz", "ss", "sssss"),
        "f" = list("zk", "v", "vh"),
        "ph" = list ("v", "vh"),
        "ce" = list ("z", "zz"),
        "ci" = list ("z", "zz"),
        "v" = list ("vv", "vv"),
        "th" = list ("zk", "szk"),
        "r" = list ("rk", "rr", "rrr", "rrrr"),
        "x" = list ("ks", "ksss", "kssss"),
        "c" = list ("ch", "chhh", "chhhh"),
        "j" = list("y"),
		"ch" = list("sh"),
		"hu" = list("yu"),
		"hoo" = list("yu"),
		"your" = list ("din"),
		"you" = list ("du"),
		"you'll" = list ("du kommer"),
		"you've" = list ("du har"),
		"and" = list ("och"),
		"or" = list ("eller"),
		"but" = list ("men"),
		"so" = list ("sa"),
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
		)
	)