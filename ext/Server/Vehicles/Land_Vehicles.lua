-- Spaghetti code by iamadeadpixel

---@class LandVehicles
LandVehicles = class 'LandVehicles'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** LandVehicles weapons Kill mod loaded ***"); 

end
end)

Events:Subscribe('Player:Killed',function(p_Player, p_Inflictor, p_Position, p_Weapon, p_IsRoadKill, p_IsHeadShot, p_WasVictimInReviveState, p_Info)

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


-- s_Inflictor.name = killer
-- p_Player.name = victim

-- Print lines will be removed on the end
		if playerishuman[s_Inflictor.name] or playerisbot[s_Inflictor.name] then

	if args[7] == "9K22 TUNGUSKA-M" then
		if kill_9K22_TUNGUSKA_M[s_Inflictor.name] == nil then kill_9K22_TUNGUSKA_M[s_Inflictor.name] = 0; end
		if death_9K22_TUNGUSKA_M[p_Player.name] == nil then death_9K22_TUNGUSKA_M[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_9K22_TUNGUSKA_M[s_Inflictor.name] = kill_9K22_TUNGUSKA_M[s_Inflictor.name] + 1
	death_9K22_TUNGUSKA_M[p_Player.name] = death_9K22_TUNGUSKA_M[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("9K22_TUNGUSKA_M Kill stats for "..args[4]..":"..kill_9K22_TUNGUSKA_M[s_Inflictor.name].." times")
			print ("9K22_TUNGUSKA_M Dead stats for "..args[1]..":"..death_9K22_TUNGUSKA_M[p_Player.name].." times")
		end
        end
--
	if args[7] == "9M133 KORNET LAUNCHER" then
		if kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] == nil then kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = 0; end
		if death_9M133_KORNET_LAUNCHER[p_Player.name] == nil then death_9M133_KORNET_LAUNCHER[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] + 1
	death_9M133_KORNET_LAUNCHER[p_Player.name] = death_9M133_KORNET_LAUNCHER[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("9M133_KORNET_LAUNCHER Kill stats for "..args[4]..":"..kill_9M133_KORNET_LAUNCHER[s_Inflictor.name].." times")
			print ("9M133_KORNET_LAUNCHER Dead stats for "..args[1]..":"..death_9M133_KORNET_LAUNCHER[p_Player.name].." times")
		end
        end
--
	if args[7] == "AAV-7A1 AMTRAC" then
		if kill_AAV_7A1_AMTRAC[s_Inflictor.name] == nil then kill_AAV_7A1_AMTRAC[s_Inflictor.name] = 0; end
		if death_AAV_7A1_AMTRAC[p_Player.name] == nil then death_AAV_7A1_AMTRAC[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_AAV_7A1_AMTRAC[s_Inflictor.name] = kill_AAV_7A1_AMTRAC[s_Inflictor.name] + 1
	death_AAV_7A1_AMTRAC[p_Player.name] = death_AAV_7A1_AMTRAC[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("AAV_7A1_AMTRAC Kill stats for "..args[4]..":"..kill_AAV_7A1_AMTRAC[s_Inflictor.name].." times")
			print ("AAV_7A1_AMTRAC Dead stats for "..args[1]..":"..death_AAV_7A1_AMTRAC[p_Player.name].." times")
		end
        end
--
	if args[7] == "BARSUK" then
		if kill_BARSUK[s_Inflictor.name] == nil then kill_BARSUK[s_Inflictor.name] = 0; end
		if death_BARSUK[p_Player.name] == nil then death_BARSUK[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_BARSUK[s_Inflictor.name] = kill_BARSUK[s_Inflictor.name] + 1
	death_BARSUK[p_Player.name] = death_BARSUK[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("BARSUK Kill stats for "..args[4]..":"..kill_BARSUK[s_Inflictor.name].." times")
			print ("BARSUK Dead stats for "..args[1]..":"..death_BARSUK[p_Player.name].." times")
		end
        end
--
	if args[7] == "BM-23" then
		if kill_BM_23[s_Inflictor.name] == nil then kill_BM_23[s_Inflictor.name] = 0; end
		if death_BM_23[p_Player.name] == nil then death_BM_23[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_BM_23[s_Inflictor.name] = kill_BM_23[s_Inflictor.name] + 1
	death_BM_23[p_Player.name] = death_BM_23[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("BM_23 Kill stats for "..args[4]..":"..kill_BM_23[s_Inflictor.name].." times")
			print ("BM_23 Dead stats for "..args[1]..":"..death_BM_23[p_Player.name].." times")
		end
        end
--
	if args[7] == "BMP-2M" then
		if kill_BMP_2M[s_Inflictor.name] == nil then kill_BMP_2M[s_Inflictor.name] = 0; end
		if death_BMP_2M[p_Player.name] == nil then death_BMP_2M[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_BMP_2M[s_Inflictor.name] = kill_BMP_2M[s_Inflictor.name] + 1
	death_BMP_2M[p_Player.name] = death_BMP_2M[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("BMP_2M Kill stats for "..args[4]..":"..kill_BMP_2M[s_Inflictor.name].." times")
			print ("BMP_2M Dead stats for "..args[1]..":"..death_BMP_2M[p_Player.name].." times")
		end
        end
--
	if args[7] == "BTR-90" then
		if kill_BTR_90[s_Inflictor.name] == nil then kill_BTR_90[s_Inflictor.name] = 0; end
		if death_BTR_90[p_Player.name] == nil then death_BTR_90[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_BTR_90[s_Inflictor.name] = kill_BTR_90[s_Inflictor.name] + 1
	death_BTR_90[p_Player.name] = death_BTR_90[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("BTR_90 Kill stats for "..args[4]..":"..kill_BTR_90[s_Inflictor.name].." times")
			print ("BTR_90 Dead stats for "..args[1]..":"..death_BTR_90[p_Player.name].." times")
		end
        end
--
	if args[7] == "CENTURION C-RAM" then
		if kill_CENTURION_C_RAM[s_Inflictor.name] == nil then kill_CENTURION_C_RAM[s_Inflictor.name] = 0; end
		if death_CENTURION_C_RAM[p_Player.name] == nil then death_CENTURION_C_RAM[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_CENTURION_C_RAM[s_Inflictor.name] = kill_CENTURION_C_RAM[s_Inflictor.name] + 1
	death_CENTURION_C_RAM[p_Player.name] = death_CENTURION_C_RAM[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("CENTURION_C_RAM Kill stats for "..args[4]..":"..kill_CENTURION_C_RAM[s_Inflictor.name].." times")
			print ("CENTURION_C_RAM Dead stats for "..args[1]..":"..death_CENTURION_C_RAM[p_Player.name].." times")
		end
        end
--
	if args[7] == "CIVILIAN CAR" then
		if kill_CIVILIAN_CAR[s_Inflictor.name] == nil then kill_CIVILIAN_CAR[s_Inflictor.name] = 0; end
		if death_CIVILIAN_CAR[p_Player.name] == nil then death_CIVILIAN_CAR[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_CIVILIAN_CAR[s_Inflictor.name] = kill_CIVILIAN_CAR[s_Inflictor.name] + 1
	death_CIVILIAN_CAR[p_Player.name] = death_CIVILIAN_CAR[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("CIVILIAN_CAR Kill stats for "..args[4]..":"..kill_CIVILIAN_CAR[s_Inflictor.name].." times")
			print ("CIVILIAN_CAR Dead stats for "..args[1]..":"..death_CIVILIAN_CAR[p_Player.name].." times")
		end
        end
--
	if args[7] == "DELIVERY VAN" then
		if kill_DELIVERY_VAN[s_Inflictor.name] == nil then kill_DELIVERY_VAN[s_Inflictor.name] = 0; end
		if death_DELIVERY_VAN[p_Player.name] == nil then death_DELIVERY_VAN[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_DELIVERY_VAN[s_Inflictor.name] = kill_DELIVERY_VAN[s_Inflictor.name] + 1
	death_DELIVERY_VAN[p_Player.name] = death_DELIVERY_VAN[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("DELIVERY_VAN Kill stats for "..args[4]..":"..kill_DELIVERY_VAN[s_Inflictor.name].." times")
			print ("DELIVERY_VAN Dead stats for "..args[1]..":"..death_DELIVERY_VAN[p_Player.name].." times")
		end
        end
--
	if args[7] == "DIRTBIKE" then
		if kill_DIRTBIKE[s_Inflictor.name] == nil then kill_DIRTBIKE[s_Inflictor.name] = 0; end
		if death_DIRTBIKE[p_Player.name] == nil then death_DIRTBIKE[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_DIRTBIKE[s_Inflictor.name] = kill_DIRTBIKE[s_Inflictor.name] + 1
	death_DIRTBIKE[p_Player.name] = death_DIRTBIKE[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("DIRTBIKE Kill stats for "..args[4]..":"..kill_DIRTBIKE[s_Inflictor.name].." times")
			print ("DIRTBIKE Dead stats for "..args[1]..":"..death_DIRTBIKE[p_Player.name].." times")
		end
        end
--
	if args[7] == "DPV" then
		if kill_DPV[s_Inflictor.name] == nil then kill_DPV[s_Inflictor.name] = 0; end
		if death_DPV[p_Player.name] == nil then death_DPV[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_DPV[s_Inflictor.name] = kill_DPV[s_Inflictor.name] + 1
	death_DPV[p_Player.name] = death_DPV[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("DPV Kill stats for "..args[4]..":"..kill_DPV[s_Inflictor.name].." times")
			print ("DPV Dead stats for "..args[1]..":"..death_DPV[p_Player.name].." times")
		end
        end
--
	if args[7] == "GAZ-3937 VODNIK" then
		if kill_GAZ_3937_VODNIK[s_Inflictor.name] == nil then kill_GAZ_3937_VODNIK[s_Inflictor.name] = 0; end
		if death_GAZ_3937_VODNIK[p_Player.name] == nil then death_GAZ_3937_VODNIK[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_GAZ_3937_VODNIK[s_Inflictor.name] = kill_GAZ_3937_VODNIK[s_Inflictor.name] + 1
	death_GAZ_3937_VODNIK[p_Player.name] = death_GAZ_3937_VODNIK[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("GAZ_3937_VODNIK Kill stats for "..args[4]..":"..kill_GAZ_3937_VODNIK[s_Inflictor.name].." times")
			print ("GAZ_3937_VODNIK Dead stats for "..args[1]..":"..death_GAZ_3937_VODNIK[p_Player.name].." times")
		end
        end
--
	if args[7] == "GROWLER ITV" then
		if kill_GROWLER_ITV[s_Inflictor.name] == nil then kill_GROWLER_ITV[s_Inflictor.name] = 0; end
		if death_GROWLER_ITV[p_Player.name] == nil then death_GROWLER_ITV[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_GROWLER_ITV[s_Inflictor.name] = kill_GROWLER_ITV[s_Inflictor.name] + 1
	death_GROWLER_ITV[p_Player.name] = death_GROWLER_ITV[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("GROWLER_ITV Kill stats for "..args[4]..":"..kill_GROWLER_ITV[s_Inflictor.name].." times")
			print ("GROWLER_ITV Dead stats for "..args[1]..":"..death_GROWLER_ITV[p_Player.name].." times")
		end
        end
--
	if args[7] == "HMMWV ASRAD" then
		if kill_HMMWV_ASRAD[s_Inflictor.name] == nil then kill_HMMWV_ASRAD[s_Inflictor.name] = 0; end
		if death_HMMWV_ASRAD[p_Player.name] == nil then death_HMMWV_ASRAD[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_HMMWV_ASRAD[s_Inflictor.name] = kill_HMMWV_ASRAD[s_Inflictor.name] + 1
	death_HMMWV_ASRAD[p_Player.name] = death_HMMWV_ASRAD[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("HMMWV_ASRAD Kill stats for "..args[4]..":"..kill_HMMWV_ASRAD[s_Inflictor.name].." times")
			print ("HMMWV_ASRAD Dead stats for "..args[1]..":"..death_HMMWV_ASRAD[p_Player.name].." times")
		end
        end
--
	if args[7] == "LAV-25" then
		if kill_LAV_25[s_Inflictor.name] == nil then kill_LAV_25[s_Inflictor.name] = 0; end
		if death_LAV_25[p_Player.name] == nil then death_LAV_25[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_LAV_25[s_Inflictor.name] = kill_LAV_25[s_Inflictor.name] + 1
	death_LAV_25[p_Player.name] = death_LAV_25[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("LAV_25 Kill stats for "..args[4]..":"..kill_LAV_25[s_Inflictor.name].." times")
			print ("LAV_25 Dead stats for "..args[1]..":"..death_LAV_25[p_Player.name].." times")
		end
        end
--
	if args[7] == "LAV-AD" then
		if kill_LAV_AD[s_Inflictor.name] == nil then kill_LAV_AD[s_Inflictor.name] = 0; end
		if death_LAV_AD[p_Player.name] == nil then death_LAV_AD[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_LAV_AD[s_Inflictor.name] = kill_LAV_AD[s_Inflictor.name] + 1
	death_LAV_AD[p_Player.name] = death_LAV_AD[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("LAV_AD Kill stats for "..args[4]..":"..kill_LAV_AD[s_Inflictor.name].." times")
			print ("LAV_AD Dead stats for "..args[1]..":"..death_LAV_AD[p_Player.name].." times")
		end
        end
--
	if args[7] == "M1 ABRAMS" then
		if kill_M1_ABRAMS[s_Inflictor.name] == nil then kill_M1_ABRAMS[s_Inflictor.name] = 0; end
		if death_M1_ABRAMS[p_Player.name] == nil then death_M1_ABRAMS[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M1_ABRAMS[s_Inflictor.name] = kill_M1_ABRAMS[s_Inflictor.name] + 1
	death_M1_ABRAMS[p_Player.name] = death_M1_ABRAMS[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("M1_ABRAMS Kill stats for "..args[4]..":"..kill_M1_ABRAMS[s_Inflictor.name].." times")
			print ("M1_ABRAMS Dead stats for "..args[1]..":"..death_M1_ABRAMS[p_Player.name].." times")
		end
        end
--
	if args[7] == "M1114 HMMWV" then
		if kill_M1114_HMMWV[s_Inflictor.name] == nil then kill_M1114_HMMWV[s_Inflictor.name] = 0; end
		if death_M1114_HMMWV[p_Player.name] == nil then death_M1114_HMMWV[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M1114_HMMWV[s_Inflictor.name] = kill_M1114_HMMWV[s_Inflictor.name] + 1
	death_M1114_HMMWV[p_Player.name] = death_M1114_HMMWV[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("M1114_HMMWV Kill stats for "..args[4]..":"..kill_M1114_HMMWV[s_Inflictor.name].." times")
			print ("M1114_HMMWV Dead stats for "..args[1]..":"..death_M1114_HMMWV[p_Player.name].." times")
		end
        end
--
	if args[7] == "M1128" then
		if kill_M1128[s_Inflictor.name] == nil then kill_M1128[s_Inflictor.name] = 0; end
		if death_M1128[p_Player.name] == nil then death_M1128[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M1128[s_Inflictor.name] = kill_M1128[s_Inflictor.name] + 1
	death_M1128[p_Player.name] = death_M1128[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("M1128 Kill stats for "..args[4]..":"..kill_M1128[s_Inflictor.name].." times")
			print ("M1128 Dead stats for "..args[1]..":"..death_M1128[p_Player.name].." times")
		end
        end
--
	if args[7] == "M142" then
		if kill_M142[s_Inflictor.name] == nil then kill_M142[s_Inflictor.name] = 0; end
		if death_M142[p_Player.name] == nil then death_M142[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M142[s_Inflictor.name] = kill_M142[s_Inflictor.name] + 1
	death_M142[p_Player.name] = death_M142[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("M142 Kill stats for "..args[4]..":"..kill_M142[s_Inflictor.name].." times")
			print ("M142 Dead stats for "..args[1]..":"..death_M142[p_Player.name].." times")
		end
        end
--
	if args[7] == "M220 TOW LAUNCHER" then
		if kill_M220_TOW_LAUNCHER[s_Inflictor.name] == nil then kill_M220_TOW_LAUNCHER[s_Inflictor.name] = 0; end
		if death_M220_TOW_LAUNCHER[p_Player.name] == nil then death_M220_TOW_LAUNCHER[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M220_TOW_LAUNCHER[s_Inflictor.name] = kill_M220_TOW_LAUNCHER[s_Inflictor.name] + 1
	death_M220_TOW_LAUNCHER[p_Player.name] = death_M220_TOW_LAUNCHER[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("M220_TOW_LAUNCHER Kill stats for "..args[4]..":"..kill_M220_TOW_LAUNCHER[s_Inflictor.name].." times")
			print ("M220_TOW_LAUNCHER Dead stats for "..args[1]..":"..death_M220_TOW_LAUNCHER[p_Player.name].." times")
		end
        end
--
	if args[7] == "PANTSIR-S1" then
		if kill_PANTSIR_S1[s_Inflictor.name] == nil then kill_PANTSIR_S1[s_Inflictor.name] = 0; end
		if death_PANTSIR_S1[p_Player.name] == nil then death_PANTSIR_S1[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_PANTSIR_S1[s_Inflictor.name] = kill_PANTSIR_S1[s_Inflictor.name] + 1
	death_PANTSIR_S1[p_Player.name] = death_PANTSIR_S1[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("PANTSIR_S1 Kill stats for "..args[4]..":"..kill_PANTSIR_S1[s_Inflictor.name].." times")
			print ("PANTSIR_S1 Dead stats for "..args[1]..":"..death_PANTSIR_S1[p_Player.name].." times")
		end
        end
--
	if args[7] == "PHOENIX" then
		if kill_PHOENIX[s_Inflictor.name] == nil then kill_PHOENIX[s_Inflictor.name] = 0; end
		if death_PHOENIX[p_Player.name] == nil then death_PHOENIX[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_PHOENIX[s_Inflictor.name] = kill_PHOENIX[s_Inflictor.name] + 1
	death_PHOENIX[p_Player.name] = death_PHOENIX[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("PHOENIX Kill stats for "..args[4]..":"..kill_PHOENIX[s_Inflictor.name].." times")
			print ("PHOENIX Dead stats for "..args[1]..":"..death_PHOENIX[p_Player.name].." times")
		end
        end
--
	if args[7] == "POLICE VAN" then
		if kill_POLICE_VAN[s_Inflictor.name] == nil then kill_POLICE_VAN[s_Inflictor.name] = 0; end
		if death_POLICE_VAN[p_Player.name] == nil then death_POLICE_VAN[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_POLICE_VAN[s_Inflictor.name] = kill_POLICE_VAN[s_Inflictor.name] + 1
	death_POLICE_VAN[p_Player.name] = death_POLICE_VAN[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("POLICE_VAN Kill stats for "..args[4]..":"..kill_POLICE_VAN[s_Inflictor.name].." times")
			print ("POLICE_VAN Dead stats for "..args[1]..":"..death_POLICE_VAN[p_Player.name].." times")
		end
        end
--
	if args[7] == "QUAD BIKE" then
		if kill_QUAD_BIKE[s_Inflictor.name] == nil then kill_QUAD_BIKE[s_Inflictor.name] = 0; end
		if death_QUAD_BIKE[p_Player.name] == nil then death_QUAD_BIKE[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_QUAD_BIKE[s_Inflictor.name] = kill_QUAD_BIKE[s_Inflictor.name] + 1
	death_QUAD_BIKE[p_Player.name] = death_QUAD_BIKE[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("QUAD_BIKE Kill stats for "..args[4]..":"..kill_QUAD_BIKE[s_Inflictor.name].." times")
			print ("QUAD_BIKE Dead stats for "..args[1]..":"..death_QUAD_BIKE[p_Player.name].." times")
		end
        end
--
	if args[7] == "RHIB BOAT" then
		if kill_RHIB_BOAT[s_Inflictor.name] == nil then kill_RHIB_BOAT[s_Inflictor.name] = 0; end
		if death_RHIB_BOAT[p_Player.name] == nil then death_RHIB_BOAT[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_RHIB_BOAT[s_Inflictor.name] = kill_RHIB_BOAT[s_Inflictor.name] + 1
	death_RHIB_BOAT[p_Player.name] = death_RHIB_BOAT[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("RHIB_BOAT Kill stats for "..args[4]..":"..kill_RHIB_BOAT[s_Inflictor.name].." times")
			print ("RHIB_BOAT Dead stats for "..args[1]..":"..death_RHIB_BOAT[p_Player.name].." times")
		end
        end
--
	if args[7] == "RHINO" then
		if kill_RHINO[s_Inflictor.name] == nil then kill_RHINO[s_Inflictor.name] = 0; end
		if death_RHINO[p_Player.name] == nil then death_RHINO[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_RHINO[s_Inflictor.name] = kill_RHINO[s_Inflictor.name] + 1
	death_RHINO[p_Player.name] = death_RHINO[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("RHINO Kill stats for "..args[4]..":"..kill_RHINO[s_Inflictor.name].." times")
			print ("RHINO Dead stats for "..args[1]..":"..death_RHINO[p_Player.name].." times")
		end
        end
--
	if args[7] == "SKID LOADER" then
		if kill_SKID_LOADER[s_Inflictor.name] == nil then kill_SKID_LOADER[s_Inflictor.name] = 0; end
		if death_SKID_LOADER[p_Player.name] == nil then death_SKID_LOADER[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SKID_LOADER[s_Inflictor.name] = kill_SKID_LOADER[s_Inflictor.name] + 1
	death_SKID_LOADER[p_Player.name] = death_SKID_LOADER[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("SKID_LOADER Kill stats for "..args[4]..":"..kill_SKID_LOADER[s_Inflictor.name].." times")
			print ("SKID_LOADER Dead stats for "..args[1]..":"..death_SKID_LOADER[p_Player.name].." times")
		end
        end
--
	if args[7] == "SPRUT-SD" then
		if kill_SPRUT_SD[s_Inflictor.name] == nil then kill_SPRUT_SD[s_Inflictor.name] = 0; end
		if death_SPRUT_SD[p_Player.name] == nil then death_SPRUT_SD[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SPRUT_SD[s_Inflictor.name] = kill_SPRUT_SD[s_Inflictor.name] + 1
	death_SPRUT_SD[p_Player.name] = death_SPRUT_SD[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("SPRUT_SD Kill stats for "..args[4]..":"..kill_SPRUT_SD[s_Inflictor.name].." times")
			print ("SPRUT_SD Dead stats for "..args[1]..":"..death_SPRUT_SD[p_Player.name].." times")
		end
        end
--
	if args[7] == "SUV" then
		if kill_SUV[s_Inflictor.name] == nil then kill_SUV[s_Inflictor.name] = 0; end
		if death_SUV[p_Player.name] == nil then death_SUV[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SUV[s_Inflictor.name] = kill_SUV[s_Inflictor.name] + 1
	death_SUV[p_Player.name] = death_SUV[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("SUV Kill stats for "..args[4]..":"..kill_SUV[s_Inflictor.name].." times")
			print ("SUV Dead stats for "..args[1]..":"..death_SUV[p_Player.name].." times")
		end
        end
--
	if args[7] == "T-90A" then
		if kill_T_90A[s_Inflictor.name] == nil then kill_T_90A[s_Inflictor.name] = 0; end
		if death_T_90A[p_Player.name] == nil then death_T_90A[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_T_90A[s_Inflictor.name] = kill_T_90A[s_Inflictor.name] + 1
	death_T_90A[p_Player.name] = death_T_90A[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("T_90A Kill stats for "..args[4]..":"..kill_T_90A[s_Inflictor.name].." times")
			print ("T_90A Dead stats for "..args[1]..":"..death_T_90A[p_Player.name].." times")
		end
        end
--
	if args[7] == "TECHNICAL TRUCK" then
		if kill_TECHNICAL_TRUCK[s_Inflictor.name] == nil then kill_TECHNICAL_TRUCK[s_Inflictor.name] = 0; end
		if death_TECHNICAL_TRUCK[p_Player.name] == nil then death_TECHNICAL_TRUCK[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_TECHNICAL_TRUCK[s_Inflictor.name] = kill_TECHNICAL_TRUCK[s_Inflictor.name] + 1
	death_TECHNICAL_TRUCK[p_Player.name] = death_TECHNICAL_TRUCK[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("TECHNICAL_TRUCK Kill stats for "..args[4]..":"..kill_TECHNICAL_TRUCK[s_Inflictor.name].." times")
			print ("TECHNICAL_TRUCK Dead stats for "..args[1]..":"..death_TECHNICAL_TRUCK[p_Player.name].." times")
		end
        end
--
	if args[7] == "VDV Buggy" then
		if kill_VDV_Buggy[s_Inflictor.name] == nil then kill_VDV_Buggy[s_Inflictor.name] = 0; end
		if death_VDV_Buggy[p_Player.name] == nil then death_VDV_Buggy[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_VDV_Buggy[s_Inflictor.name] = kill_VDV_Buggy[s_Inflictor.name] + 1
	death_VDV_Buggy[p_Player.name] = death_VDV_Buggy[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("VDV_Buggy Kill stats for "..args[4]..":"..kill_VDV_Buggy[s_Inflictor.name].." times")
			print ("VDV_Buggy Dead stats for "..args[1]..":"..death_VDV_Buggy[p_Player.name].." times")
		end
        end
--
	if args[7] == "VODNIK AA" then
		if kill_VODNIK_AA[s_Inflictor.name] == nil then kill_VODNIK_AA[s_Inflictor.name] = 0; end
		if death_VODNIK_AA[p_Player.name] == nil then death_VODNIK_AA[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_VODNIK_AA[s_Inflictor.name] = kill_VODNIK_AA[s_Inflictor.name] + 1
	death_VODNIK_AA[p_Player.name] = death_VODNIK_AA[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("VODNIK_AA Kill stats for "..args[4]..":"..kill_VODNIK_AA[s_Inflictor.name].." times")
			print ("VODNIK_AA Dead stats for "..args[1]..":"..death_VODNIK_AA[p_Player.name].." times")
		end
        end
--

end
end)


return LandVehicles()

