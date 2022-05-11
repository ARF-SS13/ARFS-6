/obj/machinery/exonet_node/relay
	name = "exonet relay"

/proc/can_telecomm(var/atom/A, var/atom/B, var/ad_hoc = FALSE)
	if(!A || !B)
		log_debug("can_telecomm(): Undefined endpoints!")
		return FALSE

	//Can't in this case, obviously!
	if(is_jammed(A) || is_jammed(B))
		return FALSE

	//Items don't have a Z when inside an object or mob
	var/turf/src_z = get_z(A)
	var/turf/dst_z = get_z(B)

	//Nullspace, probably.
	if(!src_z || !dst_z)
		return FALSE

	//We can do the simple check first, if you have ad_hoc radios.
	if(ad_hoc && src_z == dst_z)
		return TRUE
	
	if(src_z in using_map.get_map_levels(dst_z, TRUE, om_range = DEFAULT_OVERMAP_RANGE))
		return TRUE

	//Check the exonet relays
	for(var/obj/machinery/exonet_node/relay/R in machines)
		if(R && R.on && R.allow_external_communicators && R.z == src_z)
			return TRUE

	return FALSE

/proc/get_exonet_node()
	for(var/obj/machinery/exonet_node/E in machines)
		//Don't grab a relay
		if(E.type == /obj/machinery/exonet_node/relay)
			continue
		if(E.on)
			return E