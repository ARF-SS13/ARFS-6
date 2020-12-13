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