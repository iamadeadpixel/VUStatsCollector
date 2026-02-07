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
	if kill_TV_MISSILE[s_Inflictor.name] == nil then kill_TV_MISSILE[s_Inflictor.name] = 0 ; end
	kill_TV_MISSILE[s_Inflictor.name] = kill_TV_MISSILE[s_Inflictor.name] + 1

	if Death_TV_MISSILE[p_Player.name] == nil then Death_TV_MISSILE[p_Player.name] = 0 ; end
	Death_TV_MISSILE[p_Player.name] = Death_TV_MISSILE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_TV_MISSILE[p_Player.name] == nil then Headshot_TV_MISSILE[p_Player.name] = 0 ; end
	Headshot_TV_MISSILE[p_Player.name] = Headshot_TV_MISSILE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_TV_MISSILE[p_Player.name]
	Dead_data = Death_TV_MISSILE[p_Player.name] 
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_TV_MISSILE[s_Inflictor.name]
	end
--
	if args[7] == "A-10 THUNDERBOLT" then
	if kill_A10_THUNDERBOLT[s_Inflictor.name] == nil then kill_A10_THUNDERBOLT[s_Inflictor.name] = 0 ; end
	kill_A10_THUNDERBOLT[s_Inflictor.name] = kill_A10_THUNDERBOLT[s_Inflictor.name] + 1

	if Death_A10_THUNDERBOLT[p_Player.name] == nil then Death_A10_THUNDERBOLT[p_Player.name] = 0 ; end
	Death_A10_THUNDERBOLT[p_Player.name] = Death_A10_THUNDERBOLT[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_A10_THUNDERBOLT[p_Player.name] == nil then Headshot_A10_THUNDERBOLT[p_Player.name] = 0 ; end
	Headshot_A10_THUNDERBOLT[p_Player.name] = Headshot_A10_THUNDERBOLT[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_A10_THUNDERBOLT[p_Player.name]
	Dead_data = Death_A10_THUNDERBOLT[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_A10_THUNDERBOLT[s_Inflictor.name]
	end
--
	if args[7] == "AH-1Z VIPER" then
	if kill_AH_1Z_VIPER[s_Inflictor.name] == nil then kill_AH_1Z_VIPER[s_Inflictor.name] = 0 ; end
	kill_AH_1Z_VIPER[s_Inflictor.name] = kill_AH_1Z_VIPER[s_Inflictor.name] + 1

	if Death_AH_1Z_VIPER[p_Player.name] == nil then Death_AH_1Z_VIPER[p_Player.name] = 0 ; end
	Death_AH_1Z_VIPER[p_Player.name] = Death_AH_1Z_VIPER[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AH_1Z_VIPER[p_Player.name] == nil then Headshot_AH_1Z_VIPER[p_Player.name] = 0 ; end
	Headshot_AH_1Z_VIPER[p_Player.name] = Headshot_AH_1Z_VIPER[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AH_1Z_VIPER[p_Player.name]
	Dead_data = Death_AH_1Z_VIPER[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_AH_1Z_VIPER[s_Inflictor.name]
	end
--
	if args[7] == "AH-6J LITTLE BIRD" then
	if kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] == nil then kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] = 0 ; end
	kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] = kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] + 1

	if Death_AH_6J_LITTLE_BIRD[p_Player.name] == nil then Death_AH_6J_LITTLE_BIRD[p_Player.name] = 0 ; end
	Death_AH_6J_LITTLE_BIRD[p_Player.name] = Death_AH_6J_LITTLE_BIRD[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AH_6J_LITTLE_BIRD[p_Player.name] == nil then Headshot_AH_6J_LITTLE_BIRD[p_Player.name] = 0 ; end
	Headshot_AH_6J_LITTLE_BIRD[p_Player.name] = Headshot_AH_6J_LITTLE_BIRD[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AH_6J_LITTLE_BIRD[p_Player.name]
	Dead_data = Death_AH_6J_LITTLE_BIRD[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_AH_6J_LITTLE_BIRD[s_Inflictor.name]
	end
--
	if args[7] == "F-35" then
	if kill_F_35[s_Inflictor.name] == nil then kill_F_35[s_Inflictor.name] = 0 ; end
	kill_F_35[s_Inflictor.name] = kill_F_35[s_Inflictor.name] + 1

	if Death_F_35[p_Player.name] == nil then Death_F_35[p_Player.name] = 0 ; end
	Death_F_35[p_Player.name] = Death_F_35[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_F_35[p_Player.name] == nil then Headshot_F_35[p_Player.name] = 0 ; end
	Headshot_F_35[p_Player.name] = Headshot_F_35[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_F_35[p_Player.name]
	Dead_data = Death_F_35[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_F_35[s_Inflictor.name]
	end
--
	if args[7] == "F/A-18E SUPER HORNET" then
	if kill_FA_18E_SUPER_HORNET[s_Inflictor.name] == nil then kill_FA_18E_SUPER_HORNET[s_Inflictor.name] = 0 ; end
	kill_FA_18E_SUPER_HORNET[s_Inflictor.name] = kill_FA_18E_SUPER_HORNET[s_Inflictor.name] + 1

	if Death_FA_18E_SUPER_HORNET[p_Player.name] == nil then Death_FA_18E_SUPER_HORNET[p_Player.name] = 0 ; end
	Death_FA_18E_SUPER_HORNET[p_Player.name] = Death_FA_18E_SUPER_HORNET[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_FA_18E_SUPER_HORNET[p_Player.name] == nil then Headshot_FA_18E_SUPER_HORNET[p_Player.name] = 0 ; end
	Headshot_FA_18E_SUPER_HORNET[p_Player.name] = Headshot_FA_18E_SUPER_HORNET[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_FA_18E_SUPER_HORNET[p_Player.name]
	Dead_data = Death_FA_18E_SUPER_HORNET[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_FA_18E_SUPER_HORNET[s_Inflictor.name]
	end
--
	if args[7] == "GUNSHIP" then
	if kill_GUNSHIP[s_Inflictor.name] == nil then kill_GUNSHIP[s_Inflictor.name] = 0 ; end
	kill_GUNSHIP[s_Inflictor.name] = kill_GUNSHIP[s_Inflictor.name] + 1

	if Death_GUNSHIP[p_Player.name] == nil then Death_GUNSHIP[p_Player.name] = 0 ; end
	Death_GUNSHIP[p_Player.name] = Death_GUNSHIP[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GUNSHIP[p_Player.name] == nil then Headshot_GUNSHIP[p_Player.name] = 0 ; end
	Headshot_GUNSHIP[p_Player.name] = Headshot_GUNSHIP[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GUNSHIP[p_Player.name]
	Dead_data = Death_GUNSHIP[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_GUNSHIP[s_Inflictor.name]
	end
--
	if args[7] == "KA-60 KASATKA" then
	if kill_KA_60_KASATKA[s_Inflictor.name] == nil then kill_KA_60_KASATKA[s_Inflictor.name] = 0 ; end
	kill_KA_60_KASATKA[s_Inflictor.name] = kill_KA_60_KASATKA[s_Inflictor.name] + 1

	if Death_KA_60_KASATKA[p_Player.name] == nil then Death_KA_60_KASATKA[p_Player.name] = 0 ; end
	Death_KA_60_KASATKA[p_Player.name] = Death_KA_60_KASATKA[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_KA_60_KASATKA[p_Player.name] == nil then Headshot_KA_60_KASATKA[p_Player.name] = 0 ; end
	Headshot_KA_60_KASATKA[p_Player.name] = Headshot_KA_60_KASATKA[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_KA_60_KASATKA[p_Player.name]
	Dead_data = Death_KA_60_KASATKA[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_KA_60_KASATKA[s_Inflictor.name]
	end
--
	if args[7] == "MI-28 HAVOC" then
	if kill_MI_28_HAVOC[s_Inflictor.name] == nil then kill_MI_28_HAVOC[s_Inflictor.name] = 0 ; end
	kill_MI_28_HAVOC[s_Inflictor.name] = kill_MI_28_HAVOC[s_Inflictor.name] + 1

	if Death_MI_28_HAVOC[p_Player.name] == nil then Death_MI_28_HAVOC[p_Player.name] = 0 ; end
	Death_MI_28_HAVOC[p_Player.name] = Death_MI_28_HAVOC[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_MI_28_HAVOC[p_Player.name] == nil then Headshot_MI_28_HAVOC[p_Player.name] = 0 ; end
	Headshot_MI_28_HAVOC[p_Player.name] = Headshot_MI_28_HAVOC[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MI_28_HAVOC[p_Player.name]
	Dead_data = Death_MI_28_HAVOC[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_MI_28_HAVOC[s_Inflictor.name]
	end
--
	if args[7] == "SU-25TM FROGFOOT" then
	if kill_SU_25TM_FROGFOOT[s_Inflictor.name] == nil then kill_SU_25TM_FROGFOOT[s_Inflictor.name] = 0 ; end
	kill_SU_25TM_FROGFOOT[s_Inflictor.name] = kill_SU_25TM_FROGFOOT[s_Inflictor.name] + 1

	if Death_SU_25TM_FROGFOOT[p_Player.name] == nil then Death_SU_25TM_FROGFOOT[p_Player.name] = 0 ; end
	Death_SU_25TM_FROGFOOT[p_Player.name] = Death_SU_25TM_FROGFOOT[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SU_25TM_FROGFOOT[p_Player.name] == nil then Headshot_SU_25TM_FROGFOOT[p_Player.name] = 0 ; end
	Headshot_SU_25TM_FROGFOOT[p_Player.name] = Headshot_SU_25TM_FROGFOOT[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SU_25TM_FROGFOOT[p_Player.name]
	Dead_data = Death_SU_25TM_FROGFOOT[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_SU_25TM_FROGFOOT[s_Inflictor.name]
	end
--
	if args[7] == "SU-35BM FLANKER-E" then
	if kill_SU_35BM_FLANKER_E[s_Inflictor.name] == nil then kill_SU_35BM_FLANKER_E[s_Inflictor.name] = 0 ; end
	kill_SU_35BM_FLANKER_E[s_Inflictor.name] = kill_SU_35BM_FLANKER_E[s_Inflictor.name] + 1

	if Death_SU_35BM_FLANKER_E[p_Player.name] == nil then Death_SU_35BM_FLANKER_E[p_Player.name] = 0 ; end
	Death_SU_35BM_FLANKER_E[p_Player.name] = Death_SU_35BM_FLANKER_E[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SU_35BM_FLANKER_E[p_Player.name] == nil then Headshot_SU_35BM_FLANKER_E[p_Player.name] = 0 ; end
	Headshot_SU_35BM_FLANKER_E[p_Player.name] = Headshot_SU_35BM_FLANKER_E[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SU_35BM_FLANKER_E[p_Player.name]
	Dead_data = Death_SU_35BM_FLANKER_E[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_SU_35BM_FLANKER_E[s_Inflictor.name]
	end
--
	if args[7] == "SU-37" then
	if kill_SU_37[s_Inflictor.name] == nil then kill_SU_37[s_Inflictor.name] = 0 ; end
	kill_SU_37[s_Inflictor.name] = kill_SU_37[s_Inflictor.name] + 1

	if Death_SU_37[p_Player.name] == nil then Death_SU_37[p_Player.name] = 0 ; end
	Death_SU_37[p_Player.name] = Death_SU_37[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SU_37[p_Player.name] == nil then Headshot_SU_37[p_Player.name] = 0 ; end
	Headshot_SU_37[p_Player.name] = Headshot_SU_37[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SU_37[p_Player.name]
	Dead_data = Death_SU_37[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_SU_37[s_Inflictor.name]
	end
--
	if args[7] == "UH-1Y VENOM" then
	if kill_UH_1Y_VENOM[s_Inflictor.name] == nil then kill_UH_1Y_VENOM[s_Inflictor.name] = 0 ; end
	kill_UH_1Y_VENOM[s_Inflictor.name] = kill_UH_1Y_VENOM[s_Inflictor.name] + 1

	if Death_UH_1Y_VENOM[p_Player.name] == nil then Death_UH_1Y_VENOM[p_Player.name] = 0 ; end
	Death_UH_1Y_VENOM[p_Player.name] = Death_UH_1Y_VENOM[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_UH_1Y_VENOM[p_Player.name] == nil then Headshot_UH_1Y_VENOM[p_Player.name] = 0 ; end
	Headshot_UH_1Y_VENOM[p_Player.name] = Headshot_UH_1Y_VENOM[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_UH_1Y_VENOM[p_Player.name]
	Dead_data = Death_UH_1Y_VENOM[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_UH_1Y_VENOM[s_Inflictor.name]
	end
--
	if args[7] == "Z-11W" then
	if kill_Z_11W[s_Inflictor.name] == nil then kill_Z_11W[s_Inflictor.name] = 0 ; end
	kill_Z_11W[s_Inflictor.name] = kill_Z_11W[s_Inflictor.name] + 1

	if Death_Z_11W[p_Player.name] == nil then Death_Z_11W[p_Player.name] = 0 ; end
	Death_Z_11W[p_Player.name] = Death_Z_11W[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_Z_11W[p_Player.name] == nil then Headshot_Z_11W[p_Player.name] = 0 ; end
	Headshot_Z_11W[p_Player.name] = Headshot_Z_11W[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_Z_11W[p_Player.name]
	Dead_data = Death_Z_11W[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_airvehicles_msg then
	data_airvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_Z_11W[s_Inflictor.name]
	end
--

	if args[7] == "A-10 THUNDERBOLT" or args[7] == "AH-1Z VIPER" or args[7] == "AH-6J LITTLE BIRD" or args[7] == "F-35"
	or args[7] == "F/A-18E SUPER HORNET" or args[7] == "GUNSHIP" or args[7] == "KA-60 KASATKA" or args[7] == "MI-28 HAVOC"
	or args[7] == "SU-25TM FROGFOOT" or args[7] == "SU-35BM FLANKER-E" or args[7] == "SU-37"
	or args[7] == "TV MISSILE" or args[7] == "UH-1Y VENOM" or args[7] == "Z-11W" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_air_vehicles"
	data_catagory = "Air vehicles data:"
	data_playername = killer_name
	data_airvehicles(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_airvehicles(data_playername)
	end

end)

-- ------------------------------------------------------

function data_airvehicles_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_airvehicles(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_airvehicles1 then
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

	if Config.consolespam_airvehicles2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_airvehicles3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths) VALUES (?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_airvehicles4 then
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

return airvehicledata()

