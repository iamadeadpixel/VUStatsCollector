-- Spaghetti code by iamadeadpixel

---@class Common
Common = class 'Common'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** Common weapons Kill mod loaded ***"); 

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

	if playerscollected[s_Inflictor.name] and args[7] == "UMP-45" then
		if kill_UMP_45[s_Inflictor.name] == nil then kill_UMP_45[s_Inflictor.name] = 0; end
	kill_UMP_45[s_Inflictor.name] = kill_UMP_45[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "PP-2000" then
		if kill_PP_2000[s_Inflictor.name] == nil then kill_PP_2000[s_Inflictor.name] = 0; end
	kill_PP_2000[s_Inflictor.name] = kill_PP_2000[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "PP-19" then
		if kill_PP_19[s_Inflictor.name] == nil then kill_PP_19[s_Inflictor.name] = 0; end
	kill_PP_19[s_Inflictor.name] = kill_PP_19[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "PDW-R" then
		if kill_PDW_R[s_Inflictor.name] == nil then kill_PDW_R[s_Inflictor.name] = 0; end
	kill_PDW_R[s_Inflictor.name] = kill_PDW_R[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "P90" then
		if kill_P90[s_Inflictor.name] == nil then kill_P90[s_Inflictor.name] = 0; end
	kill_P90[s_Inflictor.name] = kill_P90[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "MP7" then
		if kill_MP7[s_Inflictor.name] == nil then kill_MP7[s_Inflictor.name] = 0; end
	kill_MP7[s_Inflictor.name] = kill_MP7[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M5K" then
		if kill_M5K[s_Inflictor.name] == nil then kill_M5K[s_Inflictor.name] = 0; end
	kill_M5K[s_Inflictor.name] = kill_M5K[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "AS VAL" then
		if kill_AS_VAL[s_Inflictor.name] == nil then kill_AS_VAL[s_Inflictor.name] = 0; end
	kill_AS_VAL[s_Inflictor.name] = kill_AS_VAL[s_Inflictor.name] + 1
        end
--

end)

return Common()

