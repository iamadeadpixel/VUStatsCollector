-- Spaghetti code by iamadeadpixel

---@class reconweapons
reconweapons = class 'reconweapons'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** recon weapons Kill mod loaded ***"); 

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

	if getnamehuman[s_Inflictor.name] and args[7] == "JNG-90" then
		if kill_JNG_90[s_Inflictor.name] == nil then kill_JNG_90[s_Inflictor.name] = 0; end
	kill_JNG_90[s_Inflictor.name] = kill_JNG_90[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "L96" then
		if kill_L96[s_Inflictor.name] == nil then kill_L96[s_Inflictor.name] = 0; end
	kill_L96[s_Inflictor.name] = kill_L96[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M39 EMR" then
		if kill_M39_EMR[s_Inflictor.name] == nil then kill_M39_EMR[s_Inflictor.name] = 0; end
	kill_M39_EMR[s_Inflictor.name] = kill_M39_EMR[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M40A5" then
		if kill_M40A5[s_Inflictor.name] == nil then kill_M40A5[s_Inflictor.name] = 0; end
	kill_M40A5[s_Inflictor.name] = kill_M40A5[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M417" then
		if kill_M417[s_Inflictor.name] == nil then kill_M417[s_Inflictor.name] = 0; end
	kill_M417[s_Inflictor.name] = kill_M417[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "M98B" then
		if kill_M98B[s_Inflictor.name] == nil then kill_M98B[s_Inflictor.name] = 0; end
	kill_M98B[s_Inflictor.name] = kill_M98B[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "MK11 MOD 0" then
		if kill_MK11_MOD_0[s_Inflictor.name] == nil then kill_MK11_MOD_0[s_Inflictor.name] = 0; end
	kill_MK11_MOD_0[s_Inflictor.name] = kill_MK11_MOD_0[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "QBU-88" then
		if kill_QBU_88[s_Inflictor.name] == nil then kill_QBU_88[s_Inflictor.name] = 0; end
	kill_QBU_88[s_Inflictor.name] = kill_QBU_88[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "SKS" then
		if kill_SKS[s_Inflictor.name] == nil then kill_SKS[s_Inflictor.name] = 0; end
	kill_SKS[s_Inflictor.name] = kill_SKS[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "SV98" then
		if kill_SV98[s_Inflictor.name] == nil then kill_SV98[s_Inflictor.name] = 0; end
	kill_SV98[s_Inflictor.name] = kill_SV98[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] and args[7] == "SVD" then
		if kill_SVD[s_Inflictor.name] == nil then kill_SVD[s_Inflictor.name] = 0; end
	kill_SVD[s_Inflictor.name] = kill_SVD[s_Inflictor.name] + 1
        end
--

end)


return reconweapons()

