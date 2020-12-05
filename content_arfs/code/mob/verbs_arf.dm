/mob/observer/dead/verb/spawn_as_pokemon()
	set category = "Ghost"
	set name = "Join as Pokemon"
	set desc = "Spawn in as a pokemon from one of the resleevers on the map."

	if(!istype(src, /mob/observer/dead))
		return
	if(!LAZYLEN(pokemon_pods))
		to_chat(src, "<span class='warning'>No resleever pods located. Ask a developer to map one in or an admin to place one.</span>")
		return
	var/mob/observer/dead/user = src
	var/sleever_sel = input(user, "Where would you like to spawn?", "Choose Location") as null|anything in pokemon_pods
	if(isnull(sleever_sel))
		to_chat(user, "<span class='notice'>Spawning aborted.</span>")
		return
	var/obj/structure/ghost_pod/ghost_activated/pokemon/sleever = pokemon_pods[sleever_sel]
	sleever.attack_ghost(user)
