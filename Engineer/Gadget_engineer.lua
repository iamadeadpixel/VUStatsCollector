-- Spaghetti code by iamadeadpixel

---@class engineergadgets
engineergadgets = class 'engineergadgets'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** engineer gadgets weapons Kill mod loaded ***"); 

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

	if playerscollected[s_Inflictor.name] and args[7] == "EOD BOT" then
		if kill_EOD_BOT[s_Inflictor.name] == nil then kill_EOD_BOT[s_Inflictor.name] = 0; end
	kill_EOD_BOT[s_Inflictor.name] = kill_EOD_BOT[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "FGM-148 JAVELIN" then
		if kill_FGM_148_JAVELIN[s_Inflictor.name] == nil then kill_FGM_148_JAVELIN[s_Inflictor.name] = 0; end
	kill_FGM_148_JAVELIN[s_Inflictor.name] = kill_FGM_148_JAVELIN[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "FIM-92 STINGER" then
		if kill_FIM_92_STINGER[s_Inflictor.name] == nil then kill_FIM_92_STINGER[s_Inflictor.name] = 0; end
	kill_FIM_92_STINGER[s_Inflictor.name] = kill_FIM_92_STINGER[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "M15 AT MINE" then
		if kill_M15_AT_MINE[s_Inflictor.name] == nil then kill_M15_AT_MINE[s_Inflictor.name] = 0; end
	kill_M15_AT_MINE[s_Inflictor.name] = kill_M15_AT_MINE[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "REPAIR TOOL" then
		if kill_REPAIR_TOOL[s_Inflictor.name] == nil then kill_REPAIR_TOOL[s_Inflictor.name] = 0; end
	kill_REPAIR_TOOL[s_Inflictor.name] = kill_REPAIR_TOOL[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "RPG-7V2" then
		if kill_RPG_7V2[s_Inflictor.name] == nil then kill_RPG_7V2[s_Inflictor.name] = 0; end
	kill_RPG_7V2[s_Inflictor.name] = kill_RPG_7V2[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "SA-18 IGLA" then
		if kill_SA_18_IGLA[s_Inflictor.name] == nil then kill_SA_18_IGLA[s_Inflictor.name] = 0; end
	kill_SA_18_IGLA[s_Inflictor.name] = kill_SA_18_IGLA[s_Inflictor.name] + 1
        end
--
	if playerscollected[s_Inflictor.name] and args[7] == "SMAW" then
		if kill_SMAW[s_Inflictor.name] == nil then kill_SMAW[s_Inflictor.name] = 0; end
	kill_SMAW[s_Inflictor.name] = kill_SMAW[s_Inflictor.name] + 1
        end
--

end)


return engineergadgets()

