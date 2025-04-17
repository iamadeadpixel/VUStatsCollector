-- Spaghetti code by iamadeadpixel

---@class spawn
spawn = class 'spawn'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Spawn stuff loaded ***");
	end
	end
end)

-- spawn/respawn event
Events:Subscribe('Player:Respawn', function(player, recipientMask, message, info, yell, playerGuid, accountGuid)
	if haltprocess then return end
	playerteamID[player.name] = player.teamId
	getnameall[player.name] = player.name

	if Config.consolespam_idspawn then
	print ("Player ID:"..playerteamID[player.name].." - "..getnameall[player.name])
	end

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[player.name] ~= player.name then return end
	end

-- ------
-- ------

	-- Return if the player has been announced already
	if playerishuman[player.name] then return end

	-- Return if the bot has been announced already
	if playerisbot[player.name] then return end
	getnamebot[player.name] = player.name

	    -- Add the bot to the playerisBot table
	playerisbot[player.name] = true

	if Config.consolespam_idspawn then
if getnamehuman[player.name] then print ("*** Human Player "..getnamehuman[player.name].." spawned ***") ; end
if getnamebot[player.name]    then print ("*** AI Player "..getnamebot[player.name].." spawned ***") ; end
	end

	local Botname_results = SQL:Query ('SELECT Soldiername FROM tbl_playerstats')
		if not Botname_results then
			print('*** Bot Info: - Failed to read Bot Guid query: '..SQL:Error())
			return end

		for _, l_Row in pairs(Botname_results) do
			Bottemp_Name = l_Row["Soldiername"]

	if Config.consolespam_idspawn then
		if getnamebot[player.name] == Bottemp_Name then print("*** Bot Info: FOUND BOT IN DATABASE: " ..getnamebot[player.name])
	end

		;return end
	end

	if Config.consolespam_idspawn then
	print("*** Bot Info: Adding new BOT to database:" ..getnamebot[player.name])
	end

	s_Query ='INSERT INTO tbl_playerstats     (Soldiername,         Score, Kills, Deaths, Suicide, Headshots, TeamKilled, Dogtags, Revives, Wins, Losses, Shot, Hits) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)'
	if not SQL:Query(s_Query,	    getnamebot[player.name],	  0,	 0,	0,	 0,	  0,	      0,	 0,	  0,     0,      0,     0,   0) then

			print('*** BotGuid.lua - Failed to execute BOT query: ' .. SQL:Error())
			return end



end)

return spawn()
