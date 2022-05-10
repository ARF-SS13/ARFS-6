/datum/xeno_species
	var/species_name = "xenomorph"
	var/sub_name = "drone"
	var/size = MOB_MEDIUM
	var/default_size_mult = 1
	var/maxHealth = 100
	var/healthRegen = 5
	var/move_delay = 2 //Higher is slower. 2 is normal speed
	var/growth_max = 100 //Number of Life() procs before they can evolve
	var/evolves_into = list() //List of things this species can evolve into
	var/phoron_max = 100 //Amount of phoron_stored (mana) they have for abilities
	var/phoron_regen = 10 //Amount of phoron_stored regenerated per Life() while on weeds. Quartered while off weeds.
	var/move_sounds = X_SOUND_STEP
	var/move_sounds_vent = X_SOUND_STEP_VENT
	var/move_sounds_water = X_SOUND_STEP_WATER
	var/move_sounds_vol = 25
	var/move_sounds_range = 0 // How much farther away or closer than 7 this sound can be heard
	var/death_sounds = list('sound/voice/hiss6.ogg')
	var/talk_sounds = X_SOUND_TALK
	var/attack_sounds = X_SOUND_ATTACK_CLAW
	var/breath_sounds = X_SOUND_BREATHE
	var/breath_sounds_vol = 25
	var/breath_sounds_range = -3
	var/sneak_effectiveness = 2 //Divides sound range and volume by this much while walking/sneaking. Less than 1 will invert this effect. Don't do that.
	var/melee_damage = 20 //Average melee damage dealt. Varies up/down by 25%
	var/list/abilities = list(/mob/living/proc/ventcrawl)
	var/construct_color = "#39373D" //Color of weeds, walls, etc
	var/light_color = "#000000" //Color of the light that nodes give off
	var/body_color = "#000000" //Color of the xeno's bodies. Unused
	var/resin_sounds = X_SOUND_RESINBUILD

/datum/xeno_species/drone
	sub_name = "drone"
	sneak_effectiveness = 1.5
	growth_max = 250

/datum/xeno_species/hunter
	sub_name = "hunter"
	maxHealth = 150
	sneak_effectiveness = 2.5
	move_sounds_range = -2
	move_delay = 1.75
	growth_max = 0

/datum/xeno_species/sentinel
	sub_name = "sentinel"
	maxHealth = 125
	sneak_effectiveness = 1.75
	growth_max = 0

/datum/xeno_species/runner
	sub_name = "runner"
	maxHealth = 75
	sneak_effectiveness = 2.25
	move_sounds_range = -1
	move_delay = 1.5
	growth_max = 0

/datum/xeno_species/queen
	sub_name = "queen"
	maxHealth = 200
	sneak_effectiveness = 1.25
	list/abilities = list()
	move_sounds_range = 7
	default_size_mult = 2
	move_delay = 3
	growth_max = 0

/datum/xeno_species/hugger
	sub_name = "facehugger"
	maxHealth = 15
	death_sounds = list('sound/voice/hiss6.ogg')
	growth_max = 0

/datum/xeno_species/larva
	sub_name = "larva"
	maxHealth = 30
	growth_max = 100
