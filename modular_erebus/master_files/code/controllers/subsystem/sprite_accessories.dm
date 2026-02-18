#define DEFAULT_SPRITE_LIST "default_sprites"

/// Use this to init a sprite accessory list for a feature where mobs are required to have one selected
#define INIT_ACCESSORY(sprite_accessory) init_sprite_accessory_subtypes(sprite_accessory, add_blank = FALSE)[DEFAULT_SPRITE_LIST]
/// Use this to init a sprite accessory list for a feature where mobs can opt to not have one selected
#define INIT_OPTIONAL_ACCESSORY(sprite_accessory) init_sprite_accessory_subtypes(sprite_accessory, add_blank = TRUE)[DEFAULT_SPRITE_LIST]

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()

	feature_list[FEATURE_EARS_TAJARA] = INIT_ACCESSORY(/datum/sprite_accessory/ears/tajara)
	feature_list[FEATURE_TAIL_TAJARA] = INIT_ACCESSORY(/datum/sprite_accessory/tails/tajara)
	//feature_list[FEATURE_SKRELL_HAIR] = INIT_ACCESSORY(/datum/sprite_accessory/skrell_hair)
	//feature_list[FEATURE_VOX_HAIR] = INIT_ACCESSORY(/datum/sprite_accessory/vox_hair)

#undef INIT_ACCESSORY
#undef INIT_OPTIONAL_ACCESSORY
#undef DEFAULT_SPRITE_LIST
