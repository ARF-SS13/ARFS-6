/mob/living
	digestable = 1					// Can the mob be digested inside a belly?
	digest_leave_remains = 0		// Will this mob leave bones/skull/etc after the melty demise?
	allowmobvore = 0				// Will simplemobs attempt to eat the mob?
	showvoreprefs = 1				// Determines if the mechanical vore preferences button will be displayed on the mob or not.
	obj/belly/vore_selected			// Default to no vore capability.
	list/vore_organs = list()		// List of vore containers inside a mob
	absorbed = 0					// If a mob is absorbed into another
	weight = 137					// Weight for mobs for weightgain system
	weight_gain = 1 				// How fast you gain weight
	weight_loss = 0.5 				// How fast you lose weight
	vore_egg_type = "egg" 				// Default egg type.
	feral = 0 						// How feral the mob is, if at all. Does nothing for non xenochimera at the moment.
	revive_ready = REVIVING_READY	// Only used for creatures that have the xenochimera regen ability, so far.
	metabolism = 0.0015
	vore_taste = null				// What the character tastes like
	no_vore = 0 					// If the character/mob can vore.
	noisy = 0						// Toggle audible hunger.
	absorbing_prey = 0 				// Determines if the person is using the succubus drain or not. See station_special_abilities_vr.
	drain_finalized = 0				// Determines if the succubus drain will be KO'd/absorbed. Can be toggled on at any time.
	fuzzy = 1						// Preference toggle for sharp/fuzzy icon.
	tail_alt = 0					// Tail layer toggle.
	can_be_drop_prey = 0
	can_be_drop_pred = 1	// Mobs are pred by default.