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

	if playerscollected[s_Inflictor.name] and args[7] == "L86A2" then
		if kill_L86A2[s_Inflictor.name] == nil then kill_L86A2[s_Inflictor.name] = 0; end
	kill_L86A2[s_Inflictor.name] = kill_L86A2[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "LSAT" then
		if kill_LSAT[s_Inflictor.name] == nil then kill_LSAT[s_Inflictor.name] = 0; end
	kill_LSAT[s_Inflictor.name] = kill_LSAT[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M240B" then
		if kill_M240B[s_Inflictor.name] == nil then kill_M240B[s_Inflictor.name] = 0; end
	kill_M240B[s_Inflictor.name] = kill_M240B[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M249" then
		if kill_M249[s_Inflictor.name] == nil then kill_M249[s_Inflictor.name] = 0; end
	kill_M249[s_Inflictor.name] = kill_M249[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M27 IAR" then
		if kill_M27_IAR[s_Inflictor.name] == nil then kill_M27_IAR[s_Inflictor.name] = 0; end
	kill_M27_IAR[s_Inflictor.name] = kill_M27_IAR[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M60E4" then
		if kill_M60E4[s_Inflictor.name] == nil then kill_M60E4[s_Inflictor.name] = 0; end
	kill_M60E4[s_Inflictor.name] = kill_M60E4[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "MG36" then
		if kill_MG36[s_Inflictor.name] == nil then kill_MG36[s_Inflictor.name] = 0; end
	kill_MG36[s_Inflictor.name] = kill_MG36[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "PKP PECHENEG" then
		if kill_PKP_PECHENEG[s_Inflictor.name] == nil then kill_PKP_PECHENEG[s_Inflictor.name] = 0; end
	kill_PKP_PECHENEG[s_Inflictor.name] = kill_PKP_PECHENEG[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "QBB-95" then
		if kill_QBB_95[s_Inflictor.name] == nil then kill_QBB_95[s_Inflictor.name] = 0; end
	kill_QBB_95[s_Inflictor.name] = kill_QBB_95[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "RPK-74M" then
		if kill_RPK_74M[s_Inflictor.name] == nil then kill_RPK_74M[s_Inflictor.name] = 0; end
	kill_RPK_74M[s_Inflictor.name] = kill_RPK_74M[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "TYPE 88 LMG" then
		if kill_TYPE_88_LMG[s_Inflictor.name] == nil then kill_TYPE_88_LMG[s_Inflictor.name] = 0; end
	kill_TYPE_88_LMG[s_Inflictor.name] = kill_TYPE_88_LMG[s_Inflictor.name] + 1
        end
--

end)


return supportweapons()

