-- Spaghetti code by iamadeadpixel

---@class supportweapons
supportweapons = class 'supportweapons'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** support weapons Kill mod loaded ***"); 

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

	if args[7] == "L86A2" then
		if kill_L86A2[s_Inflictor.name] == nil then kill_L86A2[s_Inflictor.name] = 0; end
		if death_L86A2[p_Player.name] == nil then death_L86A2[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_L86A2[s_Inflictor.name] = kill_L86A2[s_Inflictor.name] + 1
	death_L86A2[p_Player.name] = death_L86A2[p_Player.name] + 1
		end
        end
--
	if args[7] == "LSAT" then
		if kill_LSAT[s_Inflictor.name] == nil then kill_LSAT[s_Inflictor.name] = 0; end
		if death_LSAT[p_Player.name] == nil then death_LSAT[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_LSAT[s_Inflictor.name] = kill_LSAT[s_Inflictor.name] + 1
	death_LSAT[p_Player.name] = death_LSAT[p_Player.name] + 1
		end
        end
--
	if args[7] == "M240B" then
		if kill_M240B[s_Inflictor.name] == nil then kill_M240B[s_Inflictor.name] = 0; end
		if death_M240B[p_Player.name] == nil then death_M240B[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M240B[s_Inflictor.name] = kill_M240B[s_Inflictor.name] + 1
	death_M240B[p_Player.name] = death_M240B[p_Player.name] + 1
		end
        end
--
	if args[7] == "M249" then
		if kill_M249[s_Inflictor.name] == nil then kill_M249[s_Inflictor.name] = 0; end
		if death_M249[p_Player.name] == nil then death_M249[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M249[s_Inflictor.name] = kill_M249[s_Inflictor.name] + 1
	death_M249[p_Player.name] = death_M249[p_Player.name] + 1
		end
        end
--
	if args[7] == "M27 IAR" then
		if kill_M27_IAR[s_Inflictor.name] == nil then kill_M27_IAR[s_Inflictor.name] = 0; end
		if death_M27_IAR[p_Player.name] == nil then death_M27_IAR[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M27_IAR[s_Inflictor.name] = kill_M27_IAR[s_Inflictor.name] + 1
	death_M27_IAR[p_Player.name] = death_M27_IAR[p_Player.name] + 1
		end
        end
--
	if args[7] == "M60E4" then
		if kill_M60E4[s_Inflictor.name] == nil then kill_M60E4[s_Inflictor.name] = 0; end
		if death_M60E4[p_Player.name] == nil then death_M60E4[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M60E4[s_Inflictor.name] = kill_M60E4[s_Inflictor.name] + 1
	death_M60E4[p_Player.name] = death_M60E4[p_Player.name] + 1
		end
        end
--
	if args[7] == "MG36" then
		if kill_MG36[s_Inflictor.name] == nil then kill_MG36[s_Inflictor.name] = 0; end
		if death_MG36[p_Player.name] == nil then death_MG36[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_MG36[s_Inflictor.name] = kill_MG36[s_Inflictor.name] + 1
	death_MG36[p_Player.name] = death_MG36[p_Player.name] + 1
		end
        end
--
	if args[7] == "PKP PECHENEG" then
		if kill_PKP_PECHENEG[s_Inflictor.name] == nil then kill_PKP_PECHENEG[s_Inflictor.name] = 0; end
		if death_PKP_PECHENEG[p_Player.name] == nil then death_PKP_PECHENEG[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_PKP_PECHENEG[s_Inflictor.name] = kill_PKP_PECHENEG[s_Inflictor.name] + 1
	death_PKP_PECHENEG[p_Player.name] = death_PKP_PECHENEG[p_Player.name] + 1
		end
        end
--
	if args[7] == "QBB-95" then
		if kill_QBB_95[s_Inflictor.name] == nil then kill_QBB_95[s_Inflictor.name] = 0; end
		if death_QBB_95[p_Player.name] == nil then death_QBB_95[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_QBB_95[s_Inflictor.name] = kill_QBB_95[s_Inflictor.name] + 1
	death_QBB_95[p_Player.name] = death_QBB_95[p_Player.name] + 1
		end
        end
--
	if args[7] == "RPK-74M" then
		if kill_RPK_74M[s_Inflictor.name] == nil then kill_RPK_74M[s_Inflictor.name] = 0; end
		if death_RPK_74M[p_Player.name] == nil then death_RPK_74M[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_RPK_74M[s_Inflictor.name] = kill_RPK_74M[s_Inflictor.name] + 1
	death_RPK_74M[p_Player.name] = death_RPK_74M[p_Player.name] + 1
		end
        end
--
	if args[7] == "TYPE 88 LMG" then
		if kill_TYPE_88_LMG[s_Inflictor.name] == nil then kill_TYPE_88_LMG[s_Inflictor.name] = 0; end
		if death_TYPE_88_LMG[p_Player.name] == nil then death_TYPE_88_LMG[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_TYPE_88_LMG[s_Inflictor.name] = kill_TYPE_88_LMG[s_Inflictor.name] + 1
	death_TYPE_88_LMG[p_Player.name] = death_TYPE_88_LMG[p_Player.name] + 1
		end
        end
--

end
end)


return supportweapons()

