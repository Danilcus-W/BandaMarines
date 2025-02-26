//this file left in for legacy support

/proc/carp_migration() // -- Darem
	//sleep(100)
	spawn(rand(300, 600)) //Delayed announcements to keep the crew on their toes.
		marine_announcement("Вблизи [MAIN_SHIP_NAME] обнаружены неизвестные биологические объекты, всем приготовиться.", "Биологическая угроза", 'sound/AI/commandreport.ogg')

/proc/lightsout(isEvent = 0, lightsoutAmount = 1,lightsoutRange = 25) //leave lightsoutAmount as 0 to break ALL lights
	if(isEvent)
		marine_announcement("В вашем секторе был зафиксирован электрический шторм, пожалуйста, устраните возможные электронные перегрузки.", "Электрический шторм")

	if(lightsoutAmount)
		return

	else
		for(var/obj/structure/machinery/power/apc/apc in GLOB.machines)
			apc.overload_lighting()

	return
