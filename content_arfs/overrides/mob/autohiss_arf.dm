//This override allows for replacing longer strings

#define AUTOHISS_OFF 0
#define AUTOHISS_BASIC 1
#define AUTOHISS_FULL 2

#define AUTOHISS_NUM 3

/datum/species/handle_autohiss(message, datum/language/lang, mode)
	if(!autohiss_basic_map)
		return message
	if(lang.flags & NO_STUTTER)		// Currently prevents EAL, Sign language, and emotes from autohissing
		return message
	if(autohiss_exempt && (lang.name in autohiss_exempt))
		return message

	var/map = autohiss_basic_map.Copy()
	if(mode == AUTOHISS_FULL && autohiss_extra_map)
		map |= autohiss_extra_map

	//Handle long autohiss entries (probably accents)
	var/list/long_map = list()
	for(var/T in map)
		if((length(T) || length(map[T])) > 1)//If either the values in the list are long bois, separate them
			long_map |= T
			long_map[T] = map[T]
			map -= T

	if(long_map.len)//long_map isn't empty
		for(var/LM in long_map)
			message = replacetext(message, "[LM]", "[pick(long_map[LM])]")//replace long bois

	. = list()

	while(length(message))
		var/min_index = 10000 // if the message is longer than this, the autohiss is the least of your problems
		var/min_char = null
		for(var/char in map)
			var/i = findtext(message, char)
			if(!i) // no more of this character anywhere in the string, don't even bother searching next time
				map -= char
			else if(i < min_index)
				min_index = i
				min_char = char
		if(!min_char) // we didn't find any of the mapping characters
			. += message
			break
		. += copytext(message, 1, min_index)
		if(copytext(message, min_index, min_index+1) == uppertext(min_char))
			switch(text2ascii(message, min_index+1))
				if(65 to 90) // A-Z, uppercase; uppercase R/S followed by another uppercase letter, uppercase the entire replacement string
					. += uppertext(pick(map[min_char]))
				else
					. += capitalize(pick(map[min_char]))
		else
			. += pick(map[min_char])
		message = copytext(message, min_index + 1)

	return jointext(., null)

#undef AUTOHISS_OFF
#undef AUTOHISS_BASIC
#undef AUTOHISS_FULL
#undef AUTOHISS_NUM
