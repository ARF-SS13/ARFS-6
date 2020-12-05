/obj/item/weapon/storage/wallet/residential
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
		)

/obj/item/weapon/card/id/residential
	name = "generic residential key"
	desc = "A keyring with a small steel key, and a blue fob."
	icon = 'icons/obj/vehicles.dmi'
	icon_state = "quad_keys"

/obj/item/weapon/card/id/residential/rs1
	name = "RS1 residential key"
	access = list(8001)

/obj/item/weapon/card/id/residential/rs2
	name = "RS2 residential key"
	access = list(8002)

/obj/item/weapon/card/id/residential/rs3
	name = "RS3 residential key"
	access = list(8003)

/obj/item/weapon/card/id/residential/rs4
	name = "RS4 residential key"
	access = list(8004)

/obj/item/weapon/card/id/residential/rs5
	name = "RS5 residential key"
	access = list(8005)

/obj/item/weapon/card/id/residential/rs6
	name = "RS6 residential key"
	access = list(8006)

/obj/item/weapon/card/id/residential/rs7
	name = "RS7 residential key"
	access = list(8007)

/obj/item/weapon/card/id/residential/rs8
	name = "RS8 residential key"
	access = list(8008)

/obj/item/weapon/card/id/residential/rs9
	name = "RS9 residential key"
	access = list(8009)

/obj/item/weapon/card/id/residential/rs10
	name = "RS10 residential key"
	access = list(8010)

/obj/item/weapon/card/id/residential/rs11
	name = "RS11 residential key"
	access = list(8011)

/obj/item/weapon/card/id/residential/rs12
	name = "RS12 residential key"
	access = list(8012)

/obj/item/weapon/card/id/residential/rs13
	name = "RS13 residential key"
	access = list(8013)

/obj/item/weapon/card/id/residential/rs14
	name = "RS14 residential key"
	access = list(8014)

/obj/item/weapon/card/id/residential/rm1
	name = "RM1 residential key"
	access = list(8101)

/obj/item/weapon/card/id/residential/rm2
	name = "RM2 residential key"
	access = list(8102)

/obj/item/weapon/card/id/residential/rm3
	name = "RM3 residential key"
	access = list(8103)

/obj/item/weapon/card/id/residential/rm4
	name = "RM4 residential key"
	access = list(8104)

/obj/item/weapon/card/id/residential/rm5
	name = "RM5 residential key"
	access = list(8105)

/obj/item/weapon/card/id/residential/rm6
	name = "RM6 residential key"
	access = list(8106)

/obj/item/weapon/card/id/residential/rm7
	name = "RM7 residential key"
	access = list(8107)

/obj/item/weapon/card/id/residential/rm8
	name = "RM8 residential key"
	access = list(8108)

/obj/item/weapon/card/id/residential/rm9
	name = "RM9 residential key"
	access = list(8109)

/obj/item/weapon/card/id/residential/rm10
	name = "RM10 residential key"
	access = list(8110)

/obj/item/weapon/card/id/residential/rm11
	name = "RM11 residential key"
	access = list(8111)

/obj/item/weapon/card/id/residential/mansion
	name = "Mansion residential key"
	access = list(8100)

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

// MEDIUM KEYS

/datum/gear/fluff/res_key_rm1
	path = /obj/item/weapon/card/id/residential/rm1
	display_name = "RM1 keys"
	description = "residential"
	ckeywhitelist = list("thingpony", "siorkillbow", "cebutris", "dameonowen")
	character_name = list("Iris Miller", "Elizabeth Nayala", "Hepsie Mull", "Amber Owen")

/datum/gear/fluff/res_key_rm2
	path = /obj/item/weapon/card/id/residential/rm2
	display_name = "RM2 keys"
	description = "residential"
	ckeywhitelist = list("cebutris", "gremlingss", "disguiser", "siorkillbow")
	character_name = list("Elizabeth Nayala", "Abby Gliese", "Rak Woodrow", "Hoi Blackburn", "Hepsie Mull")

/datum/gear/fluff/res_key_rm3
	path = /obj/item/weapon/card/id/residential/rm3
	display_name = "RM3 keys"
	description = "residential"
	ckeywhitelist = list("aruis")
	character_name = list("Chance", "Sloan Lokhartt")

/datum/gear/fluff/res_key_rm4
	path = /obj/item/weapon/card/id/residential/rm4
	display_name = "RM4 keys"
	description = "residential"
	ckeywhitelist = list("igni")
	character_name = list("Sheila Frost", "Jake Frost")

