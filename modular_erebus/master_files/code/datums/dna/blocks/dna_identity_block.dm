/datum/dna_block/identity/hair_style/create_unique_block(mob/living/carbon/human/target)
	return construct_block(SSaccessories.all_hairstyles_list.Find(target.hairstyle), length(SSaccessories.all_hairstyles_list)) // EREBUS EDIT -- original uses `SSaccessories.hairstyles_list`

/datum/dna_block/identity/hair_style/apply_to_mob(mob/living/carbon/human/target, dna_hash)
	if(HAS_TRAIT(target, TRAIT_BALD))
		target.set_hairstyle("Bald", update = FALSE)
		return
	var/style = SSaccessories.all_hairstyles_list[deconstruct_block(get_block(dna_hash), length(SSaccessories.all_hairstyles_list))] // EREBUS EDIT -- original uses `SSaccessories.hairstyles_list`
	target.set_hairstyle(style, update = FALSE)

/datum/dna_block/identity/facial_style/create_unique_block(mob/living/carbon/human/target)
	return construct_block(SSaccessories.all_facial_hairstyles_list.Find(target.facial_hairstyle), length(SSaccessories.all_facial_hairstyles_list)) // EREBUS EDIT -- original uses `SSaccessories.facial_hairstyles_list`

/datum/dna_block/identity/facial_style/apply_to_mob(mob/living/carbon/human/target, dna_hash)
	if(HAS_TRAIT(src, TRAIT_SHAVED))
		target.set_facial_hairstyle("Shaved", update = FALSE)
		return
	var/style = SSaccessories.all_facial_hairstyles_list[deconstruct_block(get_block(dna_hash), length(SSaccessories.all_facial_hairstyles_list))] // EREBUS EDIT -- original uses `SSaccessories.facial_hairstyles_list`
	target.set_facial_hairstyle(style, update = FALSE)
