/*/obj/item/weapon/storage/wallet/residential
	desc = "It can hold a few small and personal things. This has more slots to accomadate keys."
	storage_slots = 30
	starts_with = list(
		/obj/item/weapon/card/id/residential/rs1,
		/obj/item/weapon/card/id/residential/rs2,
		/obj/item/weapon/card/id/residential/rs3,
		/obj/item/weapon/card/id/residential/rs4,
		/obj/item/weapon/card/id/residential/rs5,
		/obj/item/weapon/card/id/residential/rs6,
		/obj/item/weapon/card/id/residential/rs7,
		/obj/item/weapon/card/id/residential/rs8,
		/obj/item/weapon/card/id/residential/rs9,
		/obj/item/weapon/card/id/residential/rs10,
		/obj/item/weapon/card/id/residential/rs11,
		/obj/item/weapon/card/id/residential/rs12,
		/obj/item/weapon/card/id/residential/rs13,
		/obj/item/weapon/card/id/residential/rs14,
		/obj/item/weapon/card/id/residential/rm1,
		/obj/item/weapon/card/id/residential/rm2,
		/obj/item/weapon/card/id/residential/rm3,
		/obj/item/weapon/card/id/residential/rm4,
		/obj/item/weapon/card/id/residential/rm5,
		/obj/item/weapon/card/id/residential/rm6,
		/obj/item/weapon/card/id/residential/rm7,
		/obj/item/weapon/card/id/residential/rm8,
		/obj/item/weapon/card/id/residential/rm9,
		/obj/item/weapon/card/id/residential/rm10,
		/obj/item/weapon/card/id/residential/mansion,
		/obj/item/weapon/card/id/residential/rm11,
		/obj/item/weapon/card/id/residential/rm12
		)
*/
/obj/item/weapon/card/id/residential
	name = "generic residential key"
	desc = "A keyring with a small steel key, and a blue fob."
	icon = 'icons/obj/vehicles.dmi'
	base_icon = 'icons/obj/vehicles.dmi'
	icon_state = "quad_keys"

// Small apartments
/obj/item/weapon/card/id/residential/rs1
	name = "RS1, level two residential key"
	access = list(8001)

/obj/item/weapon/card/id/residential/rs2
	name = "RS2, level two residential key"
	access = list(8002)

/obj/item/weapon/card/id/residential/rs3
	name = "RS3, level two residential key"
	access = list(8003)

/obj/item/weapon/card/id/residential/rs4
	name = "RS4, level two residential key"
	access = list(8004)

/obj/item/weapon/card/id/residential/rs5
	name = "RS5, level two residential key"
	access = list(8005)

/obj/item/weapon/card/id/residential/rs6
	name = "RS6, level two residential key"
	access = list(8006)

/obj/item/weapon/card/id/residential/rs7
	name = "RS7, level two residential key"
	access = list(8007)

/obj/item/weapon/card/id/residential/rs8
	name = "RS8, level two residential key"
	access = list(8008)

/obj/item/weapon/card/id/residential/rs9
	name = "RS9, level two residential key"
	access = list(8009)

/obj/item/weapon/card/id/residential/rs10
	name = "RS10, level two residential key"
	access = list(8010)

/obj/item/weapon/card/id/residential/rs11
	name = "RS11, level two residential key"
	access = list(8011)

/obj/item/weapon/card/id/residential/rs12
	name = "RS12, level two residential key"
	access = list(8012)

/obj/item/weapon/card/id/residential/rs13
	name = "RS13, level two residential key"
	access = list(8013)

/obj/item/weapon/card/id/residential/rs14
	name = "RS14, level two residential key"
	access = list(8014)

/obj/item/weapon/card/id/residential/rs15
	name = "RS15, level two residential key"
	access = list(8015)

/obj/item/weapon/card/id/residential/rs16
	name = "RS16, level two residential key"
	access = list(8016)

// Small apartment fluff spawns
/datum/gear/fluff/res_key_rs1
	path = /obj/item/weapon/card/id/residential/rs1
	display_name = "RS1, Level two keys"
	description = "residential"
	ckeywhitelist = list("eeveerocks1000")
	character_name = list("Summer")

/datum/gear/fluff/res_key_rs2
	path = /obj/item/weapon/card/id/residential/rs2
	display_name = "RS2, level two keys"
	description = "residential"
	ckeywhitelist = list("kbraid")
	character_name = list("Eili")

