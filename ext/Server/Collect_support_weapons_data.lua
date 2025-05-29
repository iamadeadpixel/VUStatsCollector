-- Spaghetti code by iamadeadpixel

---@class Support
Support = class 'Support'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Support weapons loaded ***");
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

	if args[7] == "L86A2" then
	if kill_L86A2[s_Inflictor.name] == nil then kill_L86A2[s_Inflictor.name] = 0 ; end
	kill_L86A2[s_Inflictor.name] = kill_L86A2[s_Inflictor.name] + 1

	if Death_L86A2[p_Player.name] == nil then Death_L86A2[p_Player.name] = 0 ; end  -- Victim
	Death_L86A2[p_Player.name] = Death_L86A2[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_L86A2[p_Player.name] == nil then Headshot_L86A2[p_Player.name] = 0 ; end  -- Victim
	Headshot_L86A2[p_Player.name] = Headshot_L86A2[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_L86A2[p_Player.name]
	Dead_data = Death_L86A2[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_L86A2[s_Inflictor.name]
	end
--
	if args[7] == "LSAT" then
	if kill_LSAT[s_Inflictor.name] == nil then kill_LSAT[s_Inflictor.name] = 0 ; end
	kill_LSAT[s_Inflictor.name] = kill_LSAT[s_Inflictor.name] + 1

	if Death_LSAT[p_Player.name] == nil then Death_LSAT[p_Player.name] = 0 ; end  -- Victim
	Death_LSAT[p_Player.name] = Death_LSAT[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_LSAT[p_Player.name] == nil then Headshot_LSAT[p_Player.name] = 0 ; end  -- Victim
	Headshot_LSAT[p_Player.name] = Headshot_LSAT[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_LSAT[p_Player.name]
	Dead_data = Death_LSAT[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_LSAT[s_Inflictor.name]
	end
--
	if args[7] == "M240B" then
	if kill_M240B[s_Inflictor.name] == nil then kill_M240B[s_Inflictor.name] = 0 ; end
	kill_M240B[s_Inflictor.name] = kill_M240B[s_Inflictor.name] + 1

	if Death_M240B[p_Player.name] == nil then Death_M240B[p_Player.name] = 0 ; end  -- Victim
	Death_M240B[p_Player.name] = Death_M240B[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M240B[p_Player.name] == nil then Headshot_M240B[p_Player.name] = 0 ; end  -- Victim
	Headshot_M240B[p_Player.name] = Headshot_M240B[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M240B[p_Player.name]
	Dead_data = Death_M240B[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M240B[s_Inflictor.name]
	end
--
	if args[7] == "M249" then
	if kill_M249[s_Inflictor.name] == nil then kill_M249[s_Inflictor.name] = 0 ; end
	kill_M249[s_Inflictor.name] = kill_M249[s_Inflictor.name] + 1

	if Death_M249[p_Player.name] == nil then Death_M249[p_Player.name] = 0 ; end  -- Victim
	Death_M249[p_Player.name] = Death_M249[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M249[p_Player.name] == nil then Headshot_M249[p_Player.name] = 0 ; end  -- Victim
	Headshot_M249[p_Player.name] = Headshot_M249[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M249[p_Player.name]
	Dead_data = Death_M249[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M249[s_Inflictor.name]
	end
--
	if args[7] == "M27 IAR" then
	if kill_M27_IAR[s_Inflictor.name] == nil then kill_M27_IAR[s_Inflictor.name] = 0 ; end
	kill_M27_IAR[s_Inflictor.name] = kill_M27_IAR[s_Inflictor.name] + 1

	if Death_M27_IAR[p_Player.name] == nil then Death_M27_IAR[p_Player.name] = 0 ; end  -- Victim
	Death_M27_IAR[p_Player.name] = Death_M27_IAR[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M27_IAR[p_Player.name] == nil then Headshot_M27_IAR[p_Player.name] = 0 ; end  -- Victim
	Headshot_M27_IAR[p_Player.name] = Headshot_M27_IAR[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M27_IAR[p_Player.name]
	Dead_data = Death_M27_IAR[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M27_IAR[s_Inflictor.name]
	end
--
	if args[7] == "M60E4" then
	if kill_M60E4[s_Inflictor.name] == nil then kill_M60E4[s_Inflictor.name] = 0 ; end
	kill_M60E4[s_Inflictor.name] = kill_M60E4[s_Inflictor.name] + 1

	if Death_M60E4[p_Player.name] == nil then Death_M60E4[p_Player.name] = 0 ; end  -- Victim
	Death_M60E4[p_Player.name] = Death_M60E4[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M60E4[p_Player.name] == nil then Headshot_M60E4[p_Player.name] = 0 ; end  -- Victim
	Headshot_M60E4[p_Player.name] = Headshot_M60E4[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M60E4[p_Player.name]
	Dead_data = Death_M60E4[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M60E4[s_Inflictor.name]
	end
--
	if args[7] == "MG36" then
	if kill_MG36[s_Inflictor.name] == nil then kill_MG36[s_Inflictor.name] = 0 ; end
	kill_MG36[s_Inflictor.name] = kill_MG36[s_Inflictor.name] + 1

	if Death_MG36[p_Player.name] == nil then Death_MG36[p_Player.name] = 0 ; end  -- Victim
	Death_MG36[p_Player.name] = Death_MG36[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_MG36[p_Player.name] == nil then Headshot_MG36[p_Player.name] = 0 ; end  -- Victim
	Headshot_MG36[p_Player.name] = Headshot_MG36[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MG36[p_Player.name]
	Dead_data = Death_MG36[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_MG36[s_Inflictor.name]
	end
--
	if args[7] == "PKP PECHENEG" then
	if kill_PKP_PECHENEG[s_Inflictor.name] == nil then kill_PKP_PECHENEG[s_Inflictor.name] = 0 ; end
	kill_PKP_PECHENEG[s_Inflictor.name] = kill_PKP_PECHENEG[s_Inflictor.name] + 1

	if Death_PKP_PECHENEG[p_Player.name] == nil then Death_PKP_PECHENEG[p_Player.name] = 0 ; end  -- Victim
	Death_PKP_PECHENEG[p_Player.name] = Death_PKP_PECHENEG[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_PKP_PECHENEG[p_Player.name] == nil then Headshot_PKP_PECHENEG[p_Player.name] = 0 ; end  -- Victim
	Headshot_PKP_PECHENEG[p_Player.name] = Headshot_PKP_PECHENEG[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_PKP_PECHENEG[p_Player.name]
	Dead_data = Death_PKP_PECHENEG[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_PKP_PECHENEG[s_Inflictor.name]
	end
--
	if args[7] == "QBB-95" then
	if kill_QBB_95[s_Inflictor.name] == nil then kill_QBB_95[s_Inflictor.name] = 0 ; end
	kill_QBB_95[s_Inflictor.name] = kill_QBB_95[s_Inflictor.name] + 1

	if Death_QBB_95[p_Player.name] == nil then Death_QBB_95[p_Player.name] = 0 ; end  -- Victim
	Death_QBB_95[p_Player.name] = Death_QBB_95[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_QBB_95[p_Player.name] == nil then Headshot_QBB_95[p_Player.name] = 0 ; end  -- Victim
	Headshot_QBB_95[p_Player.name] = Headshot_QBB_95[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_QBB_95[p_Player.name]
	Dead_data = Death_QBB_95[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_QBB_95[s_Inflictor.name]
	end
--
	if args[7] == "RPK-74M" then
	if kill_RPK_74M[s_Inflictor.name] == nil then kill_RPK_74M[s_Inflictor.name] = 0 ; end
	kill_RPK_74M[s_Inflictor.name] = kill_RPK_74M[s_Inflictor.name] + 1

	if Death_RPK_74M[p_Player.name] == nil then Death_RPK_74M[p_Player.name] = 0 ; end  -- Victim
	Death_RPK_74M[p_Player.name] = Death_RPK_74M[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_RPK_74M[p_Player.name] == nil then Headshot_RPK_74M[p_Player.name] = 0 ; end  -- Victim
	Headshot_RPK_74M[p_Player.name] = Headshot_RPK_74M[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_RPK_74M[p_Player.name]
	Dead_data = Death_RPK_74M[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_RPK_74M[s_Inflictor.name]
	end
--
	if args[7] == "TYPE 88 LMG" then
	if kill_TYPE_88_LMG[s_Inflictor.name] == nil then kill_TYPE_88_LMG[s_Inflictor.name] = 0 ; end
	kill_TYPE_88_LMG[s_Inflictor.name] = kill_TYPE_88_LMG[s_Inflictor.name] + 1

	if Death_TYPE_88_LMG[p_Player.name] == nil then Death_TYPE_88_LMG[p_Player.name] = 0 ; end  -- Victim
	Death_TYPE_88_LMG[p_Player.name] = Death_TYPE_88_LMG[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_TYPE_88_LMG[p_Player.name] == nil then Headshot_TYPE_88_LMG[p_Player.name] = 0 ; end  -- Victim
	Headshot_TYPE_88_LMG[p_Player.name] = Headshot_TYPE_88_LMG[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_TYPE_88_LMG[p_Player.name]
	Dead_data = Death_TYPE_88_LMG[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_support_weapons_msg then
	data_support_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_TYPE_88_LMG[s_Inflictor.name]
	end
--

	if args[7] == "L86A2" or args[7] == "LSAT" or args[7] == "M240B" or args[7] == "M249"
	or args[7] == "M27 IAR" or args[7] == "M60E4" or args[7] == "MG36" or args[7] == "PKP PECHENEG"
	or args[7] == "QBB-95" or args[7] == "RPK-74M" or args[7] == "TYPE 88 LMG" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_support_weapons"
	data_catagory = "Support weapon data:"
	data_playername = killer_name
	data_support_weapons(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_support_weapons(data_playername)
	end

end)

-- ------------------------------------------------------

function data_support_weapons_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_support_weapons(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_support_weapons1 then
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

	if Config.consolespam_support_weapons2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_support_weapons3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_support_weapons4 then
	print("")
	print (data_table_name.." injection done")
	end

else

	if Config.consolespam_support_weapons5 then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end

end
end -- End of function call

-- ------------------------------------------------------

return Support()

