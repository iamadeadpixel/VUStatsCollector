-- Spaghetti code by iamadeadpixel

---@class Revives
Revives = class 'Revives'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Player revives stuff loaded ***");
	end
	end
end)

Events:Subscribe('Player:ReviveAccepted', function(player, reviver)
		playerrevivs[reviver.name] = playerrevivs[reviver.name] + 1
		playerdeaths[player.name] = playerdeaths[player.name] - 1

end)

return Revives()
