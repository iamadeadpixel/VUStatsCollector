-- Spaghetti code by iamadeadpixel

---@class Assault
Assault = class 'Assault'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Assault gadgets loaded ***");
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

	if args[7] == "M320 SMOKE" then
	if kill_M320_SMOKE[s_Inflictor.name] == nil then kill_M320_SMOKE[s_Inflictor.name] = 0; end
	kill_M320_SMOKE[s_Inflictor.name] = kill_M320_SMOKE[s_Inflictor.name] + 1

	if Death_M320_SMOKE[p_Player.name] == nil then Death_M320_SMOKE[p_Player.name] = 0; end
	Death_M320_SMOKE[p_Player.name] = Death_M320_SMOKE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M320_SMOKE[p_Player.name] == nil then Headshot_M320_SMOKE[p_Player.name] = 0; end
	Headshot_M320_SMOKE[p_Player.name] = Headshot_M320_SMOKE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M320_SMOKE[p_Player.name]
	Dead_data = Death_M320_SMOKE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M320_SMOKE[s_Inflictor.name]
	end
--
	if args[7] == "M320 LVG" then
	if kill_M320_LVG[s_Inflictor.name] == nil then kill_M320_LVG[s_Inflictor.name] = 0; end
	kill_M320_LVG[s_Inflictor.name] = kill_M320_LVG[s_Inflictor.name] + 1

	if Death_M320_LVG[p_Player.name] == nil then Death_M320_LVG[p_Player.name] = 0; end
	Death_M320_LVG[p_Player.name] = Death_M320_LVG[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M320_LVG[p_Player.name] == nil then Headshot_M320_LVG[p_Player.name] = 0; end
	Headshot_M320_LVG[p_Player.name] = Headshot_M320_LVG[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M320_LVG[p_Player.name]
	Dead_data = Death_M320_LVG[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M320_LVG[s_Inflictor.name]
	end
--
	if args[7] == "M320 HE" then
	if kill_M320_HE[s_Inflictor.name] == nil then kill_M320_HE[s_Inflictor.name] = 0; end
	kill_M320_HE[s_Inflictor.name] = kill_M320_HE[s_Inflictor.name] + 1

	if Death_M320_HE[p_Player.name] == nil then Death_M320_HE[p_Player.name] = 0; end
	Death_M320_HE[p_Player.name] = Death_M320_HE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M320_HE[p_Player.name] == nil then Headshot_M320_HE[p_Player.name] = 0; end
	Headshot_M320_HE[p_Player.name] = Headshot_M320_HE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M320_HE[p_Player.name]
	Dead_data = Death_M320_HE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M320_HE[s_Inflictor.name]
	end
--
	if args[7] == "M320 BUCK" then
	if kill_M320_BUCK[s_Inflictor.name] == nil then kill_M320_BUCK[s_Inflictor.name] = 0 ; end
	kill_M320_BUCK[s_Inflictor.name] = kill_M320_BUCK[s_Inflictor.name] + 1

	if Death_M320_BUCK[p_Player.name] == nil then Death_M320_BUCK[p_Player.name] = 0; end
	Death_M320_BUCK[p_Player.name] = Death_M320_BUCK[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M320_BUCK[p_Player.name] == nil then Headshot_M320_BUCK[p_Player.name] = 0; end
	Headshot_M320_BUCK[p_Player.name] = Headshot_M320_BUCK[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M320_BUCK[p_Player.name]
	Dead_data = Death_M320_BUCK[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M320_BUCK[s_Inflictor.name]
	end
--
	if args[7] == "M26 SLUG" then
	if kill_M26_SLUG[s_Inflictor.name] == nil then kill_M26_SLUG[s_Inflictor.name] = 0 ; end
	kill_M26_SLUG[s_Inflictor.name] = kill_M26_SLUG[s_Inflictor.name] + 1

	if Death_M26_SLUG[p_Player.name] == nil then Death_M26_SLUG[p_Player.name] = 0; end
	Death_M26_SLUG[p_Player.name] = Death_M26_SLUG[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M26_SLUG[p_Player.name] == nil then Headshot_M26_SLUG[p_Player.name] = 0; end
	Headshot_M26_SLUG[p_Player.name] = Headshot_M26_SLUG[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M26_SLUG[p_Player.name]
	Dead_data = Death_M26_SLUG[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M26_SLUG[s_Inflictor.name]
	end
--
	if args[7] == "M26 MASS" then
	if kill_M26_MASS[s_Inflictor.name] == nil then kill_M26_MASS[s_Inflictor.name] = 0 ; end
	kill_M26_MASS[s_Inflictor.name] = kill_M26_MASS[s_Inflictor.name] + 1

	if Death_M26_MASS[p_Player.name] == nil then Death_M26_MASS[p_Player.name] = 0; end
	Death_M26_MASS[p_Player.name] = Death_M26_MASS[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M26_MASS[p_Player.name] == nil then Headshot_M26_MASS[p_Player.name] = 0; end
	Headshot_M26_MASS[p_Player.name] = Headshot_M26_MASS[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M26_MASS[p_Player.name]
	Dead_data = Death_M26_MASS[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M26_MASS[s_Inflictor.name]
	end
--
	if args[7] == "M26 FRAG" then
	if kill_M26_FRAG[s_Inflictor.name] == nil then kill_M26_FRAG[s_Inflictor.name] = 0 ; end
	kill_M26_FRAG[s_Inflictor.name] = kill_M26_FRAG[s_Inflictor.name] + 1

	if Death_M26_FRAG[p_Player.name] == nil then Death_M26_FRAG[p_Player.name] = 0; end
	Death_M26_FRAG[p_Player.name] = Death_M26_FRAG[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M26_FRAG[p_Player.name] == nil then Headshot_M26_FRAG[p_Player.name] = 0; end
	Headshot_M26_FRAG[p_Player.name] = Headshot_M26_FRAG[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M26_FRAG[p_Player.name]
	Dead_data = Death_M26_FRAG[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M26_FRAG[s_Inflictor.name]
	end
--
	if args[7] == "M26 DART" then
	if kill_M26_DART[s_Inflictor.name] == nil then kill_M26_DART[s_Inflictor.name] = 0 ; end
	kill_M26_DART[s_Inflictor.name] = kill_M26_DART[s_Inflictor.name] + 1

	if Death_M26_DART[p_Player.name] == nil then Death_M26_DART[p_Player.name] = 0; end
	Death_M26_DART[p_Player.name] = Death_M26_DART[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_M26_DART[p_Player.name] == nil then Headshot_M26_DART[p_Player.name] = 0; end
	Headshot_M26_DART[p_Player.name] = Headshot_M26_DART[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_M26_DART[p_Player.name]
	Dead_data = Death_M26_DART[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_M26_DART[s_Inflictor.name]
	end
--
	if args[7] == "GP-30 SMOKE" then
	if kill_GP_30_SMOKE[s_Inflictor.name] == nil then kill_GP_30_SMOKE[s_Inflictor.name] = 0 ; end
	kill_GP_30_SMOKE[s_Inflictor.name] = kill_GP_30_SMOKE[s_Inflictor.name] + 1

	if Death_GP_30_SMOKE[p_Player.name] == nil then Death_GP_30_SMOKE[p_Player.name] = 0; end
	Death_GP_30_SMOKE[p_Player.name] = Death_GP_30_SMOKE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GP_30_SMOKE[p_Player.name] == nil then Headshot_GP_30_SMOKE[p_Player.name] = 0; end
	Headshot_GP_30_SMOKE[p_Player.name] = Headshot_GP_30_SMOKE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GP_30_SMOKE[p_Player.name]
	Dead_data = Death_GP_30_SMOKE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_GP_30_SMOKE[s_Inflictor.name]
	end
--
	if args[7] == "GP-30 LVG" then
	if kill_GP_30_LVG[s_Inflictor.name] == nil then kill_GP_30_LVG[s_Inflictor.name] = 0 ; end
	kill_GP_30_LVG[s_Inflictor.name] = kill_GP_30_LVG[s_Inflictor.name] + 1

	if Death_GP_30_LVG[p_Player.name] == nil then Death_GP_30_LVG[p_Player.name] = 0; end
	Death_GP_30_LVG[p_Player.name] = Death_GP_30_LVG[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GP_30_LVG[p_Player.name] == nil then Headshot_GP_30_LVG[p_Player.name] = 0; end
	Headshot_GP_30_LVG[p_Player.name] = Headshot_GP_30_LVG[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GP_30_LVG[p_Player.name]
	Dead_data = Death_GP_30_LVG[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_GP_30_LVG[s_Inflictor.name]
	end
--
	if args[7] == "GP-30 HE" then
	if kill_GP_30_HE[s_Inflictor.name] == nil then kill_GP_30_HE[s_Inflictor.name] = 0 ; end
	kill_GP_30_HE[s_Inflictor.name] = kill_GP_30_HE[s_Inflictor.name] + 1

	if Death_GP_30_HE[p_Player.name] == nil then Death_GP_30_HE[p_Player.name] = 0; end
	Death_GP_30_HE[p_Player.name] = Death_GP_30_HE[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GP_30_HE[p_Player.name] == nil then Headshot_GP_30_HE[p_Player.name] = 0; end
	Headshot_GP_30_HE[p_Player.name] = Headshot_GP_30_HE[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GP_30_HE[p_Player.name]
	Dead_data = Death_GP_30_HE[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_GP_30_HE[s_Inflictor.name]
	end
--
	if args[7] == "GP-30 DART" then
	if kill_GP_30_DART[s_Inflictor.name] == nil then kill_GP_30_DART[s_Inflictor.name] = 0 ; end
	kill_GP_30_DART[s_Inflictor.name] = kill_GP_30_DART[s_Inflictor.name] + 1

	if Death_GP_30_DART[p_Player.name] == nil then Death_GP_30_DART[p_Player.name] = 0; end
	Death_GP_30_DART[p_Player.name] = Death_GP_30_DART[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GP_30_DART[p_Player.name] == nil then Headshot_GP_30_DART[p_Player.name] = 0; end
	Headshot_GP_30_DART[p_Player.name] = Headshot_GP_30_DART[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GP_30_DART[p_Player.name]
	Dead_data = Death_GP_30_DART[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_GP_30_DART[s_Inflictor.name]
	end
--
	if args[7] == "GP-30 BUCK" then
	if kill_GP_30_BUCK[s_Inflictor.name] == nil then kill_GP_30_BUCK[s_Inflictor.name] = 0 ; end
	kill_GP_30_BUCK[s_Inflictor.name] = kill_GP_30_BUCK[s_Inflictor.name] + 1

	if Death_GP_30_BUCK[p_Player.name] == nil then Death_GP_30_BUCK[p_Player.name] = 0; end
	Death_GP_30_BUCK[p_Player.name] = Death_GP_30_BUCK[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_GP_30_BUCK[p_Player.name] == nil then Headshot_GP_30_BUCK[p_Player.name] = 0; end
	Headshot_GP_30_BUCK[p_Player.name] = Headshot_GP_30_BUCK[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_GP_30_BUCK[p_Player.name]
	Dead_data = Death_GP_30_BUCK[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_GP_30_BUCK[s_Inflictor.name]
	end
--
	if args[7] == "MEDIC KIT" then
	if kill_MEDIC_KIT[s_Inflictor.name] == nil then kill_MEDIC_KIT[s_Inflictor.name] = 0 ; end
	kill_MEDIC_KIT[s_Inflictor.name] = kill_MEDIC_KIT[s_Inflictor.name] + 1

	if Death_MEDIC_KIT[p_Player.name] == nil then Death_MEDIC_KIT[p_Player.name] = 0; end
	Death_MEDIC_KIT[p_Player.name] = Death_MEDIC_KIT[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_MEDIC_KIT[p_Player.name] == nil then Headshot_MEDIC_KIT[p_Player.name] = 0; end
	Headshot_MEDIC_KIT[p_Player.name] = Headshot_MEDIC_KIT[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_MEDIC_KIT[p_Player.name]
	Dead_data = Death_MEDIC_KIT[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_MEDIC_KIT[s_Inflictor.name]
	end
--
	if args[7] == "DEFIBRILLATOR" then
	if kill_DEFIBRILLATOR[s_Inflictor.name] == nil then kill_DEFIBRILLATOR[s_Inflictor.name] = 0 ; end
	kill_DEFIBRILLATOR[s_Inflictor.name] = kill_DEFIBRILLATOR[s_Inflictor.name] + 1

	if Death_DEFIBRILLATOR[p_Player.name] == nil then Death_DEFIBRILLATOR[p_Player.name] = 0; end
	Death_DEFIBRILLATOR[p_Player.name] = Death_DEFIBRILLATOR[p_Player.name] + 1  -- Victim

	if p_IsHeadShot then 
	if Headshot_DEFIBRILLATOR[p_Player.name] == nil then Headshot_DEFIBRILLATOR[p_Player.name] = 0; end
	Headshot_DEFIBRILLATOR[p_Player.name] = Headshot_DEFIBRILLATOR[p_Player.name] + 1  -- Victim

	hs_tempdata[p_Player.name] = 1
	end
	Headshot_data = Headshot_DEFIBRILLATOR[p_Player.name]
	Dead_data = Death_DEFIBRILLATOR[p_Player.name]
	victim_name = p_Player.name
	killer_name = s_Inflictor.name

	if Config.consolespam_assault_gadgets_msg then
	data_assault_gadgets_msg(player, data_playername)
	end

	data_weaponkills = kill_DEFIBRILLATOR[s_Inflictor.name]
	end
--

	if args[7] == "DEFIBRILLATOR" or args[7] == "MEDIC KIT" or args[7] == "GP-30 BUCK"
	or args[7] == "GP-30 DART" or args[7] == "GP-30 HE" or args[7] == "GP-30 LVG"
	or args[7] == "GP-30 SMOKE" or args[7] == "M26 DART" or args[7] == "M26 FRAG"
	or args[7] == "M26 MASS" or args[7] == "M26 SLUG" or args[7] == "M320 BUCK"
	or args[7] == "M320 HE" or args[7] == "M320 LVG" or args[7] == "M320 SMOKE" then

-- Read and set kill status
	data_weapon_name = args[7]
	data_table_name = "tbl_assault_gadgets"
	data_catagory = "Assault gadget data:"
	data_playername = killer_name
	data_assault_gadgets(data_playername)

-- Read and set death status
	data_playername = victim_name
	data_assault_gadgets(data_playername)
	end

end)

-- ------------------------------------------------------

function data_assault_gadgets_msg(player, data_playername)

	if hs_tempdata[victim_name] == 1 then
	print ("player "..victim_name.." got 3th eye`d thanks to "..killer_name.."`s "..args[7].." "..Headshot_data.." times and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	else
	print ("player "..victim_name.." got killed, thanks to "..killer_name.."`s "..args[7].." and died "..Dead_data.." times by the "..args[7].." and died "..playerdeaths[victim_name].." times in total")
	end

	hs_tempdata[victim_name] = 0
end -- End of function call

-- ------------------------------------------------------

function data_assault_gadgets(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam_assault_gadgets1 then
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

	if Config.consolespam_assault_gadgets2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_assault_gadgets3 then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills, Headshot, Deaths, Shot, Hits) VALUES (?,?,?,?,?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0,      0,       0,     0,    0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam_assault_gadgets4 then
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

return Assault()

