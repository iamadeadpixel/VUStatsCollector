-- Spaghetti code by iamadeadpixel

---@class PlayerLeaves
PlayerLeaves = class 'PlayerLeaves'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PlayerLeaves mod loaded ***");
	end
end)


Events:Subscribe('Player:Left', function(player)
	-- player.name
	CountPlayers = CountPlayers - 1
	print("Human player count:" .. CountPlayers)
	print("Human player " .. playerscollected[player.name] .. " leaving the server, removing from SQL")

	if CountPlayers == 0 then print("*** No more human players on the server"); end

	s_end_time = os.time()
	s_elapsed_time = os.difftime(s_end_time, Session_PlayTime_Start[player.name])
	s_elapsed_time = math.floor(s_elapsed_time)
	print("*** UpdateCheckInfo: LOGOFF - Player total time in seconds: " .. s_elapsed_time)

	Session_PlayTime_End[player.name] = s_elapsed_time
	if Session_PlayTime_End[player.name] then
		print("*** Player playtime on logout in seconds : " ..
			Session_PlayTime_End[player.name]);
	end

	local guid_results = SQL:Query('SELECT Soldiername, PlayerLogins, VU_GUID, Rounds, PlayTime FROM tbl_playerdata')
	if not guid_results then
		print('Failed to read Guid query: ' .. SQL:Error())
		return
	end

	print("*** SQL check: All rows readed, lets check for the correct player data. ***");
	-- Print the fetched rows.
	for _, l_Row in pairs(guid_results) do
		temp_PlayerName = l_Row["Soldiername"]
		temp_PlayerLogins = l_Row["PlayerLogins"]
		temp_Guid = l_Row["VU_GUID"]
		temp_Rounds = l_Row["Rounds"]
		temp_PlayTime = l_Row["PlayTime"]

		-- Select the correct guid if u test the crap here
		-- only one should be active,  this is info only
		if s_accountGuid == temp_Guid then print("UpdateCheckInfo: GUID FOUND FOR LEAVING PLAYER: " .. playerscollected[player.name] .. " - :" .. temp_Guid) -- Using the Accounts Guid
--		if s_playerGuid  == temp_Guid then print("UpdateCheckInfo: GUID FOUND FOR LEAVING PLAYER: " ..playerscollected[player.name].. " - :" .. temp_Guid)  -- Using the Players Guid
			print("UpdateCheckInfo: Updating player information: **");

			s_LastSeenDate = s_GetDateTime
			print("*** UpdateCheckInfo: for " .. temp_PlayerName .. " Rounds:" .. temp_Rounds)
			print("*** UpdateCheckInfo: Player login times " .. temp_PlayerLogins)
			print("*** UpdateCheckInfo: Player last play time in seconds " .. temp_PlayTime)

			s_PlayTime = temp_PlayTime + s_elapsed_time
			print("*** UpdateCheckInfo: LOGOFF - SQL - Table - new Player total time in seconds: " .. s_PlayTime)

			if not SQL:Query('UPDATE tbl_playerdata SET PlayTime=? WHERE Soldiername = ?', s_PlayTime, playerscollected[player.name]) then
				print(" ");
				print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
				print(" ");
				return
			end

			-- Removing table data on player left.
			print("Human player " .. playerscollected[player.name] .. " leaving the server, removing from DB")
			Session_PlayTime_Start[player.name] = {}
			Session_PlayTime_End[player.name] = {}
			getnamehuman[player.name] = {}
			playerishuman[player.name] = {}
			playerscollected[player.name] = {}

			print("*** Player has donked out of the server ***");
		end
	end
end)

return PlayerLeaves()
