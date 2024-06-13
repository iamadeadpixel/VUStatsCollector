-- Spaghetti code by iamadeadpixel

---@class Common
Common = class 'Common'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** auxiliary weapons Kill mod loaded ***"); 

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

			if args[7] == "M67 GRENADE" then
		if kill_M67_GRENADE[s_Inflictor.name] == nil then kill_M67_GRENADE[s_Inflictor.name] = 0; end
		if death_M67_GRENADE[p_Player.name] == nil then death_M67_GRENADE[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_M67_GRENADE[s_Inflictor.name] = kill_M67_GRENADE[s_Inflictor.name] + 1
	death_M67_GRENADE[p_Player.name] = death_M67_GRENADE[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("M67 GRENADE Kill stats for "..args[4]..":"..kill_M67_GRENADE[s_Inflictor.name].." times")
			print ("M67 GRENADE Dead stats for "..args[1]..":"..death_M67_GRENADE[p_Player.name].." times")
		end
        end
--
			if args[7] == "XBOW" then
		if kill_XBOW[s_Inflictor.name] == nil then kill_XBOW[s_Inflictor.name] = 0; end
		if death_XBOW[p_Player.name] == nil then death_XBOW[p_Player.name] = 0;	end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_XBOW[s_Inflictor.name] = kill_XBOW[s_Inflictor.name] + 1
	death_XBOW[p_Player.name] = death_XBOW[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("XBOW kill stats for "..args[4]..":"..kill_XBOW[s_Inflictor.name].." times")
			print ("XBOW dead stats for "..args[1]..":"..death_XBOW[p_Player.name].." times")
		end
        end
--
			if args[7] == "KNIFE" or args[7] == "ACB-90" then
		if kill_KNIFE[s_Inflictor.name] == nil then kill_KNIFE[s_Inflictor.name] = 0; end
		if death_KNIFE[p_Player.name] == nil then death_KNIFE[p_Player.name] = 0; end

	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
	kill_KNIFE[s_Inflictor.name] = kill_KNIFE[s_Inflictor.name] + 1
	death_KNIFE[p_Player.name] = death_KNIFE[p_Player.name] + 1
--			print ("*** victim "..args[1].. " Got killed with "..args[7].." - inflictor was "..args[4])
			print ("KNIFE Kill stats for "..args[4]..":"..kill_KNIFE[s_Inflictor.name].." times")
			print ("KNIFE Dead stats for "..args[1]..":"..death_KNIFE[p_Player.name].." times")
		end
        end
--

end
end)

return Common()

