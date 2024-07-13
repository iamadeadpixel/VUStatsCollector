-- Spaghetti code by iamadeadpixel

---@class Revives
Revives = class 'Revives'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** dump data mod loaded ***");
	end
end)



	s_roundover_starttimer_DumpData = os.time()
	s_roundover_timer_DumpData = 30
	tag = false

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_DumpData = os.time()
	s_roundover_elapsed_timer_DumpData = os.difftime(s_roundover_end_timer_DumpData, s_roundover_starttimer_DumpData)
	s_roundover_elapsed_timer_DumpData = math.floor(s_roundover_elapsed_timer_DumpData)
	if s_roundover_elapsed_timer_DumpData >= s_roundover_timer_DumpData then tag = true

	if tag == true then
		if haltprocess then return end

	print ("report back")

for data_playername, pname in pairs(playerscollected) do

		if playerdeaths[pname] == nil then playerdeaths[pname] = 0; end
		if playerdogtags[pname] == nil then playerdogtags[pname] = 0; end
		if playerheadshot[pname] == nil then playerheadshot[pname] = 0; end
		if playerkills[pname] == nil then playerkills[pname] = 0; end
		if playerrevivs[pname] == nil then playerrevivs[pname] = 0; end
		if playerscore[pname] == nil then playerscore[pname] = 0; end
		if playersuicides[pname] == nil then playersuicides[pname] = 0; end
		if playerteamkilled[pname] == nil then playerteamkilled[pname] = 0; end
		if kill_roadkills[pname] == nil then kill_roadkills[pname] = 0; end

		-- i am lazy, so, quick solution.
		chat_Deaths = playerdeaths[pname]
		chat_Dogtags = playerdogtags[pname]
		chat_Headshots = playerheadshot[pname]
		chat_Kills = playerkills[pname]
		chat_Revives = playerrevivs[pname]
		chat_Score = playerscore[pname]
		chat_Suicide = playersuicides[pname]
		chat_TeamKilled = playerteamkilled[pname]
		chat_roadkills = kill_roadkills[pname]

	if getnamehuman[player.name] == pname then
		print("** Fetching session data for " .. playerscollected[pname] .. " **");
		print("** Player round results")
		print("** Player results:" ..playerscollected[pname] .. " - Score:" .. chat_Score .. " - Kills:" .. chat_Kills .. " - Deaths:" .. chat_Deaths)
		print("** Player results:" ..playerscollected[pname] .. " - Suicides:" .. chat_Suicide .." - Headshots:" .. chat_Headshots .. " - Teamkilled:" .. chat_TeamKilled)
		print("** Player results:" ..playerscollected[pname] .. " - Knife kills:" .. chat_Dogtags .. " - Revives:" ..chat_Revives .. " - Roadkills:" .. chat_roadkills)
		print("")


end
end

			tag = false -- ensure it prints one time only
		end

		s_roundover_starttimer_DumpData = os.time()

end

end)

return Revives()
