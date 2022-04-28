//some items are commented out because they aren't ported.
//also broke up the two items per line to make it read a bit easier. - Gozulio
/obj/machinery/vending/kink
	name = "KinkMate"
	desc = "A vending machine for all your unmentionable desires."
	icon_state = "lewd"
	icon = 'content_arfs/icons/obj/vending.dmi'
	product_slogans = "Kinky!;Sexy!;Check me out, big boy!"
	vend_delay = 15
	vend_reply = "Have fun, you shameless pervert!"
	products = list(
		/obj/item/clothing/under/schoolgirl=3,
		/obj/item/clothing/ears/earmuffs=2,
		/obj/item/clothing/glasses/sunglasses/blindfold=2,
		/obj/item/clothing/mask/muzzle=2,
		/obj/item/weapon/sextoy/dildo/canine=4,
		/obj/item/weapon/sextoy/dildo/seadragon=4,
		/obj/item/weapon/sextoy/dildo/equine=4,
		/obj/item/weapon/sextoy/dildo/purpledong=4,
		/obj/item/weapon/sextoy/dildo/bigblackdick=4,
		/obj/item/weapon/sextoy/dildo/floppydick=4,
		/obj/item/weapon/sextoy/dildo/bulletvibe=4,
		/obj/item/weapon/sextoy/dildo/fleshlight=2,
		/obj/item/weapon/sextoy/dildo/analbeads=2,
		/obj/item/clothing/suit/stripper/stripper_pink/arf=4,
		/obj/item/clothing/suit/stripper/stripper_green/arf=4,
		/obj/item/weapon/gun/energy/sizegun=5,
		/obj/item/weapon/leash=10,
//		/obj/item/clothing/under/birthdaysuit=5,
//		/obj/item/clothing/under/nuditypermit=5,
//		/obj/item/clothing/suit/strapon = 5,
//		/obj/item/clothing/suit/strapon/equine=5,
		/obj/item/weapon/sextoy/dildo/chemicalkit=5 )
//	prices = list(/obj/item/clothing/under/nuditypermit=500)  Cactus please why u do dis  ~TK

//Commented out because none of this vendors contents are ported yet.
//i also think vore has a toy vendor with plushes in it. - Gozulio

/obj/machinery/vending/toy/thingpony
	name = "Toy Vendor"
	desc = "A cute teddy bear! It can give you toys!"
	product_ads = "Action figures!"
	icon_state = "toy"
	icon = 'content_arfs/icons/obj/vending.dmi'
	vend_reply = "Get to donk-ing!"
	products = list(/obj/item/toy/plushie/bubblegum=3, /obj/item/toy/plushie/plushvar=3,
/obj/item/toy/plushie/narplush=3, /obj/item/toy/plushie/snakeplush=3,
/obj/item/toy/plushie/securityk9=3, /obj/item/toy/plushie/drake=3,
/obj/item/toy/plushie/chibifox=3,/obj/item/toy/plushie/lamp=3,
/obj/item/toy/plushie/medihound=3, /obj/item/toy/plushie/scubpuppy=3,
/obj/item/toy/plushie/slaggy=3,/obj/item/toy/plushie/bucketplush=3,
/obj/item/toy/plushie/scanner=3,/obj/item/toy/plushie/fermis=3,
/obj/item/toy/plushie/nymph=3,
/obj/item/toy/plushie/teshari=3,
/obj/item/toy/plushie/mouse=3,
/obj/item/toy/plushie/kitten=3,
/obj/item/toy/plushie/lizard=3,
/obj/item/toy/plushie/spider=3,
/obj/item/toy/plushie/farwa=3,
/obj/item/toy/plushie/corgi=3,
/obj/item/toy/plushie/girly_corgi=3,
/obj/item/toy/plushie/robo_corgi=3,
/obj/item/toy/plushie/octopus=3,
/obj/item/toy/plushie/face_hugger=3,
/obj/item/toy/plushie/red_fox=3,
/obj/item/toy/plushie/black_fox=3,
/obj/item/toy/plushie/marble_fox=3,
/obj/item/toy/plushie/blue_fox=3,
/obj/item/toy/plushie/orange_fox=3,
/obj/item/toy/plushie/coffee_fox=3,
/obj/item/toy/plushie/pink_fox=3,
/obj/item/toy/plushie/purple_fox=3,
/obj/item/toy/plushie/crimson_fox=3,
/obj/item/toy/plushie/deer=3,
/obj/item/toy/plushie/black_cat=3,
/obj/item/toy/plushie/grey_cat=3,
/obj/item/toy/plushie/white_cat=3,
/obj/item/toy/plushie/orange_cat=3,
/obj/item/toy/plushie/siamese_cat=3,
/obj/item/toy/plushie/tabby_cat=3,
/obj/item/toy/plushie/tuxedo_cat=3,
/obj/item/toy/plushie/squid/green=3,
/obj/item/toy/plushie/squid/mint=3,
/obj/item/toy/plushie/squid/blue=3,
/obj/item/toy/plushie/squid/orange=3,
/obj/item/toy/plushie/squid/yellow=3,
/obj/item/toy/plushie/squid/pink=3,
/obj/item/toy/plushie/therapy/red=3,
/obj/item/toy/plushie/therapy/purple=3,
/obj/item/toy/plushie/therapy/blue=3,
/obj/item/toy/plushie/therapy/yellow=3,
/obj/item/toy/plushie/therapy/orange=3,
/obj/item/toy/plushie/therapy/green=3,
/obj/item/toy/stickhorse
)

