/datum/species/tajara
	name = "\improper Tajara"
	plural_form = "Tajaran"
	id = SPECIES_TAJARA
	examine_limb_id = SPECIES_TAJARA

	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_CATLIKE_GRACE,
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	coldmod = 0.67
	heatmod = 1.33
	payday_modifier = 0.9
	species_language_holder = /datum/language_holder/tajara

	// Mutant organs are temp; will replace with proper tajara variants later

	mutant_organs = list(
		/obj/item/organ/tail/tajara = "Plain",
	)

	mutantbrain = /obj/item/organ/brain/tajara
	mutanttongue = /obj/item/organ/tongue/tajara
	mutantears = /obj/item/organ/ears/tajara
	mutanteyes = /obj/item/organ/eyes/night_vision/tajara
	meat = /obj/item/food/meat/slab/human/mutant/tajara
	skinned_type = /obj/item/stack/sheet/animalhide/carbon/tajara
	exotic_bloodtype = /datum/blood_type/tajara

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/tajara,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/tajara,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/tajara,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/tajara,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/tajara,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/tajara,
	)


/datum/species/tajara/prepare_human_for_preview(mob/living/carbon/human/tajara)
	tajara.dna.features[FEATURE_MUTANT_COLOR] = "#707070"
	tajara.set_eye_color(COLOR_GREEN)
	//tajara.set_haircolor("#bb9966", update = FALSE) // brown
	//tajara.set_hairstyle("Business Hair", update = TRUE)
	tajara.update_body(is_creating = TRUE)

/datum/species/tajara/get_scream_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == MALE)
		if(prob(1))
			return 'sound/mobs/humanoids/human/scream/wilhelm_scream.ogg'
		return pick(
			'sound/mobs/humanoids/human/scream/malescream_1.ogg',
			'sound/mobs/humanoids/human/scream/malescream_2.ogg',
			'sound/mobs/humanoids/human/scream/malescream_3.ogg',
			'sound/mobs/humanoids/human/scream/malescream_4.ogg',
			'sound/mobs/humanoids/human/scream/malescream_5.ogg',
			'sound/mobs/humanoids/human/scream/malescream_6.ogg',
		)

	return pick(
		'sound/mobs/humanoids/human/scream/femalescream_1.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_2.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_3.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_4.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_5.ogg',
	)

/datum/species/tajara/get_cough_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)

/datum/species/tajara/get_cry_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/tajara/get_sneeze_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'

/datum/species/tajara/get_laugh_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == FEMALE)
		return 'sound/mobs/humanoids/human/laugh/womanlaugh.ogg'
	return pick(
		'sound/mobs/humanoids/human/laugh/manlaugh1.ogg',
		'sound/mobs/humanoids/human/laugh/manlaugh2.ogg',
	)

/datum/species/tajara/get_sigh_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/tajara/get_sniff_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/tajara/get_snore_sound(mob/living/carbon/human/tajara)
	if(tajara.physique == FEMALE)
		return SFX_SNORE_FEMALE
	return SFX_SNORE_MALE

/datum/species/tajara/get_hiss_sound(mob/living/carbon/human/tajara)
	return 'sound/mobs/humanoids/human/hiss/human_hiss.ogg'

/datum/species/tajara/get_physical_attributes()
	return "Tajaran withstand low temperatures better than most species thanks to their thick fur. \
		However, they are also very vulnerable to heat. Better stay away from fires!"

/datum/species/tajara/get_species_description()
	return "The Tajaran are feline humanoids hailing from Adhomai in the binary S'rendarr star system. \
		Their history full of unrest and oppression, they yet survive to thrive."

/datum/species/tajara/get_species_lore()
	return list(
		"LORE, \
		AND LORE. \
		AND LORE AGAIN.",

		"LORE \
		MORE LORE. \
		AND LORE ONCE MORE.",

		"LORE STILL. \
		LORE'S LEFT; \
		MUCH LORE TO GAIN.",

		"LORE'S DONE: \
		TIME FOR, \
		A LORE ENCORE.",
	)

/datum/species/tajara/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "thermometer-empty",
		SPECIES_PERK_NAME = "Thick Fur",
		SPECIES_PERK_DESC = "The Tajaran's fur grants them higher tolerance for low temperatures, but lower \
			tolerance for high temperatures, and especially fires. Moreover, tajaran typically prefer looser \
			and lighter clothing to stay comfortable in the station's, from their perspective, warm climate.",
	))

	return to_add
