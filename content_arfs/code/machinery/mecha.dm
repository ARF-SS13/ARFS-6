/obj/mecha/working/hoverpod/shuttlecraft/drake/Initialize() //Loaded version with gans
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/sleeper
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/sleeper
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/crisis_drone
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/storage/bluespace
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/energy/taser
	ME.attach(src)
