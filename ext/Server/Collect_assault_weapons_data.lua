-- Spaghetti code by iamadeadpixel

---@class Assault
Assault = class 'Assault'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Assault weapons loaded ***");
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
	Here we collect assault weapon data
]]

	if args[7] == "AEK-971" then
	if kill_AEK_971[s_Inflictor.name] == nil then kill_AEK_971[s_Inflictor.name] = 0; end
	kill_AEK_971[s_Inflictor.name] = kill_AEK_971[s_Inflictor.name] + 1
	data_weaponkills = kill_AEK_971[s_Inflictor.name]
	end
--
	if args[7] == "AK-74M" then
	if kill_AK_74M[s_Inflictor.name] == nil then kill_AK_74M[s_Inflictor.name] = 0; end
	kill_AK_74M[s_Inflictor.name] = kill_AK_74M[s_Inflictor.name] + 1
	data_weaponkills = kill_AK_74M[s_Inflictor.name]
	end
--
	if args[7] == "AN-94" then
	if kill_AN_94[s_Inflictor.name] == nil then kill_AN_94[s_Inflictor.name] = 0; end
	kill_AN_94[s_Inflictor.name] = kill_AN_94[s_Inflictor.name] + 1
	data_weaponkills = kill_AN_94[s_Inflictor.name]
	end
--
	if args[7] == "AUG A3" then
	if kill_AUG_A3[s_Inflictor.name] == nil then kill_AUG_A3[s_Inflictor.name] = 0; end
	kill_AUG_A3[s_Inflictor.name] = kill_AUG_A3[s_Inflictor.name] + 1
	data_weaponkills = kill_AUG_A3[s_Inflictor.name]
	end
--
	if args[7] == "F2000" then
	if kill_F2000[s_Inflictor.name] == nil then kill_F2000[s_Inflictor.name] = 0; end
	kill_F2000[s_Inflictor.name] = kill_F2000[s_Inflictor.name] + 1
	data_weaponkills = kill_F2000[s_Inflictor.name]
	end
--
	if args[7] == "FAMAS" then
	if kill_FAMAS[s_Inflictor.name] == nil then kill_FAMAS[s_Inflictor.name] = 0; end
	kill_FAMAS[s_Inflictor.name] = kill_FAMAS[s_Inflictor.name] + 1
	data_weaponkills = kill_FAMAS[s_Inflictor.name]
	end
--
	if args[7] == "G3A3" then
	if kill_G3A3[s_Inflictor.name] == nil then kill_G3A3[s_Inflictor.name] = 0; end
	kill_G3A3[s_Inflictor.name] = kill_G3A3[s_Inflictor.name] + 1
	data_weaponkills = kill_G3A3[s_Inflictor.name]
	end
--
	if args[7] == "KH2002" then
	if kill_KH2002[s_Inflictor.name] == nil then kill_KH2002[s_Inflictor.name] = 0; end
	kill_KH2002[s_Inflictor.name] = kill_KH2002[s_Inflictor.name] + 1
	data_weaponkills = kill_KH2002[s_Inflictor.name]
	end
--
	if args[7] == "L85A2" then
	if kill_L85A2[s_Inflictor.name] == nil then kill_L85A2[s_Inflictor.name] = 0; end
	kill_L85A2[s_Inflictor.name] = kill_L85A2[s_Inflictor.name] + 1
	data_weaponkills = kill_L85A2[s_Inflictor.name]
	end
--
	if args[7] == "M16A3" then
	if kill_M16A3[s_Inflictor.name] == nil then kill_M16A3[s_Inflictor.name] = 0; end
	kill_M16A3[s_Inflictor.name] = kill_M16A3[s_Inflictor.name] + 1
	data_weaponkills = kill_M16A3[s_Inflictor.name]
	end
--
	if args[7] == "M16A4" then
	if kill_M16A4[s_Inflictor.name] == nil then kill_M16A4[s_Inflictor.name] = 0; end
	kill_M16A4[s_Inflictor.name] = kill_M16A4[s_Inflictor.name] + 1
	data_weaponkills = kill_M16A4[s_Inflictor.name]
	end
--
	if args[7] == "M416" then
	if kill_M416[s_Inflictor.name] == nil then kill_M416[s_Inflictor.name] = 0; end
	kill_M416[s_Inflictor.name] = kill_M416[s_Inflictor.name] + 1
	data_weaponkills = kill_M416[s_Inflictor.name]
	end
--
	if args[7] == "SCAR-L" then
	if kill_SCAR_L[s_Inflictor.name] == nil then kill_SCAR_L[s_Inflictor.name] = 0; end
	kill_SCAR_L[s_Inflictor.name] = kill_SCAR_L[s_Inflictor.name] + 1
	data_weaponkills = kill_SCAR_L[s_Inflictor.name]
	end
--
--

	if args[7] == "AEK-971" or args[7] == "AK-74M" or args[7] == "AN-94" or args[7] == "AUG A3"
	or args[7] == "F2000" or args[7] == "FAMAS" or args[7] == "G3A3" or args[7] == "KH2002" or args[7] == "L85A2"
	or args[7] == "M16A3" or args[7] == "M16A4" or args[7] == "M416" or args[7] == "SCAR-L" then

	data_weapon_name = args[7]
	data_table_name = "tbl_assault_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Assault weapon data:"
	data_assault_weapons(data_playername)
	end

end)

-- ------------------------------------------------------

function data_assault_weapons(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_assault_weapons then
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

	if Config.consolespam_assault_weapons then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_assault_weapons then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

--add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills) VALUES (?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_assault_weapons then
	print("")
	print (data_table_name.." injection done")
	end

else
 --do some thing with results
	if Config.consolespam_assault_weapons then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end
end

end -- End of function call

-- ------------------------------------------------------

return Assault()

