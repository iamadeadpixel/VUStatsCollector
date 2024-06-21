-- Spaghetti code by iamadeadpixel

---@class handgunsweapons
handgunsweapons = class 'handgunsweapons'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** handguns weapons Kill mod loaded ***"); 

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

	if getnamehuman[s_Inflictor.name] and args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" or args[7] == "MP443" then
		if kill_MP443[s_Inflictor.name] == nil then kill_MP443[s_Inflictor.name] = 0; end
	kill_MP443[s_Inflictor.name] = kill_MP443[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "MP412 REX" then
		if kill_MP412_REX[s_Inflictor.name] == nil then kill_MP412_REX[s_Inflictor.name] = 0; end
	kill_MP412_REX[s_Inflictor.name] = kill_MP412_REX[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M9 SUPP" or args[7] == "M9 TACT" or args[7] == "M9" then
		if kill_M9[s_Inflictor.name] == nil then kill_M9[s_Inflictor.name] = 0; end
	kill_M9[s_Inflictor.name] = kill_M9[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT" or args[7] == "M1911" then
		if kill_M1911[s_Inflictor.name] == nil then kill_M1911[s_Inflictor.name] = 0; end
	kill_M1911[s_Inflictor.name] = kill_M1911[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "G18 SUPP" or args[7] == "G18" then
		if kill_G18[s_Inflictor.name] == nil then kill_G18[s_Inflictor.name] = 0; end
	kill_G18[s_Inflictor.name] = kill_G18[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "G17C SUPP" or args[7] == "G17C" then
		if kill_G17C[s_Inflictor.name] == nil then kill_G17C[s_Inflictor.name] = 0; end
	kill_G17C[s_Inflictor.name] = kill_G17C[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "93R" then
		if kill_93R[s_Inflictor.name] == nil then kill_93R[s_Inflictor.name] = 0; end
	kill_93R[s_Inflictor.name] = kill_93R[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == ".44 MAGNUM" or args[7] == ".44 SCOPED" then
		if kill_44_MAGNUM[s_Inflictor.name] == nil then kill_44_MAGNUM[s_Inflictor.name] = 0; end
	kill_44_MAGNUM[s_Inflictor.name] = kill_44_MAGNUM[s_Inflictor.name] + 1
        end
--

end)


return handgunsweapons()

