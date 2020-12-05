var/list/playerpowers = list(/datum/power/changeling/arm_blade, /datum/power/changeling/darksight, /datum/power/changeling/extractdnaplayer, /datum/power/changeling/metaextractdna, \
						     /datum/power/changeling/player_transform, /datum/power/changeling/fleshmend, /datum/power/changeling/panacea, /datum/power/changeling/rapid_regen, \
						     /datum/power/changeling/endoarmor, /datum/power/changeling/EngorgedGlands, /datum/power/changeling/self_respiration, /datum/power/changeling/space_suit, \
						     /datum/power/changeling/visible_camouflage, /datum/power/changeling/recursive_enhancement)
var/list/datum/power/changeling/playerpowerinstances = list()


/mob/proc/make_playable_changeling()

	if(!mind)				return
	if(!mind.changeling)	mind.changeling = new /datum/changeling(gender)

	// add_language("Changeling")

	var/lesser_form = !ishuman(src)

	if(!powerinstances.len)
		for(var/P in powers)
			powerinstances += new P()

	if(!playerpowerinstances.len)
		for(var/P in playerpowers)
			playerpowerinstances += new P()

	// Code to auto-purchase powers.
	for(var/datum/power/changeling/P in playerpowerinstances)
		if(!(P in mind.changeling.purchased_powers)) // Do we not have it already?
			if(P.genomecost)
				mind.changeling.geneticpoints += P.genomecost
			mind.changeling.purchasePower(mind, P.name, 0)// Purchase it. Don't remake our verbs, we're doing it after this.

	for(var/datum/power/changeling/P in mind.changeling.purchased_powers)
		if(P.isVerb)
			if(lesser_form && !P.allowduringlesserform)	continue
			if(!(P in src.verbs))
				verbs.Add(P.verbpath)
			if(P.make_hud_button)
				if(!src.ability_master)
					src.ability_master = new /obj/screen/movable/ability_master(src)
				src.ability_master.add_ling_ability(
					object_given = src,
					verb_given = P.verbpath,
					name_given = P.name,
					ability_icon_given = P.ability_icon_state,
					arguments = list()
					)

	for(var/language in languages)
		mind.changeling.absorbed_languages |= language

	var/mob/living/carbon/human/H = src
	if(istype(H))
		var/datum/absorbed_dna/newDNA = new(H.real_name, H.dna, H.species.name, H.languages, H.identifying_gender, H.flavor_texts)
		absorbDNA(newDNA)

	return 1


/datum/power/changeling/extractdnaplayer
	name = "Custom Extract DNA"
	desc = "We stealthily sting a target and extract the DNA from them."
	helptext = "Will give you the DNA of your target, allowing you to transform into them."
	ability_icon_state = "ling_sting_extract"
	genomecost = 100
	allowduringlesserform = 1
	verbpath = /mob/proc/changeling_player_extract_dna_sting


/mob/proc/changeling_player_extract_dna_sting()
	set category = "Changeling"
	set name = "Extract DNA Sting (20)"
	set desc="Stealthily sting a target to extract their DNA."

	var/datum/changeling/changeling = null
	if(src.mind && src.mind.changeling)
		changeling = src.mind.changeling
	if(!changeling)
		return 0

	var/mob/living/carbon/human/T = changeling_sting(20, /mob/proc/changeling_player_extract_dna_sting)

	if(!T)
		return

	if(!istype(T) || T.isSynthetic())
		to_chat(src, "<span class='warning'>\The [T] is not compatible with our biology.</span>")
		return 0

	if(T.species.flags & NO_SCAN)
		to_chat(src, "<span class='warning'>We do not know how to parse this creature's DNA!</span>")
		return 0

	if(HUSK in T.mutations)
		to_chat(src, "<span class='warning'>This creature's DNA is ruined beyond useability!</span>")
		return 0

	var/datum/absorbed_dna/newDNA = new(T.real_name, T.dna, T.species.name, T.languages, T.identifying_gender, T.flavor_texts, T.modifiers)
	absorbDNA(newDNA)

	feedback_add_details("changeling_powers","ED")
	return 1


/datum/power/changeling/player_transform
	name = "Custom Transform"
	desc = "We take on the appearance and voice of one we have absorbed."
	ability_icon_state = "ling_transform"
	genomecost = 100
	verbpath = /mob/proc/changeling_player_transform


