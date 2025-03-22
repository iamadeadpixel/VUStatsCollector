-- Spaghetti code by iamadeadpixel

---@class Support
Support = class 'Support'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** Support gadgets loaded ***"); 

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
		args[5] = s_Inflictor.teamId
		args[6] = s_Inflictor.squadId

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

		args[8] = p_IsRoadKill
		args[9] = p_IsHeadShot
		args[10] = p_WasVictimInReviveState
		--
		-- Victim: args[1]
		-- TeamId: args[2]
		-- SquadId: args[3]
		-- Killer: args[4]
		-- Inflictor TeamId: args[5]
		-- Inflictor SquadId: args[6]
		-- Weapon: args[7]
		-- Roadkilled: args[8]
		-- Headshot: args[9]
		-- Revived: args[10]

-- Print lines will be removed on the end
-- ------------------------------------------------------
--[[
	Here we collect support weapon data
]]

	if args[7] == "AMMO BOX" then
	if kill_AMMO_BOX[s_Inflictor.name] == nil then kill_AMMO_BOX[s_Inflictor.name] = 0; end
	kill_AMMO_BOX[s_Inflictor.name] = kill_AMMO_BOX[s_Inflictor.name] + 1
	data_weaponkills = kill_AMMO_BOX[s_Inflictor.name]
	end
--
	if args[7] == "C4 EXPLOSIVES" then
	if kill_C4_EXPLOSIVES[s_Inflictor.name] == nil then kill_C4_EXPLOSIVES[s_Inflictor.name] = 0; end
	kill_C4_EXPLOSIVES[s_Inflictor.name] = kill_C4_EXPLOSIVES[s_Inflictor.name] + 1
	data_weaponkills = kill_C4_EXPLOSIVES[s_Inflictor.name]
	end
--
	if args[7] == "M18 CLAYMORE" then
	if kill_M18_CLAYMORE[s_Inflictor.name] == nil then kill_M18_CLAYMORE[s_Inflictor.name] = 0; end
	kill_M18_CLAYMORE[s_Inflictor.name] = kill_M18_CLAYMORE[s_Inflictor.name] + 1
	data_weaponkills = kill_M18_CLAYMORE[s_Inflictor.name]
	end
--
	if args[7] == "M224 MORTAR" then
	if kill_M224_MORTAR[s_Inflictor.name] == nil then kill_M224_MORTAR[s_Inflictor.name] = 0; end
	kill_M224_MORTAR[s_Inflictor.name] = kill_M224_MORTAR[s_Inflictor.name] + 1
	data_weaponkills = kill_M224_MORTAR[s_Inflictor.name]
	end
--
--

	if args[7] == "AMMO BOX" or args[7] == "C4 EXPLOSIVES" or args[7] == "M18 CLAYMORE" or args[7] == "M224 MORTAR" then

	data_weapon_name = args[7]
	data_table_name = "tbl_support_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Support gadgets data:"
	data_support_gadgets(data_playername)
	end

end)

-- ------------------------------------------------------

function data_support_gadgets(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	print ("")
	print (data_catagory.." Weapon name:"..data_weapon_name)
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print (data_catagory.." Weapon kills:"..data_weaponkills)

	print ("")

	print ("Accessing "..data_table_name)
	Results = SQL:Query('SELECT Weaponname, Soldiername FROM '..data_table_name..' WHERE Soldiername = ? and Weaponname = ?', data_playername,data_weapon_name) -- works

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	print ("Done reading "..data_table_name)
	print (Results)
	print ("")

if type(next(Results)) == "nil" then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
 --add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills) VALUES (?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end
	print("")
	print (data_table_name.." injection done")

else
 --do some thing with results
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
end

end -- End of function call


return Support()