/datum/gear/fluff/res_key_rs3
	path = /obj/item/weapon/card/id/residential/rs3
	display_name = "RS3,level two keys"
	description = "residential"
	ckeywhitelist = list("killbow")
	character_name = list("Hoi Blackburn")

// rs4 has a ckey door, no key needed. Belongs to Lucy.

/datum/gear/fluff/res_key_rs5
	path = /obj/item/weapon/card/id/residential/rs5
	display_name = "RS5, level two keys"
	description = "residential"
	ckeywhitelist = list("semilargeman")
	character_name = list("Joseph Reed", "Connor Lan")

/datum/gear/fluff/res_key_rs6
	path = /obj/item/weapon/card/id/residential/rs6
	display_name = "RS6, level two keys"
	description = "residential"
	ckeywhitelist = list("gozulio")
	character_name = list("Eira Glitterpaws", "Jessie Glitterpaws")

/datum/gear/fluff/res_key_rs7
	path = /obj/item/weapon/card/id/residential/rs7
	display_name = "RS7, level two keys"
	description = "residential"
	ckeywhitelist = list("gremlingss", "truedark")
	character_name = list("Kyle Seeger", "Ssavethas")

/datum/gear/fluff/res_key_rs8
	path = /obj/item/weapon/card/id/residential/rs8
	display_name = "RS8, level two keys"
	description = "residential"
	ckeywhitelist = list("0hobojesus")
	character_name = list("Raigearra GerrTaLa")

//rs9 has a ckey door, no key needed. Belongs to Fetcher.

/datum/gear/fluff/res_key_rs10
	path = /obj/item/weapon/card/id/residential/rs10
	display_name = "RS11, level two keys"
	description = "residential"
	ckeywhitelist = list("rouwren")
	character_name = list("Rin Deimos")

//rs11 has a ckey door, no key needed. Belongs to ARES

/datum/gear/fluff/res_key_rs12
	path = /obj/item/weapon/card/id/residential/rs12
	display_name = "RS12, level two keys"
	description  = "residential"
	ckeywhitelist = list("thingpony", "theilluminated1")
	character_name = list ("Noel Winters", "ARES V3 Mk2", "ARES V3 Mk3")

/datum/gear/fluff/res_key_rs13
	path = /obj/item/weapon/card/id/residential/rs13
	display_name = "RS13, level two keys"
	description = "residential"
	ckeywhitelist = list("thingpony", "truedark")
	character_name = list ("River Mae", "Mimi")

// Medium Keys
/obj/item/weapon/card/id/residential/rm1
	name = "RM1, level three residential key"
	access = list(8101)

/obj/item/weapon/card/id/residential/rm2
	name = "RM2, level three residential key"
	access = list(8102)

/obj/item/weapon/card/id/residential/rm3
	name = "RM3, level three residential key"
	access = list(8103)

/obj/item/weapon/card/id/residential/rm4
	name = "RM4, level three residential key"
	access = list(8104)

/obj/item/weapon/card/id/residential/rm5
	name = "RM5, level three residential key"
	access = list(8105)

/obj/item/weapon/card/id/residential/rm6
	name = "RM6, level three residential key"
	access = list(8106)

/obj/item/weapon/card/id/residential/rm7
	name = "RM7, level three residential key"
	access = list(8107)

/obj/item/weapon/card/id/residential/rm8
	name = "RM8, level three residential key"
	access = list(8108)

/obj/item/weapon/card/id/residential/rm9
	name = "RM9, level three residential key"
	access = list(8109)

/obj/item/weapon/card/id/residential/rm10
	name = "RM10, level three residential key"
	access = list(8110)

/obj/item/weapon/card/id/residential/rm11
	name = "RM11, level three residential key"
	access = list(8111)

/obj/item/weapon/card/id/residential/rm12
	name = "RM12, level three residential Key"
	access = list(8112)

/obj/item/weapon/card/id/residential/rm13
	name = "RM13, level three residential Key"
	access = list(8113)

/obj/item/weapon/card/id/residential/rm14
	name = "RM14, level three residential key"
	access = list(8114)

/obj/item/weapon/card/id/residential/rm15
	name = "RM15, level three residential key"
	access = list(8115)

