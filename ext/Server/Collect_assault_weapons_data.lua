-- Spaghetti code by iamadeadpixel

---@class Assault
Assault = class 'Assault'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Assault weapons loaded ***");
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
	Here we collect assault weapon data
]]

	if args[7] == "AEK-971" then

	if kill_AEK_971[s_Inflictor.name] == nil then kill_AEK_971[s_Inflictor.name] = 0 ; end
	kill_AEK_971[s_Inflictor.name] = kill_AEK_971[s_Inflictor.name] + 1 -- Killer

	if Death_AEK_971[p_Player.name] == nil then Death_AEK_971[p_Player.name] = 0 ; end
	Death_AEK_971[p_Player.name] = Death_AEK_971[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AEK_971[p_Player.name] == nil then Headshot_AEK_971[p_Player.name] = 0 ; end
	Headshot_AEK_971[p_Player.name] = Headshot_AEK_971[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AEK_971[p_Player.name]
	Dead_data = Death_AEK_971[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_AEK_971[s_Inflictor.name]
	end
--
	if args[7] == "AK-74M" then

	if kill_AK_74M[s_Inflictor.name] == nil then kill_AK_74M[s_Inflictor.name] = 0 ; end
	kill_AK_74M[s_Inflictor.name] = kill_AK_74M[s_Inflictor.name] + 1

	if Death_AK_74M[p_Player.name] == nil then Death_AK_74M[p_Player.name] = 0 ; end
	Death_AK_74M[p_Player.name] = Death_AK_74M[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AK_74M[p_Player.name] == nil then Headshot_AK_74M[p_Player.name] = 0 ; end
	Headshot_AK_74M[p_Player.name] = Headshot_AK_74M[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AK_74M[p_Player.name]
	Dead_data = Death_AK_74M[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_AK_74M[s_Inflictor.name]
	end
--
	if args[7] == "AN-94" then

	if kill_AN_94[s_Inflictor.name] == nil then kill_AN_94[s_Inflictor.name] = 0 ; end
	kill_AN_94[s_Inflictor.name] = kill_AN_94[s_Inflictor.name] + 1

	if Death_AN_94[p_Player.name] == nil then Death_AN_94[p_Player.name] = 0; end
	Death_AN_94[p_Player.name] = Death_AN_94[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AN_94[p_Player.name] == nil then Headshot_AN_94[p_Player.name] = 0; end
	Headshot_AN_94[p_Player.name] = Headshot_AN_94[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AN_94[p_Player.name]
	Dead_data = Death_AN_94[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_AN_94[s_Inflictor.name]
	end
--
	if args[7] == "AUG A3" then

	if kill_AUG_A3[s_Inflictor.name] == nil then kill_AUG_A3[s_Inflictor.name] = 0; end
	kill_AUG_A3[s_Inflictor.name] = kill_AUG_A3[s_Inflictor.name] + 1

	if Death_AUG_A3[p_Player.name] == nil then Death_AUG_A3[p_Player.name] = 0; end
	Death_AUG_A3[p_Player.name] = Death_AUG_A3[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_AUG_A3[p_Player.name] == nil then Headshot_AUG_A3[p_Player.name] = 0; end
	Headshot_AUG_A3[p_Player.name] = Headshot_AUG_A3[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_AUG_A3[p_Player.name]
	Dead_data = Death_AUG_A3[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_AUG_A3[s_Inflictor.name]
	end
--
	if args[7] == "F2000" then

	if kill_F2000[s_Inflictor.name] == nil then kill_F2000[s_Inflictor.name] = 0; end
	kill_F2000[s_Inflictor.name] = kill_F2000[s_Inflictor.name] + 1

	if Death_F2000[p_Player.name] == nil then Death_F2000[p_Player.name] = 0; end
	Death_F2000[p_Player.name] = Death_F2000[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_F2000[p_Player.name] == nil then Headshot_F2000[p_Player.name] = 0; end
	Headshot_F2000[p_Player.name] = Headshot_F2000[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_F2000[p_Player.name]
	Dead_data = Death_F2000[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_F2000[s_Inflictor.name]
	end
--
	if args[7] == "FAMAS" then

	if kill_FAMAS[s_Inflictor.name] == nil then kill_FAMAS[s_Inflictor.name] = 0; end
	kill_FAMAS[s_Inflictor.name] = kill_FAMAS[s_Inflictor.name] + 1

	if Death_FAMAS[p_Player.name] == nil then Death_FAMAS[p_Player.name] = 0; end
	Death_FAMAS[p_Player.name] = Death_FAMAS[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_FAMAS[p_Player.name] == nil then Headshot_FAMAS[p_Player.name] = 0; end
	Headshot_FAMAS[p_Player.name] = Headshot_FAMAS[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_FAMAS[p_Player.name]
	Dead_data = Death_FAMAS[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_FAMAS[s_Inflictor.name]
	end
--
	if args[7] == "G3A3" then

	if kill_G3A3[s_Inflictor.name] == nil then kill_G3A3[s_Inflictor.name] = 0; end
	kill_G3A3[s_Inflictor.name] = kill_G3A3[s_Inflictor.name] + 1

	if Death_G3A3[p_Player.name] == nil then Death_G3A3[p_Player.name] = 0; end
	Death_G3A3[p_Player.name] = Death_G3A3[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_G3A3[p_Player.name] == nil then Headshot_G3A3[p_Player.name] = 0; end
	Headshot_G3A3[p_Player.name] = Headshot_G3A3[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_G3A3[p_Player.name]
	Dead_data = Death_G3A3[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_G3A3[s_Inflictor.name]
	end
--
	if args[7] == "KH2002" then

	if kill_KH2002[s_Inflictor.name] == nil then kill_KH2002[s_Inflictor.name] = 0; end
	kill_KH2002[s_Inflictor.name] = kill_KH2002[s_Inflictor.name] + 1

	if Death_KH2002[p_Player.name] == nil then Death_KH2002[p_Player.name] = 0; end
	Death_KH2002[p_Player.name] = Death_KH2002[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_KH2002[p_Player.name] == nil then Headshot_KH2002[p_Player.name] = 0; end
	Headshot_KH2002[p_Player.name] = Headshot_KH2002[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_KH2002[p_Player.name]
	Dead_data = Death_KH2002[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_KH2002[s_Inflictor.name]
	end
--
	if args[7] == "L85A2" then

	if kill_L85A2[s_Inflictor.name] == nil then kill_L85A2[s_Inflictor.name] = 0; end
	kill_L85A2[s_Inflictor.name] = kill_L85A2[s_Inflictor.name] + 1

	if Death_L85A2[p_Player.name] == nil then Death_L85A2[p_Player.name] = 0; end
	Death_L85A2[p_Player.name] = Death_L85A2[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_L85A2[p_Player.name] == nil then Headshot_L85A2[p_Player.name] = 0; end
	Headshot_L85A2[p_Player.name] = Headshot_L85A2[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_L85A2[p_Player.name]
	Dead_data = Death_L85A2[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_L85A2[s_Inflictor.name]
	end
--
	if args[7] == "M16A3" then

	if kill_M16A3[s_Inflictor.name] == nil then kill_M16A3[s_Inflictor.name] = 0; end
	kill_M16A3[s_Inflictor.name] = kill_M16A3[s_Inflictor.name] + 1

	if Death_M16A3[p_Player.name] == nil then Death_M16A3[p_Player.name] = 0; end
	Death_M16A3[p_Player.name] = Death_M16A3[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M16A3[p_Player.name] == nil then Headshot_M16A3[p_Player.name] = 0; end
	Headshot_M16A3[p_Player.name] = Headshot_M16A3[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M16A3[p_Player.name]
	Dead_data = Death_M16A3[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M16A3[s_Inflictor.name]
	end
--
	if args[7] == "M16A4" then

	if kill_M16A4[s_Inflictor.name] == nil then kill_M16A4[s_Inflictor.name] = 0; end
	kill_M16A4[s_Inflictor.name] = kill_M16A4[s_Inflictor.name] + 1

	if Death_M16A4[p_Player.name] == nil then Death_M16A4[p_Player.name] = 0; end
	Death_M16A4[p_Player.name] = Death_M16A4[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M16A4[p_Player.name] == nil then Headshot_M16A4[p_Player.name] = 0; end
	Headshot_M16A4[p_Player.name] = Headshot_M16A4[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M16A4[p_Player.name]
	Dead_data = Death_M16A4[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M16A4[s_Inflictor.name]
	end
--
	if args[7] == "M416" then

	if kill_M416[s_Inflictor.name] == nil then kill_M416[s_Inflictor.name] = 0; end
	kill_M416[s_Inflictor.name] = kill_M416[s_Inflictor.name] + 1

	if Death_M416[p_Player.name] == nil then Death_M416[p_Player.name] = 0; end
	Death_M416[p_Player.name] = Death_M416[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M416[p_Player.name] == nil then Headshot_M416[p_Player.name] = 0; end
	Headshot_M416[p_Player.name] = Headshot_M416[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M416[p_Player.name]
	Dead_data = Death_M416[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M416[s_Inflictor.name]
	end
--
	if args[7] == "SCAR-L" then

	if kill_SCAR_L[s_Inflictor.name] == nil then kill_SCAR_L[s_Inflictor.name] = 0; end
	kill_SCAR_L[s_Inflictor.name] = kill_SCAR_L[s_Inflictor.name] + 1

	if Death_SCAR_L[p_Player.name] == nil then Death_SCAR_L[p_Player.name] = 0; end
	Death_SCAR_L[p_Player.name] = Death_SCAR_L[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SCAR_L[p_Player.name] == nil then Headshot_SCAR_L[p_Player.name] = 0; end
	Headshot_SCAR_L[p_Player.name] = Headshot_SCAR_L[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SCAR_L[p_Player.name]
	Dead_data = Death_SCAR_L[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_weapons_msg then
	data_assault_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_SCAR_L[s_Inflictor.name]
	end
--

	if args[7] == "AEK-971" or args[7] == "AK-74M" or args[7] == "AN-94" or args[7] == "AUG A3"
	or args[7] == "F2000" or args[7] == "FAMAS" or args[7] == "G3A3" or args[7] == "KH2002" or args[7] == "L85A2"
	or args[7] == "M16A3" or args[7] == "M16A4" or args[7] == "M416" or args[7] == "SCAR-L" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_assault_weapons"
	data_catagory = "Assault weapon data:"
	data_playername = killer_name
	data_assault_weapons(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_assault_weapons(data_playername)
	end

end)

-- ------------------------------------------------------

function data_assault_weapons_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_assault_weapons(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_assault_weapons1 then
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

	if Config.consolespam_assault_weapons2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_assault_weapons3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths) VALUES (?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_assault_weapons4 then
	print("")
	print (data_table_name.." injection done")
	end

else

	if Config.consolespam_assault_weapons5 then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end

end
end -- End of function call

-- ------------------------------------------------------

return Assault()

