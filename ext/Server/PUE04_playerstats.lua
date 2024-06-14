-- Spaghetti code by iamadeadpixel

---@class PUE04_playerstats
PUE04_playerstats = class 'PUE04_playerstats'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PUE04_playerstats mod loaded ***");
	end
end)


-- Kick in when a player joins the server
s_roundover_starttimer_PUE04 = os.time()
s_roundover_timer_PUE04 = 3

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE04 = os.time()
	s_roundover_elapsed_timer_PUE04 = os.difftime(s_roundover_end_timer_PUE04, s_roundover_starttimer_PUE04)
	s_roundover_elapsed_timer_PUE04 = math.floor(s_roundover_elapsed_timer_PUE04)
	if s_roundover_elapsed_timer_PUE04 >= s_roundover_timer_PUE04 then
		if PUE04_playerstats == true then
			print(" Reading tbl_playerstats and updating them")

			for playerK, PDscore in pairs(playerscore) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Score:" .. PDscore)

					if not SQL:Query('UPDATE tbl_playerstats SET Score=Score+? WHERE Soldiername = ?', PDscore, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDkills in pairs(playerkills) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Kills:" .. PDkills)

					if not SQL:Query('UPDATE tbl_playerstats SET Kills=Kills+? WHERE Soldiername = ?', PDkills, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDdeaths in pairs(playerdeaths) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Deaths:" .. PDdeaths)

					if not SQL:Query('UPDATE tbl_playerstats SET Deaths=Deaths+? WHERE Soldiername = ?', PDdeaths, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--

			for playerK, PDsuicide in pairs(playersuicides) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Suicides:" .. PDsuicide)

					if not SQL:Query('UPDATE tbl_playerstats SET Suicide=Suicide+? WHERE Soldiername = ?', PDsuicide, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDheadshot in pairs(playerheadshot) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Headshots:" .. PDheadshot)

					if not SQL:Query('UPDATE tbl_playerstats SET Headshots=Headshots+? WHERE Soldiername = ?', PDheadshot, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDteamkilled in pairs(playerteamkilled) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Teamkilled:" .. PDteamkilled)

					if not SQL:Query('UPDATE tbl_playerstats SET TeamKilled=TeamKilled+? WHERE Soldiername = ?', PDteamkilled, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDdogtags in pairs(playerdogtags) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Dogtags taken:" .. PDdogtags)

					if not SQL:Query('UPDATE tbl_playerstats SET Dogtags=Dogtags+? WHERE Soldiername = ?', PDdogtags, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDrevives in pairs(playerrevivs) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Revives:" .. PDrevives)

					if not SQL:Query('UPDATE tbl_playerstats SET Revives=Revives+? WHERE Soldiername = ?', PDrevives, getnamehuman[player.name]) then
						print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
						return
					end
				end
			end
			--
			for playerK, PDroadkills in pairs(kill_roadkills) do
				;
				if playerK == getnamehuman[player.name] then
					print("End of round player report for " .. playerK .. " - Roadkilled:" .. PDroadkills)
				end
			end

			PUE05_weaponkillstats = true
			if PUE05_weaponkillstats == true then
				print("")
				print("** Starting 6th event **")
				print("")
			end

			PUE04_playerstats = false -- ensure it prints one time only
		end

		s_roundover_starttimer_PUE04 = os.time()
	end
end)

return PUE04_playerstats()
