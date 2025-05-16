-- Spaghetti code by iamadeadpixel

---@class spawn
spawn = class 'spawn'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Spawn and variables stuff loaded ***");
	end
	end
end)

-- spawn/respawn event
Events:Subscribe('Player:Respawn', function(player, recipientMask, message, info, yell, playerGuid, accountGuid)
	if haltprocess then return end

	data_playername = player.name

	playerteamID[data_playername] = player.teamId
	getnameall[data_playername] = player.name

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[data_playername] ~= data_playername then return end
	end

	-- Return if the player has been announced already
	if playerishuman[data_playername] then return end

	do
	addbot2database(player, data_playername)
	end

end)

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function addbot2database(player, data_playername)

	-- Return if the bot has been announced already
	if playerisbot[data_playername] then return end
	getnamebot[data_playername] = data_playername

	    -- Add the bot to the playerisBot table
	playerisbot[data_playername] = true

	local Botname_results = SQL:Query ('SELECT Soldiername FROM tbl_playerstats')
		if not Botname_results then
			print('*** Bot Info: - Failed to read Bot Guid query: '..SQL:Error())
			return end

		for _, l_Row in pairs(Botname_results) do
			Bottemp_Name = l_Row["Soldiername"]

		if getnamebot[data_playername] == Bottemp_Name then

	if Config.consolespam_spawn_msg then
		print("*** Bot Info: FOUND BOT IN DATABASE: " ..getnamebot[data_playername])
	end
		return end
	end

	if Config.consolespam_spawn_msg then
	print("*** Bot Info: Adding new BOT to database:" ..getnamebot[data_playername])
	end

	s_Query ='INSERT INTO tbl_playerstats     (Soldiername,         Score, Kills, Deaths, Suicide, Headshots, TeamKilled, Dogtags, Revives, Killstreaks, Wins, Losses, Shot, Hits) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
	if not SQL:Query(s_Query,	    getnamebot[data_playername],	  0,	 0,	0,	 0,	  0,	      0,	 0,	  0,         0,       0,      0,    0,    0) then

			print('*** BotGuid.lua - Failed to execute BOT query: ' .. SQL:Error())
			return end

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

return spawn()
