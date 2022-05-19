// Author: GremlingSS
// Edits made: ooc.dm, new_player/login.dm SQL/age_gate.sql
// 
// Adds in age verification via discord. Must work with the bot from https://github.com/GremlingSS/Verification-Bot
// Ye.
// Laugh at the funny name of this framework. Minor-B-Gone. LAUGH DAMN YOU, LAUGH!!!!!!!!!!!!!

/client
	var/isVerified = 0  // 0 = banned/new player || 1 = Age verified, not discord linked || 2 = Discord & Age verified

/mob/new_player/new_player_panel_proc()
	if(my_client.isVerified != 2)
		return
	..()

/client/proc/MinorBGone()
	if(!config.MinorBGone)
		return 1
	
	if(!dbcon.IsConnected()) // Deny entry if there is no database connection.
		return 0
	
	if(check_rights(R_MOD|R_ADMIN|R_DEBUG)) // Staff are exempt, obviously.
		isVerified = 2 // add this here to make sure any checks will pass.
		return 1

	// Get the doots.
	var/DBQuery/query_discordLogin = dbcon.NewQuery("SELECT verified, discordcode FROM erro_agegate WHERE ckey = '[ckey]'")
	query_discordLogin.Execute()
	
	// NextRow() checks if we actually have another entry or even an entry to begin with.
	if(!query_discordLogin.NextRow()) // If there's no next row, it's a new player, check if they don't past the age verification prompt, if they do pass it successfully, retry this function again!
		if(!AgeVerifyPrompt())
			return 0
		else
			MinorBGone()

	// Get the values!!
	var/verified = text2num(query_discordLogin.item[1])
	var/discordCode = query_discordLogin.item[2]

	isVerified = verified // Stores the verification value in client/ if access is desired anywhere else.

	if(isVerified == 1) // Almost there! Just need to verify on discord!
		alert(src,"To complete your setup, please join our discord via this link: https://discord.gg/DymQ4ud    Please remember this code, it is important: [discordCode]")
		src << link("https://discord.gg/DymQ4ud")
		return 0

	if(isVerified == 2) // If we are actually verified, LET ME THROUGH BITCH.
		return 1

/client/proc/AgeVerifyPrompt()
	var/discordCode = copytext(md5(ckey),1,7) // This is a bit scuffed, but this gets your ckey, hashes it using MD5 algorithm
	// Hashing basically "encrypts" your data, in our case, we're using the ckey, and maybe I should apply a secret key to add 
	// alongside it which you can put in on the config but I cant be assed. ANYWAY, this just copies over the first 6 values of it.
	// We don't need this to be unique, as the ckey itself is unique so yea.

	var/ageString // Prompt the user to input their DoB.
	ageString = input(src,"Please enter your date of birth (dd-mm-yyyy) eg: (31-02-1995)", "Age verification") as text

	var/list/date = splittext(ageString, "-") // the split.

	if(date.len != 3) // If they entered something like 1-15-10-1595 like as if they're dumb or something idk. Must be 12-12-1111 in terms of input.
		alert(src,"Invalid input, please input it as the example.","Invalid Input")
		return AgeVerifyPrompt() // Re-do the Minor-B-Gone process.

	// Now that we've split the text, store each one for easy access into day, month and year.
	var/day = text2num(date[1])
	var/month = text2num(date[2])
	var/year = text2num(date[3])
	if(month > 12)
		alert(src,"Invalid month.","Invalid Input")
		return AgeVerifyPrompt() // Re-do the Minor-B-Gone process.
	
	// Get the current day, month and year.
	var/currentDay = text2num(time2text(world.realtime, "DD"))
	var/currentMonth = text2num(time2text(world.realtime, "MM"))
	var/currentYear = text2num(time2text(world.realtime, "YYYY"))

	if(year == currentYear) // Sometimes I smoothbrain and put the current year instead of my year of birth, this should reduce the amount of people entering it wrong.
		alert(src,"Invalid year.","Invalid Input")
		return AgeVerifyPrompt() // Re-do the Minor-B-Gone process.

	var/age = currentYear - year

	if(currentMonth >= month) // if we are at the age for this year or not.
		if((currentDay < day) && currentMonth == month) // scuffed, eh, cba.
			age--
	else
		age--

	if(age < 18) // Satisfaction. Minor has been gone'd
		// B
		// E
		// G
		// O
		// N
		// E
		
		// Because we havent gotten an entry, insert a new entry. But this one's bad, so set verified to 0.
		var/DBQuery/query = dbcon.NewQuery("INSERT INTO erro_agegate (ckey, discordcode, age, verified) VALUES('[ckey]', '[discordCode]', '[age]', '0')")
		query.Execute()

		log_and_message_admins("[ckey] has entered their age too low ([age]), now has been verified as 0 (MinorBGone WORKS). If this is a mistake, in discord, use the command /removeckey [ckey] to clear this entry.")
		return 0 // https://youtu.be/kV6mx-yHGJs


	// Because we havent gotten an entry, insert a new entry.
	var/DBQuery/query = dbcon.NewQuery("INSERT INTO erro_agegate (ckey, discordcode, age, verified) VALUES('[ckey]', '[discordCode]', '[age]', '1')")
	
	if(!query.Execute()) // If this fails, god have mercy, PLEASE
		var/err = query.ErrorMsg()
		log_and_message_admins("SQL ERROR during first player login. Error : \[[err]\]\n")
	
	log_and_message_admins("[ckey] has done first stage verification. Expected to join discord now.")
	return 1


// Config!

/datum/configuration
	var/MinorBGone = 0

/datum/configuration/load(filename, type = "config") //the type can also be game_options, in which case it uses a different switch. not making it separate to not copypaste code - Urist
	var/list/Lines = file2list(filename)

	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null

		if (pos)
			name = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			name = lowertext(t)

		if (!name)
			continue

		if(type == "config")
			switch (name)
				if ("minorbgone")
					config.MinorBGone = 1
		..()