/*
/obj/machinery/vending/arfsnifsoft
	name = "NIFsoft"
	desc = "Apparently, it's a knock-off of some other corporation's vendor and product-line."
	icon_state = "proj"
	icon = 'icons/obj/machines/ar_elements.dmi'
	product_slogans = "Upgrade your life!,Totally not a knock-off!"
	vend_delay = 15
	vend_reply = "Enjoy your product."
	products = list(
		/obj/item/weapon/disk/nifsoft/arciv=10,
		/obj/item/weapon/disk/nifsoft/arcorrective=10,
		/obj/item/weapon/disk/nifsoft/uvblocker=10,
		/obj/item/weapon/disk/nifsoft/mesons=10,
		/obj/item/weapon/disk/nifsoft/medichines_org=10,
		/obj/item/weapon/disk/nifsoft/medichines_syn=10,
		/obj/item/weapon/disk/nifsoft/respirocytes=10,
		/obj/item/weapon/disk/nifsoft/mindbackup=10,
		/obj/item/weapon/disk/nifsoft/communicator=10,
		/obj/item/weapon/disk/nifsoft/apc_recharge=10,
		/obj/item/weapon/disk/nifsoft/pressure=10,
		/obj/item/weapon/disk/nifsoft/heatsinks=10,
		/obj/item/weapon/disk/nifsoft/worldbend=10,)
	prices = list(
		/obj/item/weapon/disk/nifsoft/arciv=500,
		/obj/item/weapon/disk/nifsoft/arcorrective=500,
		/obj/item/weapon/disk/nifsoft/uvblocker=1000,
		/obj/item/weapon/disk/nifsoft/mesons=1000,
		/obj/item/weapon/disk/nifsoft/medichines_org=1500,
		/obj/item/weapon/disk/nifsoft/medichines_syn=1500,
		/obj/item/weapon/disk/nifsoft/respirocytes=1500,
		/obj/item/weapon/disk/nifsoft/mindbackup=1000,
		/obj/item/weapon/disk/nifsoft/communicator=500,
		/obj/item/weapon/disk/nifsoft/apc_recharge=1250,
		/obj/item/weapon/disk/nifsoft/pressure=1250,
		/obj/item/weapon/disk/nifsoft/heatsinks=1250,
		/obj/item/weapon/disk/nifsoft/worldbend=100,)

/obj/machinery/vending/arfsnifsoft/medical
	name = "Medical NIFsoft"
	products = list(
		/obj/item/weapon/disk/nifsoft/armed=10,)
	prices = list(
		/obj/item/weapon/disk/nifsoft/armed=500,)

/obj/machinery/vending/arfsnifsoft/science
	name = "Science NIFsoft"
	products = list(
		/obj/item/weapon/disk/nifsoft/arsci=10,)
	prices = list(
		/obj/item/weapon/disk/nifsoft/arsci=500,)

/obj/machinery/vending/arfsnifsoft/security
	name = "Security NIFsoft"
	products = list(
		/obj/item/weapon/disk/nifsoft/arsec=10,)
	prices = list(
		/obj/item/weapon/disk/nifsoft/arciv=500,)

/obj/machinery/vending/arfsnifsoft/engineering
	name = "Engineering NIFsoft"
	products = list(
		/obj/item/weapon/disk/nifsoft/areng=10,)
	prices = list(
		/obj/item/weapon/disk/nifsoft/areng=500,)

/obj/machinery/vending/arfsnifsoft/command
	name = "Command NIFsoft"
	products = list(
		/obj/item/weapon/disk/nifsoft/aromni=10,)
	prices = list(
		/obj/item/weapon/disk/nifsoft/aromni=1000,)

/obj/machinery/vending/arfsnifsoft/mining
	name = "Mining NIFsoft"
	products = list(
		/obj/item/weapon/disk/nifsoft/material=10,)
	prices = list(
		/obj/item/weapon/disk/nifsoft/material=500,)

//Custom vendors
/obj/machinery/vending/nifsoft_shop/arfs
	name = "NIFSoft Shop"
	desc = "For all your mindware and mindware accessories."
	product_ads = "Let us get into your head!;Looking for an upgrade?;Surpass Humanity!;Why be normal when you can be SUPERnormal?;Jack in with NIFSoft!"

	icon = 'icons/obj/machines/ar_elements.dmi'
	icon_state = "proj"
	icon_vend = "beacon_yes"
	icon_deny = "beacon_no"

	products = list()
	contraband = list()
	premium = list()
	var/global/list/starting_legal_nifsoft
	var/global/list/starting_illegal_nifsoft

	density = 0
	opacity = 0
	var/datum/entopic/entopic

/obj/machinery/vending/nifsoft_shop/initialize()
	. = ..()
	entopic = new(aholder = src, aicon = icon, aicon_state = "beacon")

/obj/machinery/vending/nifsoft_shop/Destroy()
	QDEL_NULL(entopic)
	return ..()

/obj/machinery/vending/nifsoft_shop/power_change()
	..()
	if(!entopic) return //Early APC init(), ignore
	if(stat & BROKEN)
		icon_state = "[initial(icon_state)]-broken"
		entopic.hide()
	else
		if(!(stat & NOPOWER))
			icon_state = initial(icon_state)
			entopic.show()
		else
			spawn(rand(0, 15))
				icon_state = "[initial(icon_state)]-off"
				entopic.hide()

/obj/machinery/vending/nifsoft_shop/malfunction()
	stat |= BROKEN
	icon_state = "[initial(icon_state)]-broken"
	entopic.hide()
	return

// Special Treatment!
/obj/machinery/vending/nifsoft_shop/build_inventory()
	//Firsties
	if(!starting_legal_nifsoft)
		starting_legal_nifsoft = list()
		starting_illegal_nifsoft = list()
		for(var/P in (subtypesof(/datum/nifsoft) - typesof(/datum/nifsoft/package)))
			var/datum/nifsoft/NS = P
			if(initial(NS.vended))
				switch(initial(NS.illegal))
					if(TRUE)
						starting_illegal_nifsoft += NS
					if(FALSE)
						starting_legal_nifsoft += NS

	products = starting_legal_nifsoft.Copy()
	contraband = starting_illegal_nifsoft.Copy()

	var/list/all_products = list(
		list(products, CAT_NORMAL),
		list(contraband, CAT_HIDDEN),
		list(premium, CAT_COIN))

	for(var/current_list in all_products)
		var/category = current_list[2]

		for(var/entry in current_list[1])
			var/datum/nifsoft/NS = entry
			var/applies_to = initial(NS.applies_to)
			var/context = ""
			if(!(applies_to & NIF_SYNTHETIC))
				context = " (Org Only)"
			else if(!(applies_to & NIF_ORGANIC))
				context = " (Syn Only)"
			var/name = "[initial(NS.name)][context]"
			var/datum/stored_item/vending_product/product = new/datum/stored_item/vending_product(src, entry, name)

			product.price = initial(NS.cost)
			product.amount = 10
			product.category = category

			product_records.Add(product)

/obj/machinery/vending/nifsoft_shop/allowed(mob/user)
	if(!ishuman(user))
		return FALSE

	var/mob/living/carbon/human/H = user
	if(!H.nif || !H.nif.stat == NIF_WORKING)
		to_chat(H,"<span class='warning'>[src] seems unable to connect to your NIF...</span>")
		flick(icon_deny,entopic.my_image)
		return FALSE

	return ..()

//Had to override this too
/obj/machinery/vending/nifsoft_shop/Topic(href, href_list)
	if(stat & (BROKEN|NOPOWER))
		return
	if(usr.stat || usr.restrained())
		return

	if(href_list["remove_coin"] && !istype(usr,/mob/living/silicon))
		if(!coin)
			usr << "There is no coin in this machine."
			return

		coin.forceMove(src.loc)
		if(!usr.get_active_hand())
			usr.put_in_hands(coin)
		usr << "<span class='notice'>You remove \the [coin] from \the [src]</span>"
		coin = null
		categories &= ~CAT_COIN

	if((usr.contents.Find(src) || (in_range(src, usr) && istype(src.loc, /turf))))
		if((href_list["vend"]) && (vend_ready) && (!currently_vending))
			if((!allowed(usr)) && !emagged && scan_id)	//For SECURE VENDING MACHINES YEAH
				usr << "<span class='warning'>Access denied.</span>"	//Unless emagged of course
				flick(icon_deny,entopic.my_image)
				return

			var/key = text2num(href_list["vend"])
			var/datum/stored_item/vending_product/R = product_records[key]

			// This should not happen unless the request from NanoUI was bad
			if(!(R.category & categories))
				return

			//Specific soft access checking
			var/datum/nifsoft/path = R.item_path
			if(initial(path.access))
				var/list/soft_access = list(initial(path.access))
				var/list/usr_access = usr.GetAccess()
				if(!has_access(soft_access, list(), usr_access) && !emagged)
					usr << "<span class='warning'>You aren't authorized to buy [initial(path.name)].</span>"
					flick(icon_deny,entopic.my_image)
					return

			if(R.price <= 0)
				vend(R, usr)
			else if(istype(usr,/mob/living/silicon)) //If the item is not free, provide feedback if a synth is trying to buy something.
				usr << "<span class='danger'>Artificial unit recognized.  Artificial units cannot complete this transaction.  Purchase canceled.</span>"
				return
			else
				currently_vending = R
				if(!vendor_account || vendor_account.suspended)
					status_message = "This machine is currently unable to process payments due to problems with the associated account."
					status_error = 1
				else
					status_message = "[initial(path.desc)]<br><br><b>Please swipe a card or insert cash to pay for the item.</b>"
					status_error = 0

		else if(href_list["cancelpurchase"])
			currently_vending = null

		else if((href_list["togglevoice"]) && (panel_open))
			shut_up = !shut_up

		add_fingerprint(usr)
		GLOB.nanomanager.update_uis(src)

// Also special treatment!
/obj/machinery/vending/nifsoft_shop/vend(datum/stored_item/vending_product/R, mob/user)
	var/mob/living/carbon/human/H = user
	if((!allowed(usr)) && !emagged && scan_id && istype(H))	//For SECURE VENDING MACHINES YEAH
		usr << "<span class='warning'>Purchase not allowed.</span>"	//Unless emagged of course
		flick(icon_deny,entopic.my_image)
		return
	vend_ready = 0 //One thing at a time!!
	status_message = "Installing..."
	status_error = 0
	GLOB.nanomanager.update_uis(src)

	if(R.category & CAT_COIN)
		if(!coin)
			user << "<span class='notice'>You need to insert a coin to get this item.</span>"
			return
		if(coin.string_attached)
			if(prob(50))
				user << "<span class='notice'>You successfully pull the coin out before \the [src] could swallow it.</span>"
			else
				user << "<span class='notice'>You weren't able to pull the coin out fast enough, the machine ate it, string and all.</span>"
				qdel(coin)
				coin = null
				categories &= ~CAT_COIN
		else
			qdel(coin)
			coin = null
			categories &= ~CAT_COIN

	if(((last_reply + (vend_delay + 200)) <= world.time) && vend_reply)
		spawn(0)
			speak(vend_reply)
			last_reply = world.time

	use_power(vend_power_usage)	//actuators and stuff
	spawn(vend_delay)
		R.amount--
		new R.item_path(H.nif)
		flick(icon_vend,entopic.my_image)
		if(has_logs)
			do_logging(R, user, 1)

		status_message = ""
		status_error = 0
		vend_ready = 1
		currently_vending = null
		GLOB.nanomanager.update_uis(src)
	return 1*/

