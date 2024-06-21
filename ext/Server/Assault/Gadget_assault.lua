-- Spaghetti code by iamadeadpixel

---@class AssaultGadgets
AssaultGadgets = class 'AssaultGadgets'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** Assault Gadgets weapons Kill mod loaded ***"); 

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

	if getnamehuman[s_Inflictor.name] and args[7] == "M320 SMOKE" then
		if kill_M320_SMOKE[s_Inflictor.name] == nil then kill_M320_SMOKE[s_Inflictor.name] = 0; end
	kill_M320_SMOKE[s_Inflictor.name] = kill_M320_SMOKE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M320 LVG" then
		if kill_M320_LVG[s_Inflictor.name] == nil then kill_M320_LVG[s_Inflictor.name] = 0; end
	kill_M320_LVG[s_Inflictor.name] = kill_M320_LVG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M320 HE" then
		if kill_M320_HE[s_Inflictor.name] == nil then kill_M320_HE[s_Inflictor.name] = 0; end
	kill_M320_HE[s_Inflictor.name] = kill_M320_HE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M320 BUCK" then
		if kill_M320_BUCK[s_Inflictor.name] == nil then kill_M320_BUCK[s_Inflictor.name] = 0; end
	kill_M320_BUCK[s_Inflictor.name] = kill_M320_BUCK[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M26 SLUG" then
		if kill_M26_SLUG[s_Inflictor.name] == nil then kill_M26_SLUG[s_Inflictor.name] = 0; end
	kill_M26_SLUG[s_Inflictor.name] = kill_M26_SLUG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M26 MASS" then
		if kill_M26_MASS[s_Inflictor.name] == nil then kill_M26_MASS[s_Inflictor.name] = 0; end
	kill_M26_MASS[s_Inflictor.name] = kill_M26_MASS[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M26 FRAG" then
		if kill_M26_FRAG[s_Inflictor.name] == nil then kill_M26_FRAG[s_Inflictor.name] = 0; end
	kill_M26_FRAG[s_Inflictor.name] = kill_M26_FRAG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M26 DART" then
		if kill_M26_DART[s_Inflictor.name] == nil then kill_M26_DART[s_Inflictor.name] = 0; end
	kill_M26_DART[s_Inflictor.name] = kill_M26_DART[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "GP-30 SMOKE" then
		if kill_GP_30_SMOKE[s_Inflictor.name] == nil then kill_GP_30_SMOKE[s_Inflictor.name] = 0; end
	kill_GP_30_SMOKE[s_Inflictor.name] = kill_GP_30_SMOKE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "GP-30 LVG" then
		if kill_GP_30_LVG[s_Inflictor.name] == nil then kill_GP_30_LVG[s_Inflictor.name] = 0; end
	kill_GP_30_LVG[s_Inflictor.name] = kill_GP_30_LVG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "GP-30 HE" then
		if kill_GP_30_HE[s_Inflictor.name] == nil then kill_GP_30_HE[s_Inflictor.name] = 0; end
	kill_GP_30_HE[s_Inflictor.name] = kill_GP_30_HE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "GP-30 DART" then
		if kill_GP_30_DART[s_Inflictor.name] == nil then kill_GP_30_DART[s_Inflictor.name] = 0; end
	kill_GP_30_DART[s_Inflictor.name] = kill_GP_30_DART[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "GP-30 BUCK" then
		if kill_GP_30_BUCK[s_Inflictor.name] == nil then kill_GP_30_BUCK[s_Inflictor.name] = 0; end
	kill_GP_30_BUCK[s_Inflictor.name] = kill_GP_30_BUCK[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "MEDIC KIT" then
		if kill_MEDIC_KIT[s_Inflictor.name] == nil then kill_MEDIC_KIT[s_Inflictor.name] = 0; end
	kill_MEDIC_KIT[s_Inflictor.name] = kill_MEDIC_KIT[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "DEFIBRILLATOR" then
		if kill_DEFIBRILLATOR[s_Inflictor.name] == nil then kill_DEFIBRILLATOR[s_Inflictor.name] = 0; end
	kill_DEFIBRILLATOR[s_Inflictor.name] = kill_DEFIBRILLATOR[s_Inflictor.name] + 1
        end
--

end)


return AssaultGadgets()
