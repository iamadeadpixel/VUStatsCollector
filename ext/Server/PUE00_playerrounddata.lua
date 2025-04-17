-- Spaghetti code by iamadeadpixel

---@class PUE00_setplayerrounds
PUE00_setplayerrounds = class 'PUE00_setplayerrounds'

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

	if Config.consolespam_section1 then
	print ("")
	print ("*** Start section 01 ***")
	print ("")
	end
			for playerround, rounddata in pairs(getnamehuman) do
	if not SQL:Query('UPDATE tbl_playerdata SET Rounds=Rounds+?  WHERE Soldiername = ?', 1, getnamehuman[player.name]) then
					print('Failed to execute Update Rounds query: ' .. SQL:Error())
					return
			end
	end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------


-- Here we update tbl_serverstats database with new player score data.
	if Config.consolespam_section2 then
	print ("")
	print ("*** Start section 02 ***")
	print ("")
	end

			pc = PlayerManager:GetPlayerCount()

	if Config.consolespam_section2 then
			print("")
			print("** Start of score report **")
	end

			for playername1, scoreUS in pairs(playerscore1) do
				teamscoreUS = teamscoreUS + scoreUS
			end

			for playername2, scoreRU in pairs(playerscore2) do
				teamscoreRU = teamscoreRU + scoreRU
			end

			for playername3, score3 in pairs(playerscore3) do
				teamscore3 = teamscore3 + score3
			end

			for playername4, score4 in pairs(playerscore4) do
				teamscore4 = teamscore4 + score4
			end

			serverscore = teamscoreUS + teamscoreRU + teamscore3 + teamscore4
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

	if Config.consolespam_section2 then
			print("Session stats - Writting tbl_serverstats")
			print("Session stats - Gamemode:" ..s_GameMode .." - Mapname:" ..s_LevelName .. " - Winning team:" .. n_winningTeam .. " - Total players this round:" .. pc)
			print("Session stats - Time round start:" ..s_startroundtime .. " - Time round end:" ..s_endroundtime .. " - Total round time:" .. s_roundTime .. " Seconds **")
			print("Session stats - total kills:" ..eor_kills .." - Total Deaths:" ..eor_deaths .. " - Total Headshots:" .. eor_headshots .. " - Total Roadkills:" .. eor_roadkills)
			print("Session stats - Total Dogtags:" ..eor_dogtags .." - Total TeamKills:" .. eor_teamskills .." - Total suicides:" .. eor_suicides .. " - Total Revives:" .. eor_revives)
			print("Session stats - Team1 score:" ..teamscoreUS .." - Team2 score:" ..teamscoreRU .." - Team3 score:" ..teamscore3 .. " - Team4 score:" .. teamscore4 .. " - Total round score:" .. serverscore)
			print("")
	end

			if not SQL:Query('UPDATE tbl_serverstats SET SumScore=SumScore+?, SumKills=SumKills+?, SumDeaths=SumDeaths+?, SumSuicide=SumSuicide+?, SumHeadshots=SumHeadshots+?, SumTeamKilled=SumTeamKilled+?, SumDogtags=SumDogtags+?, SumRevives=SumRevives+?, SumRounds=SumRounds+?, SumRoadkills=SumRoadkills+?, SumPlaytime=SumPlaytime+?', serverscore, eor_kills, eor_deaths, eor_suicides, eor_headshots, eor_teamskills, eor_dogtags, eor_revives, 1, eor_roadkills, s_roundTime) then
				print('Failed to execute Update tbl_serverstats query: ' .. SQL:Error())
				return
			end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we update the map stats in tbl_mapstats database.
	if Config.consolespam_section3 then
	print ("")
	print ("*** Start section 03 ***")
	print ("")

			print("*** Reading previous RoundID's ***");
	end

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
	if Config.consolespam_section3 then
			print("Previous roundID:" .. temp_RoundID)
	end

		s_RoundID = temp_RoundID + 1

	if Config.consolespam_section3 then
			print("Session stats - Writting tbl_mapstats")
			print("Updating tbl_mapstats with this data - Total rounds played:"..s_RoundID)
			print("Updating tbl_mapstats with this data - Roundstart time:"..s_startroundtime.." - Round over time:"..s_endroundtime)
			print("Updating tbl_mapstats with this data - Map name:"..s_LevelName.." - Game mode:"..s_GameMode)
			print("Updating tbl_mapstats with this data - Total score:"..serverscore.." - Round time:"..s_roundTime.." seconds - Winning team:"..n_winningTeam.." - Total players:"..pc)
	end

			s_Query ='INSERT INTO tbl_mapstats (RoundID,  TimeRoundStarted,  TimeRoundEnd,    MapName,    Gamemode,  Roundscore,   Roundtime,   winningTeam,  MaxPlayers,      Shot,           Hits) VALUES (?,?,?,?,?,?,?,?,?,?,?)'
				if not SQL:Query(s_Query,  s_RoundID, s_startroundtime, s_endroundtime, s_LevelName, s_GameMode, serverscore, s_roundTime, n_winningTeam,     pc,     server_acc_shot, server_acc_hit) then
				print('Failed to execute query: ' .. SQL:Error())
				return
			end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we update tbl_playerstats database with player data
