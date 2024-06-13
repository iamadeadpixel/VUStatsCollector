-- Spaghetti code by iamadeadpixel

---@class recongadgets
recongadgets = class 'recongadgets'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** recon gadgets Kill mod loaded ***"); 

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

	if args[7] == "MAV" then
		if kill_MAV[s_Inflictor.name] == nil then kill_MAV[s_Inflictor.name] = 0; end
		if death_MAV[p_Player.name] == nil then death_MAV[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_MAV[s_Inflictor.name] = kill_MAV[s_Inflictor.name] + 1
	death_MAV[p_Player.name] = death_MAV[p_Player.name] + 1
		end
        end
--
	if args[7] == "RADIO BEACON" then
		if kill_RADIO_BEACON[s_Inflictor.name] == nil then kill_RADIO_BEACON[s_Inflictor.name] = 0; end
		if death_RADIO_BEACON[p_Player.name] == nil then death_RADIO_BEACON[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_RADIO_BEACON[s_Inflictor.name] = kill_RADIO_BEACON[s_Inflictor.name] + 1
	death_RADIO_BEACON[p_Player.name] = death_RADIO_BEACON[p_Player.name] + 1
		end
        end
--
	if args[7] == "SOFLAM" then
		if kill_SOFLAM[s_Inflictor.name] == nil then kill_SOFLAM[s_Inflictor.name] = 0; end
		if death_SOFLAM[p_Player.name] == nil then death_SOFLAM[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_SOFLAM[s_Inflictor.name] = kill_SOFLAM[s_Inflictor.name] + 1
	death_SOFLAM[p_Player.name] = death_SOFLAM[p_Player.name] + 1
		end
        end
--
	if args[7] == "T-UGS" then
		if kill_T_UGS[s_Inflictor.name] == nil then kill_T_UGS[s_Inflictor.name] = 0; end
		if death_T_UGS[p_Player.name] == nil then death_T_UGS[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_T_UGS[s_Inflictor.name] = kill_T_UGS[s_Inflictor.name] + 1
	death_T_UGS[p_Player.name] = death_T_UGS[p_Player.name] + 1
		end
        end
--

end
end)


return recongadgets()

