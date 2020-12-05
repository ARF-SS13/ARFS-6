/datum/vore_preferences
	//Actual preferences
	digestable = TRUE
	allowmobvore = FALSE
	list/belly_prefs = list()
	vore_taste = "nothing in particular"
	can_be_drop_prey = FALSE
	can_be_drop_pred = FALSE

	//Mechanically required
	path
	slot
	client/client
	client_ckey

/datum/vore_preferences/load_vore()
	if(!client || !client_ckey)
		return 0 //No client, how can we save?
	if(!client.prefs || !client.prefs.default_slot)
		return 0 //Need to know what character to load!

	slot = client.prefs.default_slot
	
	load_path(client_ckey,slot)
	
	if(!path) return 0 //Path couldn't be set?
	if(!fexists(path)) //Never saved before
		save_vore() //Make the file first
		return 1

	var/list/json_from_file = json_decode(file2text(path))
	if(!json_from_file)
		return 0 //My concern grows

	var/version = json_from_file["version"]
	json_from_file = patch_version(json_from_file,version)

	digestable = json_from_file["digestable"]
	allowmobvore = json_from_file["allowmobvore"]
	vore_taste = json_from_file["vore_taste"]
	can_be_drop_prey = json_from_file["can_be_drop_prey"]
	can_be_drop_pred = json_from_file["can_be_drop_pred"]
	belly_prefs = json_from_file["belly_prefs"]

	//Quick sanitize
	if(isnull(digestable))
		digestable = TRUE
	if(isnull(allowmobvore))
		allowmobvore = FALSE
	if(isnull(can_be_drop_prey))
		allowmobvore = FALSE
	if(isnull(can_be_drop_pred))
		allowmobvore = FALSE
	if(isnull(belly_prefs))
		belly_prefs = list()

	return 1