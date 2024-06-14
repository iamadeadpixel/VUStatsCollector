-- Spaghetti code by iamadeadpixel

---@class PUE07_vehiclekilldata
PUE07_vehiclekilldata = class 'PUE07_vehiclekilldata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PUE07_roadkillkilldata mod loaded ***");
	end
end)


-- Kick in when a player joins the server
s_roundover_starttimer_PUE07 = os.time()
s_roundover_timer_PUE07 = 3

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE07 = os.time()
	s_roundover_elapsed_timer_PUE07 = os.difftime(s_roundover_end_timer_PUE07, s_roundover_starttimer_PUE07)
	s_roundover_elapsed_timer_PUE07 = math.floor(s_roundover_elapsed_timer_PUE07)
	if s_roundover_elapsed_timer_PUE07 >= s_roundover_timer_PUE07 then
		if PUE07_roadkillkilldata == true then
			print(" Reading roadkill kills from collected tables")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Roadkills stuff
			--	tbl_roadkills
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_roadkills) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_roadkills[data_playername]
				s_weapon = "Roadkills"
				s_table = "tbl_roadkills"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			PUE08_roadkilldeathdata = true
			if PUE08_roadkilldeathdata == true then
				print("")
				print("** Starting 9th event **")
				print("")
			end

			PUE07_roadkillkilldata = false -- ensure it prints one time only
		end

		s_roundover_starttimer_PUE07 = os.time()
	end
end)
-- end of the player:update event stuff

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we do some function calls

function updateweaponkillstats(player, data_playername)
	WeaponResults = SQL:Query(
		'SELECT Weaponname, Soldiername FROM ' .. s_table .. ' WHERE Soldiername = ? and Weaponname = ?', data_playername,s_weapon)
	if not WeaponResults then
		print('Failed to read "..s_table.." KILL query: ' .. SQL:Error()); return
	end

	for killer, data in pairs(WeaponResults) do
		founddata_Soldiername = data["Soldiername"]
		founddata_Weaponname = data["Weaponname"]
	end

	-- New player stuff
	if founddata_Soldiername ~= data_playername and founddata_Weaponname ~= s_weapon then
		print(s3 .. " - Inserting " .. data_playername .. " with " .. r_killdata .. " kills in " .. s_table)
		s_Query = 'INSERT INTO ' .. s_table ..'    (Weaponname,    Soldiername,       Kills,     Deaths) VALUES (?,?,?,?)'
		if not SQL:Query(s_Query, s_weapon, data_playername, r_killdata, 0) then
			print('(3):No entries - Failed to insert kill data in "..s_table..": ' .. SQL:Error())
			return
		end
		print(s3 .. " - Done inserting " .. data_playername)
	else
		-- Updating existing playerdata
		if founddata_Soldiername == data_playername and founddata_Weaponname == s_weapon then
			print(s1 .. " - Kill data for Soldier " .. data_playername .." found with weapon " .. s_weapon .. " in " .. s_table)
			if not SQL:Query('UPDATE ' .. s_table .. ' SET Kills=Kills+? WHERE Soldiername = ? and Weaponname = ?', r_killdata, data_playername, s_weapon) then
				print('(1):Update only - Failed to update kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s1 .. " - Done updating " .. data_playername)
		else
			-- player exists, but not with the specified weapon, so we insert it
			s_Query = 'INSERT INTO ' ..s_table .. '    (Weaponname,    Soldiername,       Kills,     Deaths) VALUES (?,?,?,?)'
			if not SQL:Query(s_Query, s_weapon, data_playername, r_killdata, 0) then
				print('Failed to insert kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s2 .. " - not weapon: Done inserting " .. data_playername)
		end
	end
end -- End of function call

return PUE07_vehiclekilldata()
