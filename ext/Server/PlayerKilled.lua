---@class PlayerKilled
PlayerKilled = class 'PlayerKilled'

-- Most of the code is used from the killfeed mod, after some "personal tweaks"
-- Work in progress, provides now basic stuff

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** Player Killed mod loaded ***");
	end
end)


Events:Subscribe('Player:Killed',
	function(p_Player, p_Inflictor, p_Position, p_Weapon, p_IsRoadKill, p_IsHeadShot, p_WasVictimInReviveState, p_Info)
		if haltprocess then return end

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
		--
		-- Victim: args[1]
		-- TeamId: args[2]
		-- SquadId: args[3]
		-- Killer: args[4]
		-- Inflictor TeamId: args[5]
		-- Inflictor SquadId: args[6]
		-- Weapon: args[7]
		-- Roadkilled: args[8]
		-- Headshot: args[9]
		-- Revived: args[10]



		-- Print lines will be removed on the end
		--
		-- base setup for table variables nil -> 0
		if playerdeaths[p_Player.name] == nil then playerdeaths[p_Player.name] = 0; end
		if playersuicides[p_Player.name] == nil then playersuicides[p_Player.name] = 0; end
		if playerkills[s_Inflictor.name] == nil then playerkills[s_Inflictor.name] = 0; end
		if playerdeaths[p_Player.name] == nil then playerdeaths[p_Player.name] = 0; end
		if playerheadshot[s_Inflictor.name] == nil then playerheadshot[s_Inflictor.name] = 0; end
		if playerteamkilled[s_Inflictor.name] == nil then playerteamkilled[s_Inflictor.name] = 0; end
		if playerdogtags[s_Inflictor.name] == nil then playerdogtags[s_Inflictor.name] = 0; end

		if kill_roadkills[s_Inflictor.name] == nil then kill_roadkills[s_Inflictor.name] = 0; end
		if death_roadkills[p_Player.name] == nil then death_roadkills[p_Player.name] = 0; end

		if playerrevivs[s_Inflictor.name] == nil then playerrevivs[s_Inflictor.name] = 0; end
		if playerscore[s_Inflictor.name] == nil then playerscore[s_Inflictor.name] = 0; end


		--	print ("Weapon class for p_Weapon:"..p_Weapon)

		--	Roadkills ! ,seting up criteria
		if p_IsRoadKill then
			if args[7] == "SUICIDE" or args[7] == "IS NO MORE" or args[7] == "TEAMKILL" then
				return
			else
				if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
					--	if getnamehuman[s_Inflictor.name] then
					kill_roadkills[s_Inflictor.name] = kill_roadkills[s_Inflictor.name] + 1
					death_roadkills[p_Player.name] = death_roadkills[p_Player.name] + 1
					--	print("Woops, " ..args[1] .. " got roadkilled by a " .. args[7] .. ", " .. args[4] .. " is pissing is in pants, hehe")
					print("Roadkill Kill stats for " .. args[4] .. ":" .. kill_roadkills[s_Inflictor.name] .. " times")
					print("Roadkill Dead stats for " .. args[1] .. ":" .. death_roadkills[p_Player.name] .. " times")
				end
			end
		end
		--



		-- Counts suicides
		if args[7] == "SUICIDE" or args[7] == "IS NO MORE" then
			if getnamehuman[p_Player.name] or getnamebot[p_Player.name] then
				playersuicides[p_Player.name] = playersuicides[p_Player.name] + 1
				--	if getnamehuman[p_Player.name] then playersuicides[p_Player.name] = playersuicides[p_Player.name] + 1
				playerdeaths[p_Player.name] = playerdeaths[p_Player.name] + 1
				--	print("Player "..args[1].." suicided:"..playersuicides[p_Player.name].." times,arg used:"..args[7].." - dead count is "..playerdeaths[p_Player.name].." total")
			end
		end
		--

		-- Counts kills
		if args[1] ~= args[4] and args[7] ~= "TEAMKILL" then
			if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
				playerkills[s_Inflictor.name] = playerkills[s_Inflictor.name] + 1
				--	if getnamehuman[s_Inflictor.name] then playerkills[s_Inflictor.name] = playerkills[s_Inflictor.name] + 1
				--	print("Player "..args[4].." killed:"..playerkills[s_Inflictor.name].." enemies - arg used:"..args[7])
			end
		end
		--

		-- Counts deaths
		if args[1] ~= args[4] then
			if getnamehuman[p_Player.name] or getnamebot[p_Player.name] then
				playerdeaths[p_Player.name] = playerdeaths[p_Player.name] + 1
				--	if getnamehuman[p_Player.name] then playerdeaths[p_Player.name] = playerdeaths[p_Player.name] + 1
				--	print("Player "..args[1].." died:"..playerdeaths[p_Player.name].." times")
			end
		end
		--

		-- Counts headshot
		if p_IsHeadShot then
			if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
				playerheadshot[s_Inflictor.name] = playerheadshot[s_Inflictor.name] + 1
				--	if getnamehuman[s_Inflictor.name] then playerheadshot[s_Inflictor.name] = playerheadshot[s_Inflictor.name] + 1
				--	print("Player "..args[4].." headshot kill "..playerheadshot[s_Inflictor.name].." times")
			end
		end
		--

		-- Count knife kills
		if args[7] == "KNIFE" or args[7] == "ACB-90" then
			if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
				playerdogtags[s_Inflictor.name] = playerdogtags[s_Inflictor.name] + 1
				--	if getnamehuman[s_Inflictor.name] then 	playerdogtags[s_Inflictor.name] = playerdogtags[s_Inflictor.name] + 1
				--		print ("*** Player "..args[1].. " got a free razor cut with a "..args[7].." Killer "..args[4].." slith "..playerdogtags[s_Inflictor.name].." times a trouth with the "..args[7])
			end
		end
		--

		-- Count TeamKilled
		if args[7] == "TEAMKILL" then
			if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then
				playerteamkilled[s_Inflictor.name] = playerteamkilled[s_Inflictor.name] + 1
				--	if getnamehuman[s_Inflictor.name] or getnamebot[s_Inflictor.name] then playerkills[s_Inflictor.name] = playerkills[s_Inflictor.name] - 1
				--	if getnamehuman[s_Inflictor.name] then playerteamkilled[s_Inflictor.name] = playerteamkilled[s_Inflictor.name] + 1
				--			print ("*** Player "..args[1].. " Got teamkilled, oeps,"..args[7].." Killer "..args[4].." was a bad boy, and TK'd "..playerteamkilled[s_Inflictor.name].." times")
			end
		end

		--
	end)


return PlayerKilled()
