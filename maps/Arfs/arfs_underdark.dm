#include "underdark_pois/_templates.dm"

/obj/tether_away_spawner
	name = "RENAME ME, JERK"
	desc = "Spawns the mobs!"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x"
	invisibility = 101
	mouse_opacity = 0
	density = 0
	anchored = 1

	var/guard				//# will set the mobs to remain nearby their spawn point within this dist

	// By implementing submaps, we don't have to have a define of this really, just commenting out the duplicated vars..
	/*
	//Weighted with values (not %chance, but relative weight)
	//Can be left value-less for all equally likely
	var/list/mobs_to_pick_from

	//When the below chance fails, the spawner is marked as depleted and stops spawning
	var/prob_spawn = 100	//Chance of spawning a mob whenever they don't have one
	var/prob_fall = 5		//Above decreases by this much each time one spawns

	//Settings to help mappers/coders have their mobs do what they want in this case
	var/faction				//To prevent infighting if it spawns various mobs, set a faction
	var/atmos_comp			//TRUE will set all their survivability to be within 20% of the current air

	//Internal use only
	var/mob/living/simple_mob/my_mob
	var/depleted = FALSE
	*/

/obj/tether_away_spawner/Initialize()
	. = ..()

	if(!LAZYLEN(mobs_to_pick_from))
		error("Mob spawner at [x],[y],[z] ([get_area(src)]) had no mobs_to_pick_from set on it!")
		initialized = TRUE
		return INITIALIZE_HINT_QDEL
	START_PROCESSING(SSobj, src)

/obj/tether_away_spawner/process()
	if(my_mob && my_mob.stat != DEAD)
		return //No need

	if(LAZYLEN(loc.human_mobs(world.view)))
		return //I'll wait.

	if(prob(prob_spawn))
		prob_spawn -= prob_fall
		var/picked_type = pickweight(mobs_to_pick_from)
		my_mob = new picked_type(get_turf(src))
		my_mob.low_priority = TRUE

		if(faction)
			my_mob.faction = faction

		if(atmos_comp)
			var/turf/T = get_turf(src)
			var/datum/gas_mixture/env = T.return_air()
			if(env)
				my_mob.minbodytemp = 0
				my_mob.maxbodytemp = 400

				//var/list/gaslist = env.gas
				my_mob.min_oxy = 0
				my_mob.min_tox = 0
				my_mob.min_n2 = 0
				my_mob.min_co2 = 0
				my_mob.max_oxy = 100
				my_mob.max_tox = 2
				my_mob.max_n2 = 100
				my_mob.max_co2 = 100

/* AI modified, removes these vars
		if(guard)
			my_mob.returns_home = TRUE
			my_mob.wander_distance = guard
*/

		return
	else
		STOP_PROCESSING(SSobj, src)
		depleted = TRUE
		return

// Underdark mob spawners
/obj/tether_away_spawner/underdark_normal
	name = "Underdark Normal Spawner"
	faction = "underdark"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 50
	guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/animal/space/jelly = 3,
		/mob/living/simple_mob/animal/giant_spider/hunter = 1,
		/mob/living/simple_mob/animal/giant_spider/phorogenic = 1,
		/mob/living/simple_mob/animal/giant_spider/lurker = 1,
	)

/obj/tether_away_spawner/underdark_hard
	name = "Underdark Hard Spawner"
	faction = "underdark"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 50
	guard = 20
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/corrupthound = 1,
		/mob/living/simple_mob/vore/aggressive/rat = 1,
//		/mob/living/simple_mob/animal/space/mimic = 1
	)

/obj/tether_away_spawner/underdark_boss
	name = "Underdark Boss Spawner"
	faction = "underdark"
	atmos_comp = TRUE
	prob_spawn = 100
	prob_fall = 100
	guard = 70
	mobs_to_pick_from = list(
		/mob/living/simple_mob/vore/aggressive/dragon = 1
	)
