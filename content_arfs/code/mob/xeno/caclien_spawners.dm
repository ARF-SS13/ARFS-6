/obj/structure/mob_spawner/scanner/caclien
	name = "tunnel"
	desc = "The walls of this tunnel are caked in an organic, resin-like substance. Outside, claw marks can be seen trailing in and out of its entrance."
	icon = 'content_arfs/icons/mob/mobs/alien.dmi'
	icon_state = "alien_spawn"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	mob_faction = "xenomorph"
	total_spawns = -1
	destructible = 1
	health = 50
	anchored = TRUE
	icon = 'content_arfs/icons/mob/mobs/alien.dmi'
	icon_state = "alien_nest"
	spawn_types = list(
	/mob/living/simple_mob/caclien/wild/drone = 20,
	/mob/living/simple_mob/caclien/wild/hunter = 10,
	/mob/living/simple_mob/caclien/wild/sentinel = 10,
	)

/obj/structure/mob_spawner/scanner/caclien/royal
	name = "Royal Xenomorph Egg"
	spawn_delay = 10 MINUTES
	range = 10
	simultaneous_spawns = 1
	total_spawns = 1
	destructible = 1
	health = 50
	anchored = TRUE
	icon = 'icons/mob/actions.dmi'
	icon_state = "alien_egg"
	spawn_types = list(
	/mob/living/simple_mob/caclien/wild/queen = 5,
	)
