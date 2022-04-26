/obj/machinery/power/smes/batteryrack/shuttle
	desc = "A rack of power cells working as a PSU. Made from a recycled Breaker Box frame. Seems to be set up for general shuttle use."
	mode = 3 // Input and output

/obj/machinery/power/smes/batteryrack/shuttle/add_parts()
	component_parts = list()
	component_parts += new /obj/item/weapon/circuitboard/batteryrack
	component_parts += new /obj/item/weapon/stock_parts/capacitor/super
	component_parts += new /obj/item/weapon/stock_parts/capacitor/super
	component_parts += new /obj/item/weapon/stock_parts/capacitor/super
	component_parts += new /obj/item/weapon/stock_parts/matter_bin/super

/obj/machinery/power/smes/batteryrack/shuttle/mapped
	var/cell_type = /obj/item/weapon/cell/super/
	var/cell_number = 6
	output_attempt = TRUE
	input_attempt = TRUE

/obj/machinery/power/smes/batteryrack/shuttle/mapped/Initialize()
	. = ..()
	for(var/i = 1 to cell_number)
		if(i > max_cells)
			break
		var/obj/item/weapon/cell/newcell = new cell_type(src.loc)
		insert_cell(newcell)