//Clothing!

//Hat vendor
/obj/machinery/vending/hatvendor
	name = "Hat Vendor"
	desc = "A vending machine for hats!"
	product_ads = "Top of the morning to ya!"
	icon_state = "hats"
	icon = 'content_arfs/icons/obj/vending.dmi'
	vend_reply = "Enjoy!"
	products = list(/obj/item/clothing/head/woodcirclet=5, /obj/item/clothing/head/sunflower_crown=5,
	/obj/item/clothing/head/lavender_crown=5,/obj/item/clothing/head/poppy_crown=5,
	/obj/item/clothing/head/pin=5, /obj/item/clothing/head/pin/pink=5,
	/obj/item/clothing/head/pin/clover=5, /obj/item/clothing/head/pin/butterfly=5,
	/obj/item/clothing/head/pin/magnetic=5,/obj/item/clothing/head/pin/flower=5,
	/obj/item/clothing/head/pin/flower/blue=5,/obj/item/clothing/head/pin/flower/yellow=5,
	/obj/item/clothing/head/pin/flower/pink=5,/obj/item/clothing/head/pin/flower/violet=5,
	/obj/item/clothing/head/pin/flower/orange=5,/obj/item/clothing/head/pin/flower/white=5,
	/obj/item/clothing/head/pin/bow=5,/obj/item/clothing/head/pin/bow/big=5,
	/obj/item/clothing/head/pin/bow/big/red=5,/obj/item/clothing/head/powdered_wig=5,
	/obj/item/clothing/head/that=5,/obj/item/clothing/head/redcoat=5,
	/obj/item/clothing/head/mailman=5,/obj/item/clothing/head/plaguedoctorhat=5,
	/obj/item/clothing/head/hasturhood=5,/obj/item/clothing/head/nursehat=5,
	/obj/item/clothing/head/greenbandana=5,/obj/item/clothing/head/rabbitears=5,
	/obj/item/clothing/head/flatcap=5,/obj/item/clothing/head/flatcap/grey=5,
	/obj/item/clothing/head/bowler=5,/obj/item/clothing/head/beaverhat=5,
	/obj/item/clothing/head/boaterhat=5,/obj/item/clothing/head/fedora=5,
	/obj/item/clothing/head/fedora/brown=5,/obj/item/clothing/head/fedora=5,
	/obj/item/clothing/head/trilby/feather=5,/obj/item/clothing/head/fez=5,
	/obj/item/clothing/head/cowboy=5,/obj/item/clothing/head/cowboy/black=5,
	/obj/item/clothing/head/cowboy/wide=5,/obj/item/clothing/head/cowboy/small=5,
	/obj/item/clothing/head/witchwig=5,/obj/item/clothing/head/chicken=5,
	/obj/item/clothing/head/bearpelt=5,/obj/item/clothing/head/xenos=5,
	/obj/item/clothing/head/philosopher_wig=5,/obj/item/clothing/head/orangebandana=5,
	/obj/item/clothing/head/hijab=5,/obj/item/clothing/head/kippa=5,
	/obj/item/clothing/head/turban=5,/obj/item/clothing/head/taqiyah=5,
	/obj/item/clothing/head/beanie=5,/obj/item/clothing/head/beanie_loose=5,
	/obj/item/clothing/head/beretg=5,/obj/item/clothing/head/sombrero=5,
	/obj/item/clothing/head/headband/maid=5, /obj/item/clothing/head/kitty=5)

