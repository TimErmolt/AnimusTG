/obj/structure/mirror/change_beard(mob/living/carbon/human/beard_dresser)
	if(beard_dresser.physique == FEMALE)
		if(beard_dresser.facial_hairstyle == "Shaved")
			balloon_alert(beard_dresser, "nothing to shave!")
			return
		var/shave_beard = tgui_alert(beard_dresser, "Shave your beard?", "Grooming", list("Yes", "No"))
		if(shave_beard == "Yes" && can_use_mirror(beard_dresser))
			beard_dresser.set_facial_hairstyle("Shaved", update = TRUE)
		return

	var/new_style = tgui_input_list(beard_dresser, "Select a facial hairstyle", "Grooming", beard_dresser.dna.species.all_facial_hairstyles) // EREBUS EDIT -- original uses `SSaccessories.facial_hairstyles_list`

	if(isnull(new_style) || !can_use_mirror(beard_dresser))
		return

	if(HAS_TRAIT(beard_dresser, TRAIT_SHAVED))
		to_chat(beard_dresser, span_notice("If only growing back facial hair were that easy for you... The reminder makes you feel terrible."))
		beard_dresser.add_mood_event("bald_hair_day", /datum/mood_event/bald_reminder)
		return

	beard_dresser.set_facial_hairstyle(new_style, update = TRUE)

/obj/structure/mirror/change_hair(mob/living/carbon/human/hairdresser)
	var/new_style = tgui_input_list(hairdresser, "Select a hairstyle", "Grooming", hairdresser.dna.species.all_hairstyles) // EREBUS EDIT -- original uses `SSaccessories.hairstyles_list`
	if(isnull(new_style) || !can_use_mirror(hairdresser))
		return
	if(HAS_TRAIT(hairdresser, TRAIT_BALD))
		to_chat(hairdresser, span_notice("If only growing back hair were that easy for you... The reminder makes you feel terrible."))
		hairdresser.add_mood_event("bald_hair_day", /datum/mood_event/bald_reminder)
		return

	hairdresser.set_hairstyle(new_style, update = TRUE)

/obj/structure/mirror/magic/change_beard(mob/living/carbon/human/beard_dresser) // magical mirrors do nothing but give you the damn beard
	var/new_style = tgui_input_list(beard_dresser, "Select a facial hairstyle", "Grooming", beard_dresser.dna.species.all_facial_hairstyles) // EREBUS EDIT -- original uses `SSaccessories.facial_hairstyles_list`
	if(isnull(new_style) || !can_use_mirror(beard_dresser))
		return

	beard_dresser.set_facial_hairstyle(new_style, update = TRUE)
