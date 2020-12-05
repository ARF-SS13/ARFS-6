// Vending machine
/obj/machinery/vending/blue_lotus
	name = "Blue Lotus Produce Vender"
	desc = "Produce for all your cooking needs!"
	product_slogans = "Shop now and get frying!"
	icon_state = "lotus_machine"
	icon = 'content_arfs/icons/obj/vending.dmi'
	products = list(/obj/item/weapon/storage/box/produce/chili = 10, /obj/item/weapon/storage/box/produce/berries = 10,
	/obj/item/weapon/storage/box/produce/tomato = 10, /obj/item/weapon/storage/box/produce/eggplant = 10,
	/obj/item/weapon/storage/box/produce/apple = 10, /obj/item/weapon/storage/box/produce/mushrooms = 10,
	/obj/item/weapon/storage/box/produce/plumphelmet = 10, /obj/item/weapon/storage/box/produce/grapes = 10,
	/obj/item/weapon/storage/box/produce/lettuce = 10, /obj/item/weapon/storage/box/produce/peanut = 10,
	/obj/item/weapon/storage/box/produce/cabbage = 10, /obj/item/weapon/storage/box/produce/vanilla = 10,
	/obj/item/weapon/storage/box/produce/banana = 10, /obj/item/weapon/storage/box/produce/corn = 10,
	/obj/item/weapon/storage/box/produce/potato = 10, /obj/item/weapon/storage/box/produce/onion = 10,
	/obj/item/weapon/storage/box/produce/soybean = 10, /obj/item/weapon/storage/box/produce/wheat = 10,
	/obj/item/weapon/storage/box/produce/rice = 10, /obj/item/weapon/storage/box/produce/carrot = 10,
	/obj/item/weapon/storage/box/produce/sugarcane = 10, /obj/item/weapon/storage/box/produce/watermelon = 10,
	/obj/item/weapon/storage/box/produce/pumpkin = 10, /obj/item/weapon/storage/box/produce/lime = 10,
	/obj/item/weapon/storage/box/produce/lemon = 10, /obj/item/weapon/storage/box/produce/orange = 10,
	/obj/item/weapon/storage/box/produce/cocoa = 10, /obj/item/weapon/storage/box/produce/cherry = 10,
	/obj/item/weapon/storage/box/produce/poppies = 10, /obj/item/weapon/storage/box/produce/microm = 10,
	/obj/item/weapon/storage/box/produce/megam = 10, /obj/item/weapon/storage/box/produce/meat = 10,
	/obj/item/weapon/storage/box/produce/chicken = 10)
	prices = list(/obj/item/weapon/storage/box/produce/chili = 15, /obj/item/weapon/storage/box/produce/berries = 15,
	/obj/item/weapon/storage/box/produce/tomato = 15, /obj/item/weapon/storage/box/produce/eggplant = 15,
	/obj/item/weapon/storage/box/produce/apple = 15, /obj/item/weapon/storage/box/produce/mushrooms = 15,
	/obj/item/weapon/storage/box/produce/plumphelmet = 15, /obj/item/weapon/storage/box/produce/grapes = 15,
	/obj/item/weapon/storage/box/produce/lettuce = 15, /obj/item/weapon/storage/box/produce/peanut = 15,
	/obj/item/weapon/storage/box/produce/cabbage = 15, /obj/item/weapon/storage/box/produce/vanilla = 15,
	/obj/item/weapon/storage/box/produce/banana = 15, /obj/item/weapon/storage/box/produce/corn = 15,
	/obj/item/weapon/storage/box/produce/potato = 15, /obj/item/weapon/storage/box/produce/onion = 15,
	/obj/item/weapon/storage/box/produce/soybean = 15, /obj/item/weapon/storage/box/produce/wheat = 15,
	/obj/item/weapon/storage/box/produce/rice = 15, /obj/item/weapon/storage/box/produce/carrot = 15,
	/obj/item/weapon/storage/box/produce/sugarcane = 15, /obj/item/weapon/storage/box/produce/watermelon = 15,
	/obj/item/weapon/storage/box/produce/pumpkin = 15, /obj/item/weapon/storage/box/produce/lime = 15,
	/obj/item/weapon/storage/box/produce/lemon = 15, /obj/item/weapon/storage/box/produce/orange = 15,
	/obj/item/weapon/storage/box/produce/cocoa = 15, /obj/item/weapon/storage/box/produce/cherry = 15,
	/obj/item/weapon/storage/box/produce/poppies = 15, /obj/item/weapon/storage/box/produce/microm = 15,
	/obj/item/weapon/storage/box/produce/megam = 15, /obj/item/weapon/storage/box/produce/meat = 15,
	/obj/item/weapon/storage/box/produce/chicken = 15)

