-- Spaghetti code by iamadeadpixel

---@class Handguns
Handguns = class 'Handguns'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Handguns loaded ***");
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
--[[
	Here we collect handguns weapon data
]]

	if args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" or args[7] == "MP443" then
	kill_MP443[s_Inflictor.name] = kill_MP443[s_Inflictor.name] + 1
	if args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" then args[7] = "MP443" ; end

	Death_MP443[p_Player.name] = Death_MP443[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_MP443[p_Player.name] = Headshot_MP443[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MP443[p_Player.name]
	Dead_data = Death_MP443[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_MP443[s_Inflictor.name]
	end
--
	if args[7] == "MP412 REX" then
	kill_MP412_REX[s_Inflictor.name] = kill_MP412_REX[s_Inflictor.name] + 1

	Death_MP412_REX[p_Player.name] = Death_MP412_REX[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_MP412_REX[p_Player.name] = Headshot_MP412_REX[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MP412_REX[p_Player.name]
	Dead_data = Death_MP412_REX[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_MP412_REX[s_Inflictor.name]
	end
--
	if args[7] == "M9 SUPP" or args[7] == "M9 TACT" or args[7] == "M9" then
	kill_M9[s_Inflictor.name] = kill_M9[s_Inflictor.name] + 1
	if args[7] == "M9 SUPP" or args[7] == "M9 TACT" then args[7] = "M9" ; end

	Death_M9[p_Player.name] = Death_M9[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_M9[p_Player.name] = Headshot_M9[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M9[p_Player.name]
	Dead_data = Death_M9[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_M9[s_Inflictor.name]
	end
--
	if args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT" or args[7] == "M1911" then
	kill_M1911[s_Inflictor.name] = kill_M1911[s_Inflictor.name] + 1
	if args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT" then args[7] = "M1911" ; end

	Death_M1911[p_Player.name] = Death_M1911[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_M1911[p_Player.name] = Headshot_M1911[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M1911[p_Player.name]
	Dead_data = Death_M1911[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_M1911[s_Inflictor.name]
	end
--
	if args[7] == "G18 SUPP" or args[7] == "G18" then
	kill_G18[s_Inflictor.name] = kill_G18[s_Inflictor.name] + 1
	if args[7] == "G18 SUPP" then args[7] = "G18" ; end

	Death_G18[p_Player.name] = Death_G18[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_G18[p_Player.name] = Headshot_G18[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_G18[p_Player.name]
	Dead_data = Death_G18[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_G18[s_Inflictor.name]
	end
--
	if args[7] == "G17C SUPP" or args[7] == "G17C" then
	kill_G17C[s_Inflictor.name] = kill_G17C[s_Inflictor.name] + 1
	if args[7] == "G17C SUPP" then args[7] = "G17C" ; end

	Death_G17C[p_Player.name] = Death_G17C[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_G17C[p_Player.name] = Headshot_G17C[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_G17C[p_Player.name]
	Dead_data = Death_G17C[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_G17C[s_Inflictor.name]
	end
--
	if args[7] == "93R" then
	kill_93R[s_Inflictor.name] = kill_93R[s_Inflictor.name] + 1

	Death_93R[p_Player.name] = Death_93R[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_93R[p_Player.name] = Headshot_93R[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_93R[p_Player.name]
	Dead_data = Death_93R[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_93R[s_Inflictor.name]
	end
--
	if args[7] == ".44 MAGNUM" or args[7] == ".44 SCOPED" then
	kill_44_MAGNUM[s_Inflictor.name] = kill_44_MAGNUM[s_Inflictor.name] + 1
	if args[7] == ".44 SCOPED" then args[7] = ".44 MAGNUM" ; end

	Death_44_MAGNUM[p_Player.name] = Death_44_MAGNUM[p_Player.name] + 1  -- Victim
	if p_IsHeadShot then 
	Headshot_44_MAGNUM[p_Player.name] = Headshot_44_MAGNUM[p_Player.name] + 1  -- Victim
	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_44_MAGNUM[p_Player.name]
	Dead_data = Death_44_MAGNUM[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_handguns_msg then
	data_handguns_msg(player, data_playername)
	end

	data_weaponkills = kill_44_MAGNUM[s_Inflictor.name]
	end
--

	if args[7] == ".44 MAGNUM" or args[7] == ".44 SCOPED" or args[7] == "93R" or args[7] == "G17C SUPP" or args[7] == "G17C"
	or args[7] == "G18 SUPP" or args[7] == "G18" or args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT"
	or args[7] == "M1911" or args[7] == "M9 SUPP" or args[7] == "M9 TACT" or args[7] == "M9" or args[7] == "MP412 REX"
	or args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" or args[7] == "MP443" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_handguns_weapons"
	data_catagory = "Handguns weapon data:"
	data_playername = killer_name
	data_handguns(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_handguns(data_playername)
	end

end)

-- ------------------------------------------------------

function data_handguns_msg(player, data_playername)
	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_handguns(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_handguns1 then
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

	if Config.consolespam_handguns2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_handguns3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_handguns4 then
	print("")
	print (data_table_name.." injection done")
	end

else

	if Config.consolespam_airvehicles5 then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end

end
end -- End of function call

-- ------------------------------------------------------

return Handguns()

