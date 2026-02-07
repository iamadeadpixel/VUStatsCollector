-- Spaghetti code by iamadeadpixel

---@class Roadkill
Roadkill = class 'Roadkill'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Roadkill stuff loaded ***");
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

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[s_Inflictor.name] ~= s_Inflictor.name then return end
	end

-- ------------------------------------------------------
-- Here we collect roadkill stuff

		--	Roadkills ! ,seting up criteria
		if p_IsRoadKill then
			if args[7] == "SUICIDE" or args[7] == "IS NO MORE" or args[7] == "TEAMKILL" then
				return
			else
	if kill_roadkills[s_Inflictor.name] == nil then kill_roadkills[s_Inflictor.name] = 0 ; end
	kill_roadkills[s_Inflictor.name] = kill_roadkills[s_Inflictor.name] + 1

	if Death_roadkills[p_Player.name] == nil then Death_roadkills[p_Player.name] = 0 ; end  -- Victim
	Death_roadkills[p_Player.name] = Death_roadkills[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_roadkills[p_Player.name] == nil then Headshot_roadkills[p_Player.name] = 0 ; end  -- Victim
	Headshot_roadkills[p_Player.name] = Headshot_roadkills[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_roadkills[p_Player.name]
	Dead_data = Death_roadkills[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_roadkill_msg then
	args[7] = "ROADKILL"
	data_roadkill_msg(player, data_playername)
	end

-- Read and set kill status
	data_weaponkills = kill_roadkills[s_Inflictor.name]
	data_weapon_name = "Roadkills"
	data_table_name = "tbl_roadkills"
	data_catagory = "Roadkill data:"
	data_playername = killer_name
	data_roadkill(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_roadkill(data_playername)

end
end
end)

-- ------------------------------------------------------

function data_roadkill_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got Roadkilled , thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got roadkilled , thanks to "..killer_name.."`s "..args[7].."  and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_roadkill(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_roadkill1 then
	print ("")
	print (data_catagory.." Weapon name:"..data_weapon_name)
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print (data_catagory.." Weapon kills:"..data_weaponkills)
	print ("")
	print ("Accessing "..data_table_name)
	end

	Results = SQL:Query('SELECT Weaponname, Soldiername FROM '..data_table_name..' WHERE Soldiername = ? and Weaponname = ?', data_playername,data_weapon_name) -- works

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	if Config.consolespam_roadkill2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_roadkill3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths) VALUES (?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_roadkill4 then
	print("")
	print (data_table_name.." injection done")
	end

else

	if Config.consolespam_roadkill5 then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end

end
end -- End of function call

-- ------------------------------------------------------

return Roadkill()

