-- Spaghetti code by iamadeadpixel

---@class Score
Score = class 'Score'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** Score mod loaded ***");
	end
end)


Events:Subscribe('Player:Score', function(player, scoringTypeData, score)
	if haltprocess then return end

	-- used for playerstats.
-- Here player score is collected
	if playerscore[player.name] == nil then playerscore[player.name] = 20; end

	-- used to get team stats
-- here total team score is collected.
	if playerscore1[player.name] == nil then playerscore1[player.name] = 20; end
	if playerscore2[player.name] == nil then playerscore2[player.name] = 20; end
	if playerscore3[player.name] == nil then playerscore3[player.name] = 20; end
	if playerscore4[player.name] == nil then playerscore4[player.name] = 20; end


	playerscore[player.name] = player.score
	if player.teamId == 1 then playerscore1[player.name] = player.score; end
	if player.teamId == 2 then playerscore2[player.name] = player.score; end
	if player.teamId == 3 then playerscore3[player.name] = player.score; end
	if player.teamId == 4 then playerscore4[player.name] = player.score; end

end)


return Score()
