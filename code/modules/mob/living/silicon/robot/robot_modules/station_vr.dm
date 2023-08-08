/obj/item/weapon/robot_module/robot/security/knine
	name = "k9 robot module"

/obj/item/weapon/robot_module/robot/security/knine/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/handcuffs/cyborg(src) //You need cuffs to be a proper sec borg!
	src.modules += new /obj/item/weapon/dogborg/jaws/big(src) //In case there's some kind of hostile mob.
	src.modules += new /obj/item/weapon/melee/baton/robot(src) //Since the pounce module refused to work, they get a stunbaton instead.
	//src.modules += new /obj/item/device/dogborg/boop_module(src) //Boop people on the nose.
	src.modules += new /obj/item/taperoll/police(src) //Block out crime scenes.
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted/cyborg(src) //They /are/ a security borg, after all.
	src.modules += new /obj/item/weapon/dogborg/pounce(src) //Pounce
	src.modules += new /obj/item/device/ticket_printer(src)
	src.emag 	 = new /obj/item/weapon/gun/energy/laser/mounted(src) //Emag. Not a big problem.

	var/datum/matter_synth/water = new /datum/matter_synth(500) //Starts full and has a max of 500
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water
	synths += water

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/dogborg/sleeper/K9/B = new /obj/item/device/dogborg/sleeper/K9(src) //Eat criminals. Bring them to the brig.
	B.water = water
	src.modules += B
	..()

/obj/item/weapon/robot_module/robot/security/knine/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	var/obj/item/device/flash/F = locate() in src.modules
	if(F.broken)
		F.broken = 0
		F.times_used = 0
		F.icon_state = "flash"
	else if(F.times_used)
		F.times_used--
	var/obj/item/weapon/gun/energy/taser/mounted/cyborg/T = locate() in src.modules
	if(T.power_supply.charge < T.power_supply.maxcharge)
		T.power_supply.give(T.charge_cost * amount)
		T.update_icon()
	else
		T.charge_tick = 0
	/*var/obj/item/weapon/melee/baton/robot/B = locate() in src.modules //Borg baton uses borg cell.
	if(B && B.bcell)
		B.bcell.give(amount)*/


/obj/item/weapon/robot_module/robot/medical/medihound
	name = "MediHound module"

/obj/item/weapon/robot_module/robot/medical/medihound/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src) //In case a patient is being attacked by carp.
	//src.modules += new /obj/item/device/dogborg/boop_module(src) //Boop the crew.
	src.modules += new /obj/item/device/healthanalyzer(src) // See who's hurt specificially.
	src.modules += new /obj/item/weapon/reagent_containers/syringe(src) //In case the chemist is nice!
	src.modules += new /obj/item/weapon/reagent_containers/glass/beaker/large(src)//For holding the chemicals when the chemist is nice, made it the large variant in 2022
	src.modules += new /obj/item/device/sleevemate(src) //Lets them scan people.
	src.modules += new /obj/item/weapon/shockpaddles/robot/hound(src) //Paws of life
	src.modules += new /obj/item/weapon/inflatable_dispenser/robot(src) //This is kinda important for rescuing people without making it worse for everyone
	src.modules += new /obj/item/weapon/gripper/medical(src) //Let them do literally anything in medbay other than patch external damage and lick people
	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src) //dropper is nice to have for so much actually
	src.emag 	 = new /obj/item/weapon/dogborg/pounce(src) //Pounce

	var/datum/matter_synth/medicine = new /datum/matter_synth/medicine(10000)
	synths += medicine

	var/obj/item/stack/medical/advanced/clotting/C = new (src)
	var/obj/item/stack/medical/splint/S = new /obj/item/stack/medical/splint(src)
	C.uses_charge = 1
	C.charge_costs = list(5000)
	C.synths = list(medicine)
	S.uses_charge = 1
	S.charge_costs = list(1000)
	S.synths = list(medicine)
	src.modules += C
	src.modules += S

	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water
	synths += water

	var/obj/item/weapon/reagent_containers/borghypo/hound/H = new /obj/item/weapon/reagent_containers/borghypo/hound(src)
	H.water = water
	src.modules += H

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/dogborg/sleeper/B = new /obj/item/device/dogborg/sleeper(src) //So they can nom people and heal them
	B.water = water
	src.modules += B
	..()

