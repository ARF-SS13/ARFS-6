var/global/list/genitals_styles_list = list()	// Stores /datum/sprite_accessory/genitals indexed by type

/mob/living/carbon/human/proc/GetGenitalExamine(var/datum/gender/T)
	var/list/msg
	for(var/genital in list(penis, testicles, vagina, breasts, anus))
		if(genital)
			if(!(genital.is_hidden(src)))
				msg += "<span class='notice'>[T.he] has exposed genitals... <a href='?src=[REF(src)];lookup_info=genitals'>Look closer...</a></span>"
				break
	
	return msg