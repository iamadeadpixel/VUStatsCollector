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
	--	print ("A player got revived, Bot or Human")

	-- If human is reviver, and victim is bot.
	if playerishuman[reviver.name] and playerisbot[player.name] then
		playerrevivs[reviver.name] = playerrevivs[reviver.name] + 1
		--	print ("Human "..getnamehuman[reviver.name].." revived bot player "..getnamebot[player.name].." - Total revives:"..playerrevivs[reviver.name])
	end

	-- If human is reviver, and victim is human.
	if playerishuman[reviver.name] and playerishuman[player.name] then
		playerrevivs[reviver.name] = playerrevivs[reviver.name] + 1
		playerdeaths[player.name] = playerdeaths[player.name] - 1
		--	print ("Human "..getnamehuman[reviver.name].." revived human player "..getnamehuman[player.name].." - Total revives:"..playerrevivs[reviver.name])
	end

	-- If bot is reviver, and victim is human.
	if playerisbot[reviver.name] and playerishuman[player.name] then
		playerdeaths[player.name] = playerdeaths[player.name] - 1
		--	print ("bot "..getnamebot[reviver.name].." revived human player "..getnamehuman[player.name].." - Total revives:"..playerrevivs[reviver.name])
	end
end)

return Revives()
