-- Spaghetti code by iamadeadpixel

---@class PlayerJoins
PlayerJoins = class 'PlayerJoins'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PlayerJoins mod loaded ***");
	end
end)

-- init stuff
CountPlayers = 0
getnamehuman = {}  -- value is name
playerishuman = {} -- False or true
playerteamID = {}  -- value is 1, 2, 3, 4 (US/RU or squad TDM alpha beta charlie delta)

Session_PlayTime_Start = {}
Session_PlayTime_End = {}

-- All other table / variable stuff goes in TableSetup.lua



Events:Subscribe('Level:Loaded', function()
	print("*** Level loaded ***");
	endofround = false

	s_startroundtime = os.date('%Y-%m-%d %H:%M:%S')
	roundoverstate = false
	print("** reseting stuff **")
end)

--
--
--

Events:Subscribe('Player:Joining', function(name, playerGuid, ipAddress, accountGuid)
	s_player = name
	s_playerIP = ipAddress
	s_accountGuid = tostring(accountGuid)
	s_playerGuid = tostring(playerGuid)
	s_GetDateTime = os.date('%Y-%m-%d %H:%M:%S')
	Session_PlayTime_Start[name] = os.time()

	playerishuman[name] = true
	getnamehuman[name] = name
	if getnamehuman[name] then print("*** Human Player:" .. getnamehuman[name] .. " Joined ***"); end
	if playerishuman[name] then print("*** Human flag is set for " .. getnamehuman[name]); end

	CountPlayers = CountPlayers + 1
	print("Human player count:" .. CountPlayers)


	-- Players ID get checked by its Guid
	print('*** ServerInfo: ** Lets check if the player is found **')
	print("*** SQL check: Can we find the players Guid in here ***");
	-- SQL:Open()
	local guid_results = SQL:Query('SELECT Soldiername, PlayerLogins, VU_GUID, PlayTime FROM tbl_playerdata')
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
		temp_PlayTime = l_Row["PlayTime"]

		if s_accountGuid == temp_Guid then
			print("*** ServerInfo: GUID FOUND FOR PLAYER: " .. s_player .. " - :" .. temp_Guid)
			--		if s_playerGuid  == temp_Guid then print("*** ServerInfo: GUID FOUND FOR PLAYER: " ..s_player.. " - :" .. temp_Guid)

			print("*** UpdateCheckInfo: Player login times " .. temp_PlayerLogins)
			print("*** UpdateCheckInfo: Player last play time in seconds " .. temp_PlayTime)

			s_PlayerLogins = temp_PlayerLogins + 1
			print("*** UpdateCheckInfo: Players name found in SQL base:" .. temp_PlayerName)
			print("*** UpdateCheckInfo: Players name fetched from Login:" .. s_player)

			-- Check if player has used a different character account
			if temp_PlayerName == s_player then
				print("*** UpdateCheckInfo: Players name not changed: " .. temp_PlayerName .. " - " .. s_player)

				if not SQL:Query('UPDATE tbl_playerdata SET PlayerLogins=PlayerLogins+?,   LastSeenOnServer= ? WHERE Soldiername = ?', 1, s_GetDateTime, s_player) then
					print('Failed to execute Update query: ' .. SQL:Error())
					return
				end


				print(" ");
				print('*** UpdateCheckInfo: ** Done Updating Player information on joining the server **')
				print("*** UpdateCheckInfo: Player new login times " .. s_PlayerLogins)
				print(" ");


				-- At here, if the name is changed, it updates the SQL
				-- Dont forget to insert/update other type tables that contains a playername !
			elseif temp_PlayerName ~= s_player then
				print("*** UpdateCheckInfo: Players name was changed from " .. temp_PlayerName .. " into " .. s_player)
				print("*** UpdateCheckInfo: Updating Players name: " .. temp_PlayerName .. " -> " .. s_player);


	if not SQL:Query('UPDATE tbl_playerdata SET PlayerLogins=?, Soldiername = ?,  LastSeenOnServer= ? WHERE Soldiername = ?', s_PlayerLogins, s_player, s_GetDateTime, temp_PlayerName) then
		print('Failed to execute name change for tbl_playerdata query: ' .. SQL:Error())
					return
				end

				mytables = {
					"tbl_air_vehicles",
					"tbl_assault_gadgets",
					"tbl_assault_weapons",
					"tbl_auxiliary_gadgets",
					"tbl_engineer_gadgets",
					"tbl_engineer_weapons",
					"tbl_handguns_weapons",
					"tbl_land_vehicles",
					"tbl_playerstats",
					"tbl_primary_weapons",
					"tbl_recon_gadgets",
					"tbl_recon_weapons",
					"tbl_roadkills",
					"tbl_shotguns_weapons",
					"tbl_support_gadgets",
					"tbl_support_weapons"
				}

				for k, value in ipairs(mytables) do
					print("Updating table " .. value .. " with new player name")
					if not SQL:Query('UPDATE ' .. value .. ' SET Soldiername = ? WHERE Soldiername = ?', s_player, temp_PlayerName) then
						print('Failed to execute name change for "..value.." query: ' .. SQL:Error())
						return
					end
				end


				-- ------------------------
				--	
				print(" ");
				print('*** UpdateCheckInfo: ** Done Updating Player information on joining the server **')
				print("*** UpdateCheckInfo: Player new login times " .. s_PlayerLogins)
				print(" ");
			end
			return
		end
	end
	--
	--
	print("*** ServerInfo: NO GUID FOUND FOR PLAYER " .. s_player .. " NEW PLAYER ***")

	-- Fully working thanks to Bree_Arnold and Doc-Ice-Elm
	---@param response HttpResponse
	Net:GetHTTPAsync('https://api.ipify.org/?format=json', function(response)
		if response.status ~= 200 then return end

		local s_Response_ip = json.decode(response.body)
		local s_Server_IP = s_Response_ip.ip
		s_ServerIP = tostring(s_Server_IP)
		print("*** ServerInfo: IP FOUND FOR PLAYER: " .. s_player .. " - :" .. s_ServerIP)

		-- Fully working thanks to Bree_Arnold
		-- Used the EXTERNAL IP from server
		---@param response HttpResponse
--	Net:GetHTTPAsync('https://api.cleantalk.org/?method_name=ip_info&ip='..s_ServerIP, function (response) -- Using the external IP fetched by the json
	Net:GetHTTPAsync('https://api.cleantalk.org/?method_name=ip_info&ip='..s_playerIP, function (response) -- Using the Internal fetched IP by the player login
				if response.status ~= 200 then return end

				local s_Response = json.decode(response.body)
--	cc_CountryName = s_Response.data[s_ServerIP].country_name -- Using the external IP fetched by the json
--	cn_CountryCode = s_Response.data[s_ServerIP].country_code -- Using the external IP fetched by the json
	cc_CountryName = s_Response.data[s_playerIP].country_name -- Using the internal IP fetched by the json -- Using the Internal fetched IP by the player login
	cn_CountryCode = s_Response.data[s_playerIP].country_code -- Using the internal IP fetched by the json -- Using the Internal fetched IP by the player login

				s_CountryCode = tostring(cn_CountryCode)
				s_CountryName = tostring(cc_CountryName)

				s_MapData = "New player Setup stuff"
				print('' .. s_MapData .. ': - Client Info EXT:        Player name: ' .. s_player .. ' ')
				print('' .. s_MapData .. ': - Client Info EXT:        Player   IP: ' .. s_playerIP .. ' ')
				print('' .. s_MapData .. ': - Client Info EXT: Player global GUID: ' .. s_accountGuid .. ' ') -- Global Guid
				print('' .. s_MapData .. ': - Client Info EXT:        Player GUID: ' .. s_playerGuid .. ' ') -- Guid for each player you made.
				print('' .. s_MapData .. ': - Client Info EXT:  Players Join date: ' .. s_GetDateTime .. ' ')
				print('' .. s_MapData .. ': - Client Info EXT: Player External IP: ' .. s_ServerIP .. ' ')
				print('' ..
					s_MapData ..
					': - Client Info EXT:    Players country: ' ..
					s_CountryName .. ' CountryCode: ' .. s_CountryCode .. ' ')

				-- Here we check the players Guid entry,  and insert the new player
				local playerGuid_results = SQL:Query('SELECT VU_GUID FROM tbl_playerdata')
				if not playerGuid_results then
					print('Failed to read Guid query: ' .. SQL:Error())
					return
				end

				print("*** Done reading all playerID's ***");
				-- Print the fetched rows.
				for _, l_Row in pairs(playerGuid_results) do
					temp_PlayerGuid = l_Row["VU_GUID"]
				end

				-- Increasing playerID number by 1
				if temp_PlayerGuid == nil then print("No Guid found"); end


				s_FirstSeenDate = s_GetDateTime
	s_Query ='INSERT INTO tbl_playerdata    (Soldiername,  PlayerLogins,      VU_GUID,         IP,      CountryCode,   CountryName,   FirstSeenOnServer, LastSeenOnServer,  Rounds, PlayTime) VALUES (?,?,?,?,?,?,?,?,?,?)'
		if not SQL:Query(s_Query,         s_player,         1,         s_accountGuid,  s_playerIP, s_CountryCode, s_CountryName,   s_FirstSeenDate,   s_FirstSeenDate,     0,       0) then
--		if not SQL:Query(s_Query,         s_player,         1,          s_playerGuid,  s_playerIP, s_CountryCode, s_CountryName,   s_FirstSeenDate,   s_FirstSeenDate,     0,       0) then
					print('Failed to execute query: ' .. SQL:Error())
					return
				end

		s_Query ='INSERT INTO tbl_playerstats     (Soldiername, Score, Kills, Deaths, Suicide, Headshots, TeamKilled, Dogtags, Revives, Wins, Losses) VALUES (?,?,?,?,?,?,?,?,?,?,?)'
		if not SQL:Query(s_Query,		    s_player,	  0,	 0,	0,	 0,	  0,	      0,	 0,	  0,     0,      0) then
					print('Failed to execute query: ' .. SQL:Error())
					return
				end
				--

				print("** *** ** *** ServerInfo: SQL Data: Player IP address:" ..
					s_playerIP .. " - Join date:" .. s_FirstSeenDate)
				print("** *** ** *** ServerInfo: SQL Data: PlayerGuid:" .. s_accountGuid)
				--	print("** *** ** *** ServerInfo: SQL Data: PlayerGuid:"..s_playerGuid )
				print("** *** ** *** ServerInfo: SQL Data: CountryName:" ..
					s_CountryName .. " - CountryCode:" .. s_CountryCode .. " ** End injection **")
				-- end of inserting new player data


				-- Here we check the last ServerPlayers entry
				print("*** Updating ServerPlayers ***");
				if not SQL:Query('UPDATE tbl_serverstats SET SumPlayers = SumPlayers + ? ', 1) then
					print('Failed to execute Update query: ' .. SQL:Error()); return
				end

				print("*** Reading all ServerPlayers ***");
				local ServerPlayers_results = SQL:Query('SELECT SumPlayers FROM tbl_serverstats')
				if not ServerPlayers_results then
					print('Failed to read Guid query: ' .. SQL:Error()); return
				end

				print("*** Done reading all ServerPlayers's ***");
				-- Print the fetched rows.
				for _, l_Row in pairs(ServerPlayers_results) do
					temp_ServerPlayers = l_Row["SumPlayers"]
				end

				print("*** Total players found in tbl_serverstats:" .. temp_ServerPlayers)
		print ("*** Injecting weapon / vehicle data ***")


-- Injecting roadkills stuff
	--
	s_table = "tbl_roadkills"
	for key,s_weaponcode in ipairs(roadkills) do
	print(s_weaponcode)
		s_Query = 'INSERT INTO ' .. s_table ..'     (Weaponname,           Soldiername,        Kills) VALUES (?,?,?)'
				if not SQL:Query(s_Query,   s_weaponcode,   getnamehuman[name],   0) then
			print(s0.." - Failed to insert kill data in "..s_table..": " .. SQL:Error())
			return
	end
	end
	print("")
	print ("roadkills injection done")
			

			end)
	end)
end)

return PlayerJoins()