-- needs atention,for some reason, sometimes it fails, specialy with more human players on the server

	if Config.consolespam_section4 then
	print ("")
	print ("*** Start section 04 ***")
			print("")
			print("Session stats - Writting tbl_playerstats")
			print("Reading tbl_playerstats and updating the player stats")
			print("")
	end

			for data_playername, PDscore in pairs(playerscore) do
	s_table = "tbl_playerstats"
	r_data = PDscore
	s_sqltype = "Score"
    do
    playerstatsstuff(player, data_playername)
		end
	end

			for data_playername, PDkills in pairs(playerkills) do
	s_table = "tbl_playerstats"
	r_data = PDkills
	s_sqltype = "Kills"
    do
    playerstatsstuff(player, data_playername)
		end
	end

			for data_playername, PDdeaths in pairs(playerdeaths) do
	s_table = "tbl_playerstats"
	r_data = PDdeaths
	s_sqltype = "Deaths"
    do
    playerstatsstuff(player, data_playername)
		end
	end

			for data_playername, PDsuicide in pairs(playersuicides) do
	s_table = "tbl_playerstats"
	r_data = PDsuicide
	s_sqltype = "Suicide"
    do
    playerstatsstuff(player, data_playername)
		end
	end

			for data_playername, PDheadshot in pairs(playerheadshot) do
	s_table = "tbl_playerstats"
	r_data = PDheadshot
	s_sqltype = "Headshots"
    do
    playerstatsstuff(player, data_playername)
		end
	end

			for data_playername, PDteamkilled in pairs(playerteamkilled) do
	s_table = "tbl_playerstats"
	r_data = PDteamkilled
	s_sqltype = "TeamKilled"
    do
    playerstatsstuff(player, data_playername)
		end
	end

			for data_playername, PDdogtags in pairs(playerdogtags) do
	s_table = "tbl_playerstats"
	r_data = PDdogtags
	s_sqltype = "Dogtags"
    do
    playerstatsstuff(player, data_playername)
		end
	end

			for data_playername, PDrevives in pairs(playerrevivs) do
	s_table = "tbl_playerstats"
	r_data = PDrevives
	s_sqltype = "Revives"
    do
    playerstatsstuff(player, data_playername)
		end
	end
