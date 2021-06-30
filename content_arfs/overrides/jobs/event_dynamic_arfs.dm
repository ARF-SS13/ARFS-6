/proc/number_active_with_role()
	var/list/active_with_role = list()
	active_with_role["Engineer"] = 0
	active_with_role["Medical"] = 0
	active_with_role["Security"] = 0
	active_with_role["Scientist"] = 0
	active_with_role["AI"] = 0
	active_with_role["Cyborg"] = 0
	active_with_role["Janitor"] = 0
	active_with_role["Gardener"] = 0



		active_with_role["Any"]++

		if(istype(M, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/R = M
			if(R.module)
				if(istype(R.module, /obj/item/weapon/robot_module/robot/engineering))
					active_with_role["Engineer"]++
				else if(istype(R.module, /obj/item/weapon/robot_module/robot/security))
					active_with_role["Security"]++
				else if(istype(R.module, /obj/item/weapon/robot_module/robot/medical))
					active_with_role["Medical"]++
				else if(istype(R.module, /obj/item/weapon/robot_module/robot/research))
					active_with_role["Scientist"]++

		if(M.mind.assigned_role in SSjob.get_job_titles_in_department(DEPARTMENT_ENGINEERING))
			active_with_role["Engineer"]++

		if(M.mind.assigned_role in SSjob.get_job_titles_in_department(DEPARTMENT_MEDICAL))
			active_with_role["Medical"]++

		if(M.mind.assigned_role in SSjob.get_job_titles_in_department(DEPARTMENT_SECURITY))
			active_with_role["Security"]++

		if(M.mind.assigned_role in SSjob.get_job_titles_in_department(DEPARTMENT_RESEARCH))
			active_with_role["Scientist"]++

		if(M.mind.assigned_role == "AI")
			active_with_role["AI"]++

		if(M.mind.assigned_role == "Cyborg")
			active_with_role["Cyborg"]++

     var/datum/job/janitor/JJ
        if((M.mind.assigned_role == JJ.title) || (M.mind.assigned_role in JJ.alt_titles))
            active_with_role["Janitor"]++

        var/datum/job/hydro/HJ
        if((M.mind.assigned_role == HJ.title) || (M.mind.assigned_role in HJ.alt_titles))
            active_with_role["Gardener"]++

	return active_with_role

//add jobs that should effect weight