/obj/machinery/vending/shoevendor
	name = "shoe Vendor"
	desc = "A vending machine for shoes!"
	product_ads = "No need to go barefoot!"
	icon_state = "shoes"
	icon = 'content_arfs/icons/obj/vending.dmi'
	vend_reply = "Shoooooesss"
	products = list(/obj/item/clothing/shoes/boots=5,/obj/item/clothing/shoes/boots/cowboy=5,
	/obj/item/clothing/shoes/boots/cowboy/classic=5,/obj/item/clothing/shoes/boots/cowboy/snakeskin=5,
	/obj/item/clothing/shoes/boots/jackboots=5,/obj/item/clothing/shoes/boots/jackboots/toeless=5,
	/obj/item/clothing/shoes/boots/workboots=5,/obj/item/clothing/shoes/boots/workboots/toeless=5,
	/obj/item/clothing/shoes/boots/winter=5,/obj/item/clothing/shoes/black=5,
	/obj/item/clothing/shoes/brown=5,/obj/item/clothing/shoes/blue=5,
	/obj/item/clothing/shoes/green=5,/obj/item/clothing/shoes/yellow=5,
	/obj/item/clothing/shoes/purple=5,/obj/item/clothing/shoes/red=5,
	/obj/item/clothing/shoes/white=5,//obj/item/clothing/shoes/leather=5,
	/obj/item/clothing/shoes/rainbow=5,/obj/item/clothing/shoes/flats=5,
	/obj/item/clothing/shoes/flats/white=5,/obj/item/clothing/shoes/flats/white/color=5,
	/obj/item/clothing/shoes/flats/red=5,/obj/item/clothing/shoes/flats/purple=5,
	/obj/item/clothing/shoes/flats/blue=5,/obj/item/clothing/shoes/flats/brown=5,
	/obj/item/clothing/shoes/flats/orange=5,/obj/item/clothing/shoes/orange=5,
	/obj/item/clothing/shoes/hitops=5,/obj/item/clothing/shoes/hitops/red=5,
	/obj/item/clothing/shoes/hitops/brown=5,/obj/item/clothing/shoes/hitops/black=5,
	/obj/item/clothing/shoes/hitops/orange=5,/obj/item/clothing/shoes/hitops/blue=5,
	/obj/item/clothing/shoes/hitops/green=5,/obj/item/clothing/shoes/hitops/purple=5,
	/obj/item/clothing/shoes/hitops/yellow=5,/obj/item/clothing/shoes/mime=5,
	/obj/item/clothing/shoes/dress=5,/obj/item/clothing/shoes/dress/white=5,
	/obj/item/clothing/shoes/sandal=5,/obj/item/clothing/shoes/sandal/marisa=5,
	/obj/item/clothing/shoes/clown_shoes=5,/obj/item/clothing/shoes/slippers=5,
	/obj/item/clothing/shoes/laceup=5,/obj/item/clothing/shoes/swimmingfins=5,
	/obj/item/clothing/shoes/flipflop=5,/obj/item/clothing/shoes/athletic=5,
	/obj/item/clothing/shoes/skater=5,/obj/item/clothing/shoes/heels=5,
	/obj/item/clothing/shoes/footwraps=5,/obj/item/clothing/shoes/griffin=5)

/obj/machinery/vending/suitvendor
	name = "Suit Vendor"
	desc = "A vending machine for suits and jackets!"
	product_ads = "Snazzy!"
	icon_state = "suits"
	icon = 'content_arfs/icons/obj/vending.dmi'
	vend_reply = "Looking good!"
	products = list(/obj/item/clothing/suit/greatcoat=5,/obj/item/clothing/suit/johnny_coat=5,
	/obj/item/clothing/suit/judgerobe=5,/obj/item/clothing/suit/storage/apron/overalls=5,
	/obj/item/clothing/suit/hastur=5,/obj/item/clothing/suit/imperium_monk=5,
	/obj/item/clothing/suit/chickensuit=5,/obj/item/clothing/suit/monkeysuit=5,
	/obj/item/clothing/suit/holidaypriest=5,/obj/item/clothing/suit/cardborg=5,
	/obj/item/clothing/suit/iasexy=5,/obj/item/clothing/suit/sexyminer=5,
	/obj/item/clothing/suit/sumo=5,/obj/item/clothing/suit/hackercost=5,
	/obj/item/clothing/suit/lumber=5,/obj/item/clothing/suit/ianshirt=5,
	/obj/item/clothing/suit/kimono=5,/obj/item/clothing/suit/leathercoat=5,
	/obj/item/clothing/suit/browncoat/arf=5,/obj/item/clothing/suit/neocoat/arf=5,
	/obj/item/clothing/suit/customs=5,/obj/item/clothing/suit/storage/greyjacket=5,
	/obj/item/clothing/suit/storage/trench=5,/obj/item/clothing/suit/storage/trench/grey=5,
	/obj/item/clothing/suit/storage/toggle/peacoat=5,/obj/item/clothing/suit/storage/duster=5,
	/obj/item/clothing/suit/xenos=5,/obj/item/clothing/suit/jacket/puffer=5,
	/obj/item/clothing/suit/jacket/puffer/vest=5,/obj/item/clothing/suit/storage/miljacket=5,
	/obj/item/clothing/suit/storage/miljacket/alt=5,/obj/item/clothing/suit/storage/miljacket/green=5,
	/obj/item/clothing/suit/storage/toggle/bomber=5,/obj/item/clothing/suit/storage/bomber/alt=5,
	/obj/item/clothing/suit/storage/toggle/leather_jacket=5,/obj/item/clothing/suit/storage/toggle/leather_jacket/sleeveless=5,
	/obj/item/clothing/suit/storage/leather_jacket_alt=5,/obj/item/clothing/suit/storage/toggle/brown_jacket=5,
	/obj/item/clothing/suit/storage/toggle/brown_jacket/sleeveless=5,/obj/item/clothing/suit/storage/toggle/denim_jacket=5,
	/obj/item/clothing/suit/storage/toggle/denim_jacket/sleeveless=5,/obj/item/clothing/suit/storage/toggle/hoodie=5,
	/obj/item/clothing/suit/storage/toggle/hoodie/black=5,/obj/item/clothing/suit/storage/toggle/hoodie/red=5,
	/obj/item/clothing/suit/storage/toggle/hoodie/blue=5,
	/obj/item/clothing/suit/storage/toggle/hoodie/orange=5,/obj/item/clothing/suit/storage/toggle/hoodie/yellow=5,
	/obj/item/clothing/suit/storage/toggle/hoodie/cti=5,/obj/item/clothing/suit/storage/toggle/hoodie/mu=5,
	/obj/item/clothing/suit/storage/toggle/hoodie/nt=5,/obj/item/clothing/suit/storage/toggle/hoodie/smw=5,
	/obj/item/clothing/suit/storage/toggle/hoodie/nrti=5,/obj/item/clothing/suit/whitedress=5,
	/obj/item/clothing/suit/varsity=5,/obj/item/clothing/suit/varsity/red=5,
	/obj/item/clothing/suit/varsity/purple=5,/obj/item/clothing/suit/varsity/green=5,
	/obj/item/clothing/suit/varsity/blue=5,/obj/item/clothing/suit/varsity/brown=5,
	/obj/item/clothing/suit/storage/toggle/track=5,/obj/item/clothing/suit/storage/toggle/track/blue=5,
	/obj/item/clothing/suit/storage/toggle/track/green=5,/obj/item/clothing/suit/storage/toggle/track/red=5,
	/obj/item/clothing/suit/storage/toggle/track/white=5,/obj/item/clothing/suit/storage/flannel=5,
	/obj/item/clothing/suit/storage/flannel/red=5,/obj/item/clothing/suit/storage/flannel/aqua=5,
	/obj/item/clothing/suit/storage/flannel/brown=5,/obj/item/clothing/suit/storage/toggle/greengov=5)

