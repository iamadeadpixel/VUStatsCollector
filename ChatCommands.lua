---@class ChatCommands
ChatCommands = class 'ChatCommands'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** Player Chat mod loaded ***");
	end
end)



Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".session" then
		if playerdeaths[player.name] == nil then playerdeaths[player.name] = 0; end
		if playerdogtags[player.name] == nil then playerdogtags[player.name] = 0; end
		if playerheadshot[player.name] == nil then playerheadshot[player.name] = 0; end
		if playerkills[player.name] == nil then playerkills[player.name] = 0; end
		if playerrevivs[player.name] == nil then playerrevivs[player.name] = 0; end
		if playerscore[player.name] == nil then playerscore[player.name] = 0; end
		if playersuicides[player.name] == nil then playersuicides[player.name] = 0; end
		if playerteamkilled[player.name] == nil then playerteamkilled[player.name] = 0; end
		if kill_roadkills[player.name] == nil then kill_roadkills[player.name] = 0; end

		-- i am lazy, so, quick solution.
		chat_Deaths = playerdeaths[player.name]
		chat_Dogtags = playerdogtags[player.name]
		chat_Headshots = playerheadshot[player.name]
		chat_Kills = playerkills[player.name]
		chat_Revives = playerrevivs[player.name]
		chat_Score = playerscore[player.name]
		chat_Suicide = playersuicides[player.name]
		chat_TeamKilled = playerteamkilled[player.name]
		chat_roadkills = kill_roadkills[player.name]

		ChatManager:SendMessage("Fetching session data for " .. player.name, player)
		print("** Fetching session data for " .. player.name .. " **");
		print("** Player round results")
		print("** Player results:" ..player.name .. " - Score:" .. chat_Score .. " - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths)
		print("** Player results:" ..player.name .. " - Suicides:" .. chat_Suicide .." - Headshots:" .. chat_Headshots .. " - Teamkilled:" .. chat_TeamKilled)
		print("** Player results:" ..player.name .. " - Knife kills:" .. chat_Dogtags .. " - Revives:" ..chat_Revives .. " - Roadkills:" .. chat_roadkills)


		-- at here we use the chatmanager to print the content in chat.
		ChatManager:SendMessage("Score:" .. chat_Score .. " - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths,player)
		ChatManager:SendMessage("Suicides:" .. chat_Suicide .. " - Headshots:" .. chat_Headshots .. " - Teamkilled:" .. chat_TeamKilled,player)
		ChatManager:SendMessage("Knife kills:" .. chat_Dogtags .. " - Revives:" .. chat_Revives .. " - Roadkills:" .. chat_roadkills, player)

-- experimental, lets see if this works.
message="Players score results:" ..player.name .. " - Score:" .. chat_Score .. " - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths

print (message)

NetEvents:SendTo('showstats', player,message)


	end
end)

-- ------------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".playerstats" then
		ChatManager:SendMessage("Fetching all player stats for " .. player.name, player)
		print("** Fetching all stats for " .. player.name .. " **");

		-- Reading player session data
		CHATresults = SQL:Query('SELECT * FROM tbl_playerstats WHERE Soldiername = ?', player.name)
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end

		for _, l_Row in pairs(CHATresults) do
			chat_Soldiername = l_Row["Soldiername"]
			chat_Score = l_Row["Score"]
			chat_Kills = l_Row["Kills"]
			chat_Deaths = l_Row["Deaths"]
			chat_Suicide = l_Row["Suicide"]
			chat_Headshots = l_Row["Headshots"]
			chat_TeamKilled = l_Row["TeamKilled"]
			chat_Dogtags = l_Row["Dogtags"]
			chat_Revives = l_Row["Revives"]
			if chat_Soldiername == player.name then
				print("** Player total results")
				print("** Player results:"..chat_Soldiername .." - Score:" ..chat_Score .." - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths .. " - Suicides:" .. chat_Suicide)
				print("** Player results:"..chat_Soldiername .." - Headshots:" ..chat_Headshots .." - Teamkilled:" ..chat_TeamKilled .. " - Knife kills:" .. chat_Dogtags .. " - Revives:" .. chat_Revives)
				ChatManager:SendMessage("Score:" .. chat_Score .." - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths .. " - Suicides:" .. chat_Suicide, player)
				ChatManager:SendMessage("Headshots:" ..chat_Headshots .." - Teamkilled:" ..chat_TeamKilled .. " - Knife kills:" .. chat_Dogtags .. " - Revives:" .. chat_Revives,player)
			end
		end
	end
end)

-- ------------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".playerdata" then
		ChatManager:SendMessage("Fetching all player data for " .. player.name, player)
		print("** Fetching all data for " .. player.name .. " **");

		-- Reading player session data
		CHATresults = SQL:Query('SELECT Soldiername, PlayerLogins, VU_GUID, IP, CountryName, FirstSeenOnServer, Rounds, PlayTime FROM tbl_playerdata WHERE Soldiername = ?', player.name)
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end

		for _, l_Row in pairs(CHATresults) do
			chat_Soldiername = l_Row["Soldiername"]
			chat_PlayerLogins = l_Row["PlayerLogins"]
			chat_VU_GUID = l_Row["VU_GUID"]
			chat_IP = l_Row["IP"]
			chat_CountryName = l_Row["CountryName"]
			chat_FirstSeenOnServer = l_Row["FirstSeenOnServer"]
			chat_Rounds = l_Row["Rounds"]
			chat_PlayTime = l_Row["PlayTime"]

		seconds = chat_PlayTime
		hours = string.format(math.floor(seconds / 3600));
		mins = string.format(math.floor(seconds / 60 - (hours * 60)));
		secs = string.format(math.floor(seconds - hours * 3600 - mins * 60));
		chat_PlayTime = hours .. " hours " .. mins .. " minutes " .. secs .. " seconds"


				print("** Player results")
				print("** Player results:"..chat_Soldiername .." - Total logins:"..chat_PlayerLogins.." - You VU Guid:"..chat_VU_GUID)
				print("** Player results:"..chat_Soldiername .." - Your IP on first login:"..chat_IP.." - your country:"..chat_CountryName.." - First login:"..chat_FirstSeenOnServer)
				print("** Player results:"..chat_Soldiername .." - Total rounds played:"..chat_Rounds.." - Total playtime:"..chat_PlayTime)


				ChatManager:SendMessage("your country:"..chat_CountryName.." - First login:"..chat_FirstSeenOnServer, player)
				ChatManager:SendMessage("Your VU Guid:"..chat_VU_GUID, player)
				ChatManager:SendMessage("Your IP on first login:"..chat_IP, player)
				ChatManager:SendMessage("Total logins:"..chat_PlayerLogins.." - Total rounds played:"..chat_Rounds, player)
				ChatManager:SendMessage("Total playtime:"..chat_PlayTime, player)

		end
	end
end)


-- ------------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".serverstats" then
		ChatManager:SendMessage("Fetching global serverstats", player)
		print("** Fetching global serverstats **");

		-- Reading player session data
		CHATresults = SQL:Query('SELECT * FROM tbl_serverstats')
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end

		for _, l_Row in pairs(CHATresults) do
			chat_Players = l_Row["SumPlayers"]
			chat_Score = l_Row["SumScore"]
			chat_Kills = l_Row["SumKills"]
			chat_Deaths = l_Row["SumDeaths"]
			chat_Suicide = l_Row["SumSuicide"]
			chat_Headshots = l_Row["SumHeadshots"]
			chat_TeamKilled = l_Row["SumTeamKilled"]
			chat_Dogtags = l_Row["SumDogtags"]
			chat_Revives = l_Row["SumRevives"]
			chat_Round = l_Row["SumRounds"]
			chat_Roadkills = l_Row["SumRoadkills"]
			chat_Playtime = l_Row["SumPlaytime"]

			print("** Server total results")
			print("** server results - Total players:"..chat_Players .. " - Score:" .. chat_Score .. " - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths)
			print("** server results - Suicides:"..chat_Suicide .." - Headshots:" .. chat_Headshots .. " - Teamkilled:" .. chat_TeamKilled .. " - Knife kills:" .. chat_Dogtags)
			print("** server results - Revives:"..chat_Revives .." - rounds played:" .. chat_Round .. " - Roadkills:" .. chat_Roadkills .. " - Playtime:" .. chat_Playtime)

			-- at here we use the chatmanager to print the content in chat.
			ChatManager:SendMessage("Total Players:"..chat_Players .. " - Score:" .. chat_Score .. " - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths,player)
			ChatManager:SendMessage("Suicides:"..chat_Suicide .." - Headshots:"..chat_Headshots .. " - Teamkilled:" .. chat_TeamKilled .. " - Knife kills:" .. chat_Dogtags,player)
			ChatManager:SendMessage("Revives:" ..chat_Revives .." - Rounds played:" .. chat_Round .. " - Roadkills:" .. chat_Roadkills .. " - Playtime:" .. chat_Playtime,player)
		end
	end
end)
-- ------------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".top killer" or message == ".top killers" then
		ChatManager:SendMessage("Fetching top 3 killers", player)
		print("** Fetching top 3 killers **");

		-- Lets get the top 3 kills
		CHATresults = SQL:Query('SELECT Soldiername, Kills FROM tbl_playerstats ORDER BY Kills DESC LIMIT 3 ')
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end

		print("** Top 3 killer results")

		for _, l_Row in pairs(CHATresults) do
			chat_Soldiername = l_Row["Soldiername"]
			chat_Kills = l_Row["Kills"]

			print("** Player results - Top killers " .. chat_Soldiername .. " - Kills:" .. chat_Kills)
			ChatManager:SendMessage("Top 3 Killers:" .. chat_Soldiername .. " - Kills:" .. chat_Kills, player)
		end
	end
end)
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------



Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".top air" or message == ".top aircraft" then
		s_table = "tbl_air_vehicles"
		s_top_message1 = "** player top 3 kills with air vehicles **"
		s_topSelect = "player"
		s_topvehicletype = "Aircraft:"
	elseif message == ".top land" or message == ".top land vehicle" then
		s_table = "tbl_land_vehicles"
		s_top_message1 = "** player top 3 kills with land vehicles **"
		s_topSelect = "player"
		s_topvehicletype = "Atack vehicle:"
	elseif message == ".top aux" then
		s_table = "tbl_auxiliary_gadgets"
		s_top_message1 = "** player top 3 kills with auxiliar weapons **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top common" or message == ".top weapon common" then
		s_table = "tbl_primary_weapons"
		s_top_message1 = "** player top 3 kills with common weapons **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top handgun" or message == ".top weapon handgun" then
		s_table = "tbl_handguns_weapons"
		s_top_message1 = "** player top 3 kills with handguns **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top shotgun" or message == ".top weapon shotgun" then
		s_table = "tbl_shotguns_weapons"
		s_top_message1 = "** player top 3 kills with shotguns **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top assault" or message == ".top weapon assault" then
		s_table = "tbl_assault_weapons"
		s_top_message1 = "** player top 3 kills with assault weapons **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget assault" or message == ".top gadgets assault" then
		s_table = "tbl_assault_gadgets"
		s_top_message1 = "** player top 3 kills with assault gadgets **"
		s_topSelect = "player"
		s_topvehicletype = "Gadget:"
	elseif message == ".top engineer" or message == ".top weapon engineer" then
		s_table = "tbl_engineer_weapons"
		s_top_message1 = "** player top 3 kills with assault engineer **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget engineer" or message == ".top gadgets engineer" then
		s_table = "tbl_engineer_gadgets"
		s_top_message1 = "** player top 3 kills with engineer gadgets **"
		s_topSelect = "player"
		s_topvehicletype = "Gadget:"
	elseif message == ".top support" or message == ".top weapon support" then
		s_table = "tbl_support_weapons"
		s_top_message1 = "** player top 3 kills with support engineer **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget support" or message == ".top gadgets support" then
		s_table = "tbl_support_gadgets"
		s_top_message1 = "** player top 3 kills with support gadgets **"
		s_topSelect = "player"
		s_topvehicletype = "Gadget:"
	elseif message == ".top recon" or message == ".top weapon recon" then
		s_table = "tbl_recon_weapons"
		s_top_message1 = "** player top 3 kills with recon engineer **"
		s_topSelect = "player"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget recon" or message == ".top gadgets recon" then
		s_table = "tbl_recon_gadgets"
		s_top_message1 = "** player top 3 kills with recon gadgets **"
		s_topSelect = "player"
		s_topvehicletype = "Gadget:"

		-- --------
		-- --------
	elseif message == ".top air all" or message == ".top aircraft all" then
		s_table = "tbl_air_vehicles"
		s_top_message1 = "** top 3 killers with air vehicles **"
		s_topSelect = "all"
		s_topvehicletype = "Aircraft:"
	elseif message == ".top land all" or message == ".top land vehicle all" then
		s_table = "tbl_land_vehicles"
		s_top_message1 = "** top 3 killers with land vehicles **"
		s_topSelect = "all"
		s_topvehicletype = "Atack vehicle:"
	elseif message == ".top aux all" then
		s_table = "tbl_auxiliary_gadgets"
		s_top_message1 = "** top 3 killers with auxiliar weapons **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top common all" or message == ".top weapon common all" then
		s_table = "tbl_primary_weapons"
		s_top_message1 = "** top 3 killers with common weapons **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top handgun all" or message == ".top weapon handgun all" then
		s_table = "tbl_handguns_weapons"
		s_top_message1 = "** top 3 killers with handguns **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top shotgun all" or message == ".top weapon shotgun all" then
		s_table = "tbl_shotguns_weapons"
		s_top_message1 = "** top 3 killers with shotguns **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top assault all" or message == ".top weapon assault all" then
		s_table = "tbl_assault_weapons"
		s_top_message1 = "** top 3 killers with assault weapons **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget assault all" or message == ".top gadgets assault all" then
		s_table = "tbl_assault_gadgets"
		s_top_message1 = "** top 3 killers with assault gadgets **"
		s_topSelect = "all"
		s_topvehicletype = "Gadget:"
	elseif message == ".top engineer all" or message == ".top weapon engineer all" then
		s_table = "tbl_engineer_weapons"
		s_top_message1 = "** top 3 killers with assault engineer **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget engineer all" or message == ".top gadgets engineer all" then
		s_table = "tbl_engineer_gadgets"
		s_top_message1 = "** top 3 killers with engineer gadgets **"
		s_topSelect = "all"
		s_topvehicletype = "Gadget:"
	elseif message == ".top support all" or message == ".top weapon support all" then
		s_table = "tbl_support_weapons"
		s_top_message1 = "** top 3 killers with support engineer **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget support all" or message == ".top gadgets support all" then
		s_table = "tbl_support_gadgets"
		s_top_message1 = "** top 3 killers with support gadgets **"
		s_topSelect = "all"
		s_topvehicletype = "Gadget:"
	elseif message == ".top recon all" or message == ".top weapon recon all" then
		s_table = "tbl_recon_weapons"
		s_top_message1 = "** top 3 killers with recon engineer **"
		s_topSelect = "all"
		s_topvehicletype = "Weapon:"
	elseif message == ".top gadget recon all" or message == ".top gadgets recon all" then
		s_table = "tbl_recon_gadgets"
		s_top_message1 = "** top 3 killers with recon gadgets **"
		s_topSelect = "all"
		s_topvehicletype = "Gadget:"

		-- --------
		-- --------
	else
		return
	end

	ChatManager:SendMessage(s_top_message1, player)
	print(s_top_message1);

	if s_topSelect == "all" then
		CHATresults = SQL:Query('SELECT Weaponname, Soldiername, Kills FROM ' ..s_table.. ' ORDER BY Kills DESC, Weaponname ASC, Soldiername ASC LIMIT 3 ')
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end
		print("ALL selected")
	elseif s_topSelect == "player" then
		CHATresults = SQL:Query('SELECT Weaponname, Soldiername, Kills FROM ' .. s_table ..'  WHERE Soldiername = ? ORDER BY Kills DESC LIMIT 3 ', player.name)
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end
		print("Player selected")
	end

	for _, l_Row in pairs(CHATresults) do
		chat_Weaponname = l_Row["Weaponname"]
		chat_Soldiername = l_Row["Soldiername"]
		chat_Kills = l_Row["Kills"]


		if s_topSelect == "all" then
			print(chat_Soldiername .. ":" .. s_topvehicletype .. ":" .. chat_Weaponname .. " - Kills:" .. chat_Kills)
			ChatManager:SendMessage(chat_Soldiername .. ":" .. chat_Weaponname .. " - Kills:" .. chat_Kills, player)
		elseif s_topSelect == "player" then
			print(s_topvehicletype .. ":" .. chat_Weaponname .. " - Kills:" .. chat_Kills)
			ChatManager:SendMessage(chat_Weaponname .. " - Kills:" .. chat_Kills, player)
		end
	end
end)
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------


Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".top map" or message == ".top maps" then
		s_table = "tbl_mapstats"
		s_map_message1 = "** Best 3 maps played **"
		s_mapSelect = "all"
	elseif message == ".top map tdm" or message == ".top maps tdm" then
		s_table = "tbl_mapstats"
		s_gametype = "Team DeathMatch"
		s_map_message1 = "** Best 3 TDM maps played **"
		s_mapSelect = "map"
	elseif message == ".top map sqtdm" or message == ".top maps sqtdm" then
		s_table = "tbl_mapstats"
		s_gametype = "Squad Deathmatch"
		s_map_message1 = "** Best 3 Squad TDM maps played **"
		s_mapSelect = "map"
	elseif message == ".top map cqtdm" or message == ".top maps cqtdm" then
		s_table = "tbl_mapstats"
		s_gametype = "Team DeathMatch Close Quarters"
		s_map_message1 = "** Best 3 Close Quarters TDM maps played **"
		s_mapSelect = "map"
	elseif message == ".top map cql" or message == ".top maps cql" then
		s_table = "tbl_mapstats"
		s_gametype = "Conquest Large"
		s_map_message1 = "** Best 3 Conquest Large maps played **"
		s_mapSelect = "map"
	elseif message == ".top map cqs" or message == ".top maps cqs" then
		s_table = "tbl_mapstats"
		s_gametype = "Conquest Small"
		s_map_message1 = "** Best 3 Conquest Small maps played **"
		s_mapSelect = "map"
	elseif message == ".top map rush" or message == ".top maps rush" then
		s_table = "tbl_mapstats"
		s_gametype = "Rush"
		s_map_message1 = "** Best 3 Rush maps played **"
		s_mapSelect = "map"
	elseif message == ".top map sqrush" or message == ".top maps sqrush" then
		s_table = "tbl_mapstats"
		s_gametype = "Squad Rush"
		s_map_message1 = "** Best 3 Squad Rush maps played **"
		s_mapSelect = "map"
	elseif message == ".top map assault" or message == ".top maps assault" then
		s_table = "tbl_mapstats"
		s_gametype = "Assault"
		s_map_message1 = "** Best 3 Assault maps played **"
		s_mapSelect = "map"
	elseif message == ".top map assault64" or message == ".top maps assault64" then
		s_table = "tbl_mapstats"
		s_gametype = "Assault64"
		s_map_message1 = "** Best 3 Assault64 maps played **"
		s_mapSelect = "map"
	elseif message == ".top map assault2" or message == ".top maps assault2" then
		s_table = "tbl_mapstats"
		s_gametype = "Assault #2"
		s_map_message1 = "** Best 3 Assault #2 maps played **"
		s_mapSelect = "map"
	elseif message == ".top map gm" or message == ".top maps gm" then
		s_table = "tbl_mapstats"
		s_gametype = "Gun Master"
		s_map_message1 = "** Best 3 Gun Master maps played **"
		s_mapSelect = "map"
	elseif message == ".top map dom" or message == ".top maps dom" then
		s_table = "tbl_mapstats"
		s_gametype = "Domination"
		s_map_message1 = "** Best 3 Domination maps played **"
		s_mapSelect = "map"
	elseif message == ".top map ts" or message == ".top maps ts" then
		s_table = "tbl_mapstats"
		s_gametype = "Tank Superiority"
		s_map_message1 = "** Best 3 Tank Superiority maps played **"
		s_mapSelect = "map"
	elseif message == ".top map scav" or message == ".top maps scav" then
		s_table = "tbl_mapstats"
		s_gametype = "Scavenger"
		s_map_message1 = "** Best 3 Scavenger maps played **"
		s_mapSelect = "map"
	elseif message == ".top map as" or message == ".top maps as" then
		s_table = "tbl_mapstats"
		s_gametype = "Air Superiority"
		s_map_message1 = "** Best 3 Air Superiority maps played **"
		s_mapSelect = "map"
	elseif message == ".top map ctf" or message == ".top maps ctf" then
		s_table = "tbl_mapstats"
		s_gametype = "Capture the flag"
		s_map_message1 = "** Best 3 Capture the flag maps played **"
		s_mapSelect = "map"
	elseif message == ".top map koth" or message == ".top maps koth" then
		s_table = "tbl_mapstats"
		s_gametype = "King of the hill"
		s_map_message1 = "** Best 3 King of the hill maps played **"
		s_mapSelect = "map"
	elseif message == ".top map hs" or message == ".top maps hs" then
		s_table = "tbl_mapstats"
		s_gametype = "Heli Superiority"
		s_map_message1 = "** Best 3 Heli Superiority maps played **"
		s_mapSelect = "map"
	else
		return
	end
	--
	ChatManager:SendMessage(s_map_message1, player)
	print(s_map_message1);

	if s_mapSelect == "all" then
		CHATresults = SQL:Query('SELECT MapName, Gamemode, Roundscore, Roundtime, winningTeam FROM ' ..s_table .. ' ORDER BY Roundscore DESC LIMIT 3 ')
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end
		print("ALL selected")
	elseif s_mapSelect == "map" then
		CHATresults = SQL:Query('SELECT MapName, Gamemode, Roundscore, Roundtime, winningTeam FROM ' ..s_table .. ' WHERE Gamemode = ? ORDER BY Roundscore DESC LIMIT 3 ', s_gametype)
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end
		print("MAP selected")
	end

	for _, l_Row in pairs(CHATresults) do
		chat_MapName = l_Row["MapName"]
		chat_Gamemode = l_Row["Gamemode"]
		chat_Roundscore = l_Row["Roundscore"]
		chat_Roundtime = l_Row["Roundtime"]
		chat_winningTeam = l_Row["winningTeam"]

		seconds = chat_Roundtime
		hours = string.format(math.floor(seconds / 3600));
		mins = string.format(math.floor(seconds / 60 - (hours * 60)));
		secs = string.format(math.floor(seconds - hours * 3600 - mins * 60));
		chat_Roundtime = hours .. " hours " .. mins .. " minutes " .. secs .. " seconds"

		print(s_map_message1 ..":" ..chat_MapName .." - " ..chat_Gamemode .." - Score:" .. chat_Roundscore .. " - Roundtime:" .. chat_Roundtime .. " - Winning team:" .. chat_winningTeam)
		ChatManager:SendMessage(chat_MapName .." - " ..chat_Gamemode .." - Score:" .. chat_Roundscore .. " - Roundtime:" .. chat_Roundtime .. " - Winning team:" .. chat_winningTeam,player)
	end