/datum/gear/fluff/res_key_rm5
	path = /obj/item/weapon/card/id/residential/rm5
	display_name = "RM5 keys"
	description = "residential"
	ckeywhitelist = list("theamazingdaito", "thingpony")
	character_name = list("Madalyn Rose", "Kitsuno Harume", "Dawn Rani")

/datum/gear/fluff/res_key_rm6
	path = /obj/item/weapon/card/id/residential/rm6
	display_name = "RM6 keys"
	description = "residential"
	ckeywhitelist = list("disguiser")
	character_name = list("Rak Woodrow")

/datum/gear/fluff/res_key_rm9
	path = /obj/item/weapon/card/id/residential/rm9
	display_name = "RM9 keys"
	description = "residential"
	ckeywhitelist = list("killbow")
	character_name = list("Hepsie Mull")

/datum/gear/fluff/res_key_rm10
	path = /obj/item/weapon/card/id/residential/rm10
	display_name = "RM10 keys"
	description = "residential"
	ckeywhitelist = list("tk420634")
	character_name = list("Sugar Song")

/datum/gear/fluff/res_key_rm11
	path = /obj/item/weapon/card/id/residential/rm11
	display_name = "RM11 keys"
	description = "residential"
	ckeywhitelist = list("thingpony", "cebutris", "liujr", "truedark")
	character_name = list("Tye Riggle", "Kaibus Wordsmith", "Lywarra Lichtut", "Yalnisho Rhirrie")

// SMALL KEYS

/datum/gear/fluff/res_key_rs1
	path = /obj/item/weapon/card/id/residential/rs1
	display_name = "RS1 keys"
	description = "residential"
	ckeywhitelist = list("eeveerocks1000")
	character_name = list("Summer")

/datum/gear/fluff/res_key_rs2
	path = /obj/item/weapon/card/id/residential/rs2
	display_name = "RS2 keys"
	description = "residential"
	ckeywhitelist = list("killbow")
	character_name = list("Hoi Blackburn")

/datum/gear/fluff/res_key_rs5
	path = /obj/item/weapon/card/id/residential/rs5
	display_name = "RS5 keys"
	description = "residential"
	ckeywhitelist = list("semilargeman")
	character_name = list("Joseph Reed", "Connor Lan")

/datum/gear/fluff/res_key_rs7
	path = /obj/item/weapon/card/id/residential/rs7
	display_name = "RS7 keys"
	description = "residential"
	ckeywhitelist = list("gremlingss", "truedark")
	character_name = list("Kyle Seeger", "Ssavethas")

/datum/gear/fluff/res_key_rs8
	path = /obj/item/weapon/card/id/residential/rs8
	display_name = "RS8 keys"
	description = "residential"
	ckeywhitelist = list("gozulio")
	character_name = list("Eira Glitterpaws", "Jessie Glitterpaws")

/datum/gear/fluff/res_key_rs9
	path = /obj/item/weapon/card/id/residential/rs9
	display_name = "RS9 keys"
	description = "residential"
	ckeywhitelist = list("0hobojesus")
	character_name = list("Raigearra GerrTaLa")

/datum/gear/fluff/res_key_rs10
	path = /obj/item/weapon/card/id/residential/rs10
	display_name = "RS10 keys"
	description = "residential"
	ckeywhitelist = list("brimcon", "thingpony", "theilluminated1")
	character_name = list("Scryden Sako", "Fleur Vert", "Ni'mira Allura")

/datum/gear/fluff/res_key_rs11
	path = /obj/item/weapon/card/id/residential/rs11
	display_name = "RS11 keys"
	description = "residential"
	ckeywhitelist = list("rouwren")
	character_name = list("Rin Deimos")

/datum/gear/fluff/res_key_rs13
	path = /obj/item/weapon/card/id/residential/rs13
	display_name = "RS13 keys"
	description = "residential"
	ckeywhitelist = list("secondattemps")
	character_name = list("Alexandria Marlow")


//Mansion

/datum/gear/fluff/res_key_mansion
	path = /obj/item/weapon/card/id/residential/mansion
	display_name = "Mansion keys"
	description = "residential"
	ckeywhitelist = list("andyman105", "dameonowen", "secondattemps", "thingpony", "hagawaga")
	character_name = list("Dameon Owen", "Amber Owen", "Jake Owen", "Lilith Owen", "Iris Miller", "Brian Owen", "Percy Owen", "Ruby Flare", "Zephyr Sharpe", "Peter Sharpe", "Eve", "Ashlyn", "Agalon", "Lana Xavier")

/datum/gear/fluff/res_key_wallet
	path = /obj/item/weapon/storage/wallet/residential
	display_name = "KEEEEEYS"
	description = "residential"
	ckeywhitelist = list("lukevale")
	character_name = list("Luna")
