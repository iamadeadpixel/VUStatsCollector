-- Spaghetti code by iamadeadpixel

---@class PUE00_setplayerrounds
-- PUE00_setplayerrounds = class 'PUE00_setplayerrounds'

--[[
function Round(num, dp)
    local mult = 10^(dp or 0)
    return math.floor(num * mult + 0.5)/mult
end
]]

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** PUE00_setplayerrounds loaded ***");
	end
	end
end)

-- Kick in when a player joins the server
s_roundover_starttimer_PUE00 = os.time()
s_roundover_timer_PUE00 = 3

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE00 = os.time()
	s_roundover_elapsed_timer_PUE00 = os.difftime(s_roundover_end_timer_PUE00, s_roundover_starttimer_PUE00)
	s_roundover_elapsed_timer_PUE00 = math.floor(s_roundover_elapsed_timer_PUE00)
	if s_roundover_elapsed_timer_PUE00 >= s_roundover_timer_PUE00 then
		if PUE00_playerrounddata == true then

	if breakpoint then
	escapepoint(player, data_playername)
	end
	breakpoint = true

	print ("Lets escape from this, and do some real,cough,cough, magic.")
	masterevent1(player, data_playername)

			PUE00_playerrounddata = false -- ensure it prints one time only
		end

		s_roundover_starttimer_PUE00 = os.time()
	end
end)

-- --------------------------------------------------
-- Here we do some function calls
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function masterevent1(player, data_playername)
	print ("")
	print ("Start function 1 - Check for Vehicle spawn")

	local s_vehicleSpawnRCON = RCON:SendCommand('vars.vehicleSpawnAllowed')
	local s_vehicleSpawn = tostring(s_vehicleSpawnRCON[2])

	if s_vehicleSpawn == "true" then
	print ("Some vehicle cookies are true")
		elseif s_vehicleSpawn == "false" then
	print ("These vehicle cookies are false")
		end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
	print ("")
	print ("Start function 2 - Spam players")
	print ("")

		for data_playername, pname in pairs(getnameall) do
		print ("processing data for "..data_playername)
		end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 3")
	print ("*** Start tbl_playerdata - Update round played for player ***")

			for playerround, rounddata in pairs(getnamehuman) do

	if Config.consolespam_functioncalls then -- If false in config.lua, data is not written using function call
	updateplayerround(player, data_playername)
	end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 4")
	print ("*** Start tbl_serverstats - Base serverstats ***")
	print ("")

	sacc=Round((server_acc_hit > 0 and server_acc_shot > 0 ) and server_acc_hit/server_acc_shot*100 or 0,1)

			for playername1, score1 in pairs(playerscore1) do
				teamscore1 = teamscore1 + score1
			end

			for playername2, score2 in pairs(playerscore2) do
				teamscore2 = teamscore2 + score2
			end

			for playername3, score3 in pairs(playerscore3) do
				teamscore3 = teamscore3 + score3
			end

			for playername4, score4 in pairs(playerscore4) do
				teamscore4 = teamscore4 + score4
			end

			eor_serverscore = teamscore1 + teamscore2 + teamscore3 + teamscore4
