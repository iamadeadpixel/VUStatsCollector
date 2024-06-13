-- Spaghetti code by iamadeadpixel

---@class engineerweapons
engineerweapons = class 'engineerweapons'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** engineer weapons Kill mod loaded ***"); 

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

	if args[7] == "A-91" then
		if kill_A_91[s_Inflictor.name] == nil then kill_A_91[s_Inflictor.name] = 0; end
		if death_A_91[p_Player.name] == nil then death_A_91[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_A_91[s_Inflictor.name] = kill_A_91[s_Inflictor.name] + 1
	death_A_91[p_Player.name] = death_A_91[p_Player.name] + 1
		end
        end
--
	if args[7] == "ACW-R" then
		if kill_ACW_R[s_Inflictor.name] == nil then kill_ACW_R[s_Inflictor.name] = 0; end
		if death_ACW_R[p_Player.name] == nil then death_ACW_R[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_ACW_R[s_Inflictor.name] = kill_ACW_R[s_Inflictor.name] + 1
	death_ACW_R[p_Player.name] = death_ACW_R[p_Player.name] + 1
		end
        end
--
	if args[7] == "AKS-74u" then
		if kill_AKS_74u[s_Inflictor.name] == nil then kill_AKS_74u[s_Inflictor.name] = 0; end
		if death_AKS_74u[p_Player.name] == nil then death_AKS_74u[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_AKS_74u[s_Inflictor.name] = kill_AKS_74u[s_Inflictor.name] + 1
	death_AKS_74u[p_Player.name] = death_AKS_74u[p_Player.name] + 1
		end
        end
--
	if args[7] == "G36C" then
		if kill_G36C[s_Inflictor.name] == nil then kill_G36C[s_Inflictor.name] = 0; end
		if death_G36C[p_Player.name] == nil then death_G36C[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_G36C[s_Inflictor.name] = kill_G36C[s_Inflictor.name] + 1
	death_G36C[p_Player.name] = death_G36C[p_Player.name] + 1
		end
        end
--
	if args[7] == "G53" then
		if kill_G53[s_Inflictor.name] == nil then kill_G53[s_Inflictor.name] = 0; end
		if death_G53[p_Player.name] == nil then death_G53[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_G53[s_Inflictor.name] = kill_G53[s_Inflictor.name] + 1
	death_G53[p_Player.name] = death_G53[p_Player.name] + 1
		end
        end
--
	if args[7] == "M4" then
		if kill_M4[s_Inflictor.name] == nil then kill_M4[s_Inflictor.name] = 0; end
		if death_M4[p_Player.name] == nil then death_M4[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M4[s_Inflictor.name] = kill_M4[s_Inflictor.name] + 1
	death_M4[p_Player.name] = death_M4[p_Player.name] + 1
		end
        end
--
	if args[7] == "M4A1" then
		if kill_M4A1[s_Inflictor.name] == nil then kill_M4A1[s_Inflictor.name] = 0; end
		if death_M4A1[p_Player.name] == nil then death_M4A1[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M4A1[s_Inflictor.name] = kill_M4A1[s_Inflictor.name] + 1
	death_M4A1[p_Player.name] = death_M4A1[p_Player.name] + 1
		end
        end
--
	if args[7] == "MTAR-21" then
		if kill_MTAR_21[s_Inflictor.name] == nil then kill_MTAR_21[s_Inflictor.name] = 0; end
		if death_MTAR_21[p_Player.name] == nil then death_MTAR_21[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_MTAR_21[s_Inflictor.name] = kill_MTAR_21[s_Inflictor.name] + 1
	death_MTAR_21[p_Player.name] = death_MTAR_21[p_Player.name] + 1
		end
        end
--
	if args[7] == "QBZ-95B" then
		if kill_QBZ_95B[s_Inflictor.name] == nil then kill_QBZ_95B[s_Inflictor.name] = 0; end
		if death_QBZ_95B[p_Player.name] == nil then death_QBZ_95B[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_QBZ_95B[s_Inflictor.name] = kill_QBZ_95B[s_Inflictor.name] + 1
	death_QBZ_95B[p_Player.name] = death_QBZ_95B[p_Player.name] + 1
		end
        end
--
	if args[7] == "SCAR-H" then
		if kill_SCAR_H[s_Inflictor.name] == nil then kill_SCAR_H[s_Inflictor.name] = 0; end
		if death_SCAR_H[p_Player.name] == nil then death_SCAR_H[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SCAR_H[s_Inflictor.name] = kill_SCAR_H[s_Inflictor.name] + 1
	death_SCAR_H[p_Player.name] = death_SCAR_H[p_Player.name] + 1
		end
        end
--
	if args[7] == "SG553" then
		if kill_SG553[s_Inflictor.name] == nil then kill_SG553[s_Inflictor.name] = 0; end
		if death_SG553[p_Player.name] == nil then death_SG553[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SG553[s_Inflictor.name] = kill_SG553[s_Inflictor.name] + 1
	death_SG553[p_Player.name] = death_SG553[p_Player.name] + 1
		end
        end
--

end
end)


return engineerweapons()

