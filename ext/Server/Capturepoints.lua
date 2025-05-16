Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
--	if Config.consolespam_header then
		print("*** Capturepoint stuff loaded ***");
--	end
	end
end)


-- -------------------------------------
--[[
	playerteamID[data_playername] = player.teamId
	getnameall[data_playername] = player.name
]]

    Events:Subscribe('CapturePoint:Captured', function(capturePoint)
	print("****************** CapturePoint CAPTURED event ****************")

    PlayerManager:GetPlayers()
    

if player.teamId == 1 then
print("Team 1 player:"..player.name.." capturepoint taken")
end

if player.teamId == 2 then
print("Team 2 player:"..player.name.." capturepoint taken")
end

end)

-- -------------------------------------

Events:Subscribe('CapturePoint:Lost', function(capturePoint)

	print("****************** CapturePoint LOST event ****************")

    PlayerManager:GetPlayers()

if player.teamId == 1 then
print("Team 1 player:"..player.name.." capturepoint lost")
end

if player.teamId == 2 then
print("Team 2 player:"..player.name.." capturepoint lost")
end

end)

-- -------------------------------------
