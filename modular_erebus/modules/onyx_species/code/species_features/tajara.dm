/datum/preference/choiced/hairstyle/tajara_hair
	savefile_key = "hairstyle_tajara_name"
	intended_species = list(/datum/species/tajara)

/datum/preference/choiced/hairstyle/tajara_hair/New()
	. = ..()
	hairstyles = SSaccessories.hairstyles_tajara_list

/datum/preference/choiced/facial_hairstyle/tajara_beard
	savefile_key = "facial_style_tajara_name"
	intended_species = list(/datum/species/tajara)

/datum/preference/choiced/facial_hairstyle/tajara_beard/New()
	. = ..()
	facial_hairstyles = SSaccessories.facial_hairstyles_tajara_list

/datum/preference/choiced/species_feature/tail_tajara
	savefile_key = "feature_tajara_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	can_randomize = FALSE
	relevant_organ = /obj/item/organ/tail/tajara

/datum/preference/choiced/species_feature/tajara_ears
	savefile_key = "feature_tajara_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	can_randomize = FALSE
	relevant_organ = /obj/item/organ/ears/tajara