/obj/item/weapon/card/id/residential/rm16
	name = "RM16, level three residential key"
	access = list(8116)

//medium key fluff spawn
/datum/gear/fluff/res_key_rm1
	path = /obj/item/weapon/card/id/residential/rm1
	display_name = "RM1, level three keys"
	description = "residential"
	ckeywhitelist = list("aruis")
	character_name = list("Chance", "Sloan Lokhartt")

//rm2 has a ckey door, owner Cactus

/datum/gear/fluff/res_key_rm3
	path = /obj/item/weapon/card/id/residential/rm3
	display_name = "RM3, level three keys"
	description = "residential"
	ckeywhitelist = list("tk420634")
	character_name = list("Sugar Song")

/datum/gear/fluff/res_key_rm4
	path = /obj/item/weapon/card/id/residential/rm4
	display_name = "RM4, level three keys"
	description = "residential"
	ckeywhitelist = list("phantomwolfzero","disguiser", "thingpony")
	character_name = list("Kobalt Frevath", "Rak Woodrow","Tak Flourin", "Dottie Frevath")

/datum/gear/fluff/res_key_rm5
	path = /obj/item/weapon/card/id/residential/rm5
	display_name = "RM5, level three keys"
	description = "residential"
	ckeywhitelist = list("killbow")
	character_name = list("Hepsie Mull")

/datum/gear/fluff/res_key_rm6
	path = /obj/item/weapon/card/id/residential/rm6
	display_name = "RM6, level three keys"
	description = "residential"
	ckeywhitelist = list("mrkaktuspl")
	character_name = list("Alexandra Bowie")

/datum/gear/fluff/res_key_rm7
	path = /obj/item/weapon/card/id/residential/rm7
	display_name = "RM7, level three keys"
	description = "residential"
	ckeywhitelist = list("thingpony", "cebutris", "liujr", "truedark")
	character_name = list("Tye Riggle", "Kaibus Wordsmith", "Lywarra Lichtut", "Yalnisho Rhirrie")

/datum/gear/fluff/res_key_rm8
	path = /obj/item/weapon/card/id/residential/rm8
	display_name = "RM8, level three keys"
	description = "residential"
	ckeywhitelist = list("secondattemps")
	character_name = list("Alexandria Marlow")

/datum/gear/fluff/res_key_rm9
	path = /obj/item/weapon/card/id/residential/rm9
	display_name = "RM9, level three keys"
	description = "residential"
	ckeywhitelist = list("theamazingdaito", "thingpony")
	character_name = list("Madalyn Rose", "Kitsuno Harume", "Dawn Rani",  "Melanie Fawyer")

/datum/gear/fluff/res_key_rm10
	path = /obj/item/weapon/card/id/residential/rm10
	display_name = "RM10, level three keys"
	description = "residential"
	ckeywhitelist = list("igni")
	character_name = list("Sheila Frost", "Jake Frost")

/datum/gear/fluff/res_key_rm11
	path = /obj/item/weapon/card/id/residential/rm11
	display_name = "RM11, level three keys"
	description = "residential"
	ckeywhitelist = list("yeayea130", "runswitshadows", "broddichris")
	character_name = list("Othello", "Cu-11-3y", "Keziah Hunter")

/datum/gear/fluff/res_key_rm12
	path = /obj/item/weapon/card/id/residential/rm12
	display_name = "RM12, level three keys"
	description = "residential"
	ckeywhitelist = list("talkingcactus")
	character_name = list("Nicole Cherry")

/datum/gear/fluff/res_key_rm13
	path = /obj/item/weapon/card/id/residential/rm13
	display_name = "RM13, level three keys"
	ckeywhitelist = list("disguiser")
	character_name = list("Rak Woodrow")

/datum/gear/fluff/res_key_rm14
	path = /obj/item/weapon/card/id/residential/rm14
	display_name = "RM14, level three keys"
	ckeywhitelist = list("thingpony", "brimcon", "truedark", "nayriin")
	character_name = list("Nayelli Webb", "Zeke Webb", "Scryden Sako")

/datum/gear/fluff/res_key_rm15
	path = /obj/item/weapon/card/id/residential/rm15
	display_name = "RM15, level three keys"
	ckeywhitelist = list("thingpony", "theamazingdaito")
	character_name = list("Nuri", "Haruka Kusanagi")

