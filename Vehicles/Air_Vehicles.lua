-- Spaghetti code by iamadeadpixel

---@class AirVehicles
AirVehicles = class 'AirVehicles'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** Air Vehicles Kill mod loaded ***"); 

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

	if playerscollected[s_Inflictor.name] and args[7] == "TV MISSILE" then
		if kill_TV_MISSILE[s_Inflictor.name] == nil then kill_TV_MISSILE[s_Inflictor.name] = 0; end
	kill_TV_MISSILE[s_Inflictor.name] = kill_TV_MISSILE[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "A-10 THUNDERBOLT" then
		if kill_A10_THUNDERBOLT[s_Inflictor.name] == nil then kill_A10_THUNDERBOLT[s_Inflictor.name] = 0; end
	kill_A10_THUNDERBOLT[s_Inflictor.name] = kill_A10_THUNDERBOLT[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "AH-1Z VIPER" then
		if kill_AH_1Z_VIPER[s_Inflictor.name] == nil then kill_AH_1Z_VIPER[s_Inflictor.name] = 0; end
	kill_AH_1Z_VIPER[s_Inflictor.name] = kill_AH_1Z_VIPER[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "AH-6J LITTLE BIRD" then
		if kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] == nil then kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] = 0; end
	kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] = kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "F-35" then
		if kill_F_35[s_Inflictor.name] == nil then kill_F_35[s_Inflictor.name] = 0; end
	kill_F_35[s_Inflictor.name] = kill_F_35[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "F/A-18E SUPER HORNET" then
		if kill_FA_18E_SUPER_HORNET[s_Inflictor.name] == nil then kill_FA_18E_SUPER_HORNET[s_Inflictor.name] = 0; end
	kill_FA_18E_SUPER_HORNET[s_Inflictor.name] = kill_FA_18E_SUPER_HORNET[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "GUNSHIP" then
		if kill_GUNSHIP[s_Inflictor.name] == nil then kill_GUNSHIP[s_Inflictor.name] = 0; end
	kill_GUNSHIP[s_Inflictor.name] = kill_GUNSHIP[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "KA-60 KASATKA" then
		if kill_KA_60_KASATKA[s_Inflictor.name] == nil then kill_KA_60_KASATKA[s_Inflictor.name] = 0; end
	kill_KA_60_KASATKA[s_Inflictor.name] = kill_KA_60_KASATKA[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "MI-28 HAVOC" then
		if kill_MI_28_HAVOC[s_Inflictor.name] == nil then kill_MI_28_HAVOC[s_Inflictor.name] = 0; end
	kill_MI_28_HAVOC[s_Inflictor.name] = kill_MI_28_HAVOC[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "SU-25TM FROGFOOT" then
		if kill_SU_25TM_FROGFOOT[s_Inflictor.name] == nil then kill_SU_25TM_FROGFOOT[s_Inflictor.name] = 0; end
	kill_SU_25TM_FROGFOOT[s_Inflictor.name] = kill_SU_25TM_FROGFOOT[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "SU-35BM FLANKER-E" then
		if kill_SU_35BM_FLANKER_E[s_Inflictor.name] == nil then kill_SU_35BM_FLANKER_E[s_Inflictor.name] = 0; end
	kill_SU_35BM_FLANKER_E[s_Inflictor.name] = kill_SU_35BM_FLANKER_E[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "SU-37" then
		if kill_SU_37[s_Inflictor.name] == nil then kill_SU_37[s_Inflictor.name] = 0; end
	kill_SU_37[s_Inflictor.name] = kill_SU_37[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "UH-1Y VENOM" then
		if kill_UH_1Y_VENOM[s_Inflictor.name] == nil then kill_UH_1Y_VENOM[s_Inflictor.name] = 0; end
	kill_UH_1Y_VENOM[s_Inflictor.name] = kill_UH_1Y_VENOM[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "Z-11W" then
		if kill_Z_11W[s_Inflictor.name] == nil then kill_Z_11W[s_Inflictor.name] = 0; end
	kill_Z_11W[s_Inflictor.name] = kill_Z_11W[s_Inflictor.name] + 1
        end
--

end)


return AirVehicles()

