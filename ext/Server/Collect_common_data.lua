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
	if kill_UMP_45[s_Inflictor.name] == nil then kill_UMP_45[s_Inflictor.name] = 0; end
	kill_UMP_45[s_Inflictor.name] = kill_UMP_45[s_Inflictor.name] + 1
	data_weaponkills = kill_UMP_45[s_Inflictor.name]
	end
--
	if args[7] == "PP-2000" then
	if kill_PP_2000[s_Inflictor.name] == nil then kill_PP_2000[s_Inflictor.name] = 0; end
	kill_PP_2000[s_Inflictor.name] = kill_PP_2000[s_Inflictor.name] + 1
	data_weaponkills = kill_PP_2000[s_Inflictor.name]
	end
--
	if args[7] == "PP-19" then
	if kill_PP_19[s_Inflictor.name] == nil then kill_PP_19[s_Inflictor.name] = 0; end
	kill_PP_19[s_Inflictor.name] = kill_PP_19[s_Inflictor.name] + 1
	data_weaponkills = kill_PP_19[s_Inflictor.name]
	end
--
	if args[7] == "PDW-R" then
	if kill_PDW_R[s_Inflictor.name] == nil then kill_PDW_R[s_Inflictor.name] = 0; end
	kill_PDW_R[s_Inflictor.name] = kill_PDW_R[s_Inflictor.name] + 1
	data_weaponkills = kill_PDW_R[s_Inflictor.name]
	end
--
	if args[7] == "P90" then
	if kill_P90[s_Inflictor.name] == nil then kill_P90[s_Inflictor.name] = 0; end
	kill_P90[s_Inflictor.name] = kill_P90[s_Inflictor.name] + 1
	data_weaponkills = kill_P90[s_Inflictor.name]
	end
--
	if args[7] == "MP7" then
	if kill_MP7[s_Inflictor.name] == nil then kill_MP7[s_Inflictor.name] = 0; end
	kill_MP7[s_Inflictor.name] = kill_MP7[s_Inflictor.name] + 1
	data_weaponkills = kill_MP7[s_Inflictor.name]
	end
--
	if args[7] == "M5K" then
	if kill_M5K[s_Inflictor.name] == nil then kill_M5K[s_Inflictor.name] = 0; end
	kill_M5K[s_Inflictor.name] = kill_M5K[s_Inflictor.name] + 1
	data_weaponkills = kill_M5K[s_Inflictor.name]
	end
--
	if args[7] == "AS VAL" then
	if kill_AS_VAL[s_Inflictor.name] == nil then kill_AS_VAL[s_Inflictor.name] = 0; end
	kill_AS_VAL[s_Inflictor.name] = kill_AS_VAL[s_Inflictor.name] + 1
	data_weaponkills = kill_AS_VAL[s_Inflictor.name]
	end
--
--

	if args[7] == "AS VAL"
	or args[7] == "M5K" or args[7] == "MP7" or args[7] == "P90" or args[7] == "PDW-R"
	or args[7] == "PP-19" or args[7] == "PP-2000" or args[7] == "UMP-45" then

	data_weapon_name = args[7]
	data_table_name = "tbl_primary_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Primary weapon data:"
	data_common(data_playername)
	end

-- ------------------------------------------------------

	if args[7] == "M67 GRENADE" then
	if kill_M67_GRENADE[s_Inflictor.name] == nil then kill_M67_GRENADE[s_Inflictor.name] = 0; end
	kill_M67_GRENADE[s_Inflictor.name] = kill_M67_GRENADE[s_Inflictor.name] + 1
	data_weaponkills = kill_M67_GRENADE[s_Inflictor.name]
	end
--
	if args[7] == "XBOW" then
	if kill_XBOW[s_Inflictor.name] == nil then kill_XBOW[s_Inflictor.name] = 0; end
	kill_XBOW[s_Inflictor.name] = kill_XBOW[s_Inflictor.name] + 1
	data_weaponkills = kill_XBOW[s_Inflictor.name]
	end
--

	if args[7] == "KNIFE" or args[7] == "ACB-90" then
	if kill_KNIFE[s_Inflictor.name] == nil then kill_KNIFE[s_Inflictor.name] = 0; end
	if playerdogtags[s_Inflictor.name] == nil then playerdogtags[s_Inflictor.name] = 0; end
	playerdogtags[s_Inflictor.name] = playerdogtags[s_Inflictor.name] + 1
	kill_KNIFE[s_Inflictor.name] = kill_KNIFE[s_Inflictor.name] + 1
	-- Litle knife fix.
	if args[7] == "ACB-90" then args[7] = "KNIFE" ; end
	data_weaponkills = kill_KNIFE[s_Inflictor.name]
	end
--
--

	if args[7] == "M67 GRENADE" or args[7] == "XBOW" or args[7] == "KNIFE" or args[7] == "ACB-90" then

	data_weapon_name = args[7]
	data_table_name = "tbl_auxiliary_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Auxiliary gadgets data:"
	data_common(data_playername)
	end

end)

-- ------------------------------------------------------

function data_common(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_common then
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

	if Config.consolespam_common then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_common then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

--add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills) VALUES (?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_common then
	print("")
	print (data_table_name.." injection done")
	end

else
 --do some thing with results
	if Config.consolespam_common then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end
end

end -- End of function call

-- ------------------------------------------------------

return Common()

