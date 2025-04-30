---@class DBsetup
DBsetup = class 'DBsetup'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Database setup loaded ***");
	end
	end
end)


Events:Subscribe('Level:LoadResources', function(p_IsDedicatedServer)
	if not SQL:Open() then return end

	local s_Results = SQL:Query('SELECT * FROM tbl_playerdata')
	if not s_Results then
		print("*** Creating Table: 'tbl_playerdata' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_playerdata` (
	`Soldiername` TEXT,
	`PlayerLogins` INTEGER,
	`VU_GUID` TEXT,
	`IP` INTEGER,
	`CountryCode` INTEGER,
	`CountryName` INTEGER,
	`FirstSeenOnServer` INTEGER,
	`LastSeenOnServer` INTEGER,
	`Rounds` INTEGER,
	`PlayTime` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_playerdata Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_playerstats')
	if not s_Results then
		print("*** Creating Table: 'tbl_playerstats' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_playerstats` (
	`Soldiername` TEXT,
	`Score` INTEGER,
	`Kills` INTEGER,
	`Deaths` INTEGER,
	`Suicide` INTEGER,
	`Headshots` INTEGER,
	`TeamKilled` INTEGER,
	`Dogtags` INTEGER,
	`Revives` INTEGER,
	`Killstreaks` INTEGER,
	`Wins` INTEGER,
	`Losses` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_playerstats Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_serverstats')
	if not s_Results then
		print("*** Creating Table: 'tbl_serverstats' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_serverstats` (
	`SumPlayers` INTEGER,
	`SumScore` INTEGER,
	`SumKills` INTEGER,
	`SumDeaths` INTEGER,
	`SumSuicide` INTEGER,
	`SumHeadshots` INTEGER,
	`SumTeamKilled` INTEGER,
	`SumDogtags` INTEGER,
	`SumRevives` INTEGER,
	`SumKillstreak` INTEGER,
	`SumRounds` INTEGER,
	`SumRoadkills` INTEGER,
	`SumPlaytime` INTEGER,
	`SumShot` INTEGER,
	`SumHits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_serverstats Table: ' .. SQL:Error())
			return
		end

		s_Query ='INSERT INTO tbl_serverstats  (SumPlayers, SumScore, SumKills, SumDeaths, SumSuicide, SumHeadshots, SumTeamKilled, SumDogtags, SumRounds, SumRoadkills, SumRevives, SumKillstreak, SumPlaytime, SumShot,SumHits) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
		if not SQL:Query(s_Query, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0,0) then
			print('Failed to execute query: ' .. SQL:Error())
			return
		end
		print("*** Inserting Table entries: 'tbl_serverstats' ***")
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_mapstats')
	if not s_Results then
		print("*** Creating Table: 'tbl_mapstats' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_mapstats` (
	`RoundID` INTEGER  NOT NULL,
	`TimeRoundStarted` INTEGER,
	`TimeRoundEnd` INTEGER,
	`MapName` INTEGER,
	`Gamemode` INTEGER,
	`Roundscore` INTEGER,
	`Roundtime` INTEGER,
	`winningTeam` INTEGER,
	`MaxPlayers` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_mapstats Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_assault_gadgets')
	if not s_Results then
		print("*** Creating Table: 'tbl_assault_gadgets' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_assault_gadgets` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_assault_gadgets Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_primary_weapons')
	if not s_Results then
		print("*** Creating Table: 'tbl_primary_weapons' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_primary_weapons` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_primary_weapons Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_engineer_gadgets')
	if not s_Results then
		print("*** Creating Table: 'tbl_engineer_gadgets' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_engineer_gadgets` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_engineer_gadgets Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_support_gadgets')
	if not s_Results then
		print("*** Creating Table: 'tbl_support_gadgets' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_support_gadgets` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_support_gadgets Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_recon_gadgets')
	if not s_Results then
		print("*** Creating Table: 'tbl_recon_gadgets' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_recon_gadgets` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_recon_gadgets Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_handguns_weapons')
	if not s_Results then
		print("*** Creating Table: 'tbl_handguns_weapons' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_handguns_weapons` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_handguns_weapons Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_shotguns_weapons')
	if not s_Results then
		print("*** Creating Table: 'tbl_shotguns_weapons' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_shotguns_weapons` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_shotguns_weapons Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_assault_weapons')
	if not s_Results then
		print("*** Creating Table: 'tbl_assault_weapons' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_assault_weapons` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_assault_weapons Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_engineer_weapons')
	if not s_Results then
		print("*** Creating Table: 'tbl_engineer_weapons' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_engineer_weapons` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_engineer_weapons Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_support_weapons')
	if not s_Results then
		print("*** Creating Table: 'tbl_support_weapons' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_support_weapons` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_support_weapons Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_recon_weapons')
	if not s_Results then
		print("*** Creating Table: 'tbl_recon_weapons' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_recon_weapons` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_recon_weapons Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_land_vehicles')
	if not s_Results then
		print("*** Creating Table: 'tbl_land_vehicles' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_land_vehicles` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_land_vehicles Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_air_vehicles')
	if not s_Results then
		print("*** Creating Table: 'tbl_air_vehicles' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_air_vehicles` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_air_vehicles Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_auxiliary_gadgets')
	if not s_Results then
		print("*** Creating Table: 'tbl_auxiliary_gadgets' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_auxiliary_gadgets` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_auxiliary_gadgets Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_roadkills')
	if not s_Results then
		print("*** Creating Table: 'tbl_roadkills' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_roadkills` (
	`Weaponname` TEXT,
	`Soldiername` TEXT,
	`Kills` INTEGER,
	`Shot` INTEGER,
	`Hits` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_roadkills Table: ' .. SQL:Error())
			return
		end
	end

	--
	--
	--

	local s_Results = SQL:Query('SELECT * FROM tbl_mcom')
	if not s_Results then
		print("*** Creating Table: 'tbl_mcom' ***")
		s_Query = [[
	CREATE TABLE IF NOT EXISTS `tbl_mcom` (
	`Soldiername` TEXT,
	`Armed` INTEGER,
	`Disarmed` INTEGER,
	`Destroyed` INTEGER
	);
		]]

		if not SQL:Query(s_Query) then
			print('Failed to execute query for tbl_mcom Table: ' .. SQL:Error())
			return
		end
	end

-- --------------------------------------
-- --------------------------------------
-- --------------------------------------

	if Config.consolespam then
	print("*** DATABASE SETUP COMPLETE, END MOD.DB SETUP ***")
	end
	--
	--
	--
end)

return DBsetup()