/obj/item/weapon/robot_module/robot/medical/traumahound
	name = "traumahound robot module"

/obj/item/weapon/robot_module/robot/medical/traumahound/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	src.modules += new /obj/item/weapon/shockpaddles/robot/hound(src) //Paws of life

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	//T.water = water
	src.modules += T
	..()

/obj/item/weapon/robot_module/robot/security/ert
	name = "Emergency Responce module"

/obj/item/weapon/robot_module/robot/security/ert/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/handcuffs/cyborg(src)
	src.modules += new /obj/item/weapon/dogborg/jaws/ert(src)
	src.modules += new /obj/item/taperoll/police(src)
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted/cyborg/ertgun(src)
	src.modules += new /obj/item/weapon/dogborg/swordtail(src)
	src.emag     = new /obj/item/weapon/gun/energy/laser/mounted(src)

	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water
	synths += water

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/dogborg/sleeper/K9/B = new /obj/item/device/dogborg/sleeper/K9/ert(src)
	B.water = water
	src.modules += B
	..()

/obj/item/weapon/robot_module/robot/janitor/scrubpup
	name = "Custodial Hound module"
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/janitor/scrubpup/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	//src.modules += new /obj/item/device/dogborg/boop_module(src)
	src.modules += new /obj/item/pupscrubber(src)
	src.emag 	 = new /obj/item/weapon/dogborg/pounce(src) //Pounce

	//Starts empty. Can only recharge with recycled material.
	var/datum/matter_synth/metal = new /datum/matter_synth/metal()
	metal.name = "Steel reserves"
	metal.recharge_rate = 0
	metal.max_energy = 50000
	metal.energy = 0
	var/datum/matter_synth/glass = new /datum/matter_synth/glass()
	glass.name = "Glass reserves"
	glass.recharge_rate = 0
	glass.max_energy = 50000
	glass.energy = 0
	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water

	synths += metal
	synths += glass
	synths += water

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/lightreplacer/dogborg/LR = new /obj/item/device/lightreplacer/dogborg(src)
	LR.glass = glass
	src.modules += LR

	var/obj/item/device/dogborg/sleeper/compactor/C = new /obj/item/device/dogborg/sleeper/compactor(src)
	C.metal = metal
	C.glass = glass
	C.water = water
	src.modules += C

	//Sheet refiners can only produce raw sheets.
	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.name = "steel recycler"
	M.desc = "A device that refines recycled steel into sheets."
	M.synths = list(metal)
	M.recipes = list()
	M.recipes += new/datum/stack_recipe("steel sheet", /obj/item/stack/material/steel, 1, 1, 20)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.name = "glass recycler"
	G.desc = "A device that refines recycled glass into sheets."
	G.material = get_material_by_name("placeholder") //Hacky shit but we want sheets, not windows.
	G.synths = list(glass)
	G.recipes = list()
	G.recipes += new/datum/stack_recipe("glass sheet", /obj/item/stack/material/glass, 1, 1, 20)
	src.modules += G
	..()

