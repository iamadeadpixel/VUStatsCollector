-- Spaghetti code by iamadeadpixel

---@class landvehicledata
landvehicledata = class 'landvehicledata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** land vehicle data mod loaded ***"); 

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
-- ------------------------------------------------------

	if getnamehuman[s_Inflictor.name] ~= s_Inflictor.name then return end

-- ------------------------------------------------------
--[[
	Here we collect land vehicle data
]]

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "9K22 TUNGUSKA-M" then
	if kill_9K22_TUNGUSKA_M[s_Inflictor.name] == nil then kill_9K22_TUNGUSKA_M[s_Inflictor.name] = 0; end
	kill_9K22_TUNGUSKA_M[s_Inflictor.name] = kill_9K22_TUNGUSKA_M[s_Inflictor.name] + 1
	data_weaponkills = kill_9K22_TUNGUSKA_M[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "9M133 KORNET LAUNCHER" then
	if kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] == nil then kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = 0; end
	kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] + 1
	data_weaponkills = kill_9M133_KORNET_LAUNCHER[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AAV-7A1 AMTRAC" then
	if kill_AAV_7A1_AMTRAC[s_Inflictor.name] == nil then kill_AAV_7A1_AMTRAC[s_Inflictor.name] = 0; end
	kill_AAV_7A1_AMTRAC[s_Inflictor.name] = kill_AAV_7A1_AMTRAC[s_Inflictor.name] + 1
	data_weaponkills = kill_AAV_7A1_AMTRAC[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BARSUK" then
	if kill_BARSUK[s_Inflictor.name] == nil then kill_BARSUK[s_Inflictor.name] = 0; end
	kill_BARSUK[s_Inflictor.name] = kill_BARSUK[s_Inflictor.name] + 1
	data_weaponkills = kill_BARSUK[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BM-23" then
	if kill_BM_23[s_Inflictor.name] == nil then kill_BM_23[s_Inflictor.name] = 0; end
	kill_BM_23[s_Inflictor.name] = kill_BM_23[s_Inflictor.name] + 1
	data_weaponkills = kill_BM_23[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BMP-2M" then
	if kill_BMP_2M[s_Inflictor.name] == nil then kill_BMP_2M[s_Inflictor.name] = 0; end
	kill_BMP_2M[s_Inflictor.name] = kill_BMP_2M[s_Inflictor.name] + 1
	data_weaponkills = kill_BMP_2M[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BTR-90" then
	if kill_BTR_90[s_Inflictor.name] == nil then kill_BTR_90[s_Inflictor.name] = 0; end
	kill_BTR_90[s_Inflictor.name] = kill_BTR_90[s_Inflictor.name] + 1
	data_weaponkills = kill_BTR_90[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "CENTURION C-RAM" then
	if kill_CENTURION_C_RAM[s_Inflictor.name] == nil then kill_CENTURION_C_RAM[s_Inflictor.name] = 0; end
	kill_CENTURION_C_RAM[s_Inflictor.name] = kill_CENTURION_C_RAM[s_Inflictor.name] + 1
	data_weaponkills = kill_CENTURION_C_RAM[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "CIVILIAN CAR" then
	if kill_CIVILIAN_CAR[s_Inflictor.name] == nil then kill_CIVILIAN_CAR[s_Inflictor.name] = 0; end
	kill_CIVILIAN_CAR[s_Inflictor.name] = kill_CIVILIAN_CAR[s_Inflictor.name] + 1
	data_weaponkills = kill_CIVILIAN_CAR[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DELIVERY VAN" then
	if kill_DELIVERY_VAN[s_Inflictor.name] == nil then kill_DELIVERY_VAN[s_Inflictor.name] = 0; end
	kill_DELIVERY_VAN[s_Inflictor.name] = kill_DELIVERY_VAN[s_Inflictor.name] + 1
	data_weaponkills = kill_DELIVERY_VAN[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DIRTBIKE" then
	if kill_DIRTBIKE[s_Inflictor.name] == nil then kill_DIRTBIKE[s_Inflictor.name] = 0; end
	kill_DIRTBIKE[s_Inflictor.name] = kill_DIRTBIKE[s_Inflictor.name] + 1
	data_weaponkills = kill_DIRTBIKE[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DPV" then
	if kill_DPV[s_Inflictor.name] == nil then kill_DPV[s_Inflictor.name] = 0; end
	kill_DPV[s_Inflictor.name] = kill_DPV[s_Inflictor.name] + 1
	data_weaponkills = kill_DPV[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GAZ-3937 VODNIK" then
	if kill_GAZ_3937_VODNIK[s_Inflictor.name] == nil then kill_GAZ_3937_VODNIK[s_Inflictor.name] = 0; end
	kill_GAZ_3937_VODNIK[s_Inflictor.name] = kill_GAZ_3937_VODNIK[s_Inflictor.name] + 1
	data_weaponkills = kill_GAZ_3937_VODNIK[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GROWLER ITV" then
	if kill_GROWLER_ITV[s_Inflictor.name] == nil then kill_GROWLER_ITV[s_Inflictor.name] = 0; end
	kill_GROWLER_ITV[s_Inflictor.name] = kill_GROWLER_ITV[s_Inflictor.name] + 1
	data_weaponkills = kill_GROWLER_ITV[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "HMMWV ASRAD" then
	if kill_HMMWV_ASRAD[s_Inflictor.name] == nil then kill_HMMWV_ASRAD[s_Inflictor.name] = 0; end
	kill_HMMWV_ASRAD[s_Inflictor.name] = kill_HMMWV_ASRAD[s_Inflictor.name] + 1
	data_weaponkills = kill_HMMWV_ASRAD[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "LAV-25" then
	if kill_LAV_25[s_Inflictor.name] == nil then kill_LAV_25[s_Inflictor.name] = 0; end
	kill_LAV_25[s_Inflictor.name] = kill_LAV_25[s_Inflictor.name] + 1
	data_weaponkills = kill_LAV_25[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "LAV-AD" then
	if kill_LAV_AD[s_Inflictor.name] == nil then kill_LAV_AD[s_Inflictor.name] = 0; end
	kill_LAV_AD[s_Inflictor.name] = kill_LAV_AD[s_Inflictor.name] + 1
	data_weaponkills = kill_LAV_AD[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1 ABRAMS" then
	if kill_M1_ABRAMS[s_Inflictor.name] == nil then kill_M1_ABRAMS[s_Inflictor.name] = 0; end
	kill_M1_ABRAMS[s_Inflictor.name] = kill_M1_ABRAMS[s_Inflictor.name] + 1
	data_weaponkills = kill_M1_ABRAMS[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1114 HMMWV" then
	if kill_M1114_HMMWV[s_Inflictor.name] == nil then kill_M1114_HMMWV[s_Inflictor.name] = 0; end
	kill_M1114_HMMWV[s_Inflictor.name] = kill_M1114_HMMWV[s_Inflictor.name] + 1
	data_weaponkills = kill_M1114_HMMWV[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1128" then
	if kill_M1128[s_Inflictor.name] == nil then kill_M1128[s_Inflictor.name] = 0; end
	kill_M1128[s_Inflictor.name] = kill_M1128[s_Inflictor.name] + 1
	data_weaponkills = kill_M1128[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M142" then
	if kill_M142[s_Inflictor.name] == nil then kill_M142[s_Inflictor.name] = 0; end
	kill_M142[s_Inflictor.name] = kill_M142[s_Inflictor.name] + 1
	data_weaponkills = kill_M142[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M220 TOW LAUNCHER" then
	if kill_M220_TOW_LAUNCHER[s_Inflictor.name] == nil then kill_M220_TOW_LAUNCHER[s_Inflictor.name] = 0; end
	kill_M220_TOW_LAUNCHER[s_Inflictor.name] = kill_M220_TOW_LAUNCHER[s_Inflictor.name] + 1
	data_weaponkills = kill_M220_TOW_LAUNCHER[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PANTSIR-S1" then
	if kill_PANTSIR_S1[s_Inflictor.name] == nil then kill_PANTSIR_S1[s_Inflictor.name] = 0; end
	kill_PANTSIR_S1[s_Inflictor.name] = kill_PANTSIR_S1[s_Inflictor.name] + 1
	data_weaponkills = kill_PANTSIR_S1[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PHOENIX" then
	if kill_PHOENIX[s_Inflictor.name] == nil then kill_PHOENIX[s_Inflictor.name] = 0; end
	kill_PHOENIX[s_Inflictor.name] = kill_PHOENIX[s_Inflictor.name] + 1
	data_weaponkills = kill_PHOENIX[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "POLICE VAN" then
	if kill_POLICE_VAN[s_Inflictor.name] == nil then kill_POLICE_VAN[s_Inflictor.name] = 0; end
	kill_POLICE_VAN[s_Inflictor.name] = kill_POLICE_VAN[s_Inflictor.name] + 1
	data_weaponkills = kill_POLICE_VAN[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "QUAD BIKE" then
	if kill_QUAD_BIKE[s_Inflictor.name] == nil then kill_QUAD_BIKE[s_Inflictor.name] = 0; end
	kill_QUAD_BIKE[s_Inflictor.name] = kill_QUAD_BIKE[s_Inflictor.name] + 1
	data_weaponkills = kill_QUAD_BIKE[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "RHIB BOAT" then
	if kill_RHIB_BOAT[s_Inflictor.name] == nil then kill_RHIB_BOAT[s_Inflictor.name] = 0; end
	kill_RHIB_BOAT[s_Inflictor.name] = kill_RHIB_BOAT[s_Inflictor.name] + 1
	data_weaponkills = kill_RHIB_BOAT[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "RHINO" then
	if kill_RHINO[s_Inflictor.name] == nil then kill_RHINO[s_Inflictor.name] = 0; end
	kill_RHINO[s_Inflictor.name] = kill_RHINO[s_Inflictor.name] + 1
	data_weaponkills = kill_RHINO[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SKID LOADER" then
	if kill_SKID_LOADER[s_Inflictor.name] == nil then kill_SKID_LOADER[s_Inflictor.name] = 0; end
	kill_SKID_LOADER[s_Inflictor.name] = kill_SKID_LOADER[s_Inflictor.name] + 1
	data_weaponkills = kill_SKID_LOADER[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SPRUT-SD" then
	if kill_SPRUT_SD[s_Inflictor.name] == nil then kill_SPRUT_SD[s_Inflictor.name] = 0; end
	kill_SPRUT_SD[s_Inflictor.name] = kill_SPRUT_SD[s_Inflictor.name] + 1
	data_weaponkills = kill_SPRUT_SD[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SUV" then
	if kill_SUV[s_Inflictor.name] == nil then kill_SUV[s_Inflictor.name] = 0; end
	kill_SUV[s_Inflictor.name] = kill_SUV[s_Inflictor.name] + 1
	data_weaponkills = kill_SUV[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "T-90A" then
	if kill_T_90A[s_Inflictor.name] == nil then kill_T_90A[s_Inflictor.name] = 0; end
	kill_T_90A[s_Inflictor.name] = kill_T_90A[s_Inflictor.name] + 1
	data_weaponkills = kill_T_90A[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "TECHNICAL TRUCK" then
	if kill_TECHNICAL_TRUCK[s_Inflictor.name] == nil then kill_TECHNICAL_TRUCK[s_Inflictor.name] = 0; end
	kill_TECHNICAL_TRUCK[s_Inflictor.name] = kill_TECHNICAL_TRUCK[s_Inflictor.name] + 1
	data_weaponkills = kill_TECHNICAL_TRUCK[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "VDV Buggy" then
	if kill_VDV_Buggy[s_Inflictor.name] == nil then kill_VDV_Buggy[s_Inflictor.name] = 0; end
	kill_VDV_Buggy[s_Inflictor.name] = kill_VDV_Buggy[s_Inflictor.name] + 1
	data_weaponkills = kill_VDV_Buggy[s_Inflictor.name]
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "VODNIK AA" then
	if kill_VODNIK_AA[s_Inflictor.name] == nil then kill_VODNIK_AA[s_Inflictor.name] = 0; end
	kill_VODNIK_AA[s_Inflictor.name] = kill_VODNIK_AA[s_Inflictor.name] + 1
	data_weaponkills = kill_VODNIK_AA[s_Inflictor.name]
	end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "9K22 TUNGUSKA-M"
	or args[7] == "9M133 KORNET LAUNCHER" or args[7] == "AAV-7A1 AMTRAC"
	or args[7] == "BARSUK" or args[7] == "BM-23" or args[7] == "BMP-2M" or args[7] == "BTR-90"
	or args[7] == "CENTURION C-RAM" or args[7] == "CIVILIAN CAR" or args[7] == "DELIVERY VAN"
	or args[7] == "DIRTBIKE" or args[7] == "DPV" or args[7] == "GAZ-3937 VODNIK" or args[7] == "GROWLER ITV"
	or args[7] == "HMMWV ASRAD" or args[7] == "LAV-25" or args[7] == "LAV-AD" or args[7] == "M1 ABRAMS"
	or args[7] == "M1114 HMMWV" or args[7] == "M1128" or args[7] == "M142" or args[7] == "M220 TOW LAUNCHER"
	or args[7] == "PANTSIR-S1" or args[7] == "PHOENIX" or args[7] == "POLICE VAN"
	or args[7] == "QUAD BIKE" or args[7] == "RHIB BOAT" or args[7] == "RHINO" or args[7] == "SKID LOADER"
	or args[7] == "SPRUT-SD" or args[7] == "SUV" or args[7] == "T-90A" or args[7] == "TECHNICAL TRUCK"
	or args[7] == "VDV Buggy" or args[7] == "VODNIK AA" then

	data_weapon_name = args[7]
	data_table_name = "tbl_land_vehicles"
	data_playername = s_Inflictor.name
	data_catagory = "Land vehicles data:"
	iamyourdaddy(data_playername)
	end

end)

-- ------------------------------------------------------

function iamyourdaddy(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	print ("")
	print (data_catagory.." Weapon name:"..data_weapon_name)
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print (data_catagory.." Weapon kills:"..data_weaponkills)

	print ("")

	print ("Accessing "..data_table_name)
	Results = SQL:Query('SELECT Weaponname, Soldiername FROM '..data_table_name..' WHERE Soldiername = ? and Weaponname = ?', data_playername,data_weapon_name) -- works

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	print ("Done reading "..data_table_name)
	print (Results)
	print ("")

if type(next(Results)) == "nil" then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
 --add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills) VALUES (?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end
	print("")
	print (data_table_name.." injection done")

else
 --do some thing with results
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
end

end -- End of function call


return landvehicledata()