-- ---------------------------------------------

		print ("")

			for data_playername, myteam in pairs(playerteamID) do
	s_table = "tbl_playerstats"
	r_data = "1"

				if playerteamID[data_playername] == s_winningTeam then
	s_sqltype = "Wins"
				else
	s_sqltype = "Losses"
				end

    do
    playerstatsstuff(player, data_playername)
		end
	end

	if Config.consolespam_section4 then
			print("End of round player MATCH OUTCOME report for current round: Team "..n_winningTeam.." Won this round")
	end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- This stuff should update all vehicle and weapon table data.
	if Config.consolespam_section5 then
	print ("")
	print ("*** Start section 05 ***")
	print ("")

			print(" Reading weapon kills from collected tables")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	auxiliary weapon stuff
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
	end

			for data_playername, count_kills in pairs(kill_XBOW) do
				r_killdata = kill_XBOW[data_playername]
				s_weapon = "XBOW"
				s_table = "tbl_auxiliary_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_KNIFE) do
				r_killdata = kill_KNIFE[data_playername]
				s_weapon = "KNIFE"
				s_table = "tbl_auxiliary_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M67_GRENADE) do
				r_killdata = kill_M67_GRENADE[data_playername]
				s_weapon = "M67 GRENADE"
				s_table = "tbl_auxiliary_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Common weapon stuff
			--	tbl_primary_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_P90) do
				r_killdata = kill_P90[data_playername]
				s_weapon = "P90"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AS_VAL) do
				r_killdata = kill_AS_VAL[data_playername]
				s_weapon = "AS VAL"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M5K) do
				r_killdata = kill_M5K[data_playername]
				s_weapon = "M5K"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MP7) do
				r_killdata = kill_MP7[data_playername]
				s_weapon = "MP7"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PDW_R) do
				r_killdata = kill_PDW_R[data_playername]
				s_weapon = "PDW-R"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PP_19) do
				r_killdata = kill_PP_19[data_playername]
				s_weapon = "PP-19"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PP_2000) do
				r_killdata = kill_PP_2000[data_playername]
				s_weapon = "PP-2000"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_UMP_45) do
				r_killdata = kill_UMP_45[data_playername]
				s_weapon = "UMP-45"
				s_table = "tbl_primary_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Handguns stuff
			--	tbl_handguns_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_44_MAGNUM) do
				r_killdata = kill_44_MAGNUM[data_playername]
				s_weapon = ".44 MAGNUM"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_93R) do
				r_killdata = kill_93R[data_playername]
				s_weapon = "93R"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G17C) do
				r_killdata = kill_G17C[data_playername]
				s_weapon = "G17C"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G18) do
				r_killdata = kill_G18[data_playername]
				s_weapon = "G18"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M1911) do
				r_killdata = kill_M1911[data_playername]
				s_weapon = "M1911"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M9) do
				r_killdata = kill_M9[data_playername]
				s_weapon = "M9"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MP443) do
				r_killdata = kill_MP443[data_playername]
				s_weapon = "MP443"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MP412_REX) do
				r_killdata = kill_MP412_REX[data_playername]
				s_weapon = "MP412 REX"
				s_table = "tbl_handguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Shotgun stuff
			--	tbl_shotguns_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_870MCS) do
				r_killdata = kill_870MCS[data_playername]
				s_weapon = "870 MCS"
				s_table = "tbl_shotguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_DAO_12) do
				r_killdata = kill_DAO_12[data_playername]
				s_weapon = "DAO-12"
				s_table = "tbl_shotguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M1014) do
				r_killdata = kill_M1014[data_playername]
				s_weapon = "M1014"
				s_table = "tbl_shotguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MK3A1) do
				r_killdata = kill_MK3A1[data_playername]
				s_weapon = "MK3A1"
				s_table = "tbl_shotguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SAIGA_12K) do
				r_killdata = kill_SAIGA_12K[data_playername]
				s_weapon = "SAIGA 12K"
				s_table = "tbl_shotguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SPAS_12) do
				r_killdata = kill_SPAS_12[data_playername]
				s_weapon = "SPAS-12"
				s_table = "tbl_shotguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_USAS_12) do
				r_killdata = kill_USAS_12[data_playername]
				s_weapon = "USAS-12"
				s_table = "tbl_shotguns_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Assault gadget stuff
			--	tbl_assault_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_DEFIBRILLATOR) do
				r_killdata = kill_DEFIBRILLATOR[data_playername]
				s_weapon = "DEFIBRILLATOR"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_BUCK) do
				r_killdata = kill_GP_30_BUCK[data_playername]
				s_weapon = "GP-30 BUCK"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_DART) do
				r_killdata = kill_GP_30_DART[data_playername]
				s_weapon = "GP-30 DART"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_HE) do
				r_killdata = kill_GP_30_HE[data_playername]
				s_weapon = "GP-30 HE"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_LVG) do
				r_killdata = kill_GP_30_LVG[data_playername]
				s_weapon = "GP-30 LVG"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_SMOKE) do
				r_killdata = kill_GP_30_SMOKE[data_playername]
				s_weapon = "GP-30 SMOKE"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_DART) do
				r_killdata = kill_M26_DART[data_playername]
				s_weapon = "M26 DART"
				s_table = "tbl_assault_gadgets"


				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_FRAG) do
				r_killdata = kill_M26_FRAG[data_playername]
				s_weapon = "M26 FRAG"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_MASS) do
				r_killdata = kill_M26_MASS[data_playername]
				s_weapon = "M26 MASS"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_SLUG) do
				r_killdata = kill_M26_SLUG[data_playername]
				s_weapon = "M26 SLUG"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_BUCK) do
				r_killdata = kill_M320_BUCK[data_playername]
				s_weapon = "M320 BUCK"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_HE) do
				r_killdata = kill_M320_HE[data_playername]
				s_weapon = "M320 HE"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_LVG) do
				r_killdata = kill_M320_LVG[data_playername]
				s_weapon = "M320 LVG"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_SMOKE) do
				r_killdata = kill_M320_SMOKE[data_playername]
				s_weapon = "M320 SMOKE"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MEDIC_KIT) do
				r_killdata = kill_MEDIC_KIT[data_playername]
				s_weapon = "MEDIC KIT"
				s_table = "tbl_assault_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Assault Weapons stuff
			--	tbl_assault_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AEK_971) do
				r_killdata = kill_AEK_971[data_playername]
				s_weapon = "AEK-971"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AK_74M) do
				r_killdata = kill_AK_74M[data_playername]
				s_weapon = "AK-74M"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AN_94) do
				r_killdata = kill_AN_94[data_playername]
				s_weapon = "AN-94"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AUG_A3) do
				r_killdata = kill_AUG_A3[data_playername]
				s_weapon = "AUG A3"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_F2000) do
				r_killdata = kill_F2000[data_playername]
				s_weapon = "F2000"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_FAMAS) do
				r_killdata = kill_FAMAS[data_playername]
				s_weapon = "FAMAS"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G3A3) do
				r_killdata = kill_G3A3[data_playername]
				s_weapon = "G3A3"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_KH2002) do
				r_killdata = kill_KH2002[data_playername]
				s_weapon = "KH2002"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_L85A2) do
				r_killdata = kill_L85A2[data_playername]
				s_weapon = "L85A2"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M16A3) do
				r_killdata = kill_M16A3[data_playername]
				s_weapon = "M16A3"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M16A4) do
				r_killdata = kill_M16A4[data_playername]
				s_weapon = "M16A4"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M416) do
				r_killdata = kill_M416[data_playername]
				s_weapon = "M416"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SCAR_L) do
				r_killdata = kill_SCAR_L[data_playername]
				s_weapon = "SCAR-L"
				s_table = "tbl_assault_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Engineer gadgets stuff
			--	tbl_engineer_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_EOD_BOT) do
				r_killdata = kill_EOD_BOT[data_playername]
				s_weapon = "EOD BOT"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_FGM_148_JAVELIN) do
				r_killdata = kill_FGM_148_JAVELIN[data_playername]
				s_weapon = "FGM-148 JAVELIN"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_FIM_92_STINGER) do
				r_killdata = kill_FIM_92_STINGER[data_playername]
				s_weapon = "FIM-92 STINGER"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M15_AT_MINE) do
				r_killdata = kill_M15_AT_MINE[data_playername]
				s_weapon = "M15 AT MINE"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_REPAIR_TOOL) do
				r_killdata = kill_REPAIR_TOOL[data_playername]
				s_weapon = "REPAIR TOOL"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RPG_7V2) do
				r_killdata = kill_RPG_7V2[data_playername]
				s_weapon = "RPG-7V2"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SA_18_IGLA) do
				r_killdata = kill_SA_18_IGLA[data_playername]
				s_weapon = "SA-18 IGLA"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SMAW) do
				r_killdata = kill_SMAW[data_playername]
				s_weapon = "SMAW"
				s_table = "tbl_engineer_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Engineer Weapons stuff
			--	tbl_engineer_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_A_91) do
				r_killdata = kill_A_91[data_playername]
				s_weapon = "A-91"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_ACW_R) do
				r_killdata = kill_ACW_R[data_playername]
				s_weapon = "ACW-R"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AKS_74u) do
				r_killdata = kill_AKS_74u[data_playername]
				s_weapon = "AKS-74u"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G36C) do
				r_killdata = kill_G36C[data_playername]
				s_weapon = "G36C"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G53) do
				r_killdata = kill_G53[data_playername]
				s_weapon = "G53"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M4) do
				r_killdata = kill_M4[data_playername]
				s_weapon = "M4"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M4A1) do
				r_killdata = kill_M4A1[data_playername]
				s_weapon = "M4A1"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MTAR_21) do
				r_killdata = kill_MTAR_21[data_playername]
				s_weapon = "MTAR-21"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_QBZ_95B) do
				r_killdata = kill_QBZ_95B[data_playername]
				s_weapon = "QBZ-95B"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SCAR_H) do
				r_killdata = kill_SCAR_H[data_playername]
				s_weapon = "SCAR-H"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SG553) do
				r_killdata = kill_SG553[data_playername]
				s_weapon = "SG553"
				s_table = "tbl_engineer_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Support gadgets stuff
			--	tbl_support_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M224_MORTAR) do
				r_killdata = kill_M224_MORTAR[data_playername]
				s_weapon = "M224 MORTAR"
				s_table = "tbl_support_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AMMO_BOX) do
				r_killdata = kill_AMMO_BOX[data_playername]
				s_weapon = "AMMO BOX"
				s_table = "tbl_support_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_C4_EXPLOSIVES) do
				r_killdata = kill_C4_EXPLOSIVES[data_playername]
				s_weapon = "C4 EXPLOSIVES"
				s_table = "tbl_support_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M18_CLAYMORE) do
				r_killdata = kill_M18_CLAYMORE[data_playername]
				s_weapon = "M18 CLAYMORE"
				s_table = "tbl_support_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Support Weapons stuff
			--	tbl_support_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_L86A2) do
				r_killdata = kill_L86A2[data_playername]
				s_weapon = "L86A2"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_LSAT) do
				r_killdata = kill_LSAT[data_playername]
				s_weapon = "LSAT"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M240B) do
				r_killdata = kill_M240B[data_playername]
				s_weapon = "M240B"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M249) do
				r_killdata = kill_M249[data_playername]
				s_weapon = "M249"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M27_IAR) do
				r_killdata = kill_M27_IAR[data_playername]
				s_weapon = "M27 IAR"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M60E4) do
				r_killdata = kill_M60E4[data_playername]
				s_weapon = "M60E4"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MG36) do
				r_killdata = kill_MG36[data_playername]
				s_weapon = "MG36"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PKP_PECHENEG) do
				r_killdata = kill_PKP_PECHENEG[data_playername]
				s_weapon = "PKP PECHENEG"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_QBB_95) do
				r_killdata = kill_QBB_95[data_playername]
				s_weapon = "QBB-95"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RPK_74M) do
				r_killdata = kill_RPK_74M[data_playername]
				s_weapon = "RPK-74M"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_TYPE_88_LMG) do
				r_killdata = kill_TYPE_88_LMG[data_playername]
				s_weapon = "TYPE 88 LMG"
				s_table = "tbl_support_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Recon gadgets stuff
			--	tbl_recon_gadgets
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MAV) do
				r_killdata = kill_MAV[data_playername]
				s_weapon = "MAV"
				s_table = "tbl_recon_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RADIO_BEACON) do
				r_killdata = kill_RADIO_BEACON[data_playername]
				s_weapon = "RADIO BEACON"
				s_table = "tbl_recon_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SOFLAM) do
				r_killdata = kill_SOFLAM[data_playername]
				s_weapon = "SOFLAM"
				s_table = "tbl_recon_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_T_UGS) do
				r_killdata = kill_T_UGS[data_playername]
				s_weapon = "T-UGS"
				s_table = "tbl_recon_gadgets"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Recon Weapons stuff
			--	tbl_recon_weapons
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_JNG_90) do
				r_killdata = kill_JNG_90[data_playername]
				s_weapon = "JNG-90"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_L96) do
				r_killdata = kill_L96[data_playername]
				s_weapon = "L96"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M39_EMR) do
				r_killdata = kill_M39_EMR[data_playername]
				s_weapon = "M39 EMR"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M40A5) do
				r_killdata = kill_M40A5[data_playername]
				s_weapon = "M40A5"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M417) do
				r_killdata = kill_M417[data_playername]
				s_weapon = "M417"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M98B) do
				r_killdata = kill_M98B[data_playername]
				s_weapon = "M98B"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MK11_MOD_0) do
				r_killdata = kill_MK11_MOD_0[data_playername]
				s_weapon = "MK11 MOD 0"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_QBU_88) do
				r_killdata = kill_QBU_88[data_playername]
				s_weapon = "QBU-88"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SKS) do
				r_killdata = kill_SKS[data_playername]
				s_weapon = "SKS"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SV98) do
				r_killdata = kill_SV98[data_playername]
				s_weapon = "SV98"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SVD) do
				r_killdata = kill_SVD[data_playername]
				s_weapon = "SVD"
				s_table = "tbl_recon_weapons"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