// Produce Box
/obj/item/weapon/storage/box/produce
    name = "box of produce"
    desc = "This one's empty"
    icon = 'content_arfs/icons/obj/vending.dmi'
    icon_state = "producebox"
    max_storage_space = ITEMSIZE_COST_NORMAL * 10
    max_w_class = ITEMSIZE_NORMAL
    var/plantamount = 10

/obj/item/weapon/storage/box/produce/Initialize()
    . = ..()
    max_storage_space = ITEMSIZE_COST_NORMAL * plantamount

// Misc
/obj/item/weapon/storage/box/produce/meat
    name = "meat produce box"
    desc = "A produce box containing meat. The label lists of facts like nutrence and shelf life. This box is good for about a few weeks."
    icon = 'content_arfs/icons/obj/vending.dmi'
    icon_state = "producebox"
    max_storage_space = ITEMSIZE_COST_NORMAL * 10
    max_w_class = ITEMSIZE_NORMAL
    starts_with = list(
        /obj/item/weapon/reagent_containers/food/snacks/meat = 10)

/obj/item/weapon/storage/box/produce/meat/Initialize()
    . = ..()
    desc = "A produce box containing meat. The label lists of facts like nutrence and shelf life. This box is good for about [rand(26,45)] days."

/obj/item/weapon/storage/box/produce/chicken
    name = "chicken produce box"
    starts_with = list(
        /obj/item/weapon/reagent_containers/food/snacks/meat/chicken = 10)

// Grown Food boxes
/obj/item/weapon/storage/box/produce
    chili
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/chili = 10)
        name = "chili"

    berries
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/berries = 10)
        name = "berries"

    tomato
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/tomato = 10)
        name = "tomato"

    eggplant
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/eggplant = 10)
        name = "eggplant"

    apple
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/apple = 10)
        name = "apple"

    mushrooms
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/mushrooms = 10)
        name = "mushrooms"

    plumphelmet
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/plumphelmet = 10)
        name = "plumphelmet"

    grapes
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/grapes = 10)
        name = "grapes"

    lettuce
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/lettuce = 10)
        name = "lettuce"

    peanut
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/peanut = 10)
        name = "peanut"

    cabbage
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/cabbage = 10)
        name = "cabbage"

    vanilla
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/vanilla = 10)
        name = "vanilla"

    banana
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/banana = 10)
        name = "banana"

    corn
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/corn = 10)
        name = "corn"

    potato
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/potato = 10)
        name = "potato"

    onion
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/onion = 10)
        name = "onion"

    soybean
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/soybean = 10)
        name = "soybean"

    wheat
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/wheat = 10)
        name = "wheat"

    rice
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/rice = 10)
        name = "rice"

    carrot
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/carrot = 10)
        name = "carrot"

    sugarcane
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/sugarcane = 10)
        name = "sugarcane"

    watermelon
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/watermelon = 10)
        name = "watermelon"

    pumpkin
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/pumpkin = 10)
        name = "pumpkin"

    lime
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/lime = 10)
        name = "lime"

    lemon
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/lemon = 10)
        name = "lemon"

    orange
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/orange = 10)
        name = "orange"

    cocoa
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/cocoa = 10)
        name = "cocoa"

    cherry
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/cherry = 10)
        name = "cherry"

    poppies
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/poppies = 10)
        name = "poppies"

    microm
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/microm = 2)
        plantamount = 2
        name = "Micro Mushrooms"

    megam
        starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/grown/megam = 2)
        plantamount = 2
        name = "Mega Mushrooms"

// Premade grown food list
/obj/item/weapon/reagent_containers/food/snacks/grown
    chili
        plantname = "chili"

    berries
        plantname = "berries"

    tomato
        plantname = "tomato"

    eggplant
        plantname = "eggplant"

    apple
        plantname = "apple"

    mushrooms
        plantname = "mushrooms"

    plumphelmet
        plantname = "plumphelmet"

    grapes
        plantname = "grapes"

    lettuce
        plantname = "lettuce"

    peanut
        plantname = "peanut"

    cabbage
        plantname = "cabbage"

    vanilla
        plantname = "vanilla"

    banana
        plantname = "banana"

    corn
        plantname = "corn"

    potato
        plantname = "potato"

    onion
        plantname = "onion"

    soybean
        plantname = "soybean"

    wheat
        plantname = "wheat"

    rice
        plantname = "rice"

    carrot
        plantname = "carrot"

    sugarcane
        plantname = "sugarcane"

    watermelon
        plantname = "watermelon"

    pumpkin
        plantname = "pumpkin"

    lime
        plantname = "lime"

    lemon
        plantname = "lemon"

    orange
        plantname = "orange"

    cocoa
        plantname = "cocoa"

    cherry
        plantname = "cherry"

    poppies
        plantname = "poppies"

    microm
        plantname = "microm"

    megam
        plantname = "megam"