#define SET_OVERLAY_VALUE(overlay,variable,value) if(overlay) overlay.variable = value

/obj/item/bodypart/head/get_hair_and_lips_icon(dropped)
	RETURN_TYPE(/list)
	. = list()

	var/atom/location = loc || owner || src
	var/image_dir = null
	if (dropped)
		image_dir = SOUTH

	var/datum/sprite_accessory/sprite_accessory
	if(!facial_hair_hidden && lip_style && (head_flags & HEAD_LIPS))
		//not a sprite accessory, don't ask
		//Overlay
		var/image/lip_overlay = image('icons/mob/human/human_face.dmi', "lips_[lip_style]", -BODY_LAYER, dir = image_dir)
		lip_overlay.color = lip_color
		//Offsets
		worn_face_offset?.apply_offset(lip_overlay)
		. += lip_overlay

	var/image/facial_hair_overlay
	if(!facial_hair_hidden && facial_hairstyle && (head_flags & HEAD_FACIAL_HAIR))
		sprite_accessory = SSaccessories.all_facial_hairstyles_list[facial_hairstyle] // EREBUS EDIT -- original uses `SSaccessories.facial_hairstyles_list`
		if(sprite_accessory)
			//Overlay
			facial_hair_overlay = image(sprite_accessory.icon, sprite_accessory.icon_state, -HAIR_LAYER, dir = image_dir)
			facial_hair_overlay.alpha = facial_hair_alpha
			//Emissive blocker
			if(blocks_emissive != EMISSIVE_BLOCK_NONE)
				var/mutable_appearance/em_block = emissive_blocker(facial_hair_overlay.icon, facial_hair_overlay.icon_state, location, alpha = facial_hair_alpha)
				if (dropped)
					em_block = image(em_block, dir = SOUTH)
				facial_hair_overlay.overlays += em_block
			//Offsets
			worn_face_offset?.apply_offset(facial_hair_overlay)
			. += facial_hair_overlay
			//Gradients
			var/facial_hair_gradient_style = get_hair_gradient_style(GRADIENT_FACIAL_HAIR_KEY)
			if(facial_hair_gradient_style != "None")
				var/facial_hair_gradient_color = get_hair_gradient_color(GRADIENT_FACIAL_HAIR_KEY)
				var/image/facial_hair_gradient_overlay = get_gradient_overlay(icon(sprite_accessory.icon, sprite_accessory.icon_state), -HAIR_LAYER, SSaccessories.facial_hair_gradients_list[facial_hair_gradient_style], facial_hair_gradient_color, dropped)
				. += facial_hair_gradient_overlay

	var/list/all_hair_overlays = list()
	if(!(show_debrained && (head_flags & HEAD_DEBRAIN)) && !hair_hidden && hairstyle && (head_flags & HEAD_HAIR))
		var/datum/sprite_accessory/hair/hair_sprite_accessory = SSaccessories.all_hairstyles_list[hairstyle] // EREBUS EDIT -- original uses `SSaccessories.hairstyles_list`
		if(hair_sprite_accessory)
			//Hair masks
			var/icon/base_icon = icon(hair_sprite_accessory.getCachedIcon(hair_masks))
			//Overlay
			all_hair_overlays += image(base_icon, layer=-HAIR_LAYER, dir = image_dir)
			//If we have any hair appendages (ponytails, etc.) sticking out on a particular side, we need to add an additional hair layer to go above hats/helmets for the sides they stick out on
			if(LAZYLEN(hair_sprite_accessory.hair_appendages_outer))
				var/strictly_masked_zones = NONE
				for(var/datum/hair_mask/mask as anything in hair_masks)
					strictly_masked_zones |= mask.strict_coverage_zones
				for(var/appendage_icon_state in hair_sprite_accessory.hair_appendages_outer)
					var/appendage_zone = hair_sprite_accessory.hair_appendages_outer[appendage_icon_state]
					if(!(appendage_zone & strictly_masked_zones)) // if there are no strict masks in this zone
						all_hair_overlays += image(hair_sprite_accessory.icon, icon_state=appendage_icon_state, layer=-OUTER_HAIR_LAYER, dir = image_dir)
			for(var/image/hair_overlay as anything in all_hair_overlays)
				hair_overlay.alpha = hair_alpha
				hair_overlay.pixel_z = hair_sprite_accessory.y_offset
				//Emissive blocker
				if(blocks_emissive != EMISSIVE_BLOCK_NONE)
					var/mutable_appearance/em_block = emissive_blocker(hair_overlay.icon, hair_overlay.icon_state, location, alpha = hair_alpha)
					if (dropped)
						em_block = image(em_block, dir = SOUTH)
					hair_overlay.overlays += em_block
				//Offsets
				worn_face_offset?.apply_offset(hair_overlay)
				. += hair_overlay
				//Gradients
				var/hair_gradient_style = get_hair_gradient_style(GRADIENT_HAIR_KEY)
				if(hair_gradient_style != "None")
					var/hair_gradient_color = get_hair_gradient_color(GRADIENT_HAIR_KEY)
					var/image/hair_gradient_overlay = get_gradient_overlay(base_icon, hair_overlay.layer, SSaccessories.hair_gradients_list[hair_gradient_style], hair_gradient_color, dropped)
					hair_gradient_overlay.pixel_z = hair_sprite_accessory.y_offset
					. += hair_gradient_overlay

	if(show_debrained && (head_flags & HEAD_DEBRAIN))
		. += get_debrain_overlay(dropped)

	if(show_eyeless && (head_flags & HEAD_EYEHOLES))
		. += get_eyeless_overlay(dropped)

	//HAIR COLOR START
	if(override_hair_color)
		SET_OVERLAY_VALUE(facial_hair_overlay, color, override_hair_color)
		for(var/image/hair_overlay as anything in all_hair_overlays)
			SET_OVERLAY_VALUE(hair_overlay, color, override_hair_color)
	else if(fixed_hair_color)
		SET_OVERLAY_VALUE(facial_hair_overlay, color, fixed_hair_color)
		for(var/image/hair_overlay as anything in all_hair_overlays)
			SET_OVERLAY_VALUE(hair_overlay, color, fixed_hair_color)
	else
		SET_OVERLAY_VALUE(facial_hair_overlay, color, facial_hair_color)
		for(var/image/hair_overlay as anything in all_hair_overlays)
			SET_OVERLAY_VALUE(hair_overlay, color, hair_color)
	//HAIR COLOR END

	return .

#undef SET_OVERLAY_VALUE
