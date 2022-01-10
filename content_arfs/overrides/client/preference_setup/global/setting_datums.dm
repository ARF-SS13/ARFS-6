/datum/client_preference/eating_noises
	description = "Eating Noises"
	key = "EATING_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"
	enabled_by_default = FALSE
/datum/client_preference/digestion_noises
	description = "Digestion Noises"
	key = "DIGEST_NOISES"
	enabled_description = "Noisy"
	disabled_description = "Silent"
	enabled_by_default = FALSE

/datum/client_preference/debug/age_verified
	description = "(Debug) Age Verified Status"
	key = "AGE_VERIFIED"
	enabled_description = "TRUE"
	disabled_description = "FALSE"
	enabled_by_default = FALSE

/client/proc/toggle_age_verification()
	set name = "Toggle age verification status"
	set category = "Debug"
	set desc = "Toggles your age verified status."

	var/pref_path = /datum/client_preference/debug/age_verified

	toggle_preference(pref_path)

	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] be prompted to verify age.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAgeVerify") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
