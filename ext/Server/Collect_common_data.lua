-- Spaghetti code by iamadeadpixel

---@class Common
Common = class 'Common'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Common weapons loaded ***");
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
	Here we collect common weapon data
]]

	if args[7] == "UMP-45" then
	if kill_UMP_45[s_Inflictor.name] == nil then kill_UMP_45[s_Inflictor.name] = 0 ; end
	kill_UMP_45[s_Inflictor.name] = kill_UMP_45[s_Inflictor.name] + 1

	if Death_UMP_45[p_Player.name] == nil then Death_UMP_45[p_Player.name] = 0 ; end
	Death_UMP_45[p_Player.name] = Death_UMP_45[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_UMP_45[p_Player.name] == nil then Headshot_UMP_45[p_Player.name] = 0 ; end
	Headshot_UMP_45[p_Player.name] = Headshot_UMP_45[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_UMP_45[p_Player.name]
	Dead_data = Death_UMP_45[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_UMP_45[s_Inflictor.name]
	end
--
	if args[7] == "PP-2000" then
	if kill_PP_2000[s_Inflictor.name] == nil then kill_PP_2000[s_Inflictor.name] = 0 ; end
	kill_PP_2000[s_Inflictor.name] = kill_PP_2000[s_Inflictor.name] + 1

	if Death_PP_2000[p_Player.name] == nil then Death_PP_2000[p_Player.name] = 0 ; end
	Death_PP_2000[p_Player.name] = Death_PP_2000[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_PP_2000[p_Player.name] == nil then Headshot_PP_2000[p_Player.name] = 0 ; end
	Headshot_PP_2000[p_Player.name] = Headshot_PP_2000[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_PP_2000[p_Player.name]
	Dead_data = Death_PP_2000[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_PP_2000[s_Inflictor.name]
	end
--
	if args[7] == "PP-19" then
	if kill_PP_19[s_Inflictor.name] == nil then kill_PP_19[s_Inflictor.name] = 0 ; end
	kill_PP_19[s_Inflictor.name] = kill_PP_19[s_Inflictor.name] + 1

	if Death_PP_19[p_Player.name] == nil then Death_PP_19[p_Player.name] = 0 ; end
	Death_PP_19[p_Player.name] = Death_PP_19[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_PP_19[p_Player.name] == nil then Headshot_PP_19[p_Player.name] = 0 ; end
	Headshot_PP_19[p_Player.name] = Headshot_PP_19[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_PP_19[p_Player.name]
	Dead_data = Death_PP_19[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_PP_19[s_Inflictor.name]
	end
--
	if args[7] == "PDW-R" then
	if kill_PDW_R[s_Inflictor.name] == nil then kill_PDW_R[s_Inflictor.name] = 0 ; end
	kill_PDW_R[s_Inflictor.name] = kill_PDW_R[s_Inflictor.name] + 1

	if Death_PDW_R[p_Player.name] == nil then Death_PDW_R[p_Player.name] = 0 ; end
	Death_PDW_R[p_Player.name] = Death_PDW_R[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_PDW_R[p_Player.name] == nil then Headshot_PDW_R[p_Player.name] = 0 ; end
	Headshot_PDW_R[p_Player.name] = Headshot_PDW_R[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_PDW_R[p_Player.name]
	Dead_data = Death_PDW_R[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_PDW_R[s_Inflictor.name]
	end
--
	if args[7] == "P90" then
	if kill_P90[s_Inflictor.name] == nil then kill_P90[s_Inflictor.name] = 0 ; end
	kill_P90[s_Inflictor.name] = kill_P90[s_Inflictor.name] + 1

	if Death_P90[p_Player.name] == nil then Death_P90[p_Player.name] = 0 ; end
	Death_P90[p_Player.name] = Death_P90[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_P90[p_Player.name] == nil then Headshot_P90[p_Player.name] = 0 ; end
	Headshot_P90[p_Player.name] = Headshot_P90[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_P90[p_Player.name]
	Dead_data = Death_P90[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_P90[s_Inflictor.name]
	end
--
	if args[7] == "MP7" then
	if kill_MP7[s_Inflictor.name] == nil then kill_MP7[s_Inflictor.name] = 0 ; end
	kill_MP7[s_Inflictor.name] = kill_MP7[s_Inflictor.name] + 1

	if Death_MP7[p_Player.name] == nil then Death_MP7[p_Player.name] = 0 ; end
	Death_MP7[p_Player.name] = Death_MP7[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_MP7[p_Player.name] == nil then Headshot_MP7[p_Player.name] = 0 ; end
	Headshot_MP7[p_Player.name] = Headshot_MP7[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MP7[p_Player.name]
	Dead_data = Death_MP7[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_MP7[s_Inflictor.name]
	end
--
	if args[7] == "M5K" then
	if kill_M5K[s_Inflictor.name] == nil then kill_M5K[s_Inflictor.name] = 0 ; end
	kill_M5K[s_Inflictor.name] = kill_M5K[s_Inflictor.name] + 1

	if Death_M5K[p_Player.name] == nil then Death_M5K[p_Player.name] = 0 ; end
	Death_M5K[p_Player.name] = Death_M5K[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M5K[p_Player.name] == nil then Headshot_M5K[p_Player.name] = 0 ; end
	Headshot_M5K[p_Player.name] = Headshot_M5K[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M5K[p_Player.name]
	Dead_data = Death_M5K[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M5K[s_Inflictor.name]
	end
--
	if args[7] == "AS VAL" then
	if kill_AS_VAL[s_Inflictor.name] == nil then kill_AS_VAL[s_Inflictor.name] = 0 ; end
	kill_AS_VAL[s_Inflictor.name] = kill_AS_VAL[s_Inflictor.name] + 1

	if Death_AS_VAL[p_Player.name] == nil then Death_AS_VAL[p_Player.name] = 0 ; end
	Death_AS_VAL[p_Player.name] = Death_AS_VAL[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AS_VAL[p_Player.name] == nil then Headshot_AS_VAL[p_Player.name] = 0 ; end
	Headshot_AS_VAL[p_Player.name] = Headshot_AS_VAL[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AS_VAL[p_Player.name]
	Dead_data = Death_AS_VAL[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_AS_VAL[s_Inflictor.name]
	end
--

	if args[7] == "AS VAL" or args[7] == "M5K" or args[7] == "MP7" or args[7] == "P90" or args[7] == "PDW-R"
	or args[7] == "PP-19" or args[7] == "PP-2000" or args[7] == "UMP-45" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_primary_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Primary weapon data:"
	data_common(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_common(data_playername)
	end

-- ------------------------------------------------------

	if args[7] == "M67 GRENADE" then
	if kill_M67_GRENADE[s_Inflictor.name] == nil then kill_M67_GRENADE[s_Inflictor.name] = 0 ; end
	kill_M67_GRENADE[s_Inflictor.name] = kill_M67_GRENADE[s_Inflictor.name] + 1

	if Death_M67_GRENADE[p_Player.name] == nil then Death_M67_GRENADE[p_Player.name] = 0 ; end
	Death_M67_GRENADE[p_Player.name] = Death_M67_GRENADE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M67_GRENADE[p_Player.name] == nil then Headshot_M67_GRENADE[p_Player.name] = 0 ; end
	Headshot_M67_GRENADE[p_Player.name] = Headshot_M67_GRENADE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M67_GRENADE[p_Player.name]
	Dead_data = Death_M67_GRENADE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M67_GRENADE[s_Inflictor.name]
	end
--
	if args[7] == "XBOW" then
	if kill_XBOW[s_Inflictor.name] == nil then kill_XBOW[s_Inflictor.name] = 0 ; end
	kill_XBOW[s_Inflictor.name] = kill_XBOW[s_Inflictor.name] + 1

	if Death_XBOW[p_Player.name] == nil then Death_XBOW[p_Player.name] = 0 ; end
	Death_XBOW[p_Player.name] = Death_XBOW[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_XBOW[p_Player.name] == nil then Headshot_XBOW[p_Player.name] = 0 ; end
	Headshot_XBOW[p_Player.name] = Headshot_XBOW[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_XBOW[p_Player.name]
	Dead_data = Death_XBOW[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_common_msg then
	data_common_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_XBOW[s_Inflictor.name]
	end
--

	if args[7] == "M67 GRENADE" or args[7] == "XBOW" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_auxiliary_gadgets"
	data_catagory = "Auxiliary gadgets data:"
	data_playername = killer_name
	data_common(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_common(data_playername)
	end

end)

-- ------------------------------------------------------

function data_common_weapons_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_common(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_common1 then
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

	if Config.consolespam_common2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_common3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_common4 then
	print("")
	print (data_table_name.." injection done")
	end

else

	if Config.consolespam_common5 then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end

end
end -- End of function call

-- ------------------------------------------------------

return Common()