if SharedUtils:GetCurrentGameMode() == "ConquestLarge0" or SharedUtils:GetCurrentGameMode() == "ConquestSmall0"
or SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0"
or SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0" or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1"
or SharedUtils:GetCurrentGameMode() == "TankSuperiority0" or SharedUtils:GetCurrentGameMode() == "AirSuperiority0"
or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0" or SharedUtils:GetCurrentGameMode() == "HeliSuperiority0" then


	if Config.consolespam_section5 then
			print(" Reading Air and Land vehicle kills from collected tables")
	end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Air vehicles stuff
			--	tbl_air_vehicles
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_A10_THUNDERBOLT) do
				r_killdata = kill_A10_THUNDERBOLT[data_playername]
				s_weapon = "A-10 THUNDERBOLT"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AH_1Z_VIPER) do
				r_killdata = kill_AH_1Z_VIPER[data_playername]
				s_weapon = "AH-1Z VIPER"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AH_6J_LITTLE_BIRD) do
				r_killdata = kill_AH_6J_LITTLE_BIRD[data_playername]
				s_weapon = "AH-6J LITTLE BIRD"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_F_35) do
				r_killdata = kill_F_35[data_playername]
				s_weapon = "F-35"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_FA_18E_SUPER_HORNET) do
				r_killdata = kill_FA_18E_SUPER_HORNET[data_playername]
				s_weapon = "F/A-18E SUPER HORNET"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GUNSHIP) do
				r_killdata = kill_GUNSHIP[data_playername]
				s_weapon = "GUNSHIP"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_KA_60_KASATKA) do
				r_killdata = kill_KA_60_KASATKA[data_playername]
				s_weapon = "KA-60 KASATKA"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MI_28_HAVOC) do
				r_killdata = kill_MI_28_HAVOC[data_playername]
				s_weapon = "MI-28 HAVOC"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SU_25TM_FROGFOOT) do
				r_killdata = kill_SU_25TM_FROGFOOT[data_playername]
				s_weapon = "SU-25TM FROGFOOT"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SU_35BM_FLANKER_E) do
				r_killdata = kill_SU_35BM_FLANKER_E[data_playername]
				s_weapon = "SU-35BM FLANKER-E"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SU_37) do
				r_killdata = kill_SU_37[data_playername]
				s_weapon = "SU-37"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_TV_MISSILE) do
				r_killdata = kill_TV_MISSILE[data_playername]
				s_weapon = "TV MISSILE"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_UH_1Y_VENOM) do
				r_killdata = kill_UH_1Y_VENOM[data_playername]
				s_weapon = "UH-1Y VENOM"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_Z_11W) do
				r_killdata = kill_Z_11W[data_playername]
				s_weapon = "Z-11W"
				s_table = "tbl_air_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Land vehicles stuff
			--	tbl_land_vehicles
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_9K22_TUNGUSKA_M) do
				r_killdata = kill_9K22_TUNGUSKA_M[data_playername]
				s_weapon = "9K22 TUNGUSKA-M"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_9M133_KORNET_LAUNCHER) do
				r_killdata = kill_9M133_KORNET_LAUNCHER[data_playername]
				s_weapon = "9M133 KORNET LAUNCHER"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AAV_7A1_AMTRAC) do
				r_killdata = kill_AAV_7A1_AMTRAC[data_playername]
				s_weapon = "AAV-7A1 AMTRAC"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_BARSUK) do
				r_killdata = kill_BARSUK[data_playername]
				s_weapon = "BARSUK"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_BM_23) do
				r_killdata = kill_BM_23[data_playername]
				s_weapon = "BM-23"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_BMP_2M) do
				r_killdata = kill_BMP_2M[data_playername]
				s_weapon = "BMP-2M"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_BTR_90) do
				r_killdata = kill_BTR_90[data_playername]
				s_weapon = "BTR-90"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_CENTURION_C_RAM) do
				r_killdata = kill_CENTURION_C_RAM[data_playername]
				s_weapon = "CENTURION C-RAM"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_CIVILIAN_CAR) do
				r_killdata = kill_CIVILIAN_CAR[data_playername]
				s_weapon = "CIVILIAN CAR"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_DELIVERY_VAN) do
				r_killdata = kill_DELIVERY_VAN[data_playername]
				s_weapon = "DELIVERY VAN"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_DIRTBIKE) do
				r_killdata = kill_DIRTBIKE[data_playername]
				s_weapon = "DIRTBIKE"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_DPV) do
				r_killdata = kill_DPV[data_playername]
				s_weapon = "DPV"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GAZ_3937_VODNIK) do
				r_killdata = kill_GAZ_3937_VODNIK[data_playername]
				s_weapon = "GAZ-3937 VODNIK"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GROWLER_ITV) do
				r_killdata = kill_GROWLER_ITV[data_playername]
				s_weapon = "GROWLER ITV"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_HMMWV_ASRAD) do
				r_killdata = kill_HMMWV_ASRAD[data_playername]
				s_weapon = "HMMWV ASRAD"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_LAV_25) do
				r_killdata = kill_LAV_25[data_playername]
				s_weapon = "LAV-25"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_LAV_AD) do
				r_killdata = kill_LAV_AD[data_playername]
				s_weapon = "LAV-AD"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M1_ABRAMS) do
				r_killdata = kill_M1_ABRAMS[data_playername]
				s_weapon = "M1 ABRAMS"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M1114_HMMWV) do
				r_killdata = kill_M1114_HMMWV[data_playername]
				s_weapon = "M1114 HMMWV"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M1128) do
				r_killdata = kill_M1128[data_playername]
				s_weapon = "M1128"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M142) do
				r_killdata = kill_M142[data_playername]
				s_weapon = "M142"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M220_TOW_LAUNCHER) do
				r_killdata = kill_M220_TOW_LAUNCHER[data_playername]
				s_weapon = "M220 TOW LAUNCHER"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PANTSIR_S1) do
				r_killdata = kill_PANTSIR_S1[data_playername]
				s_weapon = "PANTSIR-S1"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PHOENIX) do
				r_killdata = kill_PHOENIX[data_playername]
				s_weapon = "PHOENIX"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_POLICE_VAN) do
				r_killdata = kill_POLICE_VAN[data_playername]
				s_weapon = "POLICE VAN"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_QUAD_BIKE) do
				r_killdata = kill_POLICE_VAN[data_playername]
				s_weapon = "QUAD BIKE"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RHIB_BOAT) do
				r_killdata = kill_RHIB_BOAT[data_playername]
				s_weapon = "RHIB BOAT"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RHINO) do
				r_killdata = kill_RHINO[data_playername]
				s_weapon = "RHINO"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SKID_LOADER) do
				r_killdata = kill_SKID_LOADER[data_playername]
				s_weapon = "SKID LOADER"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SPRUT_SD) do
				r_killdata = kill_SPRUT_SD[data_playername]
				s_weapon = "SPRUT-SD"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SUV) do
				r_killdata = kill_SUV[data_playername]
				s_weapon = "SUV"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_T_90A) do
				r_killdata = kill_T_90A[data_playername]
				s_weapon = "T-90A"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_TECHNICAL_TRUCK) do
				r_killdata = kill_TECHNICAL_TRUCK[data_playername]
				s_weapon = "TECHNICAL TRUCK"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_VDV_Buggy) do
				r_killdata = kill_VDV_Buggy[data_playername]
				s_weapon = "VDV Buggy"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_VODNIK_AA) do
				r_killdata = kill_VODNIK_AA[data_playername]
				s_weapon = "VODNIK AA"
				s_table = "tbl_land_vehicles"

				if getnamehuman[player.name] and r_killdata >= 1 then
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Roadkills stuff
			--	tbl_roadkills
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_roadkills) do
				r_killdata = kill_roadkills[data_playername]
				s_weapon = "Roadkills"
				s_table = "tbl_roadkills"

				if getnamehuman[player.name] and r_killdata >= 1 then
		end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------


	else 
	if Config.consolespam_section5 then
			print ("")
			print ("*** Skipping !,No data, not a Vehicle map ***")
	end
	end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	if Config.consolespam_section6 then
	print ("")
	print ("*** Start section 06 ***")
	print ("")
	end

	if SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "SquadRush0" then
 
	if Config.consolespam_section6 then
			print("")
			print("Round is over, Writing Mcom round data")
			print("Updating tbl_mcom ")
			print("")
			print(" Reading Mcom stuff from collected tables")
			print("")
	end

