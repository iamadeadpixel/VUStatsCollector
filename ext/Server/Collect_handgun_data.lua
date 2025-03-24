-- Spaghetti code by iamadeadpixel

---@class Handguns
Handguns = class 'Handguns'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam then
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

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[s_Inflictor.name] ~= s_Inflictor.name then return end
	end

-- ------------------------------------------------------
--[[
	Here we collect handguns weapon data
]]

	if args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" or args[7] == "MP443" then
	if kill_MP443[s_Inflictor.name] == nil then kill_MP443[s_Inflictor.name] = 0; end
	kill_MP443[s_Inflictor.name] = kill_MP443[s_Inflictor.name] + 1
	if args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" then args[7] = "MP443" ; end
	data_weaponkills = kill_MP443[s_Inflictor.name]
	end
--
	if args[7] == "MP412 REX" then
	if kill_MP412_REX[s_Inflictor.name] == nil then kill_MP412_REX[s_Inflictor.name] = 0; end
	kill_MP412_REX[s_Inflictor.name] = kill_MP412_REX[s_Inflictor.name] + 1
	data_weaponkills = kill_MP412_REX[s_Inflictor.name]
	end
--
	if args[7] == "M9 SUPP" or args[7] == "M9 TACT" or args[7] == "M9" then
	if kill_M9[s_Inflictor.name] == nil then kill_M9[s_Inflictor.name] = 0; end
	kill_M9[s_Inflictor.name] = kill_M9[s_Inflictor.name] + 1
	if args[7] == "M9 SUPP" or args[7] == "M9 TACT" then args[7] = "M9" ; end
	data_weaponkills = kill_M9[s_Inflictor.name]
	end
--
	if args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT" or args[7] == "M1911" then
	if kill_M1911[s_Inflictor.name] == nil then kill_M1911[s_Inflictor.name] = 0; end
	kill_M1911[s_Inflictor.name] = kill_M1911[s_Inflictor.name] + 1
	if args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT" then args[7] = "M1911" ; end
	data_weaponkills = kill_M1911[s_Inflictor.name]
	end
--
	if args[7] == "G18 SUPP" or args[7] == "G18" then
	if kill_G18[s_Inflictor.name] == nil then kill_G18[s_Inflictor.name] = 0; end
	kill_G18[s_Inflictor.name] = kill_G18[s_Inflictor.name] + 1
	if args[7] == "G18 SUPP" then args[7] = "G18" ; end
	data_weaponkills = kill_G18[s_Inflictor.name]
	end
--
	if args[7] == "G17C SUPP" or args[7] == "G17C" then
	if kill_G17C[s_Inflictor.name] == nil then kill_G17C[s_Inflictor.name] = 0; end
	kill_G17C[s_Inflictor.name] = kill_G17C[s_Inflictor.name] + 1
	if args[7] == "G17C SUPP" then args[7] = "G17C" ; end
	data_weaponkills = kill_G17C[s_Inflictor.name]
	end
--
	if args[7] == "93R" then
	if kill_93R[s_Inflictor.name] == nil then kill_93R[s_Inflictor.name] = 0; end
	kill_93R[s_Inflictor.name] = kill_93R[s_Inflictor.name] + 1
	data_weaponkills = kill_93R[s_Inflictor.name]
	end
--
	if args[7] == ".44 MAGNUM" or args[7] == ".44 SCOPED" then
	if kill_44_MAGNUM[s_Inflictor.name] == nil then kill_44_MAGNUM[s_Inflictor.name] = 0; end
	kill_44_MAGNUM[s_Inflictor.name] = kill_44_MAGNUM[s_Inflictor.name] + 1
	if args[7] == ".44 SCOPED" then args[7] = ".44 MAGNUM" ; end
	data_weaponkills = kill_44_MAGNUM[s_Inflictor.name]
	end
--
--

	if args[7] == ".44 MAGNUM" or args[7] == ".44 SCOPED" or args[7] == "93R" or args[7] == "G17C SUPP" or args[7] == "G17C"
	or args[7] == "G18 SUPP" or args[7] == "G18" or args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT"
	or args[7] == "M1911" or args[7] == "M9 SUPP" or args[7] == "M9 TACT" or args[7] == "M9" or args[7] == "MP412 REX"
	or args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" or args[7] == "MP443" then

	data_weapon_name = args[7]
	data_table_name = "tbl_handguns_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Handguns weapon data:"
	data_handguns(data_playername)
	end

end)

-- ------------------------------------------------------

function data_handguns(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)
	data_weaponkills = tostring (data_weaponkills)

	if Config.consolespam then
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

	if Config.consolespam then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam then
print("No data found for "..data_playername.." and "..data_weapon_name.." - Injecting now")
	end

--add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills) VALUES (?,?,?)'
			                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  1) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end

	if Config.consolespam then
	print("")
	print (data_table_name.." injection done")
	end

else
 --do some thing with results
	if Config.consolespam then
print('found data: '..data_playername..' and '..data_weapon_name..' - Kills:'..data_weaponkills)
	end
end

end -- End of function call

-- ------------------------------------------------------

return Handguns()

