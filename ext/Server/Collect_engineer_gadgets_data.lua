-- Spaghetti code by iamadeadpixel

---@class Engineer
Engineer = class 'Engineer'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Engineer gadgets loaded ***");
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

	if args[7] == "EOD BOT" then
	if kill_EOD_BOT[s_Inflictor.name] == nil then kill_EOD_BOT[s_Inflictor.name] = 0; end
	kill_EOD_BOT[s_Inflictor.name] = kill_EOD_BOT[s_Inflictor.name] + 1
	data_weaponkills = kill_EOD_BOT[s_Inflictor.name]
	end
--
	if args[7] == "FGM-148 JAVELIN" then
	if kill_FGM_148_JAVELIN[s_Inflictor.name] == nil then kill_FGM_148_JAVELIN[s_Inflictor.name] = 0; end
	kill_FGM_148_JAVELIN[s_Inflictor.name] = kill_FGM_148_JAVELIN[s_Inflictor.name] + 1
	data_weaponkills = kill_FGM_148_JAVELIN[s_Inflictor.name]
	end
--
	if args[7] == "FIM-92 STINGER" then
	if kill_FIM_92_STINGER[s_Inflictor.name] == nil then kill_FIM_92_STINGER[s_Inflictor.name] = 0; end
	kill_FIM_92_STINGER[s_Inflictor.name] = kill_FIM_92_STINGER[s_Inflictor.name] + 1
	data_weaponkills = kill_FIM_92_STINGER[s_Inflictor.name]
	end
--
	if args[7] == "M15 AT MINE" then
	if kill_M15_AT_MINE[s_Inflictor.name] == nil then kill_M15_AT_MINE[s_Inflictor.name] = 0; end
	kill_M15_AT_MINE[s_Inflictor.name] = kill_M15_AT_MINE[s_Inflictor.name] + 1
	data_weaponkills = kill_M15_AT_MINE[s_Inflictor.name]
	end
--
	if args[7] == "REPAIR TOOL" then
	if kill_REPAIR_TOOL[s_Inflictor.name] == nil then kill_REPAIR_TOOL[s_Inflictor.name] = 0; end
	kill_REPAIR_TOOL[s_Inflictor.name] = kill_REPAIR_TOOL[s_Inflictor.name] + 1
	data_weaponkills = kill_REPAIR_TOOL[s_Inflictor.name]
	end
--
	if args[7] == "RPG-7V2" then
	if kill_RPG_7V2[s_Inflictor.name] == nil then kill_RPG_7V2[s_Inflictor.name] = 0; end
	kill_RPG_7V2[s_Inflictor.name] = kill_RPG_7V2[s_Inflictor.name] + 1
	data_weaponkills = kill_RPG_7V2[s_Inflictor.name]
	end
--
	if args[7] == "SA-18 IGLA" then
	if kill_SA_18_IGLA[s_Inflictor.name] == nil then kill_SA_18_IGLA[s_Inflictor.name] = 0; end
	kill_SA_18_IGLA[s_Inflictor.name] = kill_SA_18_IGLA[s_Inflictor.name] + 1
	data_weaponkills = kill_SA_18_IGLA[s_Inflictor.name]
	end
--
	if args[7] == "SMAW" then
	if kill_SMAW[s_Inflictor.name] == nil then kill_SMAW[s_Inflictor.name] = 0; end
	kill_SMAW[s_Inflictor.name] = kill_SMAW[s_Inflictor.name] + 1
	data_weaponkills = kill_SMAW[s_Inflictor.name]
	end
--
--

	if args[7] == "EOD BOT" or args[7] == "FGM-148 JAVELIN" or args[7] == "FIM-92 STINGER"
	or args[7] == "M15 AT MINE" or args[7] == "REPAIR TOOL" or args[7] == "RPG-7V2"
	or args[7] == "SA-18 IGLA" or args[7] == "SMAW" then

	data_weapon_name = args[7]
	data_table_name = "tbl_engineer_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Engineer gadgets data:"
	data_engineer_gadgets(data_playername)
	end

end)

-- ------------------------------------------------------

function data_engineer_gadgets(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_engineer_gadgets then
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

	if Config.consolespam_engineer_gadgets then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_engineer_gadgets then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

--add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills) VALUES (?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_engineer_gadgets then
	print("")
	print (data_table_name.." injection done")
	end

else
 --do some thing with results
	if Config.consolespam_engineer_gadgets then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end
end

end -- End of function call

-- ------------------------------------------------------

return Engineer()