--
--
			for playerdata, tabledata in pairs(playerteamkilled) do
				eor_teamskills = eor_teamskills + tabledata
			end

			for playerdata, tabledata in pairs(playerdogtags) do
				eor_dogtags = eor_dogtags + tabledata
			end

			for playerdata, tabledata in pairs(playerheadshot) do
				eor_headshots = eor_headshots + tabledata
			end

			for playerdata, tabledata in pairs(playerdeaths) do
				eor_deaths = eor_deaths + tabledata
			end

			for playerdata, tabledata in pairs(playerkills) do
				eor_kills = eor_kills + tabledata
			end

			for playerdata, tabledata in pairs(playersuicides) do
				eor_suicides = eor_suicides + tabledata
			end

			for playerdata, tabledata in pairs(playerrevivs) do
				eor_revives = eor_revives + tabledata
			end

			for playerdata, tabledata in pairs(kill_roadkills) do
				eor_roadkills = eor_roadkills + tabledata
			end

			for playerdata, tabledata in pairs(killstreak_counter) do
				eor_killstreak = eor_killstreak + tabledata
			end

 print ("PRE Serverstats score stuff - Serverscore:"..eor_serverscore.." - Team 1 score:"..teamscore1.." - Team 2 score:"..teamscore2.." - Team 3 score:"..teamscore3.." - Team 4 score:"..teamscore4)
 print ("PRE Total kills:"..eor_kills.." - Total deaths:"..eor_deaths.." - Total suicides:"..eor_suicides.." - Total headshots:"..eor_headshots.." - Total teamkills:"..eor_teamskills)
 print ("PRE Total dogtags take:"..eor_dogtags.." - Total revives:"..eor_revives.." - Total killstreaks:"..eor_killstreak.." - Total roadkills:"..eor_roadkills.." - Total shots fired:"..server_acc_shot.." - Total hits received:"..server_acc_hit)


	if Config.consolespam_functioncalls then
	updateserverstats(player, data_playername)
	end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 5")
	print ("*** Start tbl_mapstats - Inserting the current played round with stats ***")

	local RoundID_results = SQL:Query('SELECT RoundID FROM tbl_mapstats')
			if not RoundID_results then
				print('Failed to read Guid query: ' .. SQL:Error())
				return
			end

			-- Print the fetched rows.
			for _, l_Row in pairs(RoundID_results) do
				temp_RoundID = l_Row["RoundID"]
			end

			if temp_RoundID == nil then temp_RoundID = 0; end

		s_RoundID = temp_RoundID + 1
			pc = PlayerManager:GetPlayerCount()

	print ("")
	print ("PRE Round stats - Total rounds played:"..s_RoundID.." - Start time:"..s_startroundtime.." - End time"..s_endroundtime.." - Total playtime:"..s_roundTime)
	print ("PRE Map name:"..s_LevelName.." - Game mode:"..s_GameMode.." - Total point scored:"..eor_serverscore)
	print ("PRE Winning team:"..n_winningTeam.." - Total players this round:"..pc.." - Total shots fired:"..server_acc_shot.." - Total hits received:"..server_acc_hit)

	if Config.consolespam_functioncalls then
	updateservermapstats(player, data_playername)
	end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 6")
	print ("*** Start tbl_mcom - processes Armed - Disarmed - Destroyed for rush maps ***")

	if SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "SquadRush0" then

		for data_playername, pname in pairs(getnameall) do
	if Mcom_Armed[data_playername] == nil then Mcom_Armed[data_playername] = 0 ; end 
	if Mcom_Disarmed[data_playername] == nil then Mcom_Disarmed[data_playername] = 0 ; end
	if Mcom_Destroyed[data_playername] == nil then Mcom_Destroyed[data_playername] = 0 ; end

				r_data_Armed = Mcom_Armed[data_playername]
				r_data_Disarmed = Mcom_Disarmed[data_playername]
				r_data_Destroyed = Mcom_Destroyed[data_playername]

	if r_data_Armed >= 1 or r_data_Disarmed >= 1 or r_data_Destroyed >= 1 then
			print("Pre Mcom Player data for "..data_playername.." Armed:"..r_data_Armed.." - Disarmed:"..r_data_Disarmed.." - Destroyed:"..r_data_Destroyed) 
	end

	if Config.consolespam_functioncalls then
	updatemcomstats(player, data_playername)
	end
	end

	else 
			print("")
			print ("*** Skipping !,No data, not a Rush/Squad Rush map ***")
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 7")
	print ("*** Start tbl_playerstats - Player basedata ***")
	print ("")

	for data_playername, pname in pairs(getnameall) do
	if playerscore[data_playername] == nil then playerscore[data_playername] = 0 ; end
	if playerkills[data_playername] == nil then playerkills[data_playername] = 0 ; end
	if playerdeaths[data_playername] == nil then playerdeaths[data_playername] = 0 ; end
	if playersuicides[data_playername] == nil then playersuicides[data_playername] = 0 ; end
	if playerheadshot[data_playername] == nil then playerheadshot[data_playername] = 0 ; end
	if playerteamkilled[data_playername] == nil then playerteamkilled[data_playername] = 0 ; end
	if playerdogtags[data_playername] == nil then playerdogtags[data_playername] = 0 ; end
	if playerrevivs[data_playername] == nil then playerrevivs[data_playername] = 0 ; end
	if killstreak_counter[data_playername] == nil then killstreak_counter[data_playername] = 0 ; end
	if playershot[data_playername] == nil then playershot[data_playername] = 0 ; end
	if playerhit[data_playername] == nil then playerhit[data_playername] = 0 ; end

	pScore=playerscore[data_playername]
	pKills=playerkills[data_playername]
	pDeaths=playerdeaths[data_playername]
	pSuicide=playersuicides[data_playername]
	pHeadshots=playerheadshot[data_playername]
	pTeamKilled=playerteamkilled[data_playername]
	pDogtags=playerdogtags[data_playername]
	pRevives=playerrevivs[data_playername]
	pKillstreaks=killstreak_counter[data_playername]
	pshots=playershot[data_playername]
	phits=playerhit[data_playername]

	if playerteamID[data_playername] == s_winningTeam then
	pWins=1
	pLosses=0
		else
	pWins=0
	pLosses=1
	end

	print ("PRE Player round stats for "..data_playername.." Score:"..pScore.." Kills:"..pKills.." Deaths:"..pDeaths.." Suicide:"..pSuicide.." Headshot:"..pHeadshots.." Teamkill:"..pTeamKilled.." Dogtag:"..pDogtags.." Revives:"..pRevives.." Killstreak:"..pKillstreaks.." Round win:"..pWins.." Round losses:"..pLosses.." Shots fired:"..pshots.." Shots hit:"..phits)

	if Config.consolespam_functioncalls then
	playerstatscombo(player, data_playername)
	end
	end


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 8")
	print ("*** Start tbl_assault_weapons - Dump all assault weapon data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Assault Weapons stuff
			--	tbl_assault_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AEK_971[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AEK_971[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AEK_971[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AEK-971"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
	end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AK_74M[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AK_74M[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AK_74M[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AK-74M"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AN_94[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AN_94[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AN_94[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AN-94"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AUG_A3[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AUG_A3[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AUG_A3[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AUG A3"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_F2000[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_F2000[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_F2000[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "F2000"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_FAMAS[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_FAMAS[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_FAMAS[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "FAMAS"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_G3A3[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_G3A3[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_G3A3[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "G3A3"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_KH2002[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_KH2002[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_KH2002[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "KH2002"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_L85A2[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_L85A2[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_L85A2[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "L85A2"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M16A3[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M16A3[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M16A3[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M16A3"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M16A4[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M16A4[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M16A4[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M16A4"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M416[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M416[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M416[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M416"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SCAR_L[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SCAR_L[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SCAR_L[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SCAR-L"
				s_table = "tbl_assault_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 9")
	print ("*** Start tbl_assault_gadgets - Dump all assault gadget data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Assault gadget stuff
			--	tbl_assault_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_DEFIBRILLATOR[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_DEFIBRILLATOR[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_DEFIBRILLATOR[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "DEFIBRILLATOR"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MEDIC_KIT[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MEDIC_KIT[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MEDIC_KIT[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MEDIC KIT"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GP_30_BUCK[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GP_30_BUCK[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GP_30_BUCK[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GP-30 BUCK"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GP_30_DART[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GP_30_DART[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GP_30_DART[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GP-30 DART"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GP_30_HE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GP_30_HE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GP_30_HE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GP-30 HE"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GP_30_LVG[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GP_30_LVG[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GP_30_LVG[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GP-30 LVG"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GP_30_SMOKE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GP_30_SMOKE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GP_30_SMOKE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GP-30 SMOKE"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M26_DART[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M26_DART[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M26_DART[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M26 DART"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M26_FRAG[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M26_FRAG[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M26_FRAG[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M26 FRAG"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M26_MASS[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M26_MASS[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M26_MASS[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M26 MASS"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M26_SLUG[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M26_SLUG[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M26_SLUG[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M26 SLUG"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M320_BUCK[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M320_BUCK[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M320_BUCK[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M320 BUCK"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M320_HE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M320_HE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M320_HE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M320 HE"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M320_LVG[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M320_LVG[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M320_LVG[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M320 LVG"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M320_SMOKE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M320_SMOKE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M320_SMOKE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M320 SMOKE"
				s_table = "tbl_assault_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 10")
	print ("*** Start tbl_engineer_weapons - Dump all engineer weapons data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Engineer Weapons stuff
			--	tbl_engineer_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_A_91[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_A_91[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_A_91[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "A-91"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_ACW_R[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_ACW_R[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_ACW_R[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "ACW-R"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AKS_74u[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AKS_74u[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AKS_74u[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AKS-74u"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_G36C[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_G36C[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_G36C[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "G36C"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_G53[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_G53[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_G53[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "G53"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M4[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M4[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M4[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M4"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M4A1[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M4A1[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M4A1[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M4A1"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MTAR_21[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MTAR_21[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MTAR_21[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MTAR-21"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_QBZ_95B[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_QBZ_95B[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_QBZ_95B[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "QBZ-95B"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SCAR_H[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SCAR_H[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SCAR_H[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SCAR-H"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SG553[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SG553[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SG553[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SG553"
				s_table = "tbl_engineer_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 11")
	print ("*** Start tbl_engineer_gadgets - Dump all engineer gadgets data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Engineer gadgets stuff
			--	tbl_engineer_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_EOD_BOT[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_EOD_BOT[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_EOD_BOT[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "EOD BOT"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_REPAIR_TOOL[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_REPAIR_TOOL[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_REPAIR_TOOL[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "REPAIR TOOL"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_FGM_148_JAVELIN[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_FGM_148_JAVELIN[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_FGM_148_JAVELIN[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "FGM-148 JAVELIN"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_FIM_92_STINGER[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_FIM_92_STINGER[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_FIM_92_STINGER[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "FIM-92 STINGER"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SA_18_IGLA[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SA_18_IGLA[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SA_18_IGLA[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SA-18 IGLA"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M15_AT_MINE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M15_AT_MINE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M15_AT_MINE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M15 AT MINE"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_RPG_7V2[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_RPG_7V2[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_RPG_7V2[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "RPG-7V2"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SMAW[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SMAW[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SMAW[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SMAW"
				s_table = "tbl_engineer_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 12")
	print ("*** Start tbl_support_weapons - Dump all support weapons data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Support Weapons stuff
			--	tbl_support_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M27_IAR[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M27_IAR[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M27_IAR[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M27 IAR"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_RPK_74M[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_RPK_74M[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_RPK_74M[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "RPK-74M"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_L86A2[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_L86A2[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_L86A2[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "L86A2"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_LSAT[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_LSAT[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_LSAT[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "LSAT"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M240B[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M240B[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M240B[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M240B"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M249[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M249[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M249[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M249"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M60E4[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M60E4[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M60E4[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M60E4"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MG36[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MG36[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MG36[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MG36"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_PKP_PECHENEG[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_PKP_PECHENEG[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_PKP_PECHENEG[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "PKP PECHENEG"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_QBB_95[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_QBB_95[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_QBB_95[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "QBB-95"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_TYPE_88_LMG[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_TYPE_88_LMG[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_TYPE_88_LMG[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "TYPE 88 LMG"
				s_table = "tbl_support_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 13")
	print ("*** Start tbl_support_gadgets - Dump all support gadgets data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Support gadgets stuff
			--	tbl_support_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AMMO_BOX[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AMMO_BOX[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AMMO_BOX[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AMMO BOX"
				s_table = "tbl_support_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_C4_EXPLOSIVES[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_C4_EXPLOSIVES[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_C4_EXPLOSIVES[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "C4 EXPLOSIVES"
				s_table = "tbl_support_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M18_CLAYMORE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M18_CLAYMORE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M18_CLAYMORE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M18 CLAYMORE"
				s_table = "tbl_support_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M224_MORTAR[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M224_MORTAR[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M224_MORTAR[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M224 MORTAR"
				s_table = "tbl_support_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 14")
	print ("*** Start tbl_recon_weapons - Dump all recon weapons data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Recon Weapons stuff
			--	tbl_recon_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_JNG_90[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_JNG_90[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_JNG_90[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "JNG-90"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_L96[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_L96[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_L96[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "L96"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M39_EMR[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M39_EMR[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M39_EMR[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M39 EMR"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M40A5[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M40A5[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M40A5[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M40A5"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M417[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M417[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M417[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M417"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M98B[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M98B[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M98B[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M98B"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MK11_MOD_0[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MK11_MOD_0[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MK11_MOD_0[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MK11 MOD 0"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_QBU_88[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_QBU_88[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_QBU_88[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "QBU-88"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SKS[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SKS[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SKS[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SKS"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SV98[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SV98[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SV98[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SV98"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SVD[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SVD[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SVD[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SVD"
				s_table = "tbl_recon_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 15")
	print ("*** Start tbl_recon_gadgets - Dump all recon gadgets data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Recon gadgets stuff
			--	tbl_recon_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MAV[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MAV[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MAV[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MAV"
				s_table = "tbl_recon_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_RADIO_BEACON[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_RADIO_BEACON[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_RADIO_BEACON[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "RADIO BEACON"
				s_table = "tbl_recon_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SOFLAM[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SOFLAM[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SOFLAM[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SOFLAM"
				s_table = "tbl_recon_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_T_UGS[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_T_UGS[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_T_UGS[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "T-UGS"
				s_table = "tbl_recon_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 16")
	print ("*** Start tbl_primary_weapons - Dump all Primary weapons data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Common weapon stuff
			--	tbl_primary_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AS_VAL[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AS_VAL[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AS_VAL[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AS VAL"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M5K[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M5K[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M5K[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M5K"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MP7[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MP7[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MP7[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MP7"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_P90[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_P90[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_P90[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "P90"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_PDW_R[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_PDW_R[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_PDW_R[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "PDW-R"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_PP_19[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_PP_19[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_PP_19[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "PP-19"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_PP_2000[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_PP_2000[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_PP_2000[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "PP-2000"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_UMP_45[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_UMP_45[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_UMP_45[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "UMP-45"
				s_table = "tbl_primary_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 17")
	print ("*** Start tbl_auxiliary_gadgets - Dump all auxiliary weapons data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	auxiliary weapon stuff
			--      tbl_auxiliary_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_KNIFE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_KNIFE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_KNIFE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "KNIFE"
				s_table = "tbl_auxiliary_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M67_GRENADE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M67_GRENADE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M67_GRENADE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M67 GRENADE"
				s_table = "tbl_auxiliary_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_XBOW[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_XBOW[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_XBOW[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "XBOW"
				s_table = "tbl_auxiliary_gadgets"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 18")
	print ("*** Start tbl_handguns_weapons - Dump all Handguns weapons data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Handguns stuff
			--	tbl_handguns_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_44_MAGNUM[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_44_MAGNUM[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_44_MAGNUM[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = ".44 MAGNUM"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_93R[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_93R[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_93R[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "93R"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_G17C[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_G17C[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_G17C[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "G17C"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_G18[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_G18[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_G18[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "G18"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M1911[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M1911[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M1911[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M1911"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M9[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M9[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M9[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M9"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MP412_REX[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MP412_REX[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MP412_REX[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MP412 REX"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MP443[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MP443[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MP443[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MP443"
				s_table = "tbl_handguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 19")
	print ("*** Start tbl_shotguns_weapons - Dump all Shotgun weapons data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Shotgun stuff
			--	tbl_shotguns_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_870MCS[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_870MCS[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_870MCS[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "870 MCS"
				s_table = "tbl_shotguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_DAO_12[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_DAO_12[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_DAO_12[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "DAO-12"
				s_table = "tbl_shotguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M1014[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M1014[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M1014[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M1014"
				s_table = "tbl_shotguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MK3A1[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MK3A1[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MK3A1[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MK3A1"
				s_table = "tbl_shotguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SAIGA_12K[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SAIGA_12K[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SAIGA_12K[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SAIGA 12K"
				s_table = "tbl_shotguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SPAS_12[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SPAS_12[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SPAS_12[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SPAS-12"
				s_table = "tbl_shotguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_USAS_12[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_USAS_12[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_USAS_12[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "USAS-12"
				s_table = "tbl_shotguns_weapons"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 20")
	print ("*** Start Land and Air Vehicle stuff  ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Roadkills stuff
			--	tbl_roadkills
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

if SharedUtils:GetCurrentGameMode() == "ConquestLarge0" or SharedUtils:GetCurrentGameMode() == "ConquestSmall0"
or SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0"
or SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0" or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1"
or SharedUtils:GetCurrentGameMode() == "TankSuperiority0" or SharedUtils:GetCurrentGameMode() == "AirSuperiority0"
or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0" or SharedUtils:GetCurrentGameMode() == "HeliSuperiority0"
or SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" then

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_roadkills[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_roadkills[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_roadkills[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "Roadkills"
				s_table = "tbl_roadkills"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 21")
	print ("*** Start tbl_air_vehicles - Dump all air vehicle kill data ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Air vehicles stuff
			--	tbl_air_vehicles
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_A10_THUNDERBOLT[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_A10_THUNDERBOLT[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_A10_THUNDERBOLT[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "A-10 THUNDERBOLT"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AH_1Z_VIPER[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AH_1Z_VIPER[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AH_1Z_VIPER[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AH-1Z VIPER"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AH_6J_LITTLE_BIRD[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AH_6J_LITTLE_BIRD[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AH_6J_LITTLE_BIRD[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AH-6J LITTLE BIRD"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_F_35[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_F_35[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_F_35[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "F-35"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_FA_18E_SUPER_HORNET[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_FA_18E_SUPER_HORNET[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_FA_18E_SUPER_HORNET[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "F/A-18E SUPER HORNET"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GUNSHIP[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GUNSHIP[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GUNSHIP[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GUNSHIP"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_KA_60_KASATKA[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_KA_60_KASATKA[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_KA_60_KASATKA[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "KA-60 KASATKA"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_MI_28_HAVOC[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_MI_28_HAVOC[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_MI_28_HAVOC[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "MI-28 HAVOC"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SU_25TM_FROGFOOT[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SU_25TM_FROGFOOT[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SU_25TM_FROGFOOT[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SU-25TM FROGFOOT"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SU_35BM_FLANKER_E[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SU_35BM_FLANKER_E[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SU_35BM_FLANKER_E[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SU-35BM FLANKER-E"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SU_37[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SU_37[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SU_37[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SU-37"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_TV_MISSILE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_TV_MISSILE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_TV_MISSILE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "TV MISSILE"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_UH_1Y_VENOM[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_UH_1Y_VENOM[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_UH_1Y_VENOM[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "UH-1Y VENOM"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_Z_11W[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_Z_11W[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_Z_11W[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "Z-11W"
				s_table = "tbl_air_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 22")
	print ("*** Start tbl_land_vehicles - Dump all land  vehicle kill data (1) ***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Land vehicles stuff - Stationary
			--	tbl_land_vehicles
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_CENTURION_C_RAM[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_CENTURION_C_RAM[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_CENTURION_C_RAM[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "CENTURION C-RAM"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_PANTSIR_S1[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_PANTSIR_S1[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_PANTSIR_S1[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "PANTSIR-S1"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M220_TOW_LAUNCHER[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M220_TOW_LAUNCHER[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M220_TOW_LAUNCHER[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M220 TOW LAUNCHER"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_9M133_KORNET_LAUNCHER[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_9M133_KORNET_LAUNCHER[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_9M133_KORNET_LAUNCHER[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "9M133 KORNET LAUNCHER"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print ("Start function 23")
	print ("*** Start tbl_land_vehicles - Dump all land  vehicle kill data (2)***")
	print ("")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Land vehicles stuff
			--	tbl_land_vehicles
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_QUAD_BIKE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_QUAD_BIKE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_QUAD_BIKE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "QUAD BIKE"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_DIRTBIKE[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_DIRTBIKE[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_DIRTBIKE[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "DIRTBIKE"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M1_ABRAMS[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M1_ABRAMS[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M1_ABRAMS[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M1 ABRAMS"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_T_90A[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_T_90A[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_T_90A[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "T-90A"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_DPV[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_DPV[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_DPV[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "DPV"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_VDV_Buggy[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_VDV_Buggy[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_VDV_Buggy[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "VDV Buggy"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_9K22_TUNGUSKA_M[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_9K22_TUNGUSKA_M[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_9K22_TUNGUSKA_M[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "9K22 TUNGUSKA-M"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_LAV_25[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_LAV_25[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_LAV_25[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "LAV-25"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_VODNIK_AA[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_VODNIK_AA[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_VODNIK_AA[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "VODNIK AA"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_AAV_7A1_AMTRAC[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_AAV_7A1_AMTRAC[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_AAV_7A1_AMTRAC[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "AAV-7A1 AMTRAC"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_BARSUK[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_BARSUK[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_BARSUK[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "BARSUK"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_BM_23[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_BM_23[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_BM_23[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "BM-23"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_BMP_2M[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_BMP_2M[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_BMP_2M[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "BMP-2M"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_BTR_90[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_BTR_90[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_BTR_90[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "BTR-90"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GAZ_3937_VODNIK[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GAZ_3937_VODNIK[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GAZ_3937_VODNIK[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GAZ-3937 VODNIK"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_GROWLER_ITV[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_GROWLER_ITV[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_GROWLER_ITV[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "GROWLER ITV"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_HMMWV_ASRAD[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_HMMWV_ASRAD[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_HMMWV_ASRAD[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "HMMWV ASRAD"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_LAV_AD[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_LAV_AD[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_LAV_AD[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "LAV-AD"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M1114_HMMWV[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M1114_HMMWV[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M1114_HMMWV[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M1114 HMMWV"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M1128[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M1128[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M1128[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M1128"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_M142[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_M142[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_M142[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "M142"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_PHOENIX[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_PHOENIX[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_PHOENIX[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "PHOENIX"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_RHIB_BOAT[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_RHIB_BOAT[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_RHIB_BOAT[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "RHIB BOAT"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_RHINO[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_RHINO[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_RHINO[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "RHINO"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SPRUT_SD[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SPRUT_SD[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SPRUT_SD[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SPRUT-SD"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SUV[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SUV[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SUV[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SUV"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_SKID_LOADER[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_SKID_LOADER[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_SKID_LOADER[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "SKID LOADER"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_CIVILIAN_CAR[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_CIVILIAN_CAR[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_CIVILIAN_CAR[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "CIVILIAN CAR"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_DELIVERY_VAN[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_DELIVERY_VAN[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_DELIVERY_VAN[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "DELIVERY VAN"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_POLICE_VAN[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_POLICE_VAN[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_POLICE_VAN[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "POLICE VAN"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

		for data_playername, pname in pairs(getnameall) do
				r_killdata = kill_TECHNICAL_TRUCK[data_playername]
				if r_killdata == nil then r_killdata = 0 ; end
				r_headshotdata = Headshot_TECHNICAL_TRUCK[data_playername]
				if r_headshotdata == nil then r_headshotdata = 0 ; end
				r_deathdata = Death_TECHNICAL_TRUCK[data_playername]
				if r_deathdata == nil then r_deathdata = 0 ; end

				s_weapon = "TECHNICAL TRUCK"
				s_table = "tbl_land_vehicles"
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)

	if Config.consolespam_functioncallskills then
				updateweaponstats(player, data_playername)
	end
			end
end


	else 
			print ("")
			print ("*** Skipping !, not a Vehicle map ***")
	end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print ("")
	print("** End processing player data event stuff **")

--
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- return PUE00_setplayerrounds()

