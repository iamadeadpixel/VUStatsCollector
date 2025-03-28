-- Spaghetti code by iamadeadpixel

---@class basedata
basedata = class 'basedata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Base stuff loaded ***");
	end
	end
end)

Events:Subscribe('Player:Killed',function(p_Player, p_Inflictor, p_Position, p_Weapon, p_IsRoadKill, p_IsHeadShot, p_WasVictimInReviveState, p_Info)
		if haltprocess then return end

		args = { p_Player.name, p_Player.teamId, p_Player.squadId }
		local s_Inflictor

		if p_Inflictor ~= nil then
			s_Inflictor = p_Inflictor
		else
			s_Inflictor = p_Player
		end

		args[4] = s_Inflictor.name

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


-- Print lines will be removed on the end
-- ------------------------------------------------------

-- Here we collect the base stats for tbl_playerstats

		-- Counts suicides
		if args[7] == "SUICIDE" or args[7] == "IS NO MORE" then
		if playersuicides[p_Player.name] == nil then playersuicides[p_Player.name] = 0; end
		if playerdeaths[p_Player.name] == nil then playerdeaths[p_Player.name] = 0; end
		playersuicides[p_Player.name] = playersuicides[p_Player.name] + 1
		playerdeaths[p_Player.name] = playerdeaths[p_Player.name] + 1
		end
		--

		-- Counts kills
		if args[1] ~= args[4] and args[7] ~= "TEAMKILL" then
		if playerkills[s_Inflictor.name] == nil then playerkills[s_Inflictor.name] = 0; end
		playerkills[s_Inflictor.name] = playerkills[s_Inflictor.name] + 1
		end
		--

		-- Counts deaths
		if args[1] ~= args[4] then
		if playerdeaths[p_Player.name] == nil then playerdeaths[p_Player.name] = 0; end
		playerdeaths[p_Player.name] = playerdeaths[p_Player.name] + 1
		end
		--

		-- Counts headshot
		if p_IsHeadShot then
		if playerheadshot[s_Inflictor.name] == nil then playerheadshot[s_Inflictor.name] = 0; end
		playerheadshot[s_Inflictor.name] = playerheadshot[s_Inflictor.name] + 1
		end
		--

		-- Count TeamKilled
		if  args[7] == "TEAMKILL" then
		if playerteamkilled[s_Inflictor.name] == nil then playerteamkilled[s_Inflictor.name] = 0; end
		playerteamkilled[s_Inflictor.name] = playerteamkilled[s_Inflictor.name] + 1
		end

end)

-- ------------------------------------------------------

return basedata()

