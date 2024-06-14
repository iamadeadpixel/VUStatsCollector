-- Spaghetti code by iamadeadpixel

---@class PUE08_vehicledeathdata
PUE08_vehicledeathdata = class 'PUE08_vehicledeathdata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PUE08_roadkilldeathdata mod loaded ***");
	end
end)


-- Kick in when a player joins the server
s_roundover_starttimer_PUE08 = os.time()
s_roundover_timer_PUE08 = 3

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE08 = os.time()
	s_roundover_elapsed_timer_PUE08 = os.difftime(s_roundover_end_timer_PUE08, s_roundover_starttimer_PUE08)
	s_roundover_elapsed_timer_PUE08 = math.floor(s_roundover_elapsed_timer_PUE08)
	if s_roundover_elapsed_timer_PUE08 >= s_roundover_timer_PUE08 then
		if PUE08_roadkilldeathdata == true then
			print(" Reading roadkills deaths from collected tables")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Roadkills stuff
			--	tbl_roadkills
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_roadkills) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_roadkills[data_playername]
				s_weapon = "Roadkills"
				s_table = "tbl_roadkills"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			--	PUE09_playerstats = true
			--	if PUE09_playerstats == true then
			--	print ("")
			--	print ("** Starting 10th event**")
			--	print ("")
			--	end

			PUE08_roadkilldeathdata = false -- ensure it prints one time only
		end

		s_roundover_starttimer_PUE08 = os.time()
	end
end)
-- end of the player:update event stuff

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we do some function calls

function updateweapondeathstats(player, data_playername)
	WeaponResults = SQL:Query(
		'SELECT Weaponname, Soldiername FROM ' .. s_table .. ' WHERE Soldiername = ? and Weaponname = ?', data_playername,s_weapon)
	if not WeaponResults then
		print('Failed to read "..s_table.." DEATH query: ' .. SQL:Error()); return
	end

	for victim, data in pairs(WeaponResults) do
		founddata_Soldiername = data["Soldiername"]
		founddata_Weaponname = data["Weaponname"]
	end

	-- New player stuff
	if founddata_Soldiername ~= data_playername and founddata_Weaponname ~= s_weapon then
		print(s3 .. " - Inserting " .. data_playername .. " with " .. r_deathdata .. " deaths in " .. s_table)
		s_Query = 'INSERT INTO ' .. s_table .. '    (Weaponname,    Soldiername,   Kills,    Deaths) VALUES (?,?,?,?)'
		if not SQL:Query(s_Query, s_weapon, data_playername, 0, r_deathdata) then
			print('(3):No entries - Failed to insert kill data in "..s_table..": ' .. SQL:Error())
			return
		end
		print(s3 .. " - Done inserting " .. data_playername)
	else
		-- Updating existing playerdata
		if founddata_Soldiername == data_playername and founddata_Weaponname == s_weapon then
			print(s1 .. " - Kill data for Soldier " .. data_playername .." found with weapon " .. s_weapon .. " in " .. s_table)
			if not SQL:Query('UPDATE ' .. s_table .. ' SET Deaths=Deaths+? WHERE Soldiername = ? and Weaponname = ?', r_deathdata, data_playername, s_weapon) then
				print('(1):Update only - Failed to update kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s1 .. " - Done updating " .. data_playername)
		else
			-- player exists, but not with the specified weapon, so we insert it
			s_Query = 'INSERT INTO ' .. s_table ..'    (Weaponname,    Soldiername,   Kills,    Deaths) VALUES (?,?,?,?)'
			if not SQL:Query(s_Query, s_weapon, data_playername, 0, r_deathdata) then
				print('Failed to insert kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s2 .. " - not weapon: Done inserting " .. data_playername)
		end
	end
end -- End of function call

return PUE08_vehicledeathdata()
