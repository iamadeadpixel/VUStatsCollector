Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** SQL Functions loaded ***");
	end
	end
end)
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------


function updateserverstats(player, data_playername)
	
			if not SQL:Query('UPDATE tbl_serverstats SET SumScore=SumScore+?, SumKills=SumKills+?, SumDeaths=SumDeaths+?, SumSuicide=SumSuicide+?, SumHeadshots=SumHeadshots+?, SumTeamKilled=SumTeamKilled+?, SumDogtags=SumDogtags+?, SumRevives=SumRevives+?, SumKillstreak=SumKillstreak+?, SumRounds=SumRounds+?, SumRoadkills=SumRoadkills+?, SumPlaytime=SumPlaytime+?, SumShot=SumShot+?, SumHits=SumHits+? ', eor_serverscore, eor_kills, eor_deaths, eor_suicides, eor_headshots, eor_teamskills, eor_dogtags, eor_revives, eor_killstreak, 1, eor_roadkills, s_roundTime, server_acc_shot, server_acc_hit) then
				print('Failed to execute Update tbl_serverstats query: ' .. SQL:Error())
				return
    end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function updateservermapstats(player, data_playername)

	s_Query ='INSERT INTO tbl_mapstats (RoundID,  TimeRoundStarted,  TimeRoundEnd,    MapName,    Gamemode,  Roundscore,   Roundtime,   winningTeam,  MaxPlayers,      Shot,           Hits) VALUES (?,?,?,?,?,?,?,?,?,?,?)'
		if not SQL:Query(s_Query,  s_RoundID, s_startroundtime, s_endroundtime, s_LevelName, s_GameMode, eor_serverscore, s_roundTime, n_winningTeam,     pc,     server_acc_shot, server_acc_hit) then
				print('Failed to execute query: ' .. SQL:Error())
				return
			end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function playerstatscombo(player, data_playername)

	if not SQL:Query('UPDATE tbl_playerstats SET Score=Score+?, Kills=Kills+?, Deaths=Deaths+?, Suicide=Suicide+?, Headshots=Headshots+?, TeamKilled=TeamKilled+?, Dogtags=Dogtags+?, Revives=Revives+?,	Killstreaks=Killstreaks+?, Wins=Wins+?, Losses=Losses+?, Shot=Shot+?, Hits=Hits+? WHERE Soldiername = ? ', pScore, pKills, pDeaths, pSuicide, pHeadshots, pTeamKilled, pDogtags, pRevives, pKillstreaks, pWins, pLosses, pshots, phits, data_playername) then
				print('Failed to execute Update tbl_serverstats ACC query: ' .. SQL:Error())
				return
		end
end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function updatemcomstats(player, data_playername)

	if not SQL:Query('UPDATE tbl_mcom SET Armed = Armed + ?, Disarmed = Disarmed + ?, Destroyed = Destroyed + ? WHERE Soldiername = ?', r_data_Armed, r_data_Disarmed, r_data_Destroyed, data_playername) then
		print("Failed to update "..r_mcomtype.." data in tbl_mcom "..SQL:Error())
			return
		end
end

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function updateplayerround(player, data_playername)
	
	if not SQL:Query('UPDATE tbl_playerdata SET Rounds=Rounds+?  WHERE Soldiername = ?', 1, getnamehuman[player.name]) then
					print('Failed to execute Update Rounds query: ' .. SQL:Error())
					return
			end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function updateweaponstats(player, data_playername)

	if getnameall[data_playername] and r_killdata >= 1 or r_headshotdata >= 1 or r_deathdata >= 1 then

	if Config.consolespam_functioncalls_msg then
	print ("PRE Update record for "..data_playername.." - Table name:"..s_table.." - Weapon:"..s_weapon.." - Kills:"..r_killdata.." - Headshots:"..r_headshotdata.." - Deaths:"..r_deathdata)
	end
	end

	if Config.consolespam_functioncalls_sql then
				s_sqltype_kills = "Kills"
				s_sqltype_headshot = "Headshot"
				s_sqltype_deaths = "Deaths"
	if not SQL:Query('UPDATE '..s_table..' SET '..s_sqltype_kills..' = '..s_sqltype_kills..'+?, '..s_sqltype_headshot..' = '..s_sqltype_headshot..'+?, '..s_sqltype_deaths..' = '..s_sqltype_deaths..'+?  WHERE Soldiername = ? and Weaponname = ?', r_killdata, r_headshotdata, r_deathdata, data_playername, s_weapon) then
				print(" - Failed to update data in "..s_table..": " .. SQL:Error())
				return
			end
	end

end -- end of fucktion stuff (this is not a typo, hehe)

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
function escapepoint(player, data_playername)
	print ("")
	print ("Oeps, Something went realy wrong !")
	if breakpoint then return
	end

--[[
Tempory solution
It randomly happens that variables got nullified
and this part of the lua script goes bonkus and loops
and fills the mod.db with false stuff
]]

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
