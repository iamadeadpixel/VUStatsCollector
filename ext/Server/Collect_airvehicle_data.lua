-- Spaghetti code by iamadeadpixel

---@class airvehicledata
airvehicledata = class 'airvehicledata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Air vehicle stuff loaded ***");
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
	Here we collect air vehicle data
]]

	if args[7] == "TV MISSILE" then
	kill_TV_MISSILE[s_Inflictor.name] = kill_TV_MISSILE[s_Inflictor.name] + 1
	data_weaponkills = kill_TV_MISSILE[s_Inflictor.name]
	end
--
	if args[7] == "A-10 THUNDERBOLT" then
	kill_A10_THUNDERBOLT[s_Inflictor.name] = kill_A10_THUNDERBOLT[s_Inflictor.name] + 1
	data_weaponkills = kill_A10_THUNDERBOLT[s_Inflictor.name]
	end
--
	if args[7] == "AH-1Z VIPER" then
	kill_AH_1Z_VIPER[s_Inflictor.name] = kill_AH_1Z_VIPER[s_Inflictor.name] + 1
	data_weaponkills = kill_AH_1Z_VIPER[s_Inflictor.name]
	end
--
	if args[7] == "AH-6J LITTLE BIRD" then
	kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] = kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] + 1
	data_weaponkills = kill_AH_6J_LITTLE_BIRD[s_Inflictor.name]
	end
--
	if args[7] == "F-35" then
	kill_F_35[s_Inflictor.name] = kill_F_35[s_Inflictor.name] + 1
	data_weaponkills = kill_F_35[s_Inflictor.name]
	end
--
	if args[7] == "F/A-18E SUPER HORNET" then
	kill_FA_18E_SUPER_HORNET[s_Inflictor.name] = kill_FA_18E_SUPER_HORNET[s_Inflictor.name] + 1
	data_weaponkills = kill_FA_18E_SUPER_HORNET[s_Inflictor.name]
	end
--
	if args[7] == "GUNSHIP" then
	kill_GUNSHIP[s_Inflictor.name] = kill_GUNSHIP[s_Inflictor.name] + 1
	data_weaponkills = kill_GUNSHIP[s_Inflictor.name]
	end
--
	if args[7] == "KA-60 KASATKA" then
	kill_KA_60_KASATKA[s_Inflictor.name] = kill_KA_60_KASATKA[s_Inflictor.name] + 1
	data_weaponkills = kill_KA_60_KASATKA[s_Inflictor.name]
	end
--
	if args[7] == "MI-28 HAVOC" then
	kill_MI_28_HAVOC[s_Inflictor.name] = kill_MI_28_HAVOC[s_Inflictor.name] + 1
	data_weaponkills = kill_MI_28_HAVOC[s_Inflictor.name]
	end
--
	if args[7] == "SU-25TM FROGFOOT" then
	kill_SU_25TM_FROGFOOT[s_Inflictor.name] = kill_SU_25TM_FROGFOOT[s_Inflictor.name] + 1
	data_weaponkills = kill_SU_25TM_FROGFOOT[s_Inflictor.name]
	end
--
	if args[7] == "SU-35BM FLANKER-E" then
	kill_SU_35BM_FLANKER_E[s_Inflictor.name] = kill_SU_35BM_FLANKER_E[s_Inflictor.name] + 1
	data_weaponkills = kill_SU_35BM_FLANKER_E[s_Inflictor.name]
	end
--
	if args[7] == "SU-37" then
	kill_SU_37[s_Inflictor.name] = kill_SU_37[s_Inflictor.name] + 1
	data_weaponkills = kill_SU_37[s_Inflictor.name]
	end
--
	if args[7] == "UH-1Y VENOM" then
	kill_UH_1Y_VENOM[s_Inflictor.name] = kill_UH_1Y_VENOM[s_Inflictor.name] + 1
	data_weaponkills = kill_UH_1Y_VENOM[s_Inflictor.name]
	end
--
	if args[7] == "Z-11W" then
	kill_Z_11W[s_Inflictor.name] = kill_Z_11W[s_Inflictor.name] + 1
	data_weaponkills = kill_Z_11W[s_Inflictor.name]
	end
--
--

	if args[7] == "A-10 THUNDERBOLT" or args[7] == "AH-1Z VIPER" or args[7] == "AH-6J LITTLE BIRD" or args[7] == "F-35"
	or args[7] == "F/A-18E SUPER HORNET" or args[7] == "GUNSHIP" or args[7] == "KA-60 KASATKA" or args[7] == "MI-28 HAVOC"
	or args[7] == "SU-25TM FROGFOOT" or args[7] == "SU-35BM FLANKER-E" or args[7] == "SU-37"
	or args[7] == "TV MISSILE" or args[7] == "UH-1Y VENOM" or args[7] == "Z-11W" then

	data_weapon_name = args[7]
	data_table_name = "tbl_air_vehicles"
	data_playername = s_Inflictor.name
	data_catagory = "Air vehicles data:"
	data_airvehicles(data_playername)
	end

end)

-- ------------------------------------------------------

function data_airvehicles(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_airvehicles then
	print ("")
	print (data_catagory.." Weapon name:"..data_weapon_name)
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print (data_catagory.." Weapon kills:"..data_weaponkills)

	print ("")

	print ("Accessing "..data_table_name)
	end -- end for the config stuff

	Results = SQL:Query('SELECT Weaponname, Soldiername FROM '..data_table_name..' WHERE Soldiername = ? and Weaponname = ?', data_playername,data_weapon_name) -- works

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	if Config.consolespam_airvehicles then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_airvehicles then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

--add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Shot, Hits) VALUES (?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1,    0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_airvehicles then
	print("")
	print (data_table_name.." injection done")
	end

else
 --do some thing with results
	if Config.consolespam_airvehicles then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end
end

end -- End of function call

-- ------------------------------------------------------

return airvehicledata()

