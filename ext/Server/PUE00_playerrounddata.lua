-- Spaghetti code by iamadeadpixel

---@class PUE00_setplayerrounds
PUE00_setplayerrounds = class 'PUE00_setplayerrounds'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PUE00_setplayerrounds mod loaded ***");
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

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here update the round table in the tbl_playerdata database
			print("")
			print("Round is over, Writing player round data")
			print("")

			-- No BS mode needed, default data is written when the player joinded the first time
			if player.name == getnamehuman[player.name] then -- if we dont do this, things wil go wrong.

				if not SQL:Query('UPDATE tbl_playerdata SET Rounds=Rounds+?  WHERE Soldiername = ?', 1, getnamehuman[player.name]) then
					print('Failed to execute Update Rounds query: ' .. SQL:Error())
					return
				end
			end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we update tbl_serverstats database with new player data.

			pc = PlayerManager:GetPlayerCount()

			print("")
			print("Dumping all score data")
			print("")

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

			for playertk, tk in pairs(playerteamkilled) do
				eor_teamskills = eor_teamskills + tk
			end

			for playerdt, dt in pairs(playerdogtags) do
				eor_dogtags = eor_dogtags + dt
			end

			for playerhs, hs in pairs(playerheadshot) do
				eor_headshots = eor_headshots + hs
			end

			for playerds, ds in pairs(playerdeaths) do
				eor_deaths = eor_deaths + ds
			end

			for playerks, ks in pairs(playerkills) do
				eor_kills = eor_kills + ks
			end

			for playersc, sc in pairs(playersuicides) do
				eor_suicides = eor_suicides + sc
			end

			for playerrv, rv in pairs(playerrevivs) do
				eor_revives = eor_revives + rv
			end

			for playerK, Kkills in pairs(kill_roadkills) do
				eor_roadkills = eor_roadkills + Kkills
			end


			print("")
			print("** Gamemode:" ..s_GameMode .." - Mapname:" ..s_LevelName .. " - Winning team:" .. n_winningTeam .. " - Total players this round:" .. pc)
			print("** Time round start:" ..s_startroundtime .. " - Time round end:" ..s_endroundtime .. " - Total round time:" .. s_roundTime .. " Seconds **")

			print("Session stats - total kills:" ..eor_kills .." - Total Deaths:" ..eor_deaths .. " - Total Headshots:" .. eor_headshots .. " - Total Roadkills:" .. eor_roadkills)
			print("Session stats - Total Dogtags:" ..eor_dogtags .." - Total TeamKills:" .. eor_teamskills .." - Total suicides:" .. eor_suicides .. " - Total Revives:" .. eor_revives)

			print("Team1 score:" ..teamscoreUS .." - Team2 score:" ..teamscoreRU .." - Team3 score:" ..teamscore3 .. " - Team4 score:" .. teamscore4 .. " - Total round score:" .. serverscore)
			print("")

			print("** End of score report **")
			print("")
			print("Updating tbl_serverstats with new data")

			if not SQL:Query('UPDATE tbl_serverstats SET SumScore=SumScore+?, SumKills=SumKills+?, SumDeaths=SumDeaths+?, SumSuicide=SumSuicide+?, SumHeadshots=SumHeadshots+?, SumTeamKilled=SumTeamKilled+?, SumDogtags=SumDogtags+?, SumRevives=SumRevives+?, SumRounds=SumRounds+?, SumRoadkills=SumRoadkills+?, SumPlaytime=SumPlaytime+?', serverscore, eor_kills, eor_deaths, eor_suicides, eor_headshots, eor_teamskills, eor_dogtags, eor_revives, 1, eor_roadkills, s_roundTime) then
				print('Failed to execute Update tbl_serverstats query: ' .. SQL:Error())
				return
			end


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we update the map stats in tbl_mapstats database.

			local RoundID_results = SQL:Query('SELECT RoundID FROM tbl_mapstats')
			if not RoundID_results then
				print('Failed to read Guid query: ' .. SQL:Error())
				return
			end

			print("*** Done reading RoundID's ***");

			-- Print the fetched rows.
			for _, l_Row in pairs(RoundID_results) do
				temp_RoundID = l_Row["RoundID"]
			end


			if temp_RoundID == nil then temp_RoundID = 0; end
			s_RoundID = temp_RoundID + 1
			print("Found this roundID:" .. temp_RoundID)

			print("Updating tbl_mapstats with this data:" .. s_RoundID .. " - " ..s_startroundtime .. " - " .. s_endroundtime)
			print("Updating tbl_mapstats with this data:" ..s_LevelName .. " - " .. s_GameMode .. " - " ..serverscore .. " - " .. s_roundTime .. " - " .. n_winningTeam .. " - " .. pc)


			s_Query ='INSERT INTO tbl_mapstats         (RoundID,  TimeRoundStarted,  TimeRoundEnd,    MapName,    Gamemode,  Roundscore,   Roundtime,   winningTeam,  MaxPlayers) VALUES (?,?,?,?,?,?,?,?,?)'
			if not SQL:Query(s_Query, s_RoundID, s_startroundtime, s_endroundtime, s_LevelName, s_GameMode, serverscore, s_roundTime, n_winningTeam, pc) then
				print('Failed to execute query: ' .. SQL:Error())
				return
			end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we update tbl_playerstats database with player data

			print(" Reading tbl_playerstats and updating them")

			for playerK, PDscore in pairs(playerscore) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Score:" .. PDscore)

					if not SQL:Query('UPDATE tbl_playerstats SET Score=Score+? WHERE Soldiername = ?', PDscore, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDkills in pairs(playerkills) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Kills:" .. PDkills)

					if not SQL:Query('UPDATE tbl_playerstats SET Kills=Kills+? WHERE Soldiername = ?', PDkills, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDdeaths in pairs(playerdeaths) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Deaths:" .. PDdeaths)

					if not SQL:Query('UPDATE tbl_playerstats SET Deaths=Deaths+? WHERE Soldiername = ?', PDdeaths, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--

			for playerK, PDsuicide in pairs(playersuicides) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Suicides:" .. PDsuicide)

					if not SQL:Query('UPDATE tbl_playerstats SET Suicide=Suicide+? WHERE Soldiername = ?', PDsuicide, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDheadshot in pairs(playerheadshot) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Headshots:" .. PDheadshot)

					if not SQL:Query('UPDATE tbl_playerstats SET Headshots=Headshots+? WHERE Soldiername = ?', PDheadshot, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDteamkilled in pairs(playerteamkilled) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Teamkilled:" .. PDteamkilled)

					if not SQL:Query('UPDATE tbl_playerstats SET TeamKilled=TeamKilled+? WHERE Soldiername = ?', PDteamkilled, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDdogtags in pairs(playerdogtags) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Dogtags taken:" .. PDdogtags)

					if not SQL:Query('UPDATE tbl_playerstats SET Dogtags=Dogtags+? WHERE Soldiername = ?', PDdogtags, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDrevives in pairs(playerrevivs) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Revives:" .. PDrevives)

					if not SQL:Query('UPDATE tbl_playerstats SET Revives=Revives+? WHERE Soldiername = ?', PDrevives, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--

-- Roadkills have its own tbl stuff
			for playerK, PDroadkilled in pairs(kill_roadkills) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - roadkilled:" .. PDroadkilled)
				end
			end


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- This stuff should update all vehicle and weapon table data.

			print(" Reading weapon kills from collected tables")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	auxiliary weapon stuff
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_XBOW) do
				r_killdata = kill_XBOW[data_playername]
				s_weapon = "XBOW"
				s_table = "tbl_auxiliary_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			print(" Reading vehicle kills from collected tables")

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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
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
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if getnamehuman[player.name] and r_killdata >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

				print("")
				print("** last table done **")
				print("")


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

function updateweaponkillstats(player, data_playername)
	if getnamehuman[player.name] then
	WeaponResults = SQL:Query('SELECT Weaponname, Soldiername FROM ' .. s_table .. ' WHERE Soldiername = ? and Weaponname = ?', data_playername,s_weapon)
	if not WeaponResults then
		print('Failed to read "..s_table.." KILL query: ' .. SQL:Error()); return
	end

	for killer, data in pairs(WeaponResults) do
		founddata_Soldiername = data["Soldiername"]
		founddata_Weaponname = data["Weaponname"]
	end

	-- New player stuff
	if founddata_Soldiername ~= data_playername and founddata_Weaponname ~= s_weapon then
		print(s3.." - Inserting " .. data_playername .. " with " .. r_killdata .. " kills in " .. s_table)
		s_Query = 'INSERT INTO ' .. s_table ..'    (Weaponname,    Soldiername,       Kills) VALUES (?,?,?)'
				if not SQL:Query(s_Query,    s_weapon,   data_playername,  r_killdata) then
			print(s3.." - Failed to insert kill data in "..s_table..": " .. SQL:Error())
			return
		end
		print(s3 .. " - Done inserting " .. data_playername)
	else
		-- Updating existing playerdata
		if founddata_Soldiername == data_playername and founddata_Weaponname == s_weapon then
			print(s1.." - Kill data for Soldier " .. data_playername .." found with weapon " .. s_weapon .. " in " .. s_table)
			if not SQL:Query('UPDATE ' .. s_table .. ' SET Kills=Kills+? WHERE Soldiername = ? and Weaponname = ?', r_killdata, data_playername, s_weapon) then
				print(s1.." - Failed to update kill data in "..s_table..": " .. SQL:Error())
				return
			end
			print(s1.." - Done updating " .. data_playername)
		end
	end
end
end -- End of function call


return PUE00_setplayerrounds()
