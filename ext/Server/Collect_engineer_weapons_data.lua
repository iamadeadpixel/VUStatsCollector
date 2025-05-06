-- Spaghetti code by iamadeadpixel

---@class Engineer
Engineer = class 'Engineer'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Engineer weapons loaded ***");
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
--[[
	Here we collect engineer weapon data
]]

	if args[7] == "A-91" then
	kill_A_91[s_Inflictor.name] = kill_A_91[s_Inflictor.name] + 1

	Death_A_91[p_Player.name] = Death_A_91[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_A_91[p_Player.name] = Headshot_A_91[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_A_91[p_Player.name]
	Dead_data = Death_A_91[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_A_91[s_Inflictor.name]
	end
--
	if args[7] == "ACW-R" then
	kill_ACW_R[s_Inflictor.name] = kill_ACW_R[s_Inflictor.name] + 1

	Death_ACW_R[p_Player.name] = Death_ACW_R[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_ACW_R[p_Player.name] = Headshot_ACW_R[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_ACW_R[p_Player.name]
	Dead_data = Death_ACW_R[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_ACW_R[s_Inflictor.name]
	end
--
	if args[7] == "AKS-74u" then
	kill_AKS_74u[s_Inflictor.name] = kill_AKS_74u[s_Inflictor.name] + 1

	Death_AKS_74u[p_Player.name] = Death_AKS_74u[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_AKS_74u[p_Player.name] = Headshot_AKS_74u[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AKS_74u[p_Player.name]
	Dead_data = Death_AKS_74u[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_AKS_74u[s_Inflictor.name]
	end
--
	if args[7] == "G36C" then
	kill_G36C[s_Inflictor.name] = kill_G36C[s_Inflictor.name] + 1

	Death_G36C[p_Player.name] = Death_G36C[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_G36C[p_Player.name] = Headshot_G36C[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_G36C[p_Player.name]
	Dead_data = Death_G36C[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_G36C[s_Inflictor.name]
	end
--
	if args[7] == "G53" then
	kill_G53[s_Inflictor.name] = kill_G53[s_Inflictor.name] + 1

	Death_G53[p_Player.name] = Death_G53[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_G53[p_Player.name] = Headshot_G53[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_G53[p_Player.name]
	Dead_data = Death_G53[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_G53[s_Inflictor.name]
	end
--
	if args[7] == "M4" then
	kill_M4[s_Inflictor.name] = kill_M4[s_Inflictor.name] + 1

	Death_M4[p_Player.name] = Death_M4[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_M4[p_Player.name] = Headshot_M4[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M4[p_Player.name]
	Dead_data = Death_M4[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M4[s_Inflictor.name]
	end
--
	if args[7] == "M4A1" then
	kill_M4A1[s_Inflictor.name] = kill_M4A1[s_Inflictor.name] + 1

	Death_M4A1[p_Player.name] = Death_M4A1[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_M4A1[p_Player.name] = Headshot_M4A1[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M4A1[p_Player.name]
	Dead_data = Death_M4A1[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M4A1[s_Inflictor.name]
	end
--
	if args[7] == "MTAR-21" then
	kill_MTAR_21[s_Inflictor.name] = kill_MTAR_21[s_Inflictor.name] + 1

	Death_MTAR_21[p_Player.name] = Death_MTAR_21[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_MTAR_21[p_Player.name] = Headshot_MTAR_21[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MTAR_21[p_Player.name]
	Dead_data = Death_MTAR_21[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_MTAR_21[s_Inflictor.name]
	end
--
	if args[7] == "QBZ-95B" then
	kill_QBZ_95B[s_Inflictor.name] = kill_QBZ_95B[s_Inflictor.name] + 1

	Death_QBZ_95B[p_Player.name] = Death_QBZ_95B[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_QBZ_95B[p_Player.name] = Headshot_QBZ_95B[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_QBZ_95B[p_Player.name]
	Dead_data = Death_QBZ_95B[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_QBZ_95B[s_Inflictor.name]
	end
--
	if args[7] == "SCAR-H" then
	kill_SCAR_H[s_Inflictor.name] = kill_SCAR_H[s_Inflictor.name] + 1

	Death_SCAR_H[p_Player.name] = Death_SCAR_H[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_SCAR_H[p_Player.name] = Headshot_SCAR_H[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SCAR_H[p_Player.name]
	Dead_data = Death_SCAR_H[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_SCAR_H[s_Inflictor.name]
	end
--
	if args[7] == "SG553" then
	kill_SG553[s_Inflictor.name] = kill_SG553[s_Inflictor.name] + 1

	Death_SG553[p_Player.name] = Death_SG553[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_SG553[p_Player.name] = Headshot_SG553[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SG553[p_Player.name]
	Dead_data = Death_SG553[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_engineer_weapons_msg then
	data_engineer_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_SG553[s_Inflictor.name]
	end
--

	if args[7] == "A-91" or args[7] == "ACW-R" or args[7] == "AKS-74u" or args[7] == "G36C"
	or args[7] == "G53" or args[7] == "M4" or args[7] == "M4A1" or args[7] == "MTAR-21"
	or args[7] == "QBZ-95B" or args[7] == "SCAR-H" or args[7] == "SG553" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_engineer_weapons"
	data_catagory = "Engineer weapon data:"
	data_playername = killer_name
	data_engineer_weapons(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_engineer_weapons(data_playername)
	end

end)

-- ------------------------------------------------------

function data_engineer_weapons_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_engineer_weapons(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_engineer_weapons1 then
	print ("")
	print (data_catagory.." Weapon name:"..data_weapon_name)
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print (data_catagory.." Weapon kills:"..data_weaponkills)
	print ("")
	print ("Accessing "..data_table_name)
	end

	Results = SQL:Query('SELECT Weaponname, Soldiername FROM '..data_table_name..' WHERE Soldiername = ? and Weaponname = ?', data_playername,data_weapon_name) -- works

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	if Config.consolespam_engineer_weapons2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_engineer_weapons3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_engineer_weapons4 then
	print("")
	print (data_table_name.." injection done")
	end

else

	if Config.consolespam_airvehicles5 then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end

end
end -- End of function call

-- ------------------------------------------------------

return Engineer()

