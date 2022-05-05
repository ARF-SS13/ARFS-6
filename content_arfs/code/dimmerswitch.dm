// Author: Gremlingthing
// Adds in the possibility to adjust the brightness of the lights in a room via alt clicking a light switch.

// adds in 1 new line of code in code\modules\power\lighting.dm:440 where we multiply correct_power by the brightness value.

// correct_power = correct_power * get_area(src).light_brightness


/obj/machinery/light_switch
	var/brightness = 1

/area
	var/light_brightness = 1

/obj/machinery/light_switch/proc/SetBrightness(var/value)
	if(!value)
		return
	
	brightness += value

	if(value > 0) // positive value
		if(brightness > 1)
			brightness = 1
			return
	else
		if(brightness < -value) // Inverse of the value because we know it's in the negative.
			brightness = -value
			return

	// do code to update all brightness stuff here. Roger doger!

	for(var/obj/machinery/light_switch/LS in area)
		LS.brightness = brightness
	
	area.light_brightness = brightness

	//area.power_change() // Replaced by the for loop below, this causes lights to burn out.
	for(var/obj/machinery/light/L in area)
		L.update(FALSE) // False for it to not fucking DIE. It just destroys lights if you use the dimmer too much.

/obj/machinery/light_switch/examine(mob/user)
	. = ..()
	if(brightness != 1)
		. += "<span class='notice'>The dimming setting has been set to [brightness * 100].</span>"

/obj/machinery/light_switch/AltClick(var/mob/living/user)
	..()

	if(!istype(user) || user.incapacitated())
		return

	var/list/choices = list("brighten","dim")

	for(var/C in choices)
		LAZYSET(choices, C, new /image('content_arfs/icons/misc/dimmerswitch.dmi', C))

	var/choice = show_radial_menu(user, src, choices, radius = 14, require_near = TRUE)

	if(!choice)
		return FALSE

	switch(choice)
		if("brighten")
			SetBrightness(0.1)
		if("dim")
			SetBrightness(-0.1)



