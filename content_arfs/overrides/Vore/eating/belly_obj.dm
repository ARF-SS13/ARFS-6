/obj/belly
	var/autotransferchance = 0 				// % Chance of prey being autotransferred to transfer location
	var/autotransferwait = 10 				// Time between trying to transfer.
	var/autotransferlocation				// Place to send them

/obj/belly/proc/check_autotransfer(var/prey, var/autotransferlocation)
	if(autotransferlocation && (autotransferchance > 0) && (prey in contents))
		if(prob(autotransferchance))
			var/obj/belly/dest_belly
			for(var/obj/belly/B in owner.vore_organs)
				if(B.name == autotransferlocation)
					dest_belly = B
					break
			if(dest_belly)
				transfer_contents(prey, dest_belly)
		else
			// Didn't transfer, so wait before retrying
			addtimer(CALLBACK(src, /obj/belly/.proc/check_autotransfer, prey, autotransferlocation), autotransferwait)

/obj/belly/Entered(atom/movable/thing, atom/OldLoc)
	.=..()
	if(!owner.client)	//Intended for simple mobs
		if(autotransferlocation != null && autotransferchance > 0)
			addtimer(CALLBACK(src, /obj/belly/.proc/check_autotransfer, thing, autotransferlocation), autotransferwait)