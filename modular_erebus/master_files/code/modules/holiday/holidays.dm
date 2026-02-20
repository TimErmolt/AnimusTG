/datum/holiday/draconic_day
	name = "Unathi Language Day"

/datum/holiday/draconic_day/greet()
	return "On this day, the Unathi celebrate their language, Sinta'unathi, with literature and other cultural works."

/datum/holiday/draconic_day/getStationPrefix()
	return pick("Sinta'unathi", "Unathi", "Literature", "Reading")
