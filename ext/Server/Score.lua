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

ps1=0
ps2=0
ps3=0
ps4=0

Events:Subscribe('Player:Score', function(player, scoringTypeData, score)
	if haltprocess then return end

	-- used for playerstats.
-- Here player score is collected
	if playerscore[player.name] == nil then playerscore[player.name] = 0;

	if Config.consolespam_score_msg then
	print ("Added "..player.name.." to score system with "..playerscore[player.name].." base points")
	print ("")
	end
end

	-- used to get team stats
-- here total team score is collected.
	if playerscore1[player.name] == nil then playerscore1[player.name] = 0; end
	if playerscore2[player.name] == nil then playerscore2[player.name] = 0; end
	if playerscore3[player.name] == nil then playerscore3[player.name] = 0; end
	if playerscore4[player.name] == nil then playerscore4[player.name] = 0; end

	playerscore[player.name] = player.score
	if player.teamId == 1 then playerscore1[player.name] = player.score; end
	if player.teamId == 2 then playerscore2[player.name] = player.score; end
	if player.teamId == 3 then playerscore3[player.name] = player.score; end
	if player.teamId == 4 then playerscore4[player.name] = player.score; end

	if Config.consolespam_score_msg then
	if player.teamId == 1 then print ("Team 1 scores for "..player.name.." player score:"..playerscore[player.name]) ; end
	if player.teamId == 2 then print ("Team 2 scores for "..player.name.." player score:"..playerscore[player.name]) ; end
	if player.teamId == 3 then print ("Team 3 scores for "..player.name.." player score:"..playerscore[player.name]) ; end
	if player.teamId == 4 then print ("Team 4 scores for "..player.name.." player score:"..playerscore[player.name]) ; end
	end
-- -----------------
-- -----------------
-- -----------------
-- -----------------

	if Config.consolespam_score2_msg then
for _, player in pairs(PlayerManager:GetPlayers()) do

if player.teamId == 1 then
ps1 = player.score
print("Team 1 player:"..player.name.." score="..ps1)
end

if player.teamId == 2 then
ps2 = player.score
print("Team 2 player:"..player.name.." score="..ps2)
end

if player.teamId == 3 then
ps3 = player.score
print("Team 3 player:"..player.name.." score="..ps3)
end

if player.teamId == 4 then
ps4 = player.score
print("Team 4 player:"..player.name.." score="..ps4)
end

 end
end

end)


return Score()
