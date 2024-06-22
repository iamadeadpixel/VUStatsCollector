-- Spaghetti code by iamadeadpixel

---@class Revives
Revives = class 'Revives'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** Revive stuff mod loaded ***");
	end
end)




Events:Subscribe('Player:ReviveAccepted', function(player, reviver)
	if playerdeaths[player.name] == nil then playerdeaths[player.name] = 0; end
	if playerrevivs[reviver.name] == nil then playerrevivs[reviver.name] = 0; end

		playerrevivs[reviver.name] = playerrevivs[reviver.name] + 1
--		if getnamehuman[reviver.name] then playerrevivs[reviver.name] = playerrevivs[reviver.name] + 1
		playerdeaths[player.name] = playerdeaths[player.name] - 1
--		end

end)

return Revives()
