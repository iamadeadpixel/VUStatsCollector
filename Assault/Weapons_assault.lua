-- Spaghetti code by iamadeadpixel

---@class assaultweapons
assaultweapons = class 'assaultweapons'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** assault weapons Kill mod loaded ***"); 

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

	if playerscollected[s_Inflictor.name] and args[7] == "AEK-971" then
		if kill_AEK_971[s_Inflictor.name] == nil then kill_AEK_971[s_Inflictor.name] = 0; end
	kill_AEK_971[s_Inflictor.name] = kill_AEK_971[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "AK-74M" then
		if kill_AK_74M[s_Inflictor.name] == nil then kill_AK_74M[s_Inflictor.name] = 0; end
	kill_AK_74M[s_Inflictor.name] = kill_AK_74M[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "AN-94" then
		if kill_AN_94[s_Inflictor.name] == nil then kill_AN_94[s_Inflictor.name] = 0; end
	kill_AN_94[s_Inflictor.name] = kill_AN_94[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "AUG A3" then
		if kill_AUG_A3[s_Inflictor.name] == nil then kill_AUG_A3[s_Inflictor.name] = 0; end
	kill_AUG_A3[s_Inflictor.name] = kill_AUG_A3[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "F2000" then
		if kill_F2000[s_Inflictor.name] == nil then kill_F2000[s_Inflictor.name] = 0; end
	kill_F2000[s_Inflictor.name] = kill_F2000[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "FAMAS" then
		if kill_FAMAS[s_Inflictor.name] == nil then kill_FAMAS[s_Inflictor.name] = 0; end
	kill_FAMAS[s_Inflictor.name] = kill_FAMAS[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "G3A3" then
		if kill_G3A3[s_Inflictor.name] == nil then kill_G3A3[s_Inflictor.name] = 0; end
	kill_G3A3[s_Inflictor.name] = kill_G3A3[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "KH2002" then
		if kill_KH2002[s_Inflictor.name] == nil then kill_KH2002[s_Inflictor.name] = 0; end
	kill_KH2002[s_Inflictor.name] = kill_KH2002[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "L85A2" then
		if kill_L85A2[s_Inflictor.name] == nil then kill_L85A2[s_Inflictor.name] = 0; end
	kill_L85A2[s_Inflictor.name] = kill_L85A2[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M16A3" then
		if kill_M16A3[s_Inflictor.name] == nil then kill_M16A3[s_Inflictor.name] = 0; end
	kill_M16A3[s_Inflictor.name] = kill_M16A3[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M16A4" then
		if kill_M16A4[s_Inflictor.name] == nil then kill_M16A4[s_Inflictor.name] = 0; end
	kill_M16A4[s_Inflictor.name] = kill_M16A4[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M416" then
		if kill_M416[s_Inflictor.name] == nil then kill_M416[s_Inflictor.name] = 0; end
	kill_M416[s_Inflictor.name] = kill_M416[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "SCAR-L" then
		if kill_SCAR_L[s_Inflictor.name] == nil then kill_SCAR_L[s_Inflictor.name] = 0; end
	kill_SCAR_L[s_Inflictor.name] = kill_SCAR_L[s_Inflictor.name] + 1
        end
--

end)


return assaultweapons()