/obj/item/weapon/robot_module/robot/research/sciencehound
	name = "Research Hound Module"
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/research/sciencehound/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	//src.modules += new /obj/item/device/dogborg/boop_module(src)
	src.modules += new /obj/item/weapon/gripper/research(src)
	src.modules += new /obj/item/weapon/gripper/no_use/loader(src)
	src.modules += new /obj/item/weapon/tool/screwdriver/cyborg(src)
	src.modules += new /obj/item/weapon/weldingtool/electric/mounted/cyborg(src)
	src.modules += new /obj/item/weapon/tool/wrench/cyborg(src)
	src.modules += new /obj/item/weapon/tool/wirecutters/cyborg(src)
	src.modules += new /obj/item/device/multitool(src)
	src.modules += new /obj/item/weapon/reagent_containers/glass/beaker/large(src)
	src.modules += new /obj/item/weapon/storage/part_replacer(src)
	src.modules += new /obj/item/device/robotanalyzer(src)
	src.modules += new /obj/item/weapon/card/robot(src)
	//Added a circuit gripper
	src.modules += new /obj/item/weapon/gripper/circuit(src)
	src.modules += new /obj/item/weapon/gripper/no_use/organ/robotics(src)
	//src.modules += new /obj/item/weapon/surgical/scalpel/cyborg(src) //these are on the normal one, but do not appear to have a purpose other than borging
	//src.modules += new /obj/item/weapon/surgical/circular_saw/cyborg(src) //so I am leaving them here but commented out because robotics no do the borging w/o medical
	src.modules += new /obj/item/weapon/portable_destructive_analyzer(src) //destructive analyzer option for pref respect while also being able to do job
	src.modules += new /obj/item/weapon/gripper/no_use/mech(src)
	src.modules += new /obj/item/weapon/shockpaddles/robot/jumper(src) //unkilling synths may be important actually
	src.modules += new /obj/item/weapon/melee/baton/slime/robot(src) //save the xenobio from themselves
	src.modules += new /obj/item/weapon/gun/energy/taser/xeno/robot(src) //save the xenobio from themselves from a distance
	src.modules += new /obj/item/device/xenoarch_multi_tool(src) //go find fancy rock
	src.modules += new /obj/item/weapon/pickaxe/excavationdrill(src) //go get fancy rock
	src.emag = new /obj/item/weapon/hand_tele(src)

	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water
	synths += water

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/dogborg/sleeper/compactor/analyzer/B = new /obj/item/device/dogborg/sleeper/compactor/analyzer(src)
	B.water = water
	src.modules += B

	var/datum/matter_synth/nanite = new /datum/matter_synth/nanite(10000)
	synths += nanite
	var/datum/matter_synth/wire = new /datum/matter_synth/wire()
	synths += wire

	var/obj/item/stack/nanopaste/N = new /obj/item/stack/nanopaste(src)
	N.uses_charge = 1
	N.charge_costs = list(1000)
	N.synths = list(nanite)
	src.modules += N

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)
	C.synths = list(wire)
	src.modules += C
	..()

/obj/item/weapon/robot_module/robot/engineering/engiedog
	name = "Construction Hound module"
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/engineering/engiedog/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/borg/sight/meson(src)
	src.modules += new /obj/item/weapon/weldingtool/electric/mounted/cyborg(src)
	src.modules += new /obj/item/weapon/tool/screwdriver/cyborg(src)
	src.modules += new /obj/item/weapon/tool/wrench/cyborg(src)
	src.modules += new /obj/item/weapon/tool/wirecutters/cyborg(src)
	src.modules += new /obj/item/device/multitool(src)
	src.modules += new /obj/item/device/t_scanner(src)
	src.modules += new /obj/item/device/analyzer(src)
	src.modules += new /obj/item/device/geiger(src)
	src.modules += new /obj/item/taperoll/engineering(src)
	src.modules += new /obj/item/weapon/inflatable_dispenser/robot(src)
	src.modules += new /obj/item/weapon/gripper/no_use/loader(src)
	src.modules += new /obj/item/weapon/pickaxe(src)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	//src.modules += new /obj/item/device/dogborg/boop_module(src)
	src.modules += new /obj/item/weapon/gripper(src)
	src.modules += new /obj/item/weapon/gripper/circuit(src)
	// The RPD does the exact same thing, this just take space.
	//src.modules += new /obj/item/device/pipe_painter(src)
	src.modules += new /obj/item/device/floor_painter(src)
	src.modules += new /obj/item/weapon/rms(src)
	src.modules += new /obj/item/weapon/pipe_dispenser(src)
	src.emag 	 = new /obj/item/weapon/dogborg/pounce(src)

	//Painfully slow charger regen but high capacity. Also starts with low amount.
	var/datum/matter_synth/metal = new /datum/matter_synth/metal()
	metal.name = "Steel reserves"
	metal.recharge_rate = 500
	metal.max_energy = 50000
	metal.energy = 10000
	var/datum/matter_synth/glass = new /datum/matter_synth/glass()
	glass.name = "Glass reserves"
	glass.recharge_rate = 500
	glass.max_energy = 50000
	glass.energy = 10000
	var/datum/matter_synth/wood = new /datum/matter_synth/wood()
	wood.name = "Wood reserves"
	wood.recharge_rate = 500
	wood.max_energy = 50000
	wood.energy = 10000
	var/datum/matter_synth/plastic = new /datum/matter_synth/plastic()
	plastic.name = "Plastic reserves"
	plastic.recharge_rate = 500
	plastic.max_energy = 50000
	plastic.energy = 10000
	var/datum/matter_synth/plasteel = new /datum/matter_synth/plasteel()
	plasteel.name = "Plasteel reserves"// Adding plasteel synthesizer to move in-line with Engiborg.
	plasteel.recharge_rate = 250
	plasteel.max_energy = 20000
	plasteel.energy = 10000
	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water

	var/datum/matter_synth/wire = new /datum/matter_synth/wire()
	synths += metal
	synths += glass
	synths += wood
	synths += plastic
	synths += wire
	synths += water
	synths += plasteel

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/lightreplacer/dogborg/LR = new /obj/item/device/lightreplacer/dogborg(src)
	LR.glass = glass
	src.modules += LR

	var/obj/item/device/dogborg/sleeper/compactor/decompiler/MD = new /obj/item/device/dogborg/sleeper/compactor/decompiler(src)
	MD.metal = metal
	MD.glass = glass
	MD.wood = wood
	MD.plastic = plastic
	MD.water = water
	src.modules += MD

	var/obj/item/stack/material/cyborg/steel/M = new (src)
	M.synths = list(metal)
	src.modules += M

	var/obj/item/stack/material/cyborg/glass/G = new (src)
	G.synths = list(glass)
	src.modules += G

	var/obj/item/stack/rods/cyborg/RD = new /obj/item/stack/rods/cyborg(src)
	RD.synths = list(metal)
	src.modules += RD

	var/obj/item/stack/cable_coil/cyborg/C = new /obj/item/stack/cable_coil/cyborg(src)
	C.synths = list(wire)
	src.modules += C

	var/obj/item/stack/tile/floor/cyborg/S = new /obj/item/stack/tile/floor/cyborg(src)
	S.synths = list(metal)
	src.modules += S

	var/obj/item/stack/material/cyborg/glass/reinforced/RG = new (src)
	RG.synths = list(metal, glass)
	src.modules += RG

	var/obj/item/stack/tile/wood/cyborg/WT = new /obj/item/stack/tile/wood/cyborg(src)
	WT.synths = list(wood)
	src.modules += WT

	var/obj/item/stack/material/cyborg/wood/W = new (src)
	W.synths = list(wood)
	src.modules += W

	var/obj/item/stack/material/cyborg/plastic/PL = new (src)
	PL.synths = list(plastic)
	src.modules += PL

	var/obj/item/stack/material/cyborg/plasteel/PS = new (src)
	PS.synths = list(plasteel)
	src.modules += PS
	..()