/datum/gear/fluff/res_key_rm16
	path = /obj/item/weapon/card/id/residential/rm16
	display_name = "RM16, level three keys"
	ckeywhitelist = list("1ceres", "liujr")
	character_name = list("Garnet Steele", "Bismuth Steele")

/obj/item/weapon/card/id/residential/rm42/laria
	name = "Laria's Key"
	desc = "A special keycard for residentals RM42 Laria Darlos is written on it."
	base_icon = 'icons/obj/card_vr.dmi'
	icon_state = "itg_purple"
	access = list(8142)
	registered_name = "Laria Darlos"
	age = "35"
	blood_type = "0-"
	gender = "plural"

/obj/item/weapon/card/id/residential/rm42/cylus
	name = "Cylus's Key"
	desc = "A special keycard for residentals RM42 Cylus Typhon is written on it."
	registered_name = "Cylus Typhon"
	age = "32"
	blood_type = "AB+"
	access = list(8142)
	base_icon = 'icons/obj/card_vr.dmi'
	icon_state = "itg_white"
	gender = "male"

/datum/gear/fluff/res_key_rm42/laria
	path = /obj/item/weapon/card/id/residential/rm42/laria
	display_name = "RM42 keycard (Laria Darlos)"
	description = "A special keycard for residential Room M42"
	ckeywhitelist = list("laria")
	character_name = list("Laria Darlos")

/datum/gear/fluff/res_key_rm42/cylus
	path = /obj/item/weapon/card/id/residential/rm42/cylus
	display_name = "RM42 keycard (Cylus Typhon)"
	description = "A special keycard for residential Room M42"
	ckeywhitelist = list("tinncatt")
	character_name = list("Cylus Typhon")

/obj/item/weapon/card/id/residential/mansion
	name = "Mansion residential key"
	access = list(8100)

//Residential Level Four

/obj/item/weapon/card/id/residential/rb2
	name = "Residential Level Four - Room 2 Residential Key"
/obj/item/weapon/card/id/residential/rb3
	name = "Residential Level Four - Room 3 residential key"
	access = list(1103)

/obj/item/weapon/card/id/residential/rb4
	name = "Residential Level Four - Room 4 residential key"
	access = list(1104)

//-SHIPS-

/obj/item/weapon/card/id/residential/s1
	name = "S1 residential key"
	access = list(8201)

/obj/item/weapon/card/id/residential/s2
	name = "S2 residential key"
	access = list(8202)

/obj/item/weapon/card/id/residential/s3
	name = "S3 residential key"
	access = list(8203)

/obj/item/weapon/card/id/residential/s4
	name = "S4 residential key"
	access = list(8204)

/obj/item/weapon/card/id/residential/s5
	name = "S5 residential key"
	access = list(8205)

/obj/item/weapon/card/id/residential/s6
	name = "S6 residential key"
	access = list(8206)

/obj/item/weapon/card/id/residential/s7
	name = "S7 residential key"
	access = list(8207)

/obj/item/weapon/card/id/residential/s8
	name = "S8 residential key"
	access = list(8208)

/obj/item/weapon/card/id/residential/s9
	name = "S9 residential key"
	access = list(8208)

//FLUFF SPAWNS

/datum/gear/fluff/res_key_s1
	path = /obj/item/weapon/card/id/residential/s1
	display_name = "S1 keys"
	description = "residential"
	ckeywhitelist = list("joezill")
	character_name = list("Ciri Vulture")

/datum/gear/fluff/res_key_s5
	path = /obj/item/weapon/card/id/residential/s5
	display_name = "S5 keys"
	description = "residential"
	ckeywhitelist = list("truedark")
	character_name = list("Squawks")

/datum/gear/fluff/res_key_s7
	path = /obj/item/weapon/card/id/residential/s7
	display_name = "S7 keys"
	description = "residential"
	ckeywhitelist = list("truedark")
	character_name = list("Vakshhas")

/datum/gear/fluff/res_key_s8
	path = /obj/item/weapon/card/id/residential/s8
	display_name = "S8 keys"
	description = "residential"
	ckeywhitelist = list("cebutris", "technicalmagi", "fludd12", "thingpony")
	character_name = list("Kaibus Wordsmith", "Nia Wordsmith", "Naomi Reids", "Tye Riggle")

