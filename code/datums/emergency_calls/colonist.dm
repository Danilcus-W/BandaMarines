

//Blank colonist ERT for admin stuff.
/datum/emergency_call/colonist
	name = "Colonists"
	mob_max = 8
	mob_min = 1
	arrival_message = "'Говор-*7%@\[НЕ РАСШИФРОВАНО\]то... ...#$#- с ко-\[НЕ РАСШИФРОВАНО\] Мы... ...\[НЕ РАСШИФРОВАНО\].'"
	objectives = "Выполняйте отданные вам приказы."
	probability = 0
	var/preset = /datum/equipment_preset/colonist


/datum/emergency_call/colonist/create_member(datum/mind/M, turf/override_spawn_loc) //Blank ERT with only basic items.
	set waitfor = 0
	var/turf/T = override_spawn_loc ? override_spawn_loc : get_spawn_point()

	if(!istype(T))
		return FALSE

	var/mob/living/carbon/human/H = new(T)
	M.transfer_to(H, TRUE)
	arm_equipment(H, preset, TRUE, TRUE)

	sleep(20)
	if(H && H.loc)
		to_chat(H, SPAN_ROLE_HEADER("You are a colonist!"))
		to_chat(H, SPAN_ROLE_BODY("You have been put into the game by a staff member. Please follow all staff instructions."))

/datum/emergency_call/colonist/engineers
	name = "Colonists - Engineers"
	preset = /datum/equipment_preset/colonist/engineer

/datum/emergency_call/colonist/security
	name = "Colonists - Security"
	preset = /datum/equipment_preset/colonist/security

/datum/emergency_call/colonist/doctors
	name = "Colonists - Doctors"
	preset = /datum/equipment_preset/colonist/doctor