/obj/machinery/vending/clothingvendor
	name = "Clothing Vendor"
	desc = "A vending machine for normal clothiing!"
	product_ads = "Come get dressed!"
	icon_state = "clothes"
	icon = 'content_arfs/icons/obj/vending.dmi'
	vend_reply = "Looking good!"
	products = list(/obj/item/clothing/under/pj/red=5,/obj/item/clothing/under/pj/blue=5,
	/obj/item/clothing/under/scratch=5,/obj/item/clothing/under/scratch/skirt=5,
	/obj/item/clothing/under/sl_suit=5,/obj/item/clothing/under/waiter=5,
	/obj/item/clothing/under/customs=5,/obj/item/clothing/under/customs/khaki=5,
	/obj/item/clothing/under/rank/mailman=5,/obj/item/clothing/under/sexyclown=5,
	/obj/item/clothing/under/rank/vice=5,/obj/item/clothing/under/rank/centcom=5,
	/obj/item/clothing/under/owl=5,/obj/item/clothing/under/johnny=5,
	/obj/item/clothing/under/color/rainbow=5,/obj/item/clothing/under/psysuit=5,
	/obj/item/clothing/under/gentlesuit=5,/obj/item/clothing/under/gentlesuit/skirt=5,
	/obj/item/clothing/under/suit_jacket=5,/obj/item/clothing/under/suit_jacket/really_black=5,
	/obj/item/clothing/under/suit_jacket/really_black/skirt=5,/obj/item/clothing/under/suit_jacket/female=5,
	/obj/item/clothing/under/suit_jacket/female/skirt=5,/obj/item/clothing/under/suit_jacket/red=5,
	/obj/item/clothing/under/suit_jacket/red/skirt=5,/obj/item/clothing/under/overalls=5,
	/obj/item/clothing/under/kilt=5,/obj/item/clothing/under/sexymime=5,
	/obj/item/clothing/under/dress/blacktango=5,/obj/item/clothing/under/dress/blacktango/alt=5,
	/obj/item/clothing/under/dress/stripeddress=5,/obj/item/clothing/under/dress/sailordress=5,
	/obj/item/clothing/under/dress/redeveninggown=5,/obj/item/clothing/under/dress/maid=5,
	/obj/item/clothing/under/dress/maid/janitor=5,/obj/item/clothing/under/dress/maid/sexy=5,
	/obj/item/clothing/under/dress/dress_fire=5,/obj/item/clothing/under/dress/dress_green=5,
	/obj/item/clothing/under/dress/dress_orange=5,/obj/item/clothing/under/dress/dress_pink=5,
	/obj/item/clothing/under/dress/dress_yellow=5,/obj/item/clothing/under/dress/dress_saloon=5,
	/obj/item/clothing/under/dress/black_corset=5,/obj/item/clothing/under/dress/flower_dress=5,
	/obj/item/clothing/under/dress/red_swept_dress=5,/obj/item/clothing/under/dress/flamenco=5,
	/obj/item/clothing/under/dress/westernbustle=5,/obj/item/clothing/under/schoolgirl/red=5,
	/obj/item/clothing/under/schoolgirl/green=5, /obj/item/clothing/under/schoolgirl/orange=5,
	/obj/item/clothing/under/lobster=5, /obj/item/clothing/head/lobster=5)

/obj/machinery/vending/arfs/hydroseeds
	name = "Arfs Seed Servitor"
	desc = "When you need seeds fast!"
	product_slogans = "THIS'S WHERE TH' SEEDS LIVE! GIT YOU SOME!;Hands down the best seed selection on the station!;Also certain mushroom varieties available, more for experts! Get certified today!"
	product_ads = "We like plants!;Grow some crops!;Grow, baby, growww!;Aw h'yeah son!"
	icon_state = "seeds"

	products = list(/obj/item/seeds/bananaseed = 3,/obj/item/seeds/berryseed = 3,/obj/item/seeds/carrotseed = 3,/obj/item/seeds/chantermycelium = 3,/obj/item/seeds/chiliseed = 3,
					/obj/item/seeds/cornseed = 3, /obj/item/seeds/eggplantseed = 3, /obj/item/seeds/potatoseed = 3, /obj/item/seeds/replicapod = 3,/obj/item/seeds/soyaseed = 3,
					/obj/item/seeds/sunflowerseed = 3,/obj/item/seeds/tomatoseed = 3,/obj/item/seeds/towermycelium = 3,/obj/item/seeds/wheatseed = 3,/obj/item/seeds/appleseed = 3,
					/obj/item/seeds/poppyseed = 3,/obj/item/seeds/sugarcaneseed = 3,/obj/item/seeds/ambrosiavulgarisseed = 3,/obj/item/seeds/peanutseed = 3,/obj/item/seeds/whitebeetseed = 3,/obj/item/seeds/watermelonseed = 3,/obj/item/seeds/lavenderseed = 3,/obj/item/seeds/limeseed = 3,
					/obj/item/seeds/lemonseed = 3,/obj/item/seeds/orangeseed = 3,/obj/item/seeds/grassseed = 3,/obj/item/seeds/cocoapodseed = 3,/obj/item/seeds/plumpmycelium = 2,
					/obj/item/seeds/cabbageseed = 3,/obj/item/seeds/grapeseed = 3,/obj/item/seeds/pumpkinseed = 3,/obj/item/seeds/cherryseed = 3,/obj/item/seeds/plastiseed = 3,/obj/item/seeds/riceseed = 3)
	contraband = list(/obj/item/seeds/amanitamycelium = 2,/obj/item/seeds/glowshroom = 2,/obj/item/seeds/libertymycelium = 2,/obj/item/seeds/mtearseed = 2,
					  /obj/item/seeds/nettleseed = 2,/obj/item/seeds/reishimycelium = 2,/obj/item/seeds/reishimycelium = 2,/obj/item/seeds/shandseed = 2)

/obj/machinery/vending/pokemonvendor
	name = "Pokemon Vender"
	desc = "Gotta Vend them all!"
	product_slogans = "Vend your new partner today!"
