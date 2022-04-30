/obj/machinery/button/retally
    name = "Engine Purge Button"
    desc = "Purges the engines of exhaust gasses to decrease their power consumption"
    var/area = null

/obj/machinery/button/retally/Initialize()
    . = ..()
    area = get_area(src)

/obj/machinery/light_switch/attack_hand(mob/user)
    area.retally_power()
    to_chat(user, "The engines whir as they eject waste gasses into space, before quieting down.");