-- Spaghetti code by iamadeadpixel

---@class shotgunsweapons
shotgunsweapons = class 'shotgunsweapons'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** shotguns weapons Kill mod loaded ***"); 

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

	if args[7] == "USAS-12" then
		if kill_USAS_12[s_Inflictor.name] == nil then kill_USAS_12[s_Inflictor.name] = 0; end
		if death_USAS_12[p_Player.name] == nil then death_USAS_12[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_USAS_12[s_Inflictor.name] = kill_USAS_12[s_Inflictor.name] + 1
	death_USAS_12[p_Player.name] = death_USAS_12[p_Player.name] + 1
		end
        end
--
			if args[7] == "SPAS-12" then
		if kill_SPAS_12[s_Inflictor.name] == nil then kill_SPAS_12[s_Inflictor.name] = 0; end
		if death_SPAS_12[p_Player.name] == nil then death_SPAS_12[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SPAS_12[s_Inflictor.name] = kill_SPAS_12[s_Inflictor.name] + 1
	death_SPAS_12[p_Player.name] = death_SPAS_12[p_Player.name] + 1
		end
        end
--
			if args[7] == "SAIGA 12K" then
		if kill_SAIGA_12K[s_Inflictor.name] == nil then kill_SAIGA_12K[s_Inflictor.name] = 0; end
		if death_SAIGA_12K[p_Player.name] == nil then death_SAIGA_12K[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SAIGA_12K[s_Inflictor.name] = kill_SAIGA_12K[s_Inflictor.name] + 1
	death_SAIGA_12K[p_Player.name] = death_SAIGA_12K[p_Player.name] + 1
		end
        end
--
			if args[7] == "MK3A1" then
		if kill_MK3A1[s_Inflictor.name] == nil then kill_MK3A1[s_Inflictor.name] = 0; end
		if death_MK3A1[p_Player.name] == nil then death_MK3A1[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_MK3A1[s_Inflictor.name] = kill_MK3A1[s_Inflictor.name] + 1
	death_MK3A1[p_Player.name] = death_MK3A1[p_Player.name] + 1
		end
        end
--
			if args[7] == "M1014" then
		if kill_M1014[s_Inflictor.name] == nil then kill_M1014[s_Inflictor.name] = 0; end
		if death_M1014[p_Player.name] == nil then death_M1014[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M1014[s_Inflictor.name] = kill_M1014[s_Inflictor.name] + 1
	death_M1014[p_Player.name] = death_M1014[p_Player.name] + 1
		end
        end
--
			if args[7] == "DAO-12" then
		if kill_DAO_12[s_Inflictor.name] == nil then kill_DAO_12[s_Inflictor.name] = 0; end
		if death_DAO_12[p_Player.name] == nil then death_DAO_12[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_DAO_12[s_Inflictor.name] = kill_DAO_12[s_Inflictor.name] + 1
	death_DAO_12[p_Player.name] = death_DAO_12[p_Player.name] + 1
		end
        end
--
			if args[7] == "870MCS" then
		if kill_870MCS[s_Inflictor.name] == nil then kill_870MCS[s_Inflictor.name] = 0; end
		if death_870MCS[p_Player.name] == nil then death_870MCS[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_870MCS[s_Inflictor.name] = kill_870MCS[s_Inflictor.name] + 1
	death_870MCS[p_Player.name] = death_870MCS[p_Player.name] + 1
		end
        end
--

end
end)


return shotgunsweapons()

