#define LANGUAGE_POKEMON "Poke-Speak"

/datum/language/pokemon
	name = LANGUAGE_POKEMON
	desc = "The language spoken and understood by all Pokemon. Consists mostly of short syllables"
	speech_verb = "says"
	ask_verb = "asks"
	exclaim_verb = "exclaims"
	whisper_verb = "whispers"
	colour = "attack"
	key = "`"
	syllables = list(
		"pika", "chu", "dra", "tini", "vul", "pix", "zora", "glac", "eon", "ee", "vee",
		"quaza", "ray", "jol", "esp", "nite", "nair", "flaa", "ffy", "might", "yena", "pooch",
		"pony", "ta", "zu", "bat", "pin", "cer", "mag", "mar", "magi", "carp", "lap", "ras",
		"kabu", "to", "aero", "dac", "tyl", "licki", "tung", "cu", "bone", "snor", "lax",
		"mew", "two", "syl", "veon", "arti", "cuno"
	)

#define LANGUAGE_PSIONIC "Psionic Communication"

/datum/language/grey
	name = LANGUAGE_PSIONIC
	desc = "Grey Psionic communication"
	speech_verb = "says"
	whisper_verb = "whispers"
	colour = "psionic"
	key = "^"
	flags = HIVEMIND
	syllables = list("blah","blah","blah","bleh","meh","neh","nah","wah")