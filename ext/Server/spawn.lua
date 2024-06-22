-- Spaghetti code by iamadeadpixel

---@class spawn
spawn = class 'spawn'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** Spawn stuff mod loaded ***");
	end
end)

-- spawn/respawn event
Events:Subscribe('Player:Respawn', function(player, recipientMask, message, info, yell, playerGuid, accountGuid)
	if haltprocess then return end
	playerscollected[player.name] = player.name

	getIDplayers[player.name] = player.teamId

	-- Human stuff
	if playerishuman[player.name] and not announcedhumannames[player.name] then
		print("Human " ..getnamehuman[player.name].. " spawned")
		announcedhumannames[player.name] = true
	end

	if playerishuman[player.name] then return end

	-- bot stuff
	getnamebot[player.name] = player.name
	playerisbot[player.name] = true

	if playerisbot[player.name] and not announcedbotnames[player.name] then
		print("Bot " ..getnamebot[player.name].. " spawned")
		announcedbotnames[player.name] = true
	end
end)

return spawn()
