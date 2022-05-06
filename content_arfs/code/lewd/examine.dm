/mob/living/carbon/human/proc/GetGenitalExamine(var/datum/gender/T)
	var/list/msg
	for(var/genital in list("penis", "testicles", "vagina", "breasts", "anus"))
		if(dna.species.mutant_bodyparts[genital])
			var/datum/sprite_accessory/genital/G = GLOB.sprite_accessories[genital][dna.species.mutant_bodyparts[genital][MUTANT_INDEX_NAME]]
			if(G)
				if(!(G.is_hidden(src)))
					msg += "<span class='notice'>[T.he] has exposed genitals... <a href='?src=[REF(src)];lookup_info=genitals'>Look closer...</a></span>"
					break
	
	return msg