// Uses modified K9 sprites.
/obj/item/weapon/robot_module/robot/clerical/butler/brodog
	name = "service-hound module"
	can_be_pushed = 0

// In a nutshell, basically service/butler robot but in dog form. - Port from CitadelRP
/obj/item/weapon/robot_module/robot/clerical/butler/brodog/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/weapon/gripper/service(src)
	src.modules += new /obj/item/weapon/reagent_containers/glass/bucket(src)
	src.modules += new /obj/item/weapon/material/minihoe(src)
	src.modules += new /obj/item/weapon/material/knife/machete/hatchet(src)
	src.modules += new /obj/item/device/analyzer/plant_analyzer(src)
	src.modules += new /obj/item/weapon/storage/bag/dogborg(src)
	src.modules += new /obj/item/weapon/robot_harvester(src)
	src.modules += new /obj/item/weapon/material/knife(src)
	src.modules += new /obj/item/weapon/material/kitchen/rollingpin(src)
	src.modules += new /obj/item/device/multitool(src) //to freeze trays
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	//src.modules += new /obj/item/device/dogborg/boop_module(src)
	src.emag 	 = new /obj/item/weapon/dogborg/pounce(src) //Pounce

	var/datum/matter_synth/water = new /datum/matter_synth(500) // buffy fix, was 0
	water.name = "Water reserves"
	water.recharge_rate = 0
	water.max_energy = 1000
	R.water_res = water
	synths += water


	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/weapon/rsf/M = new /obj/item/weapon/rsf(src)
	M.stored_matter = 30
	src.modules += M

	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src)

	var/obj/item/weapon/flame/lighter/zippo/L = new /obj/item/weapon/flame/lighter/zippo(src)
	L.lit = 1
	src.modules += L

	src.modules += new /obj/item/weapon/tray/robotray(src)
	src.modules += new /obj/item/weapon/reagent_containers/borghypo/service(src)

