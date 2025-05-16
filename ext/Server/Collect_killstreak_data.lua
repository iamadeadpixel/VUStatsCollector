-- Spaghetti code by iamadeadpixel

---@class killstreak
killstreak = class 'killstreak'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** killstreak stuff loaded ***");
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

-- ------------------------------------------------------

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[s_Inflictor.name] ~= s_Inflictor.name then return end
	end

-- ---------------------------------
-- Here we collect killstreak stuff
-- ---------------------------------

		-- Counts kills
		if args[1] ~= args[4] and args[7] ~= "TEAMKILL" then
	data_playername = s_Inflictor.name

	do data_killstreak_firstcounter(data_playername)
	end

-- ---------------------------------

		-- Count TeamKilled
		if  args[7] == "TEAMKILL" then
	data_playername = s_Inflictor.name

	do data_killstreak_death_dataupdater(data_playername)
	end
	end
-- ------------------------------------------------------

		-- Counts suicides
		if args[7] == "SUICIDE" or args[7] == "IS NO MORE" then
	data_playername = p_Player.name

	do data_killstreak_death_dataupdater(data_playername)
	end
	end
-- ---------------------------------

		-- Counts deaths
		if args[1] ~= args[4] then
	data_playername = p_Player.name

	do data_killstreak_death_dataupdater(data_playername)
	end
	end
    end
end)

-- ------------------------------------------------------

function data_killstreak_firstcounter(data_playername)

		if killstreak[data_playername] == nil then  killstreak[data_playername] = 0 ; end
		killstreak[data_playername] = killstreak[data_playername] + 1
		if killstreak_lock[data_playername] == nil then killstreak_lock[data_playername] = 0 ; end
		if killstreak_counter[data_playername] == nil then killstreak_counter[data_playername] = 0 ; end

		if killstreak[data_playername] >= KS_limit and killstreak_lock[data_playername] == 0 then 
		killstreak_counter[data_playername] = 1
	killstreak_lock[data_playername] = 1

end
end -- End of function call

-- ------------------------------------------------------

function data_killstreak_death_dataupdater(data_playername)
		if killstreak[data_playername] == nil then  killstreak[data_playername] = 0 ; end
		if killstreak_lock[data_playername] == nil then killstreak_lock[data_playername] = 0 ; end
		if killstreak_counter[data_playername] == nil then killstreak_counter[data_playername] = 0 ; end

		if killstreak[data_playername] <= 4 then killstreak[data_playername] = 0
		end

		if killstreak[data_playername] >= KS_limit then 
		killstreak[data_playername] = 0
		previouscounter = killstreak_counter[data_playername]
		killstreak_counter[data_playername] = killstreak_counter[data_playername] + 1 -- counts the total kill streaks

end
end -- End of function call

-- ------------------------------------------------------

return killstreak()
