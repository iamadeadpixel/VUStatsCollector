-- Spaghetti code by iamadeadpixel

---@class Score
Score = class 'Score'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Score stuff loaded ***");
	end
	end
end)


Events:Subscribe('Player:Score', function(player, scoringTypeData, score)
	if haltprocess then return end

	-- used for playerstats.
-- Here player score is collected

	-- used to get team stats
-- here total team score is collected.

	playerscore[player.name] = player.score
	if player.teamId == 1 then playerscore1[player.name] = player.score; end
	if player.teamId == 2 then playerscore2[player.name] = player.score; end
	if player.teamId == 3 then playerscore3[player.name] = player.score; end
	if player.teamId == 4 then playerscore4[player.name] = player.score; end

end)


return Score()