end)
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------
-- ------------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".top roadkill" or message == ".top roadkills" then
		s_table = "tbl_roadkills"
		s_top_message1 = "** player top 3 kills with roadkills **"
		s_topSelect = "player"
		s_topvehicletype = "Roadkill:"
		-- --------
		-- --------
	elseif message == ".top roadkill all" or message == ".top Roadkills all" then
		s_table = "tbl_roadkills"
		s_top_message1 = "** top 3 killers with roadkills **"
		s_topSelect = "all"
		s_topvehicletype = "Roadkill:"

		-- --------
		-- --------
	else
		return
	end

	ChatManager:SendMessage(s_top_message1, player)
	print(s_top_message1);

	if s_topSelect == "all" then
		CHATresults = SQL:Query('SELECT Weaponname, Soldiername, Kills FROM ' ..s_table.. ' ORDER BY Kills DESC, Weaponname ASC, Soldiername ASC LIMIT 3 ')
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end
		print("ALL selected")
	elseif s_topSelect == "player" then
		CHATresults = SQL:Query('SELECT Weaponname, Soldiername, Kills FROM ' .. s_table ..'  WHERE Soldiername = ? ORDER BY Kills DESC LIMIT 3 ', player.name)
		if not CHATresults then
			print('Failed to got data query: ' .. SQL:Error()); return
		end
		print("Player selected")
	end

	for _, l_Row in pairs(CHATresults) do
		chat_Weaponname = l_Row["Weaponname"]
		chat_Soldiername = l_Row["Soldiername"]
		chat_Kills = l_Row["Kills"]


		if s_topSelect == "all" then
			print(chat_Soldiername .. ":" .. s_topvehicletype .. ":" .. chat_Weaponname .. " - Kills:" .. chat_Kills)
			ChatManager:SendMessage(chat_Soldiername .. ":" .. chat_Weaponname .. " - Kills:" .. chat_Kills, player)
		elseif s_topSelect == "player" then
			print(s_topvehicletype .. ":" .. chat_Weaponname .. " - Kills:" .. chat_Kills)
			ChatManager:SendMessage(chat_Weaponname .. " - Kills:" .. chat_Kills, player)
		end
	end
end)


return ChatCommands()
