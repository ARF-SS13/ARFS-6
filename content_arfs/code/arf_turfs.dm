/turf/simulated/floor/water/arf_hotspring
	name = "Hotsprings"
	desc = "A artificially made hot spring, made from real spring water, filtered and pumped continuously for your pleasure!"
	edge_blending_priority = -2
	movement_cost = 4
	depth = 2
	water_state = "water_shallow"
	outdoors = FALSE

/turf/simulated/floor/water/hotspring/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/simulated/floor/water/arf_hotspring))
			to_chat(L, "<span class='warning'>You feel an overwhelming wave of warmth from entering \the [src]!</span>")
	AM.water_act(5)
	..()