-- -------------

			for data_playername, count_armed in pairs(Mcom_Armed) do
				r_mcomdata = Mcom_Armed[data_playername]
				r_mcomtype = "Armed"

				if r_mcomdata >= 1 then
				updatemcomstats(player, data_playername)
				end
				end

-- -------------

			for data_playername, count_disarmed in pairs(Mcom_Disarmed) do
				r_mcomdata = Mcom_Disarmed[data_playername]
				r_mcomtype = "Disarmed"

				if r_mcomdata >= 1 then
				updatemcomstats(player, data_playername)
				end
				end

-- -------------

			for data_playername, count_destroyed in pairs(Mcom_Destroyed) do
				r_mcomdata = Mcom_Destroyed[data_playername]
				r_mcomtype = "Destroyed"

				if r_mcomdata >= 1 then
				updatemcomstats(player, data_playername)
				end
				end
	if Config.consolespam_section6 then
			print("Done updating tbl_mcom ")
	end

	else 
	if Config.consolespam_section6 then
			print("")
			print ("*** Skipping !,No data, not a Rush/Squad Rush map ***")
	end

		end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	if Config.consolespam_section7 then
	print ("")
	print ("*** Start section 07 ***")
	print ("")
	print ("*** Accuracy report ***")
	end

for data_playername, pname in pairs(getnameall) do

		if playershot[data_playername] == nil then playershot[data_playername] = 0; end
		if playerhit[data_playername] == nil then playerhit[data_playername] = 0; end

	phits=playerhit[data_playername]
	pshots=playershot[data_playername]

	if Config.consolespam_section7 then
		print("** Fetching accuracy data for "..data_playername.." **");
		print ("Player "..data_playername.." shot "..pshots.." Times")
		print ("Player "..data_playername.." hitted a player "..phits.." Times")
	end

	if not SQL:Query('UPDATE tbl_playerstats SET Shot=Shot+?, Hits=Hits+? WHERE Soldiername = ? ', pshots, phits, data_playername) then
				print('Failed to execute Update tbl_serverstats ACC query: ' .. SQL:Error())
				return
			end


	acc=Round((phits > 0 and pshots > 0 ) and phits/pshots*100 or 0,1)

	if Config.consolespam_section7 then
		print ("Player "..data_playername.." Accuracy "..acc.." %")
		print("")
	end

