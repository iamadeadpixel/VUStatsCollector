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

	if playerscollected[player.name] and not announcedhumannames[player.name] then
		print("Player " ..playerscollected[player.name].. " spawned")
		announcedhumannames[player.name] = true
	end

--	if playerscollected[player.name] then return end
end)

return spawn()
