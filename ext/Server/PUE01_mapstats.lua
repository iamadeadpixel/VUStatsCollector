-- Spaghetti code by iamadeadpixel

---@class PUE01_mapstats
PUE01_mapstats = class 'PUE01_mapstats'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** PUE01_mapstats mod loaded ***"); 
	end
end)


-- Kick in when a player joins the server
	s_roundover_starttimer_PUE01 = os.time()
	s_roundover_timer_PUE01 = 3

	Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE01 = os.time()
	s_roundover_elapsed_timer_PUE01 = os.difftime(s_roundover_end_timer_PUE01, s_roundover_starttimer_PUE01)
	s_roundover_elapsed_timer_PUE01 = math.floor(s_roundover_elapsed_timer_PUE01)
	if s_roundover_elapsed_timer_PUE01 >= s_roundover_timer_PUE01 then

if PUE01_mapstats == true then 
	pc = PlayerManager:GetPlayerCount()

	print ("")
	print ("Dumping all score data")
	print ("")

    for playername1, scoreUS in pairs(playerscore1) do ;
	teamscoreUS = teamscoreUS + scoreUS
end

    for playername2, scoreRU in pairs(playerscore2) do ;
	teamscoreRU = teamscoreRU + scoreRU
end

    for playername3, score3 in pairs(playerscore3) do ;
	teamscore3 = teamscore3 + score3
end

    for playername4, score4 in pairs(playerscore4) do ;
	teamscore4 = teamscore4 + score4
end
	
	serverscore = teamscoreUS + teamscoreRU + teamscore3 + teamscore4

--

    for playertk, tk in pairs(playerteamkilled) do ;
	eor_teamskills = eor_teamskills + tk
end

    for playerdt, dt in pairs(playerdogtags) do ;
	eor_dogtags = eor_dogtags + dt
end

    for playerhs, hs in pairs(playerheadshot) do ;
	eor_headshots = eor_headshots + hs
end

    for playerds, ds in pairs(playerdeaths) do ;
	eor_deaths = eor_deaths + ds
end

    for playerks, ks in pairs(playerkills) do ;
	eor_kills = eor_kills + ks
end

    for playersc, sc in pairs(playersuicides) do ;
	eor_suicides = eor_suicides + sc
end

    for playerrv, rv in pairs(playerrevivs) do ;
	eor_revives = eor_revives + rv
end

    for playerK, Kkills in pairs(kill_roadkills) do ;
	eor_roadkills = eor_roadkills + Kkills
end




	print ("")
	print ("** Gamemode:"..s_GameMode.." - Mapname:"..s_LevelName.." - Winning team:"..n_winningTeam.." - Total players this round:"..pc)
	print ("** Time round start:"..s_startroundtime.." - Time round end:"..s_endroundtime.." - Total round time:"..s_roundTime.." Seconds **")

	print ("Session stats - total kills:"..eor_kills.." - Total Deaths:"..eor_deaths.." - Total Headshots:"..eor_headshots.." - Total Roadkills:"..kill__roadkills)
	print ("Session stats - Total Dogtags:"..eor_dogtags.." - Total TeamKills:"..eor_teamskills.." - Total suicides:"..eor_suicides.." - Total Revives:"..eor_revives)

	print ("Team1 score:"..teamscoreUS.." - Team2 score:"..teamscoreRU.." - Team3 score:"..teamscore3.." - Team4 score:"..teamscore4.." - Total round score:"..serverscore)
	print ("")

	print ("** End of score report **")
	print ("")
	print ("Updating tbl_serverstats with new data")

	if not SQL:Query('UPDATE tbl_serverstats SET SumScore=SumScore+?, SumKills=SumKills+?, SumDeaths=SumDeaths+?, SumSuicide=SumSuicide+?, SumHeadshots=SumHeadshots+?, SumTeamKilled=SumTeamKilled+?, SumDogtags=SumDogtags+?, SumRevives=SumRevives+?, SumRounds=SumRounds+?, SumRoadkills=SumRoadkills+?, SumPlaytime=SumPlaytime+?',serverscore, eor_kills, eor_deaths, eor_suicides, eor_headshots, eor_teamskills, eor_dogtags,   eor_revives,      1,      eor_roadkills, s_roundTime ) then
				print('Failed to execute Update tbl_serverstats query: ' .. SQL:Error())
				return end

--
-- Here update tbl_mapstats


	local RoundID_results = SQL:Query ('SELECT RoundID FROM tbl_mapstats')
		if not RoundID_results then
			print('Failed to read Guid query: ' .. SQL:Error())
			return
		end

	print("*** Done reading RoundID's ***"); 

		-- Print the fetched rows.
		for _, l_Row in pairs(RoundID_results) do
			temp_RoundID = l_Row["RoundID"]
	end


	if temp_RoundID == nil then temp_RoundID = 0 ;    end    
    s_RoundID = temp_RoundID + 1
	print ("Found this roundID:"..temp_RoundID)

print ("Updating tbl_mapstats with this data:"..s_RoundID.." - "..s_startroundtime.." - "..s_endroundtime)
print ("Updating tbl_mapstats with this data:"..s_LevelName.." - "..s_GameMode.." - "..serverscore.." - "..s_roundTime.." - "..n_winningTeam.." - "..pc)


	s_Query = 'INSERT INTO tbl_mapstats         (RoundID,  TimeRoundStarted,  TimeRoundEnd,    MapName,    Gamemode,  Roundscore,   Roundtime,   winningTeam,  MaxPlayers) VALUES (?,?,?,?,?,?,?,?,?)'
			if not SQL:Query(s_Query,   s_RoundID, s_startroundtime, s_endroundtime, s_LevelName, s_GameMode, serverscore, s_roundTime, n_winningTeam,     pc) then
			print('Failed to execute query: ' .. SQL:Error())
			return end

	print ("** End of tbl_mapstats update report **")
	PUE02_vehiclekilldata = true
	if PUE02_vehiclekilldata == true then
	print ("")
	print ("** Starting 3nd event**")
	print ("")
	end

	PUE01_mapstats = false -- ensure it prints one time only
	end

	s_roundover_starttimer_PUE01 = os.time()
	end
end)

return PUE01_mapstats()

