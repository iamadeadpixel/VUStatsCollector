-- Spaghetti code by iamadeadpixel

---@class landvehicledata
landvehicledata = class 'landvehicledata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Land vehicles loaded ***");
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
	Here we collect land vehicle data
]]

	if args[7] == "9K22 TUNGUSKA-M" then
	if kill_9K22_TUNGUSKA_M[s_Inflictor.name] == nil then kill_9K22_TUNGUSKA_M[s_Inflictor.name] = 0 ; end
	kill_9K22_TUNGUSKA_M[s_Inflictor.name] = kill_9K22_TUNGUSKA_M[s_Inflictor.name] + 1

	if Death_9K22_TUNGUSKA_M[p_Player.name] == nil then Death_9K22_TUNGUSKA_M[p_Player.name] = 0 ; end
	Death_9K22_TUNGUSKA_M[p_Player.name] = Death_9K22_TUNGUSKA_M[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_9K22_TUNGUSKA_M[p_Player.name] == nil then Headshot_9K22_TUNGUSKA_M[p_Player.name] = 0 ; end
	Headshot_9K22_TUNGUSKA_M[p_Player.name] = Headshot_9K22_TUNGUSKA_M[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_9K22_TUNGUSKA_M[p_Player.name]
	Dead_data = Death_9K22_TUNGUSKA_M[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_9K22_TUNGUSKA_M[s_Inflictor.name]
	end
--
	if args[7] == "9M133 KORNET LAUNCHER" then
	if kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] == nil then kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = 0 ; end
	kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] + 1

	if Death_9M133_KORNET_LAUNCHER[p_Player.name] == nil then Death_9M133_KORNET_LAUNCHER[p_Player.name] = 0 ; end  -- Victim
	Death_9M133_KORNET_LAUNCHER[p_Player.name] = Death_9M133_KORNET_LAUNCHER[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_9M133_KORNET_LAUNCHER[p_Player.name] == nil then Headshot_9M133_KORNET_LAUNCHER[p_Player.name] = 0 ; end  -- Victim
	Headshot_9M133_KORNET_LAUNCHER[p_Player.name] = Headshot_9M133_KORNET_LAUNCHER[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_9M133_KORNET_LAUNCHER[p_Player.name]
	Dead_data = Death_9M133_KORNET_LAUNCHER[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_9M133_KORNET_LAUNCHER[s_Inflictor.name]
	end
--
	if args[7] == "AAV-7A1 AMTRAC" then
	if kill_AAV_7A1_AMTRAC[s_Inflictor.name] == nil then kill_AAV_7A1_AMTRAC[s_Inflictor.name] = 0 ; end
	kill_AAV_7A1_AMTRAC[s_Inflictor.name] = kill_AAV_7A1_AMTRAC[s_Inflictor.name] + 1

	if Death_AAV_7A1_AMTRAC[p_Player.name] == nil then Death_AAV_7A1_AMTRAC[p_Player.name] = 0 ; end  -- Victim
	Death_AAV_7A1_AMTRAC[p_Player.name] = Death_AAV_7A1_AMTRAC[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AAV_7A1_AMTRAC[p_Player.name] == nil then Headshot_AAV_7A1_AMTRAC[p_Player.name] = 0 ; end  -- Victim
	Headshot_AAV_7A1_AMTRAC[p_Player.name] = Headshot_AAV_7A1_AMTRAC[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AAV_7A1_AMTRAC[p_Player.name]
	Dead_data = Death_AAV_7A1_AMTRAC[p_Player.name] 
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_AAV_7A1_AMTRAC[s_Inflictor.name]
	end
--
	if args[7] == "BARSUK" then
	if kill_BARSUK[s_Inflictor.name] == nil then kill_BARSUK[s_Inflictor.name] = 0 ; end
	kill_BARSUK[s_Inflictor.name] = kill_BARSUK[s_Inflictor.name] + 1

	if Death_BARSUK[p_Player.name] == nil then Death_BARSUK[p_Player.name] = 0 ; end  -- Victim
	Death_BARSUK[p_Player.name] = Death_BARSUK[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_BARSUK[p_Player.name] == nil then Headshot_BARSUK[p_Player.name] = 0 ; end  -- Victim
	Headshot_BARSUK[p_Player.name] = Headshot_BARSUK[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_BARSUK[p_Player.name]
	Dead_data = Death_BARSUK[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_BARSUK[s_Inflictor.name]
	end
--
	if args[7] == "BM-23" then
	if kill_BM_23[s_Inflictor.name] == nil then kill_BM_23[s_Inflictor.name] = 0 ; end
	kill_BM_23[s_Inflictor.name] = kill_BM_23[s_Inflictor.name] + 1

	if Death_BM_23[p_Player.name] == nil then Death_BM_23[p_Player.name] = 0 ; end  -- Victim
	Death_BM_23[p_Player.name] = Death_BM_23[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_BM_23[p_Player.name] == nil then Headshot_BM_23[p_Player.name] = 0 ; end  -- Victim
	Headshot_BM_23[p_Player.name] = Headshot_BM_23[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_BM_23[p_Player.name]
	Dead_data = Death_BM_23[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_BM_23[s_Inflictor.name]
	end
--
	if args[7] == "BMP-2M" then
	if kill_BMP_2M[s_Inflictor.name] == nil then kill_BMP_2M[s_Inflictor.name] = 0 ; end
	kill_BMP_2M[s_Inflictor.name] = kill_BMP_2M[s_Inflictor.name] + 1

	if Death_BMP_2M[p_Player.name] == nil then Death_BMP_2M[p_Player.name] = 0 ; end  -- Victim
	Death_BMP_2M[p_Player.name] = Death_BMP_2M[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_BMP_2M[p_Player.name] == nil then Headshot_BMP_2M[p_Player.name] = 0 ; end  -- Victim
	Headshot_BMP_2M[p_Player.name] = Headshot_BMP_2M[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_BMP_2M[p_Player.name]
	Dead_data = Death_BMP_2M[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_BMP_2M[s_Inflictor.name]
	end
--
	if args[7] == "BTR-90" then
	if kill_BTR_90[s_Inflictor.name] == nil then kill_BTR_90[s_Inflictor.name] = 0 ; end
	kill_BTR_90[s_Inflictor.name] = kill_BTR_90[s_Inflictor.name] + 1

	if Death_BTR_90[p_Player.name] == nil then Death_BTR_90[p_Player.name] = 0 ; end  -- Victim
	Death_BTR_90[p_Player.name] = Death_BTR_90[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_BTR_90[p_Player.name] == nil then Headshot_BTR_90[p_Player.name] = 0 ; end  -- Victim
	Headshot_BTR_90[p_Player.name] = Headshot_BTR_90[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_BTR_90[p_Player.name]
	Dead_data = Death_BTR_90[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_BTR_90[s_Inflictor.name]
	end
--
	if args[7] == "CENTURION C-RAM" then
	if kill_CENTURION_C_RAM[s_Inflictor.name] == nil then kill_CENTURION_C_RAM[s_Inflictor.name] = 0 ; end
	kill_CENTURION_C_RAM[s_Inflictor.name] = kill_CENTURION_C_RAM[s_Inflictor.name] + 1

	if Death_CENTURION_C_RAM[p_Player.name] == nil then Death_CENTURION_C_RAM[p_Player.name] = 0 ; end  -- Victim
	Death_CENTURION_C_RAM[p_Player.name] = Death_CENTURION_C_RAM[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_CENTURION_C_RAM[p_Player.name] == nil then Headshot_CENTURION_C_RAM[p_Player.name] = 0 ; end  -- Victim
	Headshot_CENTURION_C_RAM[p_Player.name] = Headshot_CENTURION_C_RAM[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_CENTURION_C_RAM[p_Player.name]
	Dead_data = Death_CENTURION_C_RAM[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_CENTURION_C_RAM[s_Inflictor.name]
	end
--
	if args[7] == "CIVILIAN CAR" then
	if kill_CIVILIAN_CAR[s_Inflictor.name] == nil then kill_CIVILIAN_CAR[s_Inflictor.name] = 0 ; end
	kill_CIVILIAN_CAR[s_Inflictor.name] = kill_CIVILIAN_CAR[s_Inflictor.name] + 1

	if Death_CIVILIAN_CAR[p_Player.name] == nil then Death_CIVILIAN_CAR[p_Player.name] = 0 ; end  -- Victim
	Death_CIVILIAN_CAR[p_Player.name] = Death_CIVILIAN_CAR[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_CIVILIAN_CAR[p_Player.name] == nil then Headshot_CIVILIAN_CAR[p_Player.name] = 0 ; end  -- Victim
	Headshot_CIVILIAN_CAR[p_Player.name] = Headshot_CIVILIAN_CAR[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_CIVILIAN_CAR[p_Player.name]
	Dead_data = Death_CIVILIAN_CAR[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_CIVILIAN_CAR[s_Inflictor.name]
	end
--
	if args[7] == "DELIVERY VAN" then
	if kill_DELIVERY_VAN[s_Inflictor.name] == nil then kill_DELIVERY_VAN[s_Inflictor.name] = 0 ; end
	kill_DELIVERY_VAN[s_Inflictor.name] = kill_DELIVERY_VAN[s_Inflictor.name] + 1

	if Death_DELIVERY_VAN[p_Player.name] == nil then Death_DELIVERY_VAN[p_Player.name] = 0 ; end  -- Victim
	Death_DELIVERY_VAN[p_Player.name] = Death_DELIVERY_VAN[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_DELIVERY_VAN[p_Player.name] == nil then Headshot_DELIVERY_VAN[p_Player.name] = 0 ; end  -- Victim
	Headshot_DELIVERY_VAN[p_Player.name] = Headshot_DELIVERY_VAN[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_DELIVERY_VAN[p_Player.name]
	Dead_data = Death_DELIVERY_VAN[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_DELIVERY_VAN[s_Inflictor.name]
	end
--
	if args[7] == "DIRTBIKE" then
	if kill_DIRTBIKE[s_Inflictor.name] == nil then kill_DIRTBIKE[s_Inflictor.name] = 0 ; end
	kill_DIRTBIKE[s_Inflictor.name] = kill_DIRTBIKE[s_Inflictor.name] + 1

	if Death_DIRTBIKE[p_Player.name] == nil then Death_DIRTBIKE[p_Player.name] = 0 ; end  -- Victim
	Death_DIRTBIKE[p_Player.name] = Death_DIRTBIKE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_DIRTBIKE[p_Player.name] == nil then Headshot_DIRTBIKE[p_Player.name] = 0 ; end  -- Victim
	Headshot_DIRTBIKE[p_Player.name] = Headshot_DIRTBIKE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_DIRTBIKE[p_Player.name]
	Dead_data = Death_DIRTBIKE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_DIRTBIKE[s_Inflictor.name]
	end
--
	if args[7] == "DPV" then
	if kill_DPV[s_Inflictor.name] == nil then kill_DPV[s_Inflictor.name] = 0 ; end
	kill_DPV[s_Inflictor.name] = kill_DPV[s_Inflictor.name] + 1

	if Death_DPV[p_Player.name] == nil then Death_DPV[p_Player.name] = 0 ; end  -- Victim
	Death_DPV[p_Player.name] = Death_DPV[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_DPV[p_Player.name] == nil then Headshot_DPV[p_Player.name] = 0 ; end  -- Victim
	Headshot_DPV[p_Player.name] = Headshot_DPV[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_DPV[p_Player.name]
	Dead_data = Death_DPV[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_DPV[s_Inflictor.name]
	end
--
	if args[7] == "GAZ-3937 VODNIK" then
	if kill_GAZ_3937_VODNIK[s_Inflictor.name] == nil then kill_GAZ_3937_VODNIK[s_Inflictor.name] = 0 ; end
	kill_GAZ_3937_VODNIK[s_Inflictor.name] = kill_GAZ_3937_VODNIK[s_Inflictor.name] + 1

	if Death_GAZ_3937_VODNIK[p_Player.name] == nil then Death_GAZ_3937_VODNIK[p_Player.name] = 0 ; end  -- Victim
	Death_GAZ_3937_VODNIK[p_Player.name] = Death_GAZ_3937_VODNIK[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GAZ_3937_VODNIK[p_Player.name] == nil then Headshot_GAZ_3937_VODNIK[p_Player.name] = 0 ; end  -- Victim
	Headshot_GAZ_3937_VODNIK[p_Player.name] = Headshot_GAZ_3937_VODNIK[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GAZ_3937_VODNIK[p_Player.name]
	Dead_data = Death_GAZ_3937_VODNIK[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_GAZ_3937_VODNIK[s_Inflictor.name]
	end
--
	if args[7] == "GROWLER ITV" then
	if kill_GROWLER_ITV[s_Inflictor.name] == nil then kill_GROWLER_ITV[s_Inflictor.name] = 0 ; end
	kill_GROWLER_ITV[s_Inflictor.name] = kill_GROWLER_ITV[s_Inflictor.name] + 1

	if Death_GROWLER_ITV[p_Player.name] == nil then Death_GROWLER_ITV[p_Player.name] = 0 ; end  -- Victim
	Death_GROWLER_ITV[p_Player.name] = Death_GROWLER_ITV[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GROWLER_ITV[p_Player.name] == nil then Headshot_GROWLER_ITV[p_Player.name] = 0 ; end  -- Victim
	Headshot_GROWLER_ITV[p_Player.name] = Headshot_GROWLER_ITV[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GROWLER_ITV[p_Player.name]
	Dead_data = Death_GROWLER_ITV[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_GROWLER_ITV[s_Inflictor.name]
	end
--
	if args[7] == "HMMWV ASRAD" then
	if kill_HMMWV_ASRAD[s_Inflictor.name] == nil then kill_HMMWV_ASRAD[s_Inflictor.name] = 0 ; end
	kill_HMMWV_ASRAD[s_Inflictor.name] = kill_HMMWV_ASRAD[s_Inflictor.name] + 1

	if Death_HMMWV_ASRAD[p_Player.name] == nil then Death_HMMWV_ASRAD[p_Player.name] = 0 ; end  -- Victim
	Death_HMMWV_ASRAD[p_Player.name] = Death_HMMWV_ASRAD[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_HMMWV_ASRAD[p_Player.name] == nil then Headshot_HMMWV_ASRAD[p_Player.name] = 0 ; end  -- Victim
	Headshot_HMMWV_ASRAD[p_Player.name] = Headshot_HMMWV_ASRAD[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_HMMWV_ASRAD[p_Player.name]
	Dead_data = Death_HMMWV_ASRAD[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_HMMWV_ASRAD[s_Inflictor.name]
	end
--
	if args[7] == "LAV-25" then
	if kill_LAV_25[s_Inflictor.name] == nil then kill_LAV_25[s_Inflictor.name] = 0 ; end
	kill_LAV_25[s_Inflictor.name] = kill_LAV_25[s_Inflictor.name] + 1

	if Death_LAV_25[p_Player.name] == nil then Death_LAV_25[p_Player.name] = 0 ; end  -- Victim
	Death_LAV_25[p_Player.name] = Death_LAV_25[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_LAV_25[p_Player.name] == nil then Headshot_LAV_25[p_Player.name] = 0 ; end  -- Victim
	Headshot_LAV_25[p_Player.name] = Headshot_LAV_25[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_LAV_25[p_Player.name]
	Dead_data = Death_LAV_25[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_LAV_25[s_Inflictor.name]
	end
--
	if args[7] == "LAV-AD" then
	if kill_LAV_AD[s_Inflictor.name] == nil then kill_LAV_AD[s_Inflictor.name] = 0 ; end
	kill_LAV_AD[s_Inflictor.name] = kill_LAV_AD[s_Inflictor.name] + 1

	if Death_LAV_AD[p_Player.name] == nil then Death_LAV_AD[p_Player.name] = 0 ; end  -- Victim
	Death_LAV_AD[p_Player.name] = Death_LAV_AD[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_LAV_AD[p_Player.name] == nil then Headshot_LAV_AD[p_Player.name] = 0 ; end  -- Victim
	Headshot_LAV_AD[p_Player.name] = Headshot_LAV_AD[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_LAV_AD[p_Player.name]
	Dead_data = Death_LAV_AD[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_LAV_AD[s_Inflictor.name]
	end
--
	if args[7] == "M1 ABRAMS" then
	if kill_M1_ABRAMS[s_Inflictor.name] == nil then kill_M1_ABRAMS[s_Inflictor.name] = 0 ; end
	kill_M1_ABRAMS[s_Inflictor.name] = kill_M1_ABRAMS[s_Inflictor.name] + 1

	if Death_M1_ABRAMS[p_Player.name] == nil then Death_M1_ABRAMS[p_Player.name] = 0 ; end  -- Victim
	Death_M1_ABRAMS[p_Player.name] = Death_M1_ABRAMS[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M1_ABRAMS[p_Player.name] == nil then Headshot_M1_ABRAMS[p_Player.name] = 0 ; end  -- Victim
	Headshot_M1_ABRAMS[p_Player.name] = Headshot_M1_ABRAMS[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M1_ABRAMS[p_Player.name]
	Dead_data = Death_M1_ABRAMS[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_M1_ABRAMS[s_Inflictor.name]
	end
--
	if args[7] == "M1114 HMMWV" then
	if kill_M1114_HMMWV[s_Inflictor.name] == nil then kill_M1114_HMMWV[s_Inflictor.name] = 0 ; end
	kill_M1114_HMMWV[s_Inflictor.name] = kill_M1114_HMMWV[s_Inflictor.name] + 1

	if Death_M1114_HMMWV[p_Player.name] == nil then Death_M1114_HMMWV[p_Player.name] = 0 ; end  -- Victim
	Death_M1114_HMMWV[p_Player.name] = Death_M1114_HMMWV[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M1114_HMMWV[p_Player.name] == nil then Headshot_M1114_HMMWV[p_Player.name] = 0 ; end  -- Victim
	Headshot_M1114_HMMWV[p_Player.name] = Headshot_M1114_HMMWV[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M1114_HMMWV[p_Player.name]
	Dead_data = Death_M1114_HMMWV[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_M1114_HMMWV[s_Inflictor.name]
	end
--
	if args[7] == "M1128" then
	if kill_M1128[s_Inflictor.name] == nil then kill_M1128[s_Inflictor.name] = 0 ; end
	kill_M1128[s_Inflictor.name] = kill_M1128[s_Inflictor.name] + 1

	if Death_M1128[p_Player.name] == nil then Death_M1128[p_Player.name] = 0 ; end  -- Victim
	Death_M1128[p_Player.name] = Death_M1128[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M1128[p_Player.name] == nil then Headshot_M1128[p_Player.name] = 0 ; end  -- Victim
	Headshot_M1128[p_Player.name] = Headshot_M1128[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M1128[p_Player.name]
	Dead_data = Death_M1128[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_M1128[s_Inflictor.name]
	end
--
	if args[7] == "M142" then
	if kill_M142[s_Inflictor.name] == nil then kill_M142[s_Inflictor.name] = 0 ; end
	kill_M142[s_Inflictor.name] = kill_M142[s_Inflictor.name] + 1

	if Death_M142[p_Player.name] == nil then Death_M142[p_Player.name] = 0 ; end  -- Victim
	Death_M142[p_Player.name] = Death_M142[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M142[p_Player.name] == nil then Headshot_M142[p_Player.name] = 0 ; end  -- Victim
	Headshot_M142[p_Player.name] = Headshot_M142[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M142[p_Player.name]
	Dead_data = Death_M142[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_M142[s_Inflictor.name]
	end
--
	if args[7] == "M220 TOW LAUNCHER" then
	if kill_M220_TOW_LAUNCHER[s_Inflictor.name] == nil then kill_M220_TOW_LAUNCHER[s_Inflictor.name] = 0 ; end
	kill_M220_TOW_LAUNCHER[s_Inflictor.name] = kill_M220_TOW_LAUNCHER[s_Inflictor.name] + 1

	if Death_M220_TOW_LAUNCHER[p_Player.name] == nil then Death_M220_TOW_LAUNCHER[p_Player.name] = 0 ; end  -- Victim
	Death_M220_TOW_LAUNCHER[p_Player.name] = Death_M220_TOW_LAUNCHER[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M220_TOW_LAUNCHER[p_Player.name] == nil then Headshot_M220_TOW_LAUNCHER[p_Player.name] = 0 ; end  -- Victim
	Headshot_M220_TOW_LAUNCHER[p_Player.name] = Headshot_M220_TOW_LAUNCHER[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M220_TOW_LAUNCHER[p_Player.name]
	Dead_data = Death_M220_TOW_LAUNCHER[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_M220_TOW_LAUNCHER[s_Inflictor.name]
	end
--
	if args[7] == "PANTSIR-S1" then
	if kill_PANTSIR_S1[s_Inflictor.name] == nil then kill_PANTSIR_S1[s_Inflictor.name] = 0 ; end
	kill_PANTSIR_S1[s_Inflictor.name] = kill_PANTSIR_S1[s_Inflictor.name] + 1

	if Death_PANTSIR_S1[p_Player.name] == nil then Death_PANTSIR_S1[p_Player.name] = 0 ; end  -- Victim
	Death_PANTSIR_S1[p_Player.name] = Death_PANTSIR_S1[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_PANTSIR_S1[p_Player.name] == nil then Headshot_PANTSIR_S1[p_Player.name] = 0 ; end  -- Victim
	Headshot_PANTSIR_S1[p_Player.name] = Headshot_PANTSIR_S1[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_PANTSIR_S1[p_Player.name]
	Dead_data = Death_PANTSIR_S1[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_PANTSIR_S1[s_Inflictor.name]
	end
--
	if args[7] == "PHOENIX" then
	if kill_PHOENIX[s_Inflictor.name] == nil then kill_PHOENIX[s_Inflictor.name] = 0 ; end
	kill_PHOENIX[s_Inflictor.name] = kill_PHOENIX[s_Inflictor.name] + 1

	if Death_PHOENIX[p_Player.name] == nil then Death_PHOENIX[p_Player.name] = 0 ; end  -- Victim
	Death_PHOENIX[p_Player.name] = Death_PHOENIX[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_PHOENIX[p_Player.name] == nil then Headshot_PHOENIX[p_Player.name] = 0 ; end  -- Victim
	Headshot_PHOENIX[p_Player.name] = Headshot_PHOENIX[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_PHOENIX[p_Player.name]
	Dead_data = Death_PHOENIX[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_PHOENIX[s_Inflictor.name]
	end
--
	if args[7] == "POLICE VAN" then
	if kill_POLICE_VAN[s_Inflictor.name] == nil then kill_POLICE_VAN[s_Inflictor.name] = 0 ; end
	kill_POLICE_VAN[s_Inflictor.name] = kill_POLICE_VAN[s_Inflictor.name] + 1

	if Death_POLICE_VAN[p_Player.name] == nil then Death_POLICE_VAN[p_Player.name] = 0 ; end  -- Victim
	Death_POLICE_VAN[p_Player.name] = Death_POLICE_VAN[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_POLICE_VAN[p_Player.name] == nil then Headshot_POLICE_VAN[p_Player.name] = 0 ; end  -- Victim
	Headshot_POLICE_VAN[p_Player.name] = Headshot_POLICE_VAN[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_POLICE_VAN[p_Player.name]
	Dead_data = Death_POLICE_VAN[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_POLICE_VAN[s_Inflictor.name]
	end
--
	if args[7] == "QUAD BIKE" then
	if kill_QUAD_BIKE[s_Inflictor.name] == nil then kill_QUAD_BIKE[s_Inflictor.name] = 0 ; end
	kill_QUAD_BIKE[s_Inflictor.name] = kill_QUAD_BIKE[s_Inflictor.name] + 1

	if Death_QUAD_BIKE[p_Player.name] == nil then Death_QUAD_BIKE[p_Player.name] = 0 ; end  -- Victim
	Death_QUAD_BIKE[p_Player.name] = Death_QUAD_BIKE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_QUAD_BIKE[p_Player.name] == nil then Headshot_QUAD_BIKE[p_Player.name] = 0 ; end  -- Victim
	Headshot_QUAD_BIKE[p_Player.name] = Headshot_QUAD_BIKE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_QUAD_BIKE[p_Player.name]
	Dead_data = Death_QUAD_BIKE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_QUAD_BIKE[s_Inflictor.name]
	end
--
	if args[7] == "RHIB BOAT" then
	if kill_RHIB_BOAT[s_Inflictor.name] == nil then kill_RHIB_BOAT[s_Inflictor.name] = 0 ; end
	kill_RHIB_BOAT[s_Inflictor.name] = kill_RHIB_BOAT[s_Inflictor.name] + 1

	if Death_RHIB_BOAT[p_Player.name] == nil then Death_RHIB_BOAT[p_Player.name] = 0 ; end  -- Victim
	Death_RHIB_BOAT[p_Player.name] = Death_RHIB_BOAT[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_RHIB_BOAT[p_Player.name] == nil then Headshot_RHIB_BOAT[p_Player.name] = 0 ; end  -- Victim
	Headshot_RHIB_BOAT[p_Player.name] = Headshot_RHIB_BOAT[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_RHIB_BOAT[p_Player.name]
	Dead_data = Death_RHIB_BOAT[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_RHIB_BOAT[s_Inflictor.name]
	end
--
	if args[7] == "RHINO" then
	if kill_RHINO[s_Inflictor.name] == nil then kill_RHINO[s_Inflictor.name] = 0 ; end
	kill_RHINO[s_Inflictor.name] = kill_RHINO[s_Inflictor.name] + 1

	if Death_RHINO[p_Player.name] == nil then Death_RHINO[p_Player.name] = 0 ; end  -- Victim
	Death_RHINO[p_Player.name] = Death_RHINO[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_RHINO[p_Player.name] == nil then Headshot_RHINO[p_Player.name] = 0 ; end  -- Victim
	Headshot_RHINO[p_Player.name] = Headshot_RHINO[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_RHINO[p_Player.name]
	Dead_data = Death_RHINO[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_RHINO[s_Inflictor.name]
	end
--
	if args[7] == "SKID LOADER" then
	if kill_SKID_LOADER[s_Inflictor.name] == nil then kill_SKID_LOADER[s_Inflictor.name] = 0 ; end
	kill_SKID_LOADER[s_Inflictor.name] = kill_SKID_LOADER[s_Inflictor.name] + 1

	if Death_SKID_LOADER[p_Player.name] == nil then Death_SKID_LOADER[p_Player.name] = 0 ; end  -- Victim
	Death_SKID_LOADER[p_Player.name] = Death_SKID_LOADER[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SKID_LOADER[p_Player.name] == nil then Headshot_SKID_LOADER[p_Player.name] = 0 ; end  -- Victim
	Headshot_SKID_LOADER[p_Player.name] = Headshot_SKID_LOADER[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SKID_LOADER[p_Player.name]
	Dead_data = Death_SKID_LOADER[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_SKID_LOADER[s_Inflictor.name]
	end
--
	if args[7] == "SPRUT-SD" then
	if kill_SPRUT_SD[s_Inflictor.name] == nil then kill_SPRUT_SD[s_Inflictor.name] = 0 ; end
	kill_SPRUT_SD[s_Inflictor.name] = kill_SPRUT_SD[s_Inflictor.name] + 1

	if Death_SPRUT_SD[p_Player.name] == nil then Death_SPRUT_SD[p_Player.name] = 0 ; end  -- Victim
	Death_SPRUT_SD[p_Player.name] = Death_SPRUT_SD[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SPRUT_SD[p_Player.name] == nil then Headshot_SPRUT_SD[p_Player.name] = 0 ; end  -- Victim
	Headshot_SPRUT_SD[p_Player.name] = Headshot_SPRUT_SD[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SPRUT_SD[p_Player.name]
	Dead_data = Death_SPRUT_SD[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_SPRUT_SD[s_Inflictor.name]
	end
--
	if args[7] == "SUV" then
	if kill_SUV[s_Inflictor.name] == nil then kill_SUV[s_Inflictor.name] = 0 ; end
	kill_SUV[s_Inflictor.name] = kill_SUV[s_Inflictor.name] + 1

	if Death_SUV[p_Player.name] == nil then Death_SUV[p_Player.name] = 0 ; end  -- Victim
	Death_SUV[p_Player.name] = Death_SUV[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SUV[p_Player.name] == nil then Headshot_SUV[p_Player.name] = 0 ; end  -- Victim
	Headshot_SUV[p_Player.name] = Headshot_SUV[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SUV[p_Player.name]
	Dead_data = Death_SUV[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_SUV[s_Inflictor.name]
	end
--
	if args[7] == "T-90A" then
	if kill_T_90A[s_Inflictor.name] == nil then kill_T_90A[s_Inflictor.name] = 0 ; end
	kill_T_90A[s_Inflictor.name] = kill_T_90A[s_Inflictor.name] + 1

	if Death_T_90A[p_Player.name] == nil then Death_T_90A[p_Player.name] = 0 ; end  -- Victim
	Death_T_90A[p_Player.name] = Death_T_90A[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_T_90A[p_Player.name] == nil then Headshot_T_90A[p_Player.name] = 0 ; end  -- Victim
	Headshot_T_90A[p_Player.name] = Headshot_T_90A[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_T_90A[p_Player.name]
	Dead_data = Death_T_90A[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_T_90A[s_Inflictor.name]
	end
--
	if args[7] == "TECHNICAL TRUCK" then
	if kill_TECHNICAL_TRUCK[s_Inflictor.name] == nil then kill_TECHNICAL_TRUCK[s_Inflictor.name] = 0 ; end
	kill_TECHNICAL_TRUCK[s_Inflictor.name] = kill_TECHNICAL_TRUCK[s_Inflictor.name] + 1

	if Death_TECHNICAL_TRUCK[p_Player.name] == nil then Death_TECHNICAL_TRUCK[p_Player.name] = 0 ; end  -- Victim
	Death_TECHNICAL_TRUCK[p_Player.name] = Death_TECHNICAL_TRUCK[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_TECHNICAL_TRUCK[p_Player.name] == nil then Headshot_TECHNICAL_TRUCK[p_Player.name] = 0 ; end  -- Victim
	Headshot_TECHNICAL_TRUCK[p_Player.name] = Headshot_TECHNICAL_TRUCK[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_TECHNICAL_TRUCK[p_Player.name]
	Dead_data = Death_TECHNICAL_TRUCK[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_TECHNICAL_TRUCK[s_Inflictor.name]
	end
--
	if args[7] == "VDV Buggy" then
	if kill_VDV_Buggy[s_Inflictor.name] == nil then kill_VDV_Buggy[s_Inflictor.name] = 0 ; end
	kill_VDV_Buggy[s_Inflictor.name] = kill_VDV_Buggy[s_Inflictor.name] + 1

	if Death_VDV_Buggy[p_Player.name] == nil then Death_VDV_Buggy[p_Player.name] = 0 ; end  -- Victim
	Death_VDV_Buggy[p_Player.name] = Death_VDV_Buggy[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_VDV_Buggy[p_Player.name] == nil then Headshot_VDV_Buggy[p_Player.name] = 0 ; end  -- Victim
	Headshot_VDV_Buggy[p_Player.name] = Headshot_VDV_Buggy[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_VDV_Buggy[p_Player.name]
	Dead_data = Death_VDV_Buggy[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_VDV_Buggy[s_Inflictor.name]
	end
--
	if args[7] == "VODNIK AA" then
	if kill_VODNIK_AA[s_Inflictor.name] == nil then kill_VODNIK_AA[s_Inflictor.name] = 0 ; end
	kill_VODNIK_AA[s_Inflictor.name] = kill_VODNIK_AA[s_Inflictor.name] + 1

	if Death_VODNIK_AA[p_Player.name] == nil then Death_VODNIK_AA[p_Player.name] = 0 ; end  -- Victim
	Death_VODNIK_AA[p_Player.name] = Death_VODNIK_AA[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_VODNIK_AA[p_Player.name] == nil then Headshot_VODNIK_AA[p_Player.name] = 0 ; end  -- Victim
	Headshot_VODNIK_AA[p_Player.name] = Headshot_VODNIK_AA[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_VODNIK_AA[p_Player.name]
	Dead_data = Death_VODNIK_AA[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_landvehicles_msg then
	data_landvehicles_msg(player, data_playername)
	end

	data_weaponkills = kill_VODNIK_AA[s_Inflictor.name]
	end
--

	if args[7] == "9K22 TUNGUSKA-M"	or args[7] == "9M133 KORNET LAUNCHER" or args[7] == "AAV-7A1 AMTRAC"
	or args[7] == "BARSUK" or args[7] == "BM-23" or args[7] == "BMP-2M" or args[7] == "BTR-90"
	or args[7] == "CENTURION C-RAM" or args[7] == "CIVILIAN CAR" or args[7] == "DELIVERY VAN"
	or args[7] == "DIRTBIKE" or args[7] == "DPV" or args[7] == "GAZ-3937 VODNIK" or args[7] == "GROWLER ITV"
	or args[7] == "HMMWV ASRAD" or args[7] == "LAV-25" or args[7] == "LAV-AD" or args[7] == "M1 ABRAMS"
	or args[7] == "M1114 HMMWV" or args[7] == "M1128" or args[7] == "M142" or args[7] == "M220 TOW LAUNCHER"
	or args[7] == "PANTSIR-S1" or args[7] == "PHOENIX" or args[7] == "POLICE VAN"
	or args[7] == "QUAD BIKE" or args[7] == "RHIB BOAT" or args[7] == "RHINO" or args[7] == "SKID LOADER"
	or args[7] == "SPRUT-SD" or args[7] == "SUV" or args[7] == "T-90A" or args[7] == "TECHNICAL TRUCK"
	or args[7] == "VDV Buggy" or args[7] == "VODNIK AA" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_land_vehicles"
	data_catagory = "Land vehicles data:"
	data_playername = killer_name
	data_landvehicles(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_landvehicles(data_playername)
	end

end)

-- ------------------------------------------------------

function data_landvehicles_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_landvehicles(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_landvehicles1 then
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

	if Config.consolespam_landvehicles2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_landvehicles3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_landvehicles4 then
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

return landvehicledata()

