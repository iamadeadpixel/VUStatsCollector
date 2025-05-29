-- Spaghetti code by iamadeadpixel

---@class Teamkill
Teamkill = class 'Teamkill'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Teamkill stuff loaded ***");
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
-- Here we collect Teamkill stuff
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

		-- Count TeamKilled
	if  args[7] == "TEAMKILL" then
	if TeamKilled_Killer[s_Inflictor.name] == nil then TeamKilled_Killer[s_Inflictor.name] = 0; end -- Killer
	if TeamKilled_Victim[p_Player.name] == nil then TeamKilled_Victim[p_Player.name] = 0 ; end  -- Victim

	TeamKilled_Killer[s_Inflictor.name] = TeamKilled_Killer[s_Inflictor.name] + 1 -- Killer
	TeamKilled_Victim[p_Player.name] = TeamKilled_Victim[p_Player.name] + 1  -- Victim

	Dead_data = TeamKilled_Victim[p_Player.name]

	if Config.consolespam_teamkill_msg then
	args[7] = "TEAMKILL"
	data_teamkill_msg(player, data_playername)
	end

	data_catagory = "Teamkill data:"
	data_table_name = "tbl_teamkilled"
	data_playername = killer_name
	data_teamkill(data_playername)

	data_playername = victim_name
	data_teamkill(data_playername)

	end
end)

-- ------------------------------------------------------

function data_teamkill_msg(player, data_playername)

	print ("player "..victim_name.." got killed , thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times due "..args[7])

end -- End of function call

-- ------------------------------------------------------

function data_teamkill(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_teamkill1 then
	print ("")
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print ("")
	print ("Accessing "..data_table_name)
	end

	Results = SQL:Query('SELECT Soldiername FROM tbl_teamkilled WHERE Soldiername = ?', data_playername)

	if not Results then
	print('Failed to execute table tbl_teamkilled for query: ' .. SQL:Error())
	return
	end

	if Config.consolespam_teamkill2 then
	print ("Done reading tbl_teamkilled")
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_teamkill3 then
print("No data found for "..data_playername.." and TeamKilled_Killer / TeamKilled_Victim - Injecting now")
	end

		           s_Query = 'INSERT INTO tbl_teamkilled   (Soldiername,    TeamKilled_Killer, TeamKilled_Victim) VALUES (?,?,?)'
			                if not SQL:Query(s_Query, data_playername,       0,                 0) then
			print(" - Failed to insert teamkill data in tbl_teamkilled: " .. SQL:Error())
			return
	end

	if Config.consolespam_teamkill4 then
	print("")
	print ("tbl_teamkilled injection done")
	end

else

	if Config.consolespam_teamkill5 then
print("found data: "..data_playername.." and TeamKilled_Killer / TeamKilled_Victim")
	end

end
end -- End of function call

-- ------------------------------------------------------

return Teamkill()

