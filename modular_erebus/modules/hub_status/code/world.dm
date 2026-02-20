/world/update_status()

	var/list/features = list()

	if(LAZYACCESS(SSlag_switch.measures, DISABLE_NON_OBSJOBS))
		features += "closed"

	var/new_status = "<b>\[SS13.RU\] "
	var/hostedby
	if(config)
		var/server_name = CONFIG_GET(string/servername)
		if(server_name)
			new_status += "[server_name] &#8212; "
		if(CONFIG_GET(flag/allow_respawn))
			features += "respawn" // show "respawn" regardless of "respawn as char" or "free respawn"
		if(!CONFIG_GET(flag/allow_ai))
			features += "AI disabled"
		hostedby = CONFIG_GET(string/hostedby)

	if(SSmapping.current_map)
		new_status += "[SSmapping.current_map.map_path == CUSTOM_MAP_PATH ? "Uncharted Territory" : SSmapping.current_map.map_name] &#8212; "

	if(length(features))
		new_status += "[jointext(features, ", ")] &#8212; "

	new_status += "</b><a href=\"[CONFIG_GET(string/discord_link)]\">(Discord)</a>"

	new_status += "<br>[CONFIG_GET(string/hub_tagline1)]"
	if(hostedby)
		new_status += ", hosted by <b>[hostedby]</b>"
	new_status += "<br>[CONFIG_GET(string/hub_tagline2)]"

	var/players = GLOB.clients.len

	game_state = (CONFIG_GET(number/extreme_popcap) && players >= CONFIG_GET(number/extreme_popcap)) //tells the hub if we are full

	if(!SSticker || SSticker?.current_state == GAME_STATE_STARTUP)
		new_status += "<br><b>GAME STARTING</b>"
	else if(SSticker)
		if(SSticker.current_state == GAME_STATE_PREGAME && SSticker.GetTimeLeft() > 0)
			new_status += "<br>Round Starting: <b>[round((SSticker.GetTimeLeft())/10)]</b> seconds"
		else if(SSticker.current_state == GAME_STATE_SETTING_UP)
			new_status += "<br>Round Starting: <b>Now!</b>"
		else if(SSticker.IsRoundInProgress())
			new_status += "<br>Round Time: <b>[time2text(STATION_TIME_PASSED(), "hh:mm", NO_TIMEZONE)]</b>"
			if(SSshuttle?.emergency && SSshuttle?.emergency?.mode != (SHUTTLE_IDLE || SHUTTLE_ENDGAME))
				new_status += " | Shuttle: <b>[SSshuttle.emergency.getModeStr()] [SSshuttle.emergency.getTimerStr()]</b>"
		else if(SSticker.current_state == GAME_STATE_FINISHED)
			new_status += "<br><b>GAME RESTARTING</b>"

	status = new_status
