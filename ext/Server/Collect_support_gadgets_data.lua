-- Spaghetti code by iamadeadpixel

---@class Support
Support = class 'Support'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Support gadgets loaded ***");
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
	Here we collect support weapon data
]]

	if args[7] == "AMMO BOX" then
	if kill_AMMO_BOX[s_Inflictor.name] == nil then kill_AMMO_BOX[s_Inflictor.name] = 0 ; end
	kill_AMMO_BOX[s_Inflictor.name] = kill_AMMO_BOX[s_Inflictor.name] + 1

	if Death_AMMO_BOX[p_Player.name] == nil then Death_AMMO_BOX[p_Player.name] = 0 ; end  -- Victim
	Death_AMMO_BOX[p_Player.name] = Death_AMMO_BOX[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AMMO_BOX[p_Player.name] == nil then Headshot_AMMO_BOX[p_Player.name] = 0 ; end  -- Victim
	Headshot_AMMO_BOX[p_Player.name] = Headshot_AMMO_BOX[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AMMO_BOX[p_Player.name]
	Dead_data = Death_AMMO_BOX[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_gadgets_msg then
	data_support_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_AMMO_BOX[s_Inflictor.name]
	end
--
	if args[7] == "C4 EXPLOSIVES" then
	if kill_C4_EXPLOSIVES[s_Inflictor.name] == nil then kill_C4_EXPLOSIVES[s_Inflictor.name] = 0 ; end
	kill_C4_EXPLOSIVES[s_Inflictor.name] = kill_C4_EXPLOSIVES[s_Inflictor.name] + 1

	if Death_C4_EXPLOSIVES[p_Player.name] == nil then Death_C4_EXPLOSIVES[p_Player.name] = 0 ; end  -- Victim
	Death_C4_EXPLOSIVES[p_Player.name] = Death_C4_EXPLOSIVES[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_C4_EXPLOSIVES[p_Player.name] == nil then Headshot_C4_EXPLOSIVES[p_Player.name] = 0 ; end  -- Victim
	Headshot_C4_EXPLOSIVES[p_Player.name] = Headshot_C4_EXPLOSIVES[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_C4_EXPLOSIVES[p_Player.name]
	Dead_data = Death_C4_EXPLOSIVES[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_gadgets_msg then
	data_support_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_C4_EXPLOSIVES[s_Inflictor.name]
	end
--
	if args[7] == "M18 CLAYMORE" then
	if kill_M18_CLAYMORE[s_Inflictor.name] == nil then kill_M18_CLAYMORE[s_Inflictor.name] = 0 ; end
	kill_M18_CLAYMORE[s_Inflictor.name] = kill_M18_CLAYMORE[s_Inflictor.name] + 1

	if Death_M18_CLAYMORE[p_Player.name] == nil then Death_M18_CLAYMORE[p_Player.name] = 0 ; end  -- Victim
	Death_M18_CLAYMORE[p_Player.name] = Death_M18_CLAYMORE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M18_CLAYMORE[p_Player.name] == nil then Headshot_M18_CLAYMORE[p_Player.name] = 0 ; end  -- Victim
	Headshot_M18_CLAYMORE[p_Player.name] = Headshot_M18_CLAYMORE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M18_CLAYMORE[p_Player.name]
	Dead_data = Death_M18_CLAYMORE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_gadgets_msg then
	data_support_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M18_CLAYMORE[s_Inflictor.name]
	end
--
	if args[7] == "M224 MORTAR" then
	if kill_M224_MORTAR[s_Inflictor.name] == nil then kill_M224_MORTAR[s_Inflictor.name] = 0 ; end
	kill_M224_MORTAR[s_Inflictor.name] = kill_M224_MORTAR[s_Inflictor.name] + 1

	if Death_M224_MORTAR[p_Player.name] == nil then Death_M224_MORTAR[p_Player.name] = 0 ; end  -- Victim
	Death_M224_MORTAR[p_Player.name] = Death_M224_MORTAR[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M224_MORTAR[p_Player.name] == nil then Headshot_M224_MORTAR[p_Player.name] = 0 ; end  -- Victim
	Headshot_M224_MORTAR[p_Player.name] = Headshot_M224_MORTAR[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M224_MORTAR[p_Player.name]
	Dead_data = Death_M224_MORTAR[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_gadgets_msg then
	data_support_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M224_MORTAR[s_Inflictor.name]
	end
--

	if args[7] == "AMMO BOX" or args[7] == "C4 EXPLOSIVES" or args[7] == "M18 CLAYMORE" or args[7] == "M224 MORTAR" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_support_gadgets"
	data_catagory = "Support gadgets data:"
	data_playername = killer_name
	data_support_gadgets(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_support_gadgets(data_playername)
	end

end)

-- ------------------------------------------------------

function data_support_gadgets_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_support_gadgets(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_support_gadgets1 then
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

	if Config.consolespam_support_gadgets2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_support_gadgets3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_support_gadgets4 then
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

return Support()