end

-- ------------
-- ------------
-- ------------
--[[
Here set server stats on shots fired and hits
]]
	sacc=Round((server_acc_hit > 0 and server_acc_shot > 0 ) and server_acc_hit/server_acc_shot*100 or 0,1)
	if Config.consolespam_section7 then
		print("** Fetching Round accuracy data **");
		print ("Round data total shots fired: "..server_acc_shot.." Times")
		print ("Round data total hits received: "..server_acc_hit.." Times")
		print("")
		print ("Round accuracy: Accuracy "..sacc.." %")
		print("")
	end

	if not SQL:Query('UPDATE tbl_serverstats SET SumShot=SumShot+?, SumHits=SumHits+? ', server_acc_shot, server_acc_hit) then
				print('Failed to execute Update tbl_serverstats ACC query: ' .. SQL:Error())
				return
			end


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

	print("** End SQL event stuff **")
	
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

			PUE00_playerrounddata = false -- ensure it prints one time only
		end

		s_roundover_starttimer_PUE00 = os.time()
	end
end)


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we do some function calls
-- Print statement used for console debug, will be removed IF this ever works 100% as it should be.

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function playerstatsstuff(player, data_playername)

	if Config.consolespam_playerstatsstuff then
		print("End of round player "..s_sqltype.." report for "..data_playername.." - "..s_sqltype..":"..r_data)
	end

			if not SQL:Query('UPDATE '..s_table..' SET '..s_sqltype..' = '..s_sqltype..' + ? WHERE Soldiername = ?', r_data,data_playername) then
				print(" - Failed to update kill data in "..s_table..": " .. SQL:Error())
				return
			end
		end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function updateweaponkillstats(player, data_playername)
