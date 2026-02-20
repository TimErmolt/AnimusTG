/datum/species
	var/all_hairstyles
	var/male_hairstyles
	var/female_hairstyles
	var/all_facial_hairstyles
	var/male_facial_hairstyles
	var/female_facial_hairstyles

/datum/species/New()
	. = ..()
	all_hairstyles = SSaccessories.hairstyles_list
	male_hairstyles = SSaccessories.hairstyles_male_list
	female_hairstyles = SSaccessories.hairstyles_female_list
	all_facial_hairstyles = SSaccessories.facial_hairstyles_list
	male_facial_hairstyles = SSaccessories.facial_hairstyles_male_list
	female_facial_hairstyles = SSaccessories.facial_hairstyles_female_list

/datum/species/proc/random_hairstyle(gender)
	switch(gender)
		if(MALE)
			return pick(male_hairstyles)
		if(FEMALE)
			return pick(female_hairstyles)
		else
			return pick(all_hairstyles)

/datum/species/proc/random_facial_hairstyle(gender)
	switch(gender)
		if(MALE)
			return pick(male_facial_hairstyles)
		if(FEMALE)
			return pick(female_facial_hairstyles)
		else
			return pick(all_facial_hairstyles)