//Change our DNA to that of somebody we've absorbed.
/mob/proc/changeling_player_transform()
	set category = "Changeling"
	set name = "Transform (5)"

	var/datum/changeling/changeling = changeling_power(5,1,0)
	if(!changeling)	return

	if(!isturf(loc))
		to_chat(src, "<span class='warning'>Transforming here would be a bad idea.</span>")
		return 0

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in changeling.absorbed_dna)
		names += "[DNA.name]"

	var/S = input("Select the target DNA: ", "Target DNA", null) as null|anything in names
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = changeling.GetDNA(S)
	if(!chosen_dna)
		return

	changeling.chem_charges -= 5
	src.visible_message("<span class='warning'>[src] transforms!</span>")

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		var/newSpecies = chosen_dna.speciesName
		H.set_species(newSpecies,1)

	src.dna = chosen_dna.dna.Clone()
	src.dna.body_markings = deepCopyList(chosen_dna.dna.body_markings)

	src.dna.b_type = "AB+" //This is needed to avoid blood rejection bugs.  The fact that the blood type might not match up w/ records could be a *FEATURE* too.
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		H.b_type = "AB+" //For some reason we have two blood types on the mob.
		H.identifying_gender = chosen_dna.identifying_gender
		H.flavor_texts = chosen_dna.flavour_texts ? chosen_dna.flavour_texts.Copy() : null
		for(var/obj/item/organ/external/E in H.organs)
			E.markings = list()
	src.real_name = chosen_dna.name
	src.UpdateAppearance()
	domutcheck(src, null)
	changeling_update_languages(changeling.absorbed_languages)
	if(chosen_dna.genMods)
		var/mob/living/carbon/human/self = src
		for(var/datum/modifier/mod in self.modifiers)
			self.modifiers.Remove(mod.type)

		for(var/datum/modifier/mod in chosen_dna.genMods)
			self.modifiers.Add(mod.type)

	src.verbs -= /mob/proc/changeling_player_transform
	spawn(10)
		src.verbs += /mob/proc/changeling_player_transform
		src.regenerate_icons()

	feedback_add_details("changeling_powers","TR")
	return 1


/datum/power/changeling/metaextractdna
	name = "Meta Extract DNA"
	desc = "We stealthily use the DNA from a pre-stung target."
	helptext = "Will give you the DNA of a pre-stung target, allowing you to transform into them."
	ability_icon_state = "ling_sting_extract"
	genomecost = 100
	allowduringlesserform = 1
	verbpath = /mob/proc/meta_extract_dna_sting


/mob/proc/meta_extract_dna_sting()
	set category = "Changeling"
	set name = "Meta Extract DNA Sting (20)"
	set desc="Stealthily sting a target to extract their DNA."

	var/datum/changeling/changeling = null
	if(src.mind && src.mind.changeling)
		changeling = changeling_power(20)
	if(!changeling)
		return 0

	//Fun code
	var/picked_ckey = src.client.ckey
	var/picked_slot = src.client.prefs.default_slot
	var/mob/living/carbon/human/new_character
	var/spawnloc = get_turf(src)
	if(!spawnloc)
		to_chat(src, "Couldn't get valid spawn location.")
		return
	new_character = new(spawnloc)
	if(!new_character)
		to_chat(src, "Something went wrong and spawning failed.")
		return

	src.client.prefs.copy_to(new_character)
	if(new_character.dna)
		new_character.dna.ResetUIFrom(new_character)
		new_character.sync_organ_dna()
	if(new_character.mind)
		new_character.mind.loaded_from_ckey = picked_ckey
		new_character.mind.loaded_from_slot = picked_slot
	//A redraw for good measure
	new_character.update_icons_all()

	//Less fun code
	var/mob/living/carbon/human/T = new_character
	changeling.chem_charges -= 20

	if(!T)
		return

	if(!istype(T) || T.isSynthetic())
		to_chat(src, "<span class='warning'>\The [T] is not compatible with our biology.</span>")
		return 0

	if(T.species.flags & NO_SCAN)
		to_chat(src, "<span class='warning'>We do not know how to parse this creature's DNA!</span>")
		return 0

	if(HUSK in T.mutations)
		to_chat(src, "<span class='warning'>This creature's DNA is ruined beyond useability!</span>")
		return 0

	var/datum/absorbed_dna/newDNA = new(T.real_name, T.dna, T.species.name, T.languages, T.identifying_gender, T.flavor_texts, T.modifiers)
	absorbDNA(newDNA)
	qdel(new_character)

	src.verbs -= /mob/proc/meta_extract_dna_sting
	spawn(10)
		src.verbs += /mob/proc/meta_extract_dna_sting

	feedback_add_details("changeling_powers","ED")
	return 1