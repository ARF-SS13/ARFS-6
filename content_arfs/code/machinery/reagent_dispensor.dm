
/obj/machinery/chemical_dispenser/kitchen
	name = "kitchen dispenser"
	desc = "Helping chefs be lazy."
	icon_state = "coffee_dispenser"
	ui_title = "Kitchen Dispenser"
	accept_drinking = 1

/obj/machinery/chemical_dispenser/kitchen/full
	spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/milk, /obj/item/weapon/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/batter, /obj/item/weapon/reagent_containers/chem_disp_cartridge/beerbatter,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/mayo, /obj/item/weapon/reagent_containers/chem_disp_cartridge/yeast,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/flour, /obj/item/weapon/reagent_containers/chem_disp_cartridge/soysauce,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/peanutbutter, /obj/item/weapon/reagent_containers/chem_disp_cartridge/blackpepper,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/salt, /obj/item/weapon/reagent_containers/chem_disp_cartridge/spacespice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/soymilk, /obj/item/weapon/reagent_containers/chem_disp_cartridge/egg,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/enzyme, /obj/item/weapon/reagent_containers/chem_disp_cartridge/water)



//chem dispensor carts
/*
/obj/item/weapon/reagent_containers/chem_disp_cartridge/arfs

	batter	spawn_reagent = "batter"
	beerbatter	spawn_reagent = "beerbatter"
	mayo	spawn_reagent = "mayo"
	yeast	spawn_reagent = "yeast"
	flour	spawn_reagent = "flour"
	soysauce	spawn_reagent = "soysauce"
	peanutbutter	spawn_reagent = "peanutbutter"
	blackpepper	spawn_reagent = "blackpepper"
	spacespice	spawn_reagent = "spacespice"
	salt	spawn_reagent = "salt"
	soymilk	 spawn_reagent = "soymilk"
	egg	 spawn_reagent = "egg"

/obj/machinery/chemical_dispenser/kitchen
	dispense_reagents = list(
		"milk", "sugar", "batter", "beerbatter")
*/

/obj/item/weapon/reagent_containers/chem_disp_cartridge/batter
	spawn_reagent = "batter"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/beerbatter
	spawn_reagent = "beerbatter"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/mayo
	spawn_reagent = "mayo"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/yeast
	spawn_reagent = "yeast"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/flour
	spawn_reagent = "flour"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/soysauce
	spawn_reagent = "soysauce"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/peanutbutter
	spawn_reagent = "peanutbutter"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/blackpepper
	spawn_reagent = "blackpepper"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/spacespice
	spawn_reagent = "spacespice"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/salt
	spawn_reagent = "salt"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/soymilk
	spawn_reagent = "soymilk"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/egg
	spawn_reagent = "egg"

/obj/item/weapon/reagent_containers/chem_disp_cartridge/enzyme
	spawn_reagent = "enzyme"