//	product_ads = ""
	icon_state = "pokemon"
	icon = 'content_arfs/icons/obj/vending.dmi'

	products = list(/mob/living/simple_mob/animal/passive/pokemon/leg/articuno = 5,/mob/living/simple_mob/animal/passive/pokemon/absol = 5,
	/mob/living/simple_mob/animal/passive/pokemon/aggron = 5,/mob/living/simple_mob/animal/passive/pokemon/ampharos = 5,
	/mob/living/simple_mob/animal/passive/pokemon/charmander =5,/mob/living/simple_mob/animal/passive/pokemon/ditto = 5,
	/mob/living/simple_mob/animal/passive/pokemon/dragonair =5,/mob/living/simple_mob/animal/passive/pokemon/dragonite =5,
	/mob/living/simple_mob/animal/passive/pokemon/dratini =5,/mob/living/simple_mob/animal/passive/pokemon/eevee = 5,
	/mob/living/simple_mob/animal/passive/pokemon/espeon =5,/mob/living/simple_mob/animal/passive/pokemon/flaaffy =5,
	/mob/living/simple_mob/animal/passive/pokemon/flareon =5,/mob/living/simple_mob/animal/passive/pokemon/glaceon =5,
	/mob/living/simple_mob/animal/passive/pokemon/jolteon =5,/mob/living/simple_mob/animal/passive/pokemon/larvitar = 5,
	/mob/living/simple_mob/animal/passive/pokemon/growlithe =5,/mob/living/simple_mob/animal/passive/pokemon/mareep =5,
	/mob/living/simple_mob/animal/passive/pokemon/mightyena =5,/mob/living/simple_mob/animal/passive/pokemon/miltank =5,
	/mob/living/simple_mob/animal/passive/pokemon/poochyena =5,/mob/living/simple_mob/animal/passive/pokemon/sylveon =5,
	/mob/living/simple_mob/animal/passive/pokemon/umbreon = 5,/mob/living/simple_mob/animal/passive/pokemon/vulpix =5,
	/mob/living/simple_mob/animal/passive/pokemon/tentacruel =5,/mob/living/simple_mob/animal/passive/pokemon/ninetales =5,
	/mob/living/simple_mob/animal/passive/pokemon/ponyta =5,/mob/living/simple_mob/animal/passive/pokemon/tangela =5,
	/mob/living/simple_mob/animal/passive/pokemon/pinsir =5,/mob/living/simple_mob/animal/passive/pokemon/omanyte =5,
	/mob/living/simple_mob/animal/passive/pokemon/magmar =5,/mob/living/simple_mob/animal/passive/pokemon/magicarp =5,
	/mob/living/simple_mob/animal/passive/pokemon/lapras =5,/mob/living/simple_mob/animal/passive/pokemon/kabuto =5,
	/mob/living/simple_mob/animal/passive/pokemon/aerodactyl =5, /mob/living/simple_mob/animal/passive/pokemon/lickitung =5,
	/mob/living/simple_mob/animal/passive/pokemon/cubone =5,/mob/living/simple_mob/animal/passive/pokemon/mewtwo =5,
	/mob/living/simple_mob/animal/passive/pokemon/snorlax =5)
	prices = list(/mob/living/simple_mob/animal/passive/pokemon/leg/articuno = 200,/mob/living/simple_mob/animal/passive/pokemon/absol = 200,
	/mob/living/simple_mob/animal/passive/pokemon/aggron = 200, /mob/living/simple_mob/animal/passive/pokemon/ampharos = 200,
	/mob/living/simple_mob/animal/passive/pokemon/charmander =200,/mob/living/simple_mob/animal/passive/pokemon/ditto = 200,
	/mob/living/simple_mob/animal/passive/pokemon/dragonair =200,/mob/living/simple_mob/animal/passive/pokemon/dragonite =200,
	/mob/living/simple_mob/animal/passive/pokemon/dratini =200,/mob/living/simple_mob/animal/passive/pokemon/eevee = 200,
	/mob/living/simple_mob/animal/passive/pokemon/espeon =200,/mob/living/simple_mob/animal/passive/pokemon/flaaffy =200,
	/mob/living/simple_mob/animal/passive/pokemon/flareon =200,/mob/living/simple_mob/animal/passive/pokemon/glaceon =200,
	/mob/living/simple_mob/animal/passive/pokemon/jolteon =200,/mob/living/simple_mob/animal/passive/pokemon/larvitar =200,
	/mob/living/simple_mob/animal/passive/pokemon/growlithe =200,/mob/living/simple_mob/animal/passive/pokemon/mareep = 200,
	/mob/living/simple_mob/animal/passive/pokemon/mightyena =200,/mob/living/simple_mob/animal/passive/pokemon/miltank =200,
	/mob/living/simple_mob/animal/passive/pokemon/poochyena = 200,/mob/living/simple_mob/animal/passive/pokemon/sylveon = 200,
	/mob/living/simple_mob/animal/passive/pokemon/umbreon = 200,/mob/living/simple_mob/animal/passive/pokemon/vulpix =200,
	/mob/living/simple_mob/animal/passive/pokemon/tentacruel =200,/mob/living/simple_mob/animal/passive/pokemon/ninetales = 200,
	/mob/living/simple_mob/animal/passive/pokemon/ponyta = 200, /mob/living/simple_mob/animal/passive/pokemon/tangela = 200,
	/mob/living/simple_mob/animal/passive/pokemon/pinsir =200,/mob/living/simple_mob/animal/passive/pokemon/omanyte =200,
	/mob/living/simple_mob/animal/passive/pokemon/magmar =200,/mob/living/simple_mob/animal/passive/pokemon/magicarp =500,
	/mob/living/simple_mob/animal/passive/pokemon/lapras =200,/mob/living/simple_mob/animal/passive/pokemon/kabuto =200,
	/mob/living/simple_mob/animal/passive/pokemon/aerodactyl =200,/mob/living/simple_mob/animal/passive/pokemon/lickitung =200,
	/mob/living/simple_mob/animal/passive/pokemon/cubone =200,/mob/living/simple_mob/animal/passive/pokemon/mewtwo =500,
	/mob/living/simple_mob/animal/passive/pokemon/snorlax =200)


