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
	if kill_A_91[s_Inflictor.name] == nil then kill_A_91[s_Inflictor.name] = 0; end
	kill_A_91[s_Inflictor.name] = kill_A_91[s_Inflictor.name] + 1
	data_weaponkills = kill_A_91[s_Inflictor.name]
	end
--
	if args[7] == "ACW-R" then
	if kill_ACW_R[s_Inflictor.name] == nil then kill_ACW_R[s_Inflictor.name] = 0; end
	kill_ACW_R[s_Inflictor.name] = kill_ACW_R[s_Inflictor.name] + 1
	data_weaponkills = kill_ACW_R[s_Inflictor.name]
	end
--
	if args[7] == "AKS-74u" then
	if kill_AKS_74u[s_Inflictor.name] == nil then kill_AKS_74u[s_Inflictor.name] = 0; end
	kill_AKS_74u[s_Inflictor.name] = kill_AKS_74u[s_Inflictor.name] + 1
	data_weaponkills = kill_AKS_74u[s_Inflictor.name]
	end
--
	if args[7] == "G36C" then
	if kill_G36C[s_Inflictor.name] == nil then kill_G36C[s_Inflictor.name] = 0; end
	kill_G36C[s_Inflictor.name] = kill_G36C[s_Inflictor.name] + 1
	data_weaponkills = kill_G36C[s_Inflictor.name]
	end
--
	if args[7] == "G53" then
	if kill_G53[s_Inflictor.name] == nil then kill_G53[s_Inflictor.name] = 0; end
	kill_G53[s_Inflictor.name] = kill_G53[s_Inflictor.name] + 1
	data_weaponkills = kill_G53[s_Inflictor.name]
	end
--
	if args[7] == "M4" then
	if kill_M4[s_Inflictor.name] == nil then kill_M4[s_Inflictor.name] = 0; end
	kill_M4[s_Inflictor.name] = kill_M4[s_Inflictor.name] + 1
	data_weaponkills = kill_M4[s_Inflictor.name]
	end
--
	if args[7] == "M4A1" then
	if kill_M4A1[s_Inflictor.name] == nil then kill_M4A1[s_Inflictor.name] = 0; end
	kill_M4A1[s_Inflictor.name] = kill_M4A1[s_Inflictor.name] + 1
	data_weaponkills = kill_M4A1[s_Inflictor.name]
	end
--
	if args[7] == "MTAR-21" then
	if kill_MTAR_21[s_Inflictor.name] == nil then kill_MTAR_21[s_Inflictor.name] = 0; end
	kill_MTAR_21[s_Inflictor.name] = kill_MTAR_21[s_Inflictor.name] + 1
	data_weaponkills = kill_MTAR_21[s_Inflictor.name]
	end
--
	if args[7] == "QBZ-95B" then
	if kill_QBZ_95B[s_Inflictor.name] == nil then kill_QBZ_95B[s_Inflictor.name] = 0; end
	kill_QBZ_95B[s_Inflictor.name] = kill_QBZ_95B[s_Inflictor.name] + 1
	data_weaponkills = kill_QBZ_95B[s_Inflictor.name]
	end
--
	if args[7] == "SCAR-H" then
	if kill_SCAR_H[s_Inflictor.name] == nil then kill_SCAR_H[s_Inflictor.name] = 0; end
	kill_SCAR_H[s_Inflictor.name] = kill_SCAR_H[s_Inflictor.name] + 1
	data_weaponkills = kill_SCAR_H[s_Inflictor.name]
	end
--
	if args[7] == "SG553" then
	if kill_SG553[s_Inflictor.name] == nil then kill_SG553[s_Inflictor.name] = 0; end
	kill_SG553[s_Inflictor.name] = kill_SG553[s_Inflictor.name] + 1
	data_weaponkills = kill_SG553[s_Inflictor.name]
	end
--
--

	if args[7] == "A-91" or args[7] == "ACW-R" or args[7] == "AKS-74u" or args[7] == "G36C"
	or args[7] == "G53" or args[7] == "M4" or args[7] == "M4A1" or args[7] == "MTAR-21"
	or args[7] == "QBZ-95B" or args[7] == "SCAR-H" or args[7] == "SG553" then

	data_weapon_name = args[7]
	data_table_name = "tbl_engineer_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Engineer weapon data:"
	data_engineer_weapons(data_playername)
	end

end)

-- ------------------------------------------------------

function data_engineer_weapons(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_engineer_weapons then
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

	if Config.consolespam_engineer_weapons then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_engineer_weapons then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

--add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Shot, Hits) VALUES (?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1,    0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_engineer_weapons then
	print("")
	print (data_table_name.." injection done")
	end

else
 --do some thing with results
	if Config.consolespam_engineer_weapons then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end
end

end -- End of function call

-- ------------------------------------------------------

return Engineer()