/* // I don't know what kind of sleeper to put here, but also no need if you already have "Robot Nom" verb. - revisit later
	var/obj/item/device/dogborg/sleeper/K9/B = new /obj/item/device/dogborg/sleeper/K9(src)
	B.water = water
	src.modules += B
*/
	..()

/obj/item/weapon/robot_module/robot/miner/kmine
	name = "Supply Hound Module"
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/miner/kmine/New(var/mob/living/silicon/robot/R)
	src.modules += new /obj/item/borg/sight/material(src)
	src.modules += new /obj/item/weapon/tool/wrench/cyborg(src)
	src.modules += new /obj/item/weapon/tool/screwdriver/cyborg(src)
	src.modules += new /obj/item/weapon/storage/bag/ore(src)
	src.modules += new /obj/item/weapon/pickaxe/borgdrill(src)
	src.modules += new /obj/item/weapon/storage/bag/sheetsnatcher/borg(src)
	src.modules += new /obj/item/weapon/gripper/miner(src)
	src.modules += new /obj/item/weapon/mining_scanner(src)
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	// New Emag gear for the minebots!
	src.emag = new /obj/item/weapon/kinetic_crusher/machete/dagger(src)

	// No reason for these, upgrade modules replace them.
	//src.emag = new /obj/item/weapon/pickaxe/plasmacutter(src)
	//src.emag = new /obj/item/weapon/pickaxe/diamonddrill(src)

	var/datum/matter_synth/water = new /datum/matter_synth(500)
	water.name = "Water reserves"
	water.recharge_rate = 0
	R.water_res = water
	synths += water

	var/obj/item/device/dogborg/tongue/T = new /obj/item/device/dogborg/tongue(src)
	T.water = water
	src.modules += T

	var/obj/item/device/dogborg/sleeper/B = new /obj/item/device/dogborg/sleeper/compactor/supply(src)
	B.water = water
	src.modules += B

	..()

/obj/item/weapon/robot_module/robot/clerical/butler/booze
	name = "BoozeHound robot module"
	can_be_pushed = 0

/obj/item/weapon/robot_module/robot/clerical/butler/booze/New(var/mob/living/silicon/robot/R)
	..()
	src.modules += new /obj/item/weapon/gripper/service(src)
	//src.modules += new /obj/item/weapon/reagent_containers/glass/bucket(src)
	//src.modules += new /obj/item/weapon/material/minihoe(src)
	//src.modules += new /obj/item/device/analyzer/plant_analyzer(src)
	//src.modules += new /obj/item/weapon/storage/bag/plants(src)
	//src.modules += new /obj/item/weapon/robot_harvester(src)
	src.modules += new /obj/item/weapon/material/knife(src)
	src.modules += new /obj/item/weapon/material/kitchen/rollingpin(src)
	src.modules += new /obj/item/device/multitool(src) //to freeze trays
	src.modules += new /obj/item/weapon/dogborg/jaws/small(src)
	src.modules += new /obj/item/weapon/tray/robotray
	//src.modules += new /obj/item/device/dogborg/boop_module(src)
	src.modules += new /obj/item/device/dogborg/sleeper/compactor/brewer(src)
	src.emag 	 = new /obj/item/weapon/dogborg/pounce(src)
	//R.verbs += /mob/living/silicon/robot/proc/reskin_booze

	var/obj/item/weapon/rsf/M = new /obj/item/weapon/rsf(src)
	M.stored_matter = 30
	src.modules += M

	src.modules += new /obj/item/weapon/reagent_containers/dropper/industrial(src)

	var/obj/item/weapon/flame/lighter/zippo/L = new /obj/item/weapon/flame/lighter/zippo(src)
	L.lit = 1
	src.modules += L

	src.modules += new /obj/item/weapon/tray/robotray(src)
	src.modules += new /obj/item/weapon/reagent_containers/borghypo/service(src)
	..()

/obj/item/weapon/robot_module/robot/clerical/butler/booze/respawn_consumable(var/mob/living/silicon/robot/R, var/amount)
	var/obj/item/weapon/reagent_containers/food/condiment/enzyme/E = locate() in src.modules
	E.reagents.add_reagent("enzyme", 2 * amount)