--	if getnamehuman[player.name] and r_killdata >= 1 then
	if getnameall[player.name] and r_killdata >= 1 then

	if Config.consolespam_killtable then
			print("xD Found player "..data_playername.." in "..s_table.." table, with the "..s_weapon.." - Kills:"..r_killdata)
	end

-- Here also correct the kill we added when creating the table entry by removing 1 kill on the end.
			if not SQL:Query('UPDATE ' .. s_table .. ' SET Kills=Kills+?-1 WHERE Soldiername = ? and Weaponname = ?', r_killdata, data_playername, s_weapon) then
				print(" - Failed to update kill data in "..s_table..": " .. SQL:Error())
				return
			end
		end
	end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function updatemcomstats(player, data_playername)
--	if getnamehuman[player.name] and r_mcomdata >= 1 then
	if getnameall[player.name] and r_mcomdata >= 1 then
	
	if Config.consolespam_mcomtable then
				print("xD Updating player "..data_playername.." in Mcom "..r_mcomtype.." table, with "..r_mcomdata.." "..r_mcomtype.." Mcoms")
	end

				if not SQL:Query('UPDATE tbl_mcom SET '..r_mcomtype..' = '..r_mcomtype..' + ? WHERE Soldiername = ?', r_mcomdata,data_playername) then

				print("Failed to update "..r_mcomtype.." data in tbl_mcom "..SQL:Error())
				return	end

--[[
	if Config.consolespam_mcomtable then
				print("xD Done updating player "..data_playername.." in Mcom "..r_mcomtype.." table, with "..r_mcomdata.." "..r_mcomtype.." Mcoms")
				print("")
	end
]]

	end
end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

return PUE00_setplayerrounds()