/obj/machinery/vending/bedsheet
	name = "Bedsheet Selector"
	desc = "For all your bedsheet needs"
	icon = 'icons/obj/structures.dmi'
	icon_state = "linenbin-full"
	products = list(/obj/item/weapon/bedsheet/blue = 5, /obj/item/weapon/bedsheet/bluedouble =5,
	/obj/item/weapon/bedsheet/green =5, /obj/item/weapon/bedsheet/greendouble =5,
	/obj/item/weapon/bedsheet/orange =5, /obj/item/weapon/bedsheet/orangedouble =5,
	/obj/item/weapon/bedsheet/purple =5, /obj/item/weapon/bedsheet/purpledouble =5,
	/obj/item/weapon/bedsheet/rainbow =5, /obj/item/weapon/bedsheet/rainbowdouble =5,
	/obj/item/weapon/bedsheet/red =5, /obj/item/weapon/bedsheet/reddouble =5,
	/obj/item/weapon/bedsheet/yellow =5, /obj/item/weapon/bedsheet/yellowdouble =5,
	/obj/item/weapon/bedsheet/mime =5, /obj/item/weapon/bedsheet/mimedouble =5,
	/obj/item/weapon/bedsheet/clown =5, /obj/item/weapon/bedsheet/clowndouble =5,
	/obj/item/weapon/bedsheet/captain =5, /obj/item/weapon/bedsheet/captaindouble =5,
	/obj/item/weapon/bedsheet/rd =5, /obj/item/weapon/bedsheet/rddouble =5,
	/obj/item/weapon/bedsheet/medical =5,
	/obj/item/weapon/bedsheet/hos =5, /obj/item/weapon/bedsheet/hosdouble =5,
	/obj/item/weapon/bedsheet/hop =5, /obj/item/weapon/bedsheet/hopdouble =5,
	/obj/item/weapon/bedsheet/ce =5, /obj/item/weapon/bedsheet/cedouble =5,
	/obj/item/weapon/bedsheet/brown =5, /obj/item/weapon/bedsheet/browndouble =5,
	/obj/item/weapon/bedsheet/ian =5, /obj/item/weapon/bedsheet/iandouble =5,
	/obj/item/weapon/bedsheet/double =5, /obj/item/weapon/bedsheet/transpride =5,
	/obj/item/weapon/bedsheet/panpride =5, /obj/item/weapon/bedsheet/nonbinpride =5,
	/obj/item/weapon/bedsheet/bipride =5, /obj/item/weapon/bedsheet/italianflag =5,
	/obj/item/weapon/bedsheet/canadaflag =5,/obj/item/weapon/bedsheet/deer =5,
	/obj/item/weapon/bedsheet/doubledeer =5, /obj/item/weapon/bedsheet/UKflag =5,
	/obj/item/weapon/bedsheet/transpridedouble=5,/obj/item/weapon/bedsheet/doublepanpride=5,
	/obj/item/weapon/bedsheet/doublenonbinpride=5)

/obj/machinery/vending/bedsheet/big
	name = "Large Bedsheet Selector"
	desc = "For all your large bedsheet needs"
	products = list(
	/obj/item/weapon/bedsheet/bluedouble/big =5,
	/obj/item/weapon/bedsheet/greendouble/big =5,
	/obj/item/weapon/bedsheet/orangedouble/big =5,
	/obj/item/weapon/bedsheet/purpledouble/big =5,
	/obj/item/weapon/bedsheet/rainbowdouble/big =5,
	/obj/item/weapon/bedsheet/reddouble/big =5,
	/obj/item/weapon/bedsheet/yellowdouble/big =5,
	/obj/item/weapon/bedsheet/mimedouble/big =5,
	/obj/item/weapon/bedsheet/clowndouble/big =5,
	/obj/item/weapon/bedsheet/captaindouble/big =5,
	/obj/item/weapon/bedsheet/rddouble/big =5,
	/obj/item/weapon/bedsheet/hosdouble/big =5,
	/obj/item/weapon/bedsheet/hopdouble/big =5,
	/obj/item/weapon/bedsheet/cedouble/big =5,
	/obj/item/weapon/bedsheet/browndouble/big =5,
	/obj/item/weapon/bedsheet/iandouble/big =5,
	/obj/item/weapon/bedsheet/doubledeer/big =5,
	/obj/item/weapon/bedsheet/transpridedouble/big=5,
	/obj/item/weapon/bedsheet/doublepanpride/big=5,
	/obj/item/weapon/bedsheet/doublenonbinpride/big=5
	)

/obj/machinery/vending/bedsheet/huge
	name = "Huge Bedsheet Selector"
	desc = "For all your huge bedsheet needs"
	products = list(
	/obj/item/weapon/bedsheet/bluedouble/huge =5,
	/obj/item/weapon/bedsheet/greendouble/huge =5,
	/obj/item/weapon/bedsheet/orangedouble/huge =5,
	/obj/item/weapon/bedsheet/purpledouble/huge =5,
	/obj/item/weapon/bedsheet/rainbowdouble/huge =5,
	/obj/item/weapon/bedsheet/reddouble/huge =5,
	/obj/item/weapon/bedsheet/yellowdouble/huge =5,
	/obj/item/weapon/bedsheet/mimedouble/huge =5,
	/obj/item/weapon/bedsheet/clowndouble/huge =5,
	/obj/item/weapon/bedsheet/captaindouble/huge =5,
	/obj/item/weapon/bedsheet/rddouble/huge =5,
	/obj/item/weapon/bedsheet/hosdouble/huge =5,
	/obj/item/weapon/bedsheet/hopdouble/huge =5,
	/obj/item/weapon/bedsheet/cedouble/huge =5,
	/obj/item/weapon/bedsheet/browndouble/huge =5,
	/obj/item/weapon/bedsheet/iandouble/huge =5,
	/obj/item/weapon/bedsheet/doubledeer/huge =5,
	/obj/item/weapon/bedsheet/transpridedouble/huge=5,
	/obj/item/weapon/bedsheet/doublepanpride/huge=5,
	/obj/item/weapon/bedsheet/doublenonbinpride/huge=5
	)

/obj/machinery/vending/bedsheet/mega
	name = "Mega Bedsheet Selector"
	desc = "For all your mega bedsheet needs"
	products = list(
	/obj/item/weapon/bedsheet/bluedouble/mega =5,
	/obj/item/weapon/bedsheet/greendouble/mega =5,
	/obj/item/weapon/bedsheet/orangedouble/mega =5,
	/obj/item/weapon/bedsheet/purpledouble/mega =5,
	/obj/item/weapon/bedsheet/rainbowdouble/mega =5,
	/obj/item/weapon/bedsheet/reddouble/mega =5,
	/obj/item/weapon/bedsheet/yellowdouble/mega =5,
	/obj/item/weapon/bedsheet/mimedouble/mega =5,
	/obj/item/weapon/bedsheet/clowndouble/mega =5,
	/obj/item/weapon/bedsheet/captaindouble/mega =5,
	/obj/item/weapon/bedsheet/rddouble/mega =5,
	/obj/item/weapon/bedsheet/hosdouble/mega =5,
	/obj/item/weapon/bedsheet/hopdouble/mega =5,
	/obj/item/weapon/bedsheet/cedouble/mega =5,
	/obj/item/weapon/bedsheet/browndouble/mega =5,
	/obj/item/weapon/bedsheet/iandouble/mega =5,
	/obj/item/weapon/bedsheet/doubledeer/mega =5,
	/obj/item/weapon/bedsheet/transpridedouble/mega=5,
	/obj/item/weapon/bedsheet/doublepanpride/mega=5,
	/obj/item/weapon/bedsheet/doublenonbinpride/mega=5
	)

