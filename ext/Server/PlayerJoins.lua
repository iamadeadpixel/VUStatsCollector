-- Spaghetti code by iamadeadpixel

---@class PlayerJoins
PlayerJoins = class 'PlayerJoins'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** PlayerJoins loaded ***");
	end
	end
end)


Events:Subscribe('Player:Joining', function(name, playerGuid, ipAddress, accountGuid)
	s_player = name
	s_playerIP = ipAddress
	s_accountGuid = tostring(accountGuid)
	s_playerGuid = tostring(playerGuid)
	s_GetDateTime = os.date('%Y-%m-%d %H:%M:%S')
	Session_PlayTime_Start[name] = os.time()

	playerishuman[name] = true
	getnamehuman[name] = name
	CountPlayers = CountPlayers + 1

	local guid_results = SQL:Query('SELECT Soldiername, PlayerLogins, VU_GUID, PlayTime FROM tbl_playerdata')
	if not guid_results then
		print('Failed to read Guid query: ' .. SQL:Error())
		return
	end

	-- Print the fetched rows.
	for _, l_Row in pairs(guid_results) do
		temp_PlayerName = l_Row["Soldiername"]
		temp_PlayerLogins = l_Row["PlayerLogins"]
		temp_Guid = l_Row["VU_GUID"]
		temp_PlayTime = l_Row["PlayTime"]

		if s_accountGuid == temp_Guid then
			s_PlayerLogins = temp_PlayerLogins + 1

			-- Check if player has used a different character account
			if temp_PlayerName == s_player then

				if not SQL:Query('UPDATE tbl_playerdata SET PlayerLogins=PlayerLogins+?,   LastSeenOnServer= ? WHERE Soldiername = ?', 1, s_GetDateTime, s_player) then
					print('Failed to execute Update query: ' .. SQL:Error())
					return
				end


				-- At here, if the name is changed, it updates the SQL
				-- Dont forget to insert/update other type tables that contains a playername !
			elseif temp_PlayerName ~= s_player then

	if Config.consolespam_newplayerjoins_msg then
				print("*** UpdateCheckInfo: Players name was changed from " .. temp_PlayerName .. " into " .. s_player)
				print("*** UpdateCheckInfo: Updating Players name: " .. temp_PlayerName .. " -> " .. s_player);
	end

	if not SQL:Query('UPDATE tbl_playerdata SET PlayerLogins=?, Soldiername = ?,  LastSeenOnServer= ? WHERE Soldiername = ?', s_PlayerLogins, s_player, s_GetDateTime, temp_PlayerName) then
		print('Failed to execute name change for tbl_playerdata query: ' .. SQL:Error())
					return
				end

			-- Tables what contain the Soldiername tag
				mytables = {
					"tbl_air_vehicles",
					"tbl_land_vehicles",
					"tbl_mcom",
					"tbl_playerstats",
					"tbl_primary_weapons",
					"tbl_roadkills",
					"tbl_handguns_weapons",
					"tbl_shotguns_weapons",
					"tbl_assault_gadgets",
					"tbl_assault_weapons",
					"tbl_auxiliary_gadgets",
					"tbl_engineer_gadgets",
					"tbl_engineer_weapons",
					"tbl_recon_gadgets",
					"tbl_recon_weapons",
					"tbl_support_gadgets",
					"tbl_support_weapons"
				}

				for k, value in ipairs(mytables) do

	if Config.consolespam_newplayerjoins_msg then
					print("Updating table "..value.." with new player name")
	end

					if not SQL:Query('UPDATE '..value..' SET Soldiername = ? WHERE Soldiername = ?', s_player, temp_PlayerName) then
						print('Failed to execute name change for "..value.." query: ' .. SQL:Error())
						return
					end
				end

	if Config.consolespam_newplayerjoins_msg then
				print(" ");
				print('*** UpdateCheckInfo: ** Done Updating Player information on joining the server **')
				print(" ");
	end

			end
			return
		end
	end

	--
	--
	if Config.consolespam_newplayerjoins_msg then
	print("*** ServerInfo: NO GUID FOUND FOR PLAYER "..s_player.." IS NEW PLAYER ***")
	end

	-- Fully working thanks to Bree_Arnold and Doc-Ice-Elm
	---@param response HttpResponse
	Net:GetHTTPAsync('https://api.ipify.org/?format=json', function(response)
		if response.status ~= 200 then return end

		local s_Response_ip = json.decode(response.body)
		local s_Server_IP = s_Response_ip.ip
		s_ServerIP = tostring(s_Server_IP)

	if Config.consolespam_newplayerjoins_msg then
		print("*** ServerInfo: IP FOUND FOR PLAYER: "..s_player.." - :".. s_ServerIP)
	end

		-- Fully working thanks to Bree_Arnold
		-- Used to grab the players IP
		---@param response HttpResponse
	Net:GetHTTPAsync('https://api.cleantalk.org/?method_name=ip_info&ip='..s_playerIP, function (response) -- Using the Internal fetched IP by the player login
				if response.status ~= 200 then return end

				local s_Response = json.decode(response.body)
	cc_CountryName = s_Response.data[s_playerIP].country_name -- Using the internal IP fetched by the json -- Using the Internal fetched IP by the player login
	cn_CountryCode = s_Response.data[s_playerIP].country_code -- Using the internal IP fetched by the json -- Using the Internal fetched IP by the player login

				s_CountryCode = tostring(cn_CountryCode)
				s_CountryName = tostring(cc_CountryName)

				s_MapData = "New player Setup stuff"

	if Config.consolespam_newplayerjoins_msg then
				print('' ..s_MapData.. ': - Client Info EXT:        Player name: ' ..s_player.. ' ')
				print('' ..s_MapData.. ': - Client Info EXT:        Player   IP: ' ..s_playerIP.. ' ')
				print('' ..s_MapData.. ': - Client Info EXT: Player global GUID: ' ..s_accountGuid.. ' ') -- Global Guid
				print('' ..s_MapData.. ': - Client Info EXT:        Player GUID: ' ..s_playerGuid.. ' ') -- Guid for each player you made.
				print('' ..s_MapData.. ': - Client Info EXT:  Players Join date: ' ..s_GetDateTime.. ' ')
				print('' ..s_MapData.. ': - Client Info EXT: Player External IP: ' ..s_ServerIP.. ' ')
				print('' ..s_MapData.. ': - Client Info EXT:    Players country: ' ..s_CountryName.. ' CountryCode: ' ..s_CountryCode.. ' ')
	end

				-- Here we check the players Guid entry,  and insert the new player
				local playerGuid_results = SQL:Query('SELECT VU_GUID FROM tbl_playerdata')
				if not playerGuid_results then
					print('Failed to read Guid query: ' .. SQL:Error())
					return
				end

	if Config.consolespam_newplayerjoins_msg then
				print("*** Done reading all playerID's ***");
	end
				-- Print the fetched rows.
				for _, l_Row in pairs(playerGuid_results) do
					temp_PlayerGuid = l_Row["VU_GUID"]
				end

				if temp_PlayerGuid == nil then 

	if Config.consolespam_newplayerjoins_msg then
				print("No Guid found")
	end
				end


				s_FirstSeenDate = s_GetDateTime
	s_Query ='INSERT INTO tbl_playerdata    (Soldiername,  PlayerLogins,      VU_GUID,         IP,      CountryCode,   CountryName,   FirstSeenOnServer, LastSeenOnServer,  Rounds, PlayTime) VALUES (?,?,?,?,?,?,?,?,?,?)'
		if not SQL:Query(s_Query,         s_player,         1,         s_accountGuid,  s_playerIP, s_CountryCode, s_CountryName,   s_FirstSeenDate,   s_FirstSeenDate,     0,       0) then
					print('Failed to execute query: ' .. SQL:Error())
					return
				end

		s_Query ='INSERT INTO tbl_playerstats     (Soldiername, Score, Kills, Deaths, Suicide, Headshots, TeamKilled, Dogtags, Revives, Killstreaks, Wins, Losses, Shot, Hits) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
		if not SQL:Query(s_Query,		    s_player,	  0,	 0,	0,	 0,	  0,	      0,	 0,	  0,         0,       0,     0,     0,    0) then
					print('Failed to execute query: ' .. SQL:Error())
					return
				end
				--

	if Config.consolespam_newplayerjoins_msg then
				print("** *** ** *** ServerInfo: SQL Data: Player IP address:" ..s_playerIP.. " - Join date:" ..s_FirstSeenDate)
				print("** *** ** *** ServerInfo: SQL Data: PlayerGuid:" ..s_accountGuid)
				print("** *** ** *** ServerInfo: SQL Data: CountryName:" ..s_CountryName.. " - CountryCode:" ..s_CountryCode.. " ** End injection **")
	end
				-- end of inserting new player data


				-- Here we check the last ServerPlayers entry
	if Config.consolespam_newplayerjoins_msg then
				print("*** Updating ServerPlayers ***");
	end

				if not SQL:Query('UPDATE tbl_serverstats SET SumPlayers = SumPlayers + ? ', 1) then
					print('Failed to execute Update query: ' .. SQL:Error()); return
				end

	if Config.consolespam_newplayerjoins_msg then
				print("*** Reading all ServerPlayers ***");
	end
				local ServerPlayers_results = SQL:Query('SELECT SumPlayers FROM tbl_serverstats')
				if not ServerPlayers_results then
					print('Failed to read Guid query: ' .. SQL:Error()); return
				end

	if Config.consolespam_newplayerjoins_msg then
				print("*** Done reading all ServerPlayers's ***");
	end
				-- Print the fetched rows.
				for _, l_Row in pairs(ServerPlayers_results) do
					temp_ServerPlayers = l_Row["SumPlayers"]
				end

	if Config.consolespam_newplayerjoins_msg then
				print("*** Total players found in tbl_serverstats:" .. temp_ServerPlayers)
	end

			end)
	end)
end)

return PlayerJoins()

--[[
	if Config.consolespam_newplayerjoins_msg then
]]
