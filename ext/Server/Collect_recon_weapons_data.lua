-- Spaghetti code by iamadeadpixel

---@class Recon
Recon = class 'Recon'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Recon weapons loaded ***");
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
	Here we collect recon weapon data
]]

	if args[7] == "JNG-90" then
	if kill_JNG_90[s_Inflictor.name] == nil then kill_JNG_90[s_Inflictor.name] = 0 ; end
	kill_JNG_90[s_Inflictor.name] = kill_JNG_90[s_Inflictor.name] + 1

	if Death_JNG_90[p_Player.name] == nil then Death_JNG_90[p_Player.name] = 0 ; end  -- Victim
	Death_JNG_90[p_Player.name] = Death_JNG_90[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_JNG_90[p_Player.name] == nil then Headshot_JNG_90[p_Player.name] = 0 ; end  -- Victim
	Headshot_JNG_90[p_Player.name] = Headshot_JNG_90[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_JNG_90[p_Player.name]
	Dead_data = Death_JNG_90[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_JNG_90[s_Inflictor.name]
	end
--
	if args[7] == "L96" then
	if kill_L96[s_Inflictor.name] == nil then kill_L96[s_Inflictor.name] = 0 ; end
	kill_L96[s_Inflictor.name] = kill_L96[s_Inflictor.name] + 1

	if Death_L96[p_Player.name] == nil then Death_L96[p_Player.name] = 0 ; end  -- Victim
	Death_L96[p_Player.name] = Death_L96[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_L96[p_Player.name] == nil then Headshot_L96[p_Player.name] = 0 ; end  -- Victim
	Headshot_L96[p_Player.name] = Headshot_L96[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_L96[p_Player.name]
	Dead_data = Death_L96[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_L96[s_Inflictor.name]
	end
--
	if args[7] == "M39 EMR" then
	if kill_M39_EMR[s_Inflictor.name] == nil then kill_M39_EMR[s_Inflictor.name] = 0 ; end
	kill_M39_EMR[s_Inflictor.name] = kill_M39_EMR[s_Inflictor.name] + 1

	if Death_M39_EMR[p_Player.name] == nil then Death_M39_EMR[p_Player.name] = 0 ; end  -- Victim
	Death_M39_EMR[p_Player.name] = Death_M39_EMR[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M39_EMR[p_Player.name] == nil then Headshot_M39_EMR[p_Player.name] = 0 ; end  -- Victim
	Headshot_M39_EMR[p_Player.name] = Headshot_M39_EMR[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M39_EMR[p_Player.name]
	Dead_data = Death_M39_EMR[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M39_EMR[s_Inflictor.name]
	end
--
	if args[7] == "M40A5" then
	if kill_M40A5[s_Inflictor.name] == nil then kill_M40A5[s_Inflictor.name] = 0 ; end
	kill_M40A5[s_Inflictor.name] = kill_M40A5[s_Inflictor.name] + 1

	if Death_M40A5[p_Player.name] == nil then Death_M40A5[p_Player.name] = 0 ; end  -- Victim
	Death_M40A5[p_Player.name] = Death_M40A5[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M40A5[p_Player.name] == nil then Headshot_M40A5[p_Player.name] = 0 ; end  -- Victim
	Headshot_M40A5[p_Player.name] = Headshot_M40A5[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M40A5[p_Player.name]
	Dead_data = Death_M40A5[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M40A5[s_Inflictor.name]
	end
--
	if args[7] == "M417" then
	if kill_M417[s_Inflictor.name] == nil then kill_M417[s_Inflictor.name] = 0 ; end
	kill_M417[s_Inflictor.name] = kill_M417[s_Inflictor.name] + 1

	if Death_M417[p_Player.name] == nil then Death_M417[p_Player.name] = 0 ; end  -- Victim
	Death_M417[p_Player.name] = Death_M417[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M417[p_Player.name] == nil then Headshot_M417[p_Player.name] = 0 ; end  -- Victim
	Headshot_M417[p_Player.name] = Headshot_M417[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M417[p_Player.name]
	Dead_data = Death_M417[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M417[s_Inflictor.name]
	end
--
	if args[7] == "M98B" then
	if kill_M98B[s_Inflictor.name] == nil then kill_M98B[s_Inflictor.name] = 0 ; end
	kill_M98B[s_Inflictor.name] = kill_M98B[s_Inflictor.name] + 1

	if Death_M98B[p_Player.name] == nil then Death_M98B[p_Player.name] = 0 ; end  -- Victim
	Death_M98B[p_Player.name] = Death_M98B[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M98B[p_Player.name] == nil then Headshot_M98B[p_Player.name] = 0 ; end  -- Victim
	Headshot_M98B[p_Player.name] = Headshot_M98B[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M98B[p_Player.name]
	Dead_data = Death_M98B[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_M98B[s_Inflictor.name]
	end
--
	if args[7] == "MK11 MOD 0" then
	if kill_MK11_MOD_0[s_Inflictor.name] == nil then kill_MK11_MOD_0[s_Inflictor.name] = 0 ; end
	kill_MK11_MOD_0[s_Inflictor.name] = kill_MK11_MOD_0[s_Inflictor.name] + 1

	if Death_MK11_MOD_0[p_Player.name] == nil then Death_MK11_MOD_0[p_Player.name] = 0 ; end  -- Victim
	Death_MK11_MOD_0[p_Player.name] = Death_MK11_MOD_0[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_MK11_MOD_0[p_Player.name] == nil then Headshot_MK11_MOD_0[p_Player.name] = 0 ; end  -- Victim
	Headshot_MK11_MOD_0[p_Player.name] = Headshot_MK11_MOD_0[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MK11_MOD_0[p_Player.name]
	Dead_data = Death_MK11_MOD_0[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_MK11_MOD_0[s_Inflictor.name]
	end
--
	if args[7] == "QBU-88" then
	if kill_QBU_88[s_Inflictor.name] == nil then kill_QBU_88[s_Inflictor.name] = 0 ; end
	kill_QBU_88[s_Inflictor.name] = kill_QBU_88[s_Inflictor.name] + 1

	if Death_QBU_88[p_Player.name] == nil then Death_QBU_88[p_Player.name] = 0 ; end  -- Victim
	Death_QBU_88[p_Player.name] = Death_QBU_88[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_QBU_88[p_Player.name] == nil then Headshot_QBU_88[p_Player.name] = 0 ; end  -- Victim
	Headshot_QBU_88[p_Player.name] = Headshot_QBU_88[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_QBU_88[p_Player.name]
	Dead_data = Death_QBU_88[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_QBU_88[s_Inflictor.name]
	end
--
	if args[7] == "SKS" then
	if kill_SKS[s_Inflictor.name] == nil then kill_SKS[s_Inflictor.name] = 0 ; end
	kill_SKS[s_Inflictor.name] = kill_SKS[s_Inflictor.name] + 1

	if Death_SKS[p_Player.name] == nil then Death_SKS[p_Player.name] = 0 ; end  -- Victim
	Death_SKS[p_Player.name] = Death_SKS[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SKS[p_Player.name] == nil then Headshot_SKS[p_Player.name] = 0 ; end  -- Victim
	Headshot_SKS[p_Player.name] = Headshot_SKS[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SKS[p_Player.name]
	Dead_data = Death_SKS[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_SKS[s_Inflictor.name]
	end
--
	if args[7] == "SV98" then
	if kill_SV98[s_Inflictor.name] == nil then kill_SV98[s_Inflictor.name] = 0 ; end
	kill_SV98[s_Inflictor.name] = kill_SV98[s_Inflictor.name] + 1

	if Death_SV98[p_Player.name] == nil then Death_SV98[p_Player.name] = 0 ; end  -- Victim
	Death_SV98[p_Player.name] = Death_SV98[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SV98[p_Player.name] == nil then Headshot_SV98[p_Player.name] = 0 ; end  -- Victim
	Headshot_SV98[p_Player.name] = Headshot_SV98[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SV98[p_Player.name]
	Dead_data = Death_SV98[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_SV98[s_Inflictor.name]
	end
--
	if args[7] == "SVD" then
	if kill_SVD[s_Inflictor.name] == nil then kill_SVD[s_Inflictor.name] = 0 ; end
	kill_SVD[s_Inflictor.name] = kill_SVD[s_Inflictor.name] + 1

	if Death_SVD[p_Player.name] == nil then Death_SVD[p_Player.name] = 0 ; end  -- Victim
	Death_SVD[p_Player.name] = Death_SVD[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_SVD[p_Player.name] == nil then Headshot_SVD[p_Player.name] = 0 ; end  -- Victim
	Headshot_SVD[p_Player.name] = Headshot_SVD[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_SVD[p_Player.name]
	Dead_data = Death_SVD[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_recon_weapons_msg then
	data_recon_weapons_msg(player, data_playername)
	end

	data_weaponkills = kill_SVD[s_Inflictor.name]
	end
--

	if args[7] == "JNG-90" or args[7] == "L96" or args[7] == "M39 EMR" or args[7] == "M40A5" or args[7] == "M417"
	or args[7] == "M98B" or args[7] == "MK11 MOD 0" or args[7] == "QBU-88"
	or args[7] == "SKS" or args[7] == "SV98" or args[7] == "SVD" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_recon_weapons"
	data_catagory = "Recon weapon data:"
	data_playername = killer_name
	data_recon_weapons(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_recon_weapons(data_playername)
	end

end)

-- ------------------------------------------------------

function data_recon_weapons_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_recon_weapons(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_recon_weapons1 then
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

	if Config.consolespam_recon_weapons2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_recon_weapons3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_recon_weapons4 then
	print("")
	print (data_table_name.." injection done")
	end

else

	if Config.consolespam_recon_weapons5 then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end

end
end -- End of function call

-- ------------------------------------------------------

return Recon()

