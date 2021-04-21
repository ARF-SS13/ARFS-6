//Custom airlocks and airlock code
/obj/machinery/door/airlock/ckey
	desc = "Looks like this airlock has been fitted with a DNA scanner to only allow certain people through."
	var/list/req_one_ckey = list() //If you have a key in this list you can open the door. NO CAPITALIZATION

/obj/machinery/door/airlock/ckey/allowed(mob/M)
	if(locked)
		return 0
	if(!LAZYLEN(req_one_ckey) || !M.ckey)
		return ..(M)//No ckey list or no ckey. Callback
	if(M.ckey in req_one_ckey)
		return 1	//Ckey is in the list, let them pass.
	if(LAZYLEN(req_access) || LAZYLEN(req_one_access))
		return ..(M)//If the door has normal acces requirements, check those too; even if they aren't on the ckey list. Allows for master door keys and the likes.
	return 0		//Otherwise, deny access.


//Access Overwrites
/obj/machinery/door/airlock/command
	req_one_access = list(access_heads, access_blueshield)

/obj/machinery/door/airlock/security
	req_one_access = list(access_security, access_blueshield)

/obj/machinery/door/airlock/engineering
	req_one_access = list(access_engine, access_blueshield)

/obj/machinery/door/airlock/engineeringatmos
	req_one_access = list(access_atmospherics, access_blueshield)

/obj/machinery/door/airlock/medical
	req_one_access = list(access_medical, access_blueshield)

/obj/machinery/door/airlock/maintenance
	//req_one_access = list(access_maint_tunnels, access_blueshield)

/obj/machinery/door/airlock/maintenance/cargo
	req_one_access = list(access_cargo, access_blueshield)

/obj/machinery/door/airlock/maintenance/command
	req_one_access = list(access_heads, access_blueshield)

/obj/machinery/door/airlock/maintenance/engi
	req_one_access = list(access_engine, access_blueshield)

/obj/machinery/door/airlock/maintenance/medical
	req_one_access = list(access_medical, access_blueshield)

/obj/machinery/door/airlock/maintenance/rnd
	req_one_access = list(access_research, access_blueshield)

/obj/machinery/door/airlock/maintenance/sec
	req_one_access = list(access_security, access_blueshield)

/obj/machinery/door/airlock/glass_external
	req_one_access = list(access_external_airlocks, access_blueshield)

/obj/machinery/door/airlock/centcom
	req_one_access = list(access_cent_general, access_blueshield)

/obj/machinery/door/airlock/vault
	req_one_access = list(access_heads_vault, access_blueshield)

/obj/machinery/door/airlock/hatch
	req_one_access = list(access_maint_tunnels, access_blueshield)

/obj/machinery/door/airlock/maintenance_hatch
	req_one_access = list(access_maint_tunnels, access_blueshield)

/obj/machinery/door/airlock/glass_command
	req_one_access = list(access_heads, access_blueshield)

/obj/machinery/door/airlock/glass_engineering
	req_one_access = list(access_engine, access_blueshield)

/obj/machinery/door/airlock/glass_engineeringatmos
	req_one_access = list(access_atmospherics, access_blueshield)

/obj/machinery/door/airlock/glass_security
	req_one_access = list(access_security, access_blueshield)

/obj/machinery/door/airlock/glass_medical
	req_one_access = list(access_medical, access_blueshield)

/obj/machinery/door/airlock/mining
	req_one_access = list(access_mining, access_blueshield)

/obj/machinery/door/airlock/atmos
	req_one_access = list(access_atmospherics, access_blueshield)

/obj/machinery/door/airlock/glass_research
	req_one_access = list(access_research, access_blueshield)

/obj/machinery/door/airlock/glass_mining
	req_one_access = list(access_mining, access_blueshield)

/obj/machinery/door/airlock/glass_atmos
	req_one_access = list(access_atmospherics, access_blueshield)

/obj/machinery/door/airlock/science
	req_one_access = list(access_research, access_blueshield)

/obj/machinery/door/airlock/glass_science
	req_one_access = list(access_research, access_blueshield)

/obj/machinery/door/airlock/highsecurity
	req_one_access = list(access_heads_vault, access_blueshield)

/obj/machinery/door/window/brigdoor
	req_access = list(access_security, access_blueshield)