/datum/gear/fluff/res_key_s9
	path = /obj/item/weapon/card/id/residential/s9
	display_name = "S9 keys"
	description = "residential"
	ckeywhitelist = list("thingpony")
	character_name = list("Haven Faye")

/obj/item/weapon/card/id/residential/rb1
	name = "Residential Level Four - Room 1 Residential Key"
	access = list(1201)

/obj/item/weapon/card/id/residential/rb2
	name = "Residential Level Four - Room 2 Residential Key"
	access = list(1202)

/obj/item/weapon/card/id/residential/rb3
	name = "Residential Level Four - Room 3 residential key"
	access = list(1203)

/obj/item/weapon/card/id/residential/rb4
	name = "Residential Level Four - Room 4 residential key"
	access = list(1204)


//Residential Level Four Fluff Spawns

/datum/gear/fluff/res_key_rb1
	path = /obj/item/weapon/card/id/residential/rb1
	display_name = "Res level four, room one keys"
	description = "residential"
	ckeywhitelist = list("cebutris", "gremlingss", "disguiser", "siorkillbow", "lukevale", "thingpony")
	character_name = list("Elizabeth Nayala", "Abby Gliese", "Rak Woodrow", "Hoi Blackburn", "Hepsie Mull", "Luna", "Iris Miller")

/datum/gear/fluff/res_key_rb2
	path = /obj/item/weapon/card/id/residential/rb2
	display_name = "res level four, room two keys"
	description = "residential"
	ckeywhitelist = list("thingpony", "siorkillbow", "cebutris", "dameonowen", "brimcon", "foxyrose", "lukevale", "andyman105", "dwagin")
	character_name = list("Iris Miller", "Elizabeth Nayala", "Hepsie Mull", "Amber Owen", "Amber", "Scryden Sako", "Emma Miller", "Aiden Miller", "Scarlet Owen", "Luna", "Dameon Owen", "Jake Owen")

/datum/gear/fluff/res_key_rb3
	path = /obj/item/weapon/card/id/residential/rb3
	display_name = "res level four, room three keys"
	description = "residential"
	ckeywhitelist = list("brimcon", "thingpony")
	character_name = list("Scryden Sako", "Fleur Sako")


/datum/gear/fluff/res_key_rb4
	path = /obj/item/weapon/card/id/residential/rb4
	display_name = "Res level four, room four keys"
	description = "residential"
	ckeywhitelist = list("thingpony","brimcon","truedark")
	character_name = list("Willow Snow", "Scryden Sako", "Sheyss Brauror")

//Mansion

/datum/gear/fluff/res_key_mansion
	path = /obj/item/weapon/card/id/residential/mansion
	display_name = "Mansion keys"
	description = "residential"
	ckeywhitelist = list("andyman105", "dameonowen", "secondattemps", "thingpony", "hagawaga","brimcon", "lukevale", "foxyrose", "dwagin")
	character_name = list("Dameon Owen", "Amber Owen", "Amber", "Jake Owen", "Lilith Owen", "Iris Miller", "Brian Owen", "Percy Owen", "Ruby Flare", "Zephyr Sharpe", "Peter Sharpe", "Eve", "Ashlyn", "Agalon", "Lana Xavier", "Scryden Sako", "Scarlet Owen", "Luna","Emma Miller", "Aiden Miller")

//Master Key. Why wasn't this made before? So much easier!

/obj/item/weapon/card/id/residential/master_key
	name = "Master Residential Key"
	base_icon = 'content_arfs/icons/obj/misc.dmi'
	icon_state = "master_key"
	access = list(8001, 8002, 8003, 8004, 8005, 8006, 8007, 8008, 8009, 8010, 8011, 8012, 8013, 8014, 8015, 8016, 8101, 8102, 8103, 8104, 8105, 8106, 8107, 8108, 8109, 8110, 8111, 8112, 8113, 8142, 8100, 8201, 8202, 8203, 8204, 8206, 8207, 8208)

/obj/item/weapon/storage/wallet/residential
	desc = "It can hold a few small and personal things. This has more slots to accomadate keys."
	storage_slots = 30
	starts_with = list(/obj/item/weapon/card/id/residential/master_key)

/datum/gear/fluff/res_key_wallet
	path = /obj/item/weapon/storage/wallet/residential
	display_name = "KEEEEEYS"
	description = "residential"
	ckeywhitelist = list("thingpony")
	character_name = list("Iris Miller")
