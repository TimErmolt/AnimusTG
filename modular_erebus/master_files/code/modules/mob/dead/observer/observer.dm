/mob/dead/observer/update_icon(updates=ALL, new_form)
	. = ..()

	if(client) //We update our preferences in case they changed right before update_appearance was called.
		ghost_accs = client.prefs.read_preference(/datum/preference/choiced/ghost_accessories)
		ghost_others = client.prefs.read_preference(/datum/preference/choiced/ghost_others)

	if(hair_overlay)
		cut_overlay(hair_overlay)
		hair_overlay = null

	if(facial_hair_overlay)
		cut_overlay(facial_hair_overlay)
		facial_hair_overlay = null


	if(new_form)
		icon_state = new_form
		if(icon_state in GLOB.ghost_forms_with_directions_list)
			ghostimage_default.icon_state = new_form + "_nodir" //if this icon has dirs, the default ghostimage must use its nodir version or clients with the preference set to default sprites only will see the dirs
		else
			ghostimage_default.icon_state = new_form

	if((ghost_accs == GHOST_ACCS_DIR || ghost_accs == GHOST_ACCS_FULL) && (icon_state in GLOB.ghost_forms_with_directions_list)) //if this icon has dirs AND the client wants to show them, we make sure we update the dir on movement
		updatedir = 1
	else
		updatedir = 0 //stop updating the dir in case we want to show accessories with dirs on a ghost sprite without dirs
		setDir(2 )//reset the dir to its default so the sprites all properly align up

	if(ghost_accs == GHOST_ACCS_FULL && (icon_state in GLOB.ghost_forms_with_accessories_list)) //check if this form supports accessories and if the client wants to show them
		if(facial_hairstyle)
			var/datum/sprite_accessory/S = SSaccessories.all_facial_hairstyles_list[facial_hairstyle] // EREBUS EDIT -- original uses `SSaccessories.facial_hairstyles_list`
			if(S)
				facial_hair_overlay = mutable_appearance(S.icon, "[S.icon_state]", -HAIR_LAYER)
				if(facial_hair_color)
					facial_hair_overlay.color = facial_hair_color
				facial_hair_overlay.alpha = 200
				add_overlay(facial_hair_overlay)
		if(hairstyle)
			var/datum/sprite_accessory/hair/S = SSaccessories.all_hairstyles_list[hairstyle] // EREBUS EDIT -- original uses `SSaccessories.hairstyles_list`
			if(S)
				hair_overlay = mutable_appearance(S.icon, "[S.icon_state]", -HAIR_LAYER)
				if(hair_color)
					hair_overlay.color = hair_color
				hair_overlay.alpha = 200
				hair_overlay.pixel_z = S.y_offset
				add_overlay(hair_overlay)