/obj/machinery/smartfridge/food
	name = "\improper Food Showcase"
	desc = "A refrigerated storage unit for tasty tasty food. Keeps cold foods cold and warm foods warm."
	icon_state = "fridge_drinks"
	icon_base = "fridge_drinks"
	icon_contents = "drink"

/obj/machinery/smartfridge/food/accept_check(var/obj/item/O as obj)
	if(istype(O,/obj/item/weapon/reagent_containers/food) || istype(O,/obj/item/weapon/reagent_containers/food/snacks) || istype(O,/obj/item/weapon/reagent_containers/food/condiment))
		return 1

/obj/machinery/vending/wallmedarfs
	name = "ArfMed++"
	desc = "A wall-mounted version of the NanoMed, containing only vital first aid equipment."
	description_fluff = "A compacted Bluespace Storage vendor"
	icon_state = "wallmed"
	layer = ABOVE_WINDOW_LAYER
	density = 0 //It is wall-mounted, and thus, not dense. --Superxpdude
	products = list(/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/toxin = 4,
					/obj/item/weapon/reagent_containers/syringe/antiviral = 4,
					/obj/item/weapon/reagent_containers/syringe = 12,
					/obj/item/device/healthanalyzer = 5,
					/obj/item/weapon/reagent_containers/glass/beaker = 4,
					/obj/item/weapon/reagent_containers/dropper = 2,
					/obj/item/stack/medical/advanced/bruise_pack = 6,
					/obj/item/stack/medical/advanced/ointment = 6,
					/obj/item/stack/medical/splint = 4,
					/obj/item/weapon/storage/pill_bottle/carbon = 2,
					/obj/item/weapon/reagent_containers/pill/tox = 3,
					/obj/item/weapon/reagent_containers/pill/stox = 4,
					/obj/item/weapon/reagent_containers/pill/antitox = 6,
					/obj/item/weapon/reagent_containers/hypospray/autoinjector/detox = 6,
					/obj/item/weapon/reagent_containers/hypospray/autoinjector/rad =6,
					/obj/item/weapon/reagent_containers/syringe/inaprovaline =6,
					/obj/item/weapon/storage/pill_bottle/dylovene  =6)
	req_log_access = access_cmo
	has_logs = 1
	can_rotate = 0

/obj/machinery/vending/bloodarfs
	name = "Blood-Onator++"
	desc = "A wall-mounted version of the Blood-Onator. Freezer-vendor for storage and quick dispensing of blood packs"
	description_fluff = "A compacted Bluespace Storage vendor"
	product_ads = "The true life juice!;Vampire's choice!;Home-grown blood only!;Donate today, be saved tomorrow!;Approved by Zeng-Hu Pharmaceuticals Incorporated!; Curse you, Vey-Med artificial blood!"
	layer = ABOVE_WINDOW_LAYER
	icon_state = "wallmed"
	vend_delay = 7
	density = 0 //It is wall-mounted, and thus, not dense. --Superxpdude
	idle_power_usage = 211
	products = list(/obj/item/weapon/reagent_containers/blood/prelabeled/APlus = 3,/obj/item/weapon/reagent_containers/blood/prelabeled/AMinus = 3,
					/obj/item/weapon/reagent_containers/blood/prelabeled/BPlus = 3,/obj/item/weapon/reagent_containers/blood/prelabeled/BMinus = 3,
					/obj/item/weapon/reagent_containers/blood/prelabeled/OPlus = 2,/obj/item/weapon/reagent_containers/blood/prelabeled/OMinus = 5,
					/obj/item/weapon/reagent_containers/blood/empty = 5)
	contraband = list(/obj/item/weapon/reagent_containers/glass/bottle/stoxin = 2)
	req_log_access = access_cmo
	has_logs = 1

/obj/machinery/vending/food/autochef
	name = "AutoChef"
	desc = "A kitchen appliance which, when supplied with reagent capsules, can fabricate almost any pre-programmed foods the user desires. Can also dispense some kitchenware."
	icon_state = "hotfood"
	products = list(/obj/item/weapon/tray = 8,
					/obj/item/weapon/material/kitchen/utensil/fork = 12,
					/obj/item/weapon/material/knife/plastic = 12,
					/obj/item/weapon/material/kitchen/utensil/spoon = 12,
					/obj/item/weapon/reagent_containers/food/snacks/benedict = 12,
					/obj/item/weapon/reagent_containers/food/snacks/slice/sushi/filled/filled = 12,
					/obj/item/weapon/reagent_containers/food/snacks/bagelplain = 12,
					/obj/item/weapon/reagent_containers/food/snacks/bageleverything = 12,
					/obj/item/weapon/reagent_containers/food/snacks/donkpocket = 12,
					/obj/item/weapon/reagent_containers/food/snacks/donut = 12,
					/obj/item/weapon/reagent_containers/food/snacks/baguette = 12,
					/obj/item/weapon/reagent_containers/food/snacks/generalschicken = 12,
					/obj/item/weapon/reagent_containers/food/snacks/lomein = 12,
					/obj/item/weapon/reagent_containers/food/snacks/macncheese = 12,
					/obj/item/weapon/reagent_containers/food/snacks/omelette = 12,
					/obj/item/weapon/reagent_containers/food/snacks/lobstercooked = 12,
					/obj/item/weapon/reagent_containers/food/snacks/mushroomsoup = 12,
					/obj/item/weapon/reagent_containers/food/snacks/taco = 12,
					/obj/item/weapon/reagent_containers/food/snacks/meatsteak = 12,
					/obj/item/weapon/reagent_containers/food/snacks/cheeseburger = 12,
					/obj/item/weapon/reagent_containers/food/snacks/grilledcheese = 12,
					/obj/item/weapon/reagent_containers/food/snacks/hotdog = 12,
					/obj/item/weapon/reagent_containers/food/snacks/loadedbakedpotato = 12,
					/obj/item/weapon/reagent_containers/food/snacks/omelette = 12,
					/obj/item/weapon/reagent_containers/food/snacks/pastatomato = 12,
					/obj/item/weapon/reagent_containers/food/snacks/tofuburger = 12,
					/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/mushroompizza = 4,
					/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza = 4,
					/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/margherita = 4,
					/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/meatpizza = 4,
					/obj/item/weapon/reagent_containers/food/snacks/waffles = 12,
					/obj/item/weapon/reagent_containers/food/snacks/muffin = 12,
					/obj/item/weapon/reagent_containers/food/snacks/appletart = 12,
					/obj/item/weapon/reagent_containers/food/snacks/sliceable/applecake = 12,
					/obj/item/weapon/reagent_containers/food/snacks/sliceable/bananabread = 12,
					)
	contraband = list(/obj/item/weapon/reagent_containers/food/snacks/mysterysoup = 10)
	vend_delay = 15
