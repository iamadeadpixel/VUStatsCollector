-- Spaghetti code by iamadeadpixel

---@class Revives
Revives = class 'Revives'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** dump data mod loaded ***");
	end
end)



	s_roundover_starttimer_DumpData = os.time()
	s_roundover_timer_DumpData = 10
	tag = false

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_DumpData = os.time()
	s_roundover_elapsed_timer_DumpData = os.difftime(s_roundover_end_timer_DumpData, s_roundover_starttimer_DumpData)
	s_roundover_elapsed_timer_DumpData = math.floor(s_roundover_elapsed_timer_DumpData)
	if s_roundover_elapsed_timer_DumpData >= s_roundover_timer_DumpData then tag = true

	if tag == true then
	print ("report back")

for data_playername, count_kills in pairs(playerscollected) do

		if playerdeaths[player.name] == nil then playerdeaths[player.name] = 0; end
		if playerdogtags[player.name] == nil then playerdogtags[player.name] = 0; end
		if playerheadshot[player.name] == nil then playerheadshot[player.name] = 0; end
		if playerkills[player.name] == nil then playerkills[player.name] = 0; end
		if playerrevivs[player.name] == nil then playerrevivs[player.name] = 0; end
		if playerscore[player.name] == nil then playerscore[player.name] = 0; end
		if playersuicides[player.name] == nil then playersuicides[player.name] = 0; end
		if playerteamkilled[player.name] == nil then playerteamkilled[player.name] = 0; end
		if kill_roadkills[player.name] == nil then kill_roadkills[player.name] = 0; end

		-- i am lazy, so, quick solution.
		chat_Deaths = playerdeaths[player.name]
		chat_Dogtags = playerdogtags[player.name]
		chat_Headshots = playerheadshot[player.name]
		chat_Kills = playerkills[player.name]
		chat_Revives = playerrevivs[player.name]
		chat_Score = playerscore[player.name]
		chat_Suicide = playersuicides[player.name]
		chat_TeamKilled = playerteamkilled[player.name]
		chat_roadkills = kill_roadkills[player.name]

		print("** Fetching session data for " .. player.name .. " **");
		print("** Player round results")
		print("** Player results:" ..player.name .. " - Score:" .. chat_Score .. " - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths)
		print("** Player results:" ..player.name .. " - Suicides:" .. chat_Suicide .." - Headshots:" .. chat_Headshots .. " - Teamkilled:" .. chat_TeamKilled)
		print("** Player results:" ..player.name .. " - Knife kills:" .. chat_Dogtags .. " - Revives:" ..chat_Revives .. " - Roadkills:" .. chat_roadkills)
		print("")


end


			tag = false -- ensure it prints one time only
		end

		s_roundover_starttimer_DumpData = os.time()

end

end)

return Revives()
