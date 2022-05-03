/datum/riding/pokemon
	keytype = /obj/item/weapon/material/twohanded/riding_crop
	nonhuman_key_exemption = FALSE
	key_name = "a riding crop"
	only_one_driver = TRUE
/*
/datum/riding/pokemon/handle_vehicle_layer()
	ridden.layer = initial(ridden.layer)
*/
/datum/riding/pokemon/ride_check(mob/living/M)
	var/mob/living/L = ridden
	if(L.stat)
		force_dismount(M)
		return FALSE
	return TRUE

/datum/riding/pokemon/force_dismount(mob/M)
	. =..()
	ridden.visible_message("<span class='notice'>[M] stops riding [ridden]!</span>")

/mob/living/simple_mob/animal/passive/pokemon/buckle_mob(mob/living/M, forced = FALSE, check_loc = TRUE)
	if(forced)
		return ..() // Skip our checks
	if(!(P_TRAIT_RIDEABLE in p_traits))
		return FALSE
	if(lying)
		return FALSE
	if(M in buckled_mobs)
		return FALSE
	if((M.size_multiplier * M.mob_size) > ((size_multiplier * mob_size) * 1.4))//Account for mob size
		to_chat(src, "<span class='warning'>This isn't a pony show! You need to be bigger for them to ride.</span>")
		return FALSE
	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		if(istaurtail(H.tail_style))
			to_chat(src, "<span class='warning'>Too many legs. TOO MANY LEGS!!</span>")
			return FALSE

	if(M.loc != src.loc)
		if(M.Adjacent(src))
			M.forceMove(get_turf(src))

	. = ..()
	if(.)
		riding_datum.rider_size = M.size_multiplier
		buckled_mobs[M] = "riding"

/mob/living/simple_mob/animal/passive/pokemon/proc/riding_mount(var/mob/living/M in living_mobs(1))
	set name = "Mount/Dismount"
	set category = "Abilities"
	set desc = "Let people ride on you."

	if(LAZYLEN(buckled_mobs))
		var/datum/riding/R = riding_datum
		for(var/rider in buckled_mobs)
			R.force_dismount(rider)
		return
	if (stat != CONSCIOUS)
		return
	if(!can_buckle || !istype(M) || !M.Adjacent(src) || M.buckled)
		return
	if(buckle_mob(M))
		visible_message("<span class='notice'>[M] starts riding [name]!</span>")
