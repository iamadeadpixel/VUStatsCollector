-- Spaghetti code by iamadeadpixel

---@class headshot
headshot = class 'headshot'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** headshot stuff loaded ***");
	end
	end
end)

Events:Subscribe('Player:Killed',function(p_Player, p_Inflictor, p_Position, p_Weapon, p_IsRoadKill, p_IsHeadShot, p_WasVictimInReviveState, p_Info)
		if haltprocess then return end

		args = { p_Player.name, p_Player.teamId, p_Player.squadId }
		local s_Inflictor

		if p_Inflictor ~= nil then
			s_Inflictor = p_Inflictor
		else
			s_Inflictor = p_Player
		end

		args[4] = s_Inflictor.name

		if p_Player.name == s_Inflictor.name then
			if p_Weapon == "Death" or p_Weapon == "DamageArea" or p_Weapon == "SoldierCollision" then
				args[7] = "IS NO MORE"
			else
				args[7] = "SUICIDE"
			end
		elseif p_Player.teamId == s_Inflictor.teamId then
			args[7] = "TEAMKILL"
		elseif s_Inflictor.controlledControllable ~= nil and s_Inflictor.controlledControllable.data:Is("VehicleEntityData") then
			args[7] = vehicleTable
				[VehicleEntityData(s_Inflictor.controlledControllable.data).controllableType:gsub(".+/.+/", "")]
		else
			if p_Weapon == "Death" or p_Weapon == "DamageArea" or p_Weapon == "SoldierCollision" then
				args[7] = "KILLED"
			elseif p_Info.weaponUnlock ~= nil then
				args[7] = weaponTable[_G[p_Info.weaponUnlock.typeInfo.name](p_Info.weaponUnlock).debugUnlockId]
			else
				args[7] = p_Weapon
			end
		end


-- Print lines will be removed on the end
-- ------------------------------------------------------

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[s_Inflictor.name] ~= s_Inflictor.name then return end
	end

-- ------------------------------------------------------
-- Here we collect headshot stuff

	victim_name = p_Player.name
	killer_name = s_Inflictor.name

		-- Count headshoted
	if args[7] ~= "TEAMKILL" then
		if p_IsHeadShot then
	if Headshots_Killer[s_Inflictor.name] == nil then Headshots_Killer[s_Inflictor.name] = 0; end -- Killer
	if Headshots_Victim[p_Player.name] == nil then Headshots_Victim[p_Player.name] = 0 ; end  -- Victim

	Headshots_Killer[s_Inflictor.name] = Headshots_Killer[s_Inflictor.name] + 1 -- Killer
	Headshots_Victim[p_Player.name] = Headshots_Victim[p_Player.name] + 1  -- Victim

	Dead_data = Headshots_Victim[p_Player.name]

	if Config.consolespam_headshot_msg then
	args[7] = "Headshot"
	data_headshot_msg(player, data_playername)
	end

	data_catagory = "Headshot data:"
	data_table_name = "tbl_headshots"
	data_playername = killer_name
	data_headshot(data_playername)

	data_playername = victim_name
	data_headshot(data_playername)

end
end
end)

-- ------------------------------------------------------

function data_headshot_msg(player, data_playername)

	print ("player "..victim_name.." got killed , thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times due "..args[7])

end -- End of function call

-- ------------------------------------------------------

function data_headshot(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_headshot1 then
	print ("")
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print ("")
	print ("Accessing "..data_table_name)
	end

	Results = SQL:Query('SELECT Soldiername FROM tbl_headshots WHERE Soldiername = ?', data_playername)

	if not Results then
	print('Failed to execute table tbl_headshots for query: ' .. SQL:Error())
	return
	end

	if Config.consolespam_headshot2 then
	print ("Done reading tbl_headshots")
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_headshot3 then
print("No data found for "..data_playername.." and Headshot stuff - Injecting now")
	end

		           s_Query = 'INSERT INTO tbl_headshots   (Soldiername,    Headshots_Killer, Headshots_Victim) VALUES (?,?,?)'
			                 if not SQL:Query(s_Query, data_playername,       0,                 0) then
			print(" - Failed to insert Headshot data in tbl_headshots: " .. SQL:Error())
			return
	end

	if Config.consolespam_headshot4 then
	print("")
	print ("tbl_headshots injection done")
	end

else

	if Config.consolespam_headshot5 then
print("found data: "..data_playername.." and Headshot stuff")
	end

end
end -- End of function call

-- ------------------------------------------------------

return headshot()

