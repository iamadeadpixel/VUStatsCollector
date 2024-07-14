-- Spaghetti code by iamadeadpixel

---@class Combined
Combined = class 'Combined'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** All vehicles and weapons mod loaded ***"); 

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


-- s_Inflictor.name = killer
-- p_Player.name = victim

-- Print lines will be removed on the end
	if getnamehuman[s_Inflictor.name] ~= s_Inflictor.name then return end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "UMP-45" then
	if kill_UMP_45[s_Inflictor.name] == nil then kill_UMP_45[s_Inflictor.name] = 0; end
	kill_UMP_45[s_Inflictor.name] = kill_UMP_45[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PP-2000" then
	if kill_PP_2000[s_Inflictor.name] == nil then kill_PP_2000[s_Inflictor.name] = 0; end
	kill_PP_2000[s_Inflictor.name] = kill_PP_2000[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PP-19" then
	if kill_PP_19[s_Inflictor.name] == nil then kill_PP_19[s_Inflictor.name] = 0; end
	kill_PP_19[s_Inflictor.name] = kill_PP_19[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PDW-R" then
	if kill_PDW_R[s_Inflictor.name] == nil then kill_PDW_R[s_Inflictor.name] = 0; end
	kill_PDW_R[s_Inflictor.name] = kill_PDW_R[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "P90" then
	if kill_P90[s_Inflictor.name] == nil then kill_P90[s_Inflictor.name] = 0; end
	kill_P90[s_Inflictor.name] = kill_P90[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MP7" then
	if kill_MP7[s_Inflictor.name] == nil then kill_MP7[s_Inflictor.name] = 0; end
	kill_MP7[s_Inflictor.name] = kill_MP7[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M5K" then
	if kill_M5K[s_Inflictor.name] == nil then kill_M5K[s_Inflictor.name] = 0; end
	kill_M5K[s_Inflictor.name] = kill_M5K[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AS VAL" then
	if kill_AS_VAL[s_Inflictor.name] == nil then kill_AS_VAL[s_Inflictor.name] = 0; end
	kill_AS_VAL[s_Inflictor.name] = kill_AS_VAL[s_Inflictor.name] + 1
	end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AS VAL"
	or args[7] == "M5K" or args[7] == "MP7" or args[7] == "P90" or args[7] == "PDW-R"
	or args[7] == "PP-19" or args[7] == "PP-2000" or args[7] == "UMP-45" then

	data_weapon_name = args[7]
	data_table_name = "tbl_primary_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M320 SMOKE" then
	if kill_M320_SMOKE[s_Inflictor.name] == nil then kill_M320_SMOKE[s_Inflictor.name] = 0; end
	kill_M320_SMOKE[s_Inflictor.name] = kill_M320_SMOKE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M320 LVG" then
	if kill_M320_LVG[s_Inflictor.name] == nil then kill_M320_LVG[s_Inflictor.name] = 0; end
	kill_M320_LVG[s_Inflictor.name] = kill_M320_LVG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M320 HE" then
	if kill_M320_HE[s_Inflictor.name] == nil then kill_M320_HE[s_Inflictor.name] = 0; end
	kill_M320_HE[s_Inflictor.name] = kill_M320_HE[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M320 BUCK" then
	if kill_M320_BUCK[s_Inflictor.name] == nil then kill_M320_BUCK[s_Inflictor.name] = 0; end
	kill_M320_BUCK[s_Inflictor.name] = kill_M320_BUCK[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M26 SLUG" then
	if kill_M26_SLUG[s_Inflictor.name] == nil then kill_M26_SLUG[s_Inflictor.name] = 0; end
	kill_M26_SLUG[s_Inflictor.name] = kill_M26_SLUG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M26 MASS" then
	if kill_M26_MASS[s_Inflictor.name] == nil then kill_M26_MASS[s_Inflictor.name] = 0; end
	kill_M26_MASS[s_Inflictor.name] = kill_M26_MASS[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M26 FRAG" then
	if kill_M26_FRAG[s_Inflictor.name] == nil then kill_M26_FRAG[s_Inflictor.name] = 0; end
	kill_M26_FRAG[s_Inflictor.name] = kill_M26_FRAG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M26 DART" then
	if kill_M26_DART[s_Inflictor.name] == nil then kill_M26_DART[s_Inflictor.name] = 0; end
	kill_M26_DART[s_Inflictor.name] = kill_M26_DART[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GP-30 SMOKE" then
	if kill_GP_30_SMOKE[s_Inflictor.name] == nil then kill_GP_30_SMOKE[s_Inflictor.name] = 0; end
	kill_GP_30_SMOKE[s_Inflictor.name] = kill_GP_30_SMOKE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GP-30 LVG" then
	if kill_GP_30_LVG[s_Inflictor.name] == nil then kill_GP_30_LVG[s_Inflictor.name] = 0; end
	kill_GP_30_LVG[s_Inflictor.name] = kill_GP_30_LVG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GP-30 HE" then
	if kill_GP_30_HE[s_Inflictor.name] == nil then kill_GP_30_HE[s_Inflictor.name] = 0; end
	kill_GP_30_HE[s_Inflictor.name] = kill_GP_30_HE[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GP-30 DART" then
	if kill_GP_30_DART[s_Inflictor.name] == nil then kill_GP_30_DART[s_Inflictor.name] = 0; end
	kill_GP_30_DART[s_Inflictor.name] = kill_GP_30_DART[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GP-30 BUCK" then
	if kill_GP_30_BUCK[s_Inflictor.name] == nil then kill_GP_30_BUCK[s_Inflictor.name] = 0; end
	kill_GP_30_BUCK[s_Inflictor.name] = kill_GP_30_BUCK[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MEDIC KIT" then
	if kill_MEDIC_KIT[s_Inflictor.name] == nil then kill_MEDIC_KIT[s_Inflictor.name] = 0; end
	kill_MEDIC_KIT[s_Inflictor.name] = kill_MEDIC_KIT[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DEFIBRILLATOR" then
	if kill_DEFIBRILLATOR[s_Inflictor.name] == nil then kill_DEFIBRILLATOR[s_Inflictor.name] = 0; end
	kill_DEFIBRILLATOR[s_Inflictor.name] = kill_DEFIBRILLATOR[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DEFIBRILLATOR"
	or args[7] == "MEDIC KIT" or args[7] == "GP-30 BUCK"
	or args[7] == "GP-30 DART" or args[7] == "GP-30 HE" or args[7] == "GP-30 LVG"
	or args[7] == "GP-30 SMOKE" or args[7] == "M26 DART" or args[7] == "M26 FRAG"
	or args[7] == "M26 MASS" or args[7] == "M26 SLUG" or args[7] == "M320 BUCK"
	or args[7] == "M320 HE" or args[7] == "M320 LVG" or args[7] == "M320 SMOKE" then

	data_weapon_name = args[7]
	data_table_name = "tbl_assault_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AEK-971" then
	if kill_AEK_971[s_Inflictor.name] == nil then kill_AEK_971[s_Inflictor.name] = 0; end
	kill_AEK_971[s_Inflictor.name] = kill_AEK_971[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AK-74M" then
	if kill_AK_74M[s_Inflictor.name] == nil then kill_AK_74M[s_Inflictor.name] = 0; end
	kill_AK_74M[s_Inflictor.name] = kill_AK_74M[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AN-94" then
	if kill_AN_94[s_Inflictor.name] == nil then kill_AN_94[s_Inflictor.name] = 0; end
	kill_AN_94[s_Inflictor.name] = kill_AN_94[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AUG A3" then
	if kill_AUG_A3[s_Inflictor.name] == nil then kill_AUG_A3[s_Inflictor.name] = 0; end
	kill_AUG_A3[s_Inflictor.name] = kill_AUG_A3[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "F2000" then
	if kill_F2000[s_Inflictor.name] == nil then kill_F2000[s_Inflictor.name] = 0; end
	kill_F2000[s_Inflictor.name] = kill_F2000[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "FAMAS" then
	if kill_FAMAS[s_Inflictor.name] == nil then kill_FAMAS[s_Inflictor.name] = 0; end
	kill_FAMAS[s_Inflictor.name] = kill_FAMAS[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "G3A3" then
	if kill_G3A3[s_Inflictor.name] == nil then kill_G3A3[s_Inflictor.name] = 0; end
	kill_G3A3[s_Inflictor.name] = kill_G3A3[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "KH2002" then
	if kill_KH2002[s_Inflictor.name] == nil then kill_KH2002[s_Inflictor.name] = 0; end
	kill_KH2002[s_Inflictor.name] = kill_KH2002[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "L85A2" then
	if kill_L85A2[s_Inflictor.name] == nil then kill_L85A2[s_Inflictor.name] = 0; end
	kill_L85A2[s_Inflictor.name] = kill_L85A2[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M16A3" then
	if kill_M16A3[s_Inflictor.name] == nil then kill_M16A3[s_Inflictor.name] = 0; end
	kill_M16A3[s_Inflictor.name] = kill_M16A3[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M16A4" then
	if kill_M16A4[s_Inflictor.name] == nil then kill_M16A4[s_Inflictor.name] = 0; end
	kill_M16A4[s_Inflictor.name] = kill_M16A4[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M416" then
	if kill_M416[s_Inflictor.name] == nil then kill_M416[s_Inflictor.name] = 0; end
	kill_M416[s_Inflictor.name] = kill_M416[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SCAR-L" then
	if kill_SCAR_L[s_Inflictor.name] == nil then kill_SCAR_L[s_Inflictor.name] = 0; end
	kill_SCAR_L[s_Inflictor.name] = kill_SCAR_L[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AEK-971"
	or args[7] == "AK-74M" or args[7] == "AN-94" or args[7] == "AUG A3"
	or args[7] == "F2000" or args[7] == "FAMAS" or args[7] == "G3A3" or args[7] == "KH2002" or args[7] == "L85A2"
	or args[7] == "M16A3" or args[7] == "M16A4" or args[7] == "M416" or args[7] == "SCAR-L" then

	data_weapon_name = args[7]
	data_table_name = "tbl_assault_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M67 GRENADE" then
	if kill_M67_GRENADE[s_Inflictor.name] == nil then kill_M67_GRENADE[s_Inflictor.name] = 0; end
	kill_M67_GRENADE[s_Inflictor.name] = kill_M67_GRENADE[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "XBOW" then
	if kill_XBOW[s_Inflictor.name] == nil then kill_XBOW[s_Inflictor.name] = 0; end
	kill_XBOW[s_Inflictor.name] = kill_XBOW[s_Inflictor.name] + 1
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "KNIFE" or args[7] == "ACB-90" then
	if kill_KNIFE[s_Inflictor.name] == nil then kill_KNIFE[s_Inflictor.name] = 0; end
	kill_KNIFE[s_Inflictor.name] = kill_KNIFE[s_Inflictor.name] + 1
	-- Litle knife fix.
	if args[7] == "ACB-90" then args[7] = "KNIFE" ; end
	end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M67 GRENADE"
	or args[7] == "XBOW" or args[7] == "KNIFE" or args[7] == "ACB-90" then

	data_weapon_name = args[7]
	data_table_name = "tbl_auxiliary_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "A-91" then
	if kill_A_91[s_Inflictor.name] == nil then kill_A_91[s_Inflictor.name] = 0; end
	kill_A_91[s_Inflictor.name] = kill_A_91[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "ACW-R" then
	if kill_ACW_R[s_Inflictor.name] == nil then kill_ACW_R[s_Inflictor.name] = 0; end
	kill_ACW_R[s_Inflictor.name] = kill_ACW_R[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AKS-74u" then
	if kill_AKS_74u[s_Inflictor.name] == nil then kill_AKS_74u[s_Inflictor.name] = 0; end
	kill_AKS_74u[s_Inflictor.name] = kill_AKS_74u[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "G36C" then
	if kill_G36C[s_Inflictor.name] == nil then kill_G36C[s_Inflictor.name] = 0; end
	kill_G36C[s_Inflictor.name] = kill_G36C[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "G53" then
	if kill_G53[s_Inflictor.name] == nil then kill_G53[s_Inflictor.name] = 0; end
	kill_G53[s_Inflictor.name] = kill_G53[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M4" then
	if kill_M4[s_Inflictor.name] == nil then kill_M4[s_Inflictor.name] = 0; end
	kill_M4[s_Inflictor.name] = kill_M4[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M4A1" then
	if kill_M4A1[s_Inflictor.name] == nil then kill_M4A1[s_Inflictor.name] = 0; end
	kill_M4A1[s_Inflictor.name] = kill_M4A1[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MTAR-21" then
	if kill_MTAR_21[s_Inflictor.name] == nil then kill_MTAR_21[s_Inflictor.name] = 0; end
	kill_MTAR_21[s_Inflictor.name] = kill_MTAR_21[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "QBZ-95B" then
	if kill_QBZ_95B[s_Inflictor.name] == nil then kill_QBZ_95B[s_Inflictor.name] = 0; end
	kill_QBZ_95B[s_Inflictor.name] = kill_QBZ_95B[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SCAR-H" then
	if kill_SCAR_H[s_Inflictor.name] == nil then kill_SCAR_H[s_Inflictor.name] = 0; end
	kill_SCAR_H[s_Inflictor.name] = kill_SCAR_H[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SG553" then
	if kill_SG553[s_Inflictor.name] == nil then kill_SG553[s_Inflictor.name] = 0; end
	kill_SG553[s_Inflictor.name] = kill_SG553[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "A-91"
	or args[7] == "ACW-R" or args[7] == "AKS-74u" or args[7] == "G36C"
	or args[7] == "G53" or args[7] == "M4" or args[7] == "M4A1" or args[7] == "MTAR-21"
	or args[7] == "QBZ-95B" or args[7] == "SCAR-H" or args[7] == "SG553" then

	data_weapon_name = args[7]
	data_table_name = "tbl_engineer_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "EOD BOT" then
	if kill_EOD_BOT[s_Inflictor.name] == nil then kill_EOD_BOT[s_Inflictor.name] = 0; end
	kill_EOD_BOT[s_Inflictor.name] = kill_EOD_BOT[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "FGM-148 JAVELIN" then
	if kill_FGM_148_JAVELIN[s_Inflictor.name] == nil then kill_FGM_148_JAVELIN[s_Inflictor.name] = 0; end
	kill_FGM_148_JAVELIN[s_Inflictor.name] = kill_FGM_148_JAVELIN[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "FIM-92 STINGER" then
	if kill_FIM_92_STINGER[s_Inflictor.name] == nil then kill_FIM_92_STINGER[s_Inflictor.name] = 0; end
	kill_FIM_92_STINGER[s_Inflictor.name] = kill_FIM_92_STINGER[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M15 AT MINE" then
	if kill_M15_AT_MINE[s_Inflictor.name] == nil then kill_M15_AT_MINE[s_Inflictor.name] = 0; end
	kill_M15_AT_MINE[s_Inflictor.name] = kill_M15_AT_MINE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "REPAIR TOOL" then
	if kill_REPAIR_TOOL[s_Inflictor.name] == nil then kill_REPAIR_TOOL[s_Inflictor.name] = 0; end
	kill_REPAIR_TOOL[s_Inflictor.name] = kill_REPAIR_TOOL[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "RPG-7V2" then
	if kill_RPG_7V2[s_Inflictor.name] == nil then kill_RPG_7V2[s_Inflictor.name] = 0; end
	kill_RPG_7V2[s_Inflictor.name] = kill_RPG_7V2[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SA-18 IGLA" then
	if kill_SA_18_IGLA[s_Inflictor.name] == nil then kill_SA_18_IGLA[s_Inflictor.name] = 0; end
	kill_SA_18_IGLA[s_Inflictor.name] = kill_SA_18_IGLA[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SMAW" then
	if kill_SMAW[s_Inflictor.name] == nil then kill_SMAW[s_Inflictor.name] = 0; end
	kill_SMAW[s_Inflictor.name] = kill_SMAW[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "EOD BOT"
	or args[7] == "FGM-148 JAVELIN" or args[7] == "FIM-92 STINGER"
	or args[7] == "M15 AT MINE" or args[7] == "REPAIR TOOL" or args[7] == "RPG-7V2"
	or args[7] == "SA-18 IGLA" or args[7] == "SMAW" then

	data_weapon_name = args[7]
	data_table_name = "tbl_engineer_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" or args[7] == "MP443" then
	if kill_MP443[s_Inflictor.name] == nil then kill_MP443[s_Inflictor.name] = 0; end
	kill_MP443[s_Inflictor.name] = kill_MP443[s_Inflictor.name] + 1
	if args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" then args[7] = "MP443" ; end
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MP412 REX" then
	if kill_MP412_REX[s_Inflictor.name] == nil then kill_MP412_REX[s_Inflictor.name] = 0; end
	kill_MP412_REX[s_Inflictor.name] = kill_MP412_REX[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M9 SUPP" or args[7] == "M9 TACT" or args[7] == "M9" then
	if kill_M9[s_Inflictor.name] == nil then kill_M9[s_Inflictor.name] = 0; end
	kill_M9[s_Inflictor.name] = kill_M9[s_Inflictor.name] + 1
	if args[7] == "M9 SUPP" or args[7] == "M9 TACT" then args[7] = "M9" ; end
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT" or args[7] == "M1911" then
	if kill_M1911[s_Inflictor.name] == nil then kill_M1911[s_Inflictor.name] = 0; end
	kill_M1911[s_Inflictor.name] = kill_M1911[s_Inflictor.name] + 1
	if args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT" then args[7] = "M1911" ; end
	end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "G18 SUPP" or args[7] == "G18" then
	if kill_G18[s_Inflictor.name] == nil then kill_G18[s_Inflictor.name] = 0; end
	kill_G18[s_Inflictor.name] = kill_G18[s_Inflictor.name] + 1
	if args[7] == "G18 SUPP" then args[7] = "G18" ; end
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "G17C SUPP" or args[7] == "G17C" then
	if kill_G17C[s_Inflictor.name] == nil then kill_G17C[s_Inflictor.name] = 0; end
	kill_G17C[s_Inflictor.name] = kill_G17C[s_Inflictor.name] + 1
	if args[7] == "G17C SUPP" then args[7] = "G17C" ; end
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "93R" then
	if kill_93R[s_Inflictor.name] == nil then kill_93R[s_Inflictor.name] = 0; end
	kill_93R[s_Inflictor.name] = kill_93R[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == ".44 MAGNUM" or args[7] == ".44 SCOPED" then
	if kill_44_MAGNUM[s_Inflictor.name] == nil then kill_44_MAGNUM[s_Inflictor.name] = 0; end
	kill_44_MAGNUM[s_Inflictor.name] = kill_44_MAGNUM[s_Inflictor.name] + 1
	if args[7] == ".44 SCOPED" then args[7] = ".44 MAGNUM" ; end
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == ".44 MAGNUM"
	or args[7] == ".44 SCOPED" or args[7] == "93R" or args[7] == "G17C SUPP" or args[7] == "G17C"
	or args[7] == "G18 SUPP" or args[7] == "G18" or args[7] == "M1911 S-TAC" or args[7] == "M1911 SUPP" or args[7] == "M1911 TACT"
	or args[7] == "M1911" or args[7] == "M9 SUPP" or args[7] == "M9 TACT" or args[7] == "M9" or args[7] == "MP412 REX"
	or args[7] == "MP443 SUPP" or args[7] == "MP443 TACT" or args[7] == "MP443" then

	data_weapon_name = args[7]
	data_table_name = "tbl_handguns_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MAV" then
	if kill_MAV[s_Inflictor.name] == nil then kill_MAV[s_Inflictor.name] = 0; end
	kill_MAV[s_Inflictor.name] = kill_MAV[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "RADIO BEACON" then
	if kill_RADIO_BEACON[s_Inflictor.name] == nil then kill_RADIO_BEACON[s_Inflictor.name] = 0; end
	kill_RADIO_BEACON[s_Inflictor.name] = kill_RADIO_BEACON[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SOFLAM" then
	if kill_SOFLAM[s_Inflictor.name] == nil then kill_SOFLAM[s_Inflictor.name] = 0; end
	kill_SOFLAM[s_Inflictor.name] = kill_SOFLAM[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "T-UGS" then
	if kill_T_UGS[s_Inflictor.name] == nil then kill_T_UGS[s_Inflictor.name] = 0; end
	kill_T_UGS[s_Inflictor.name] = kill_T_UGS[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MAV"
	or args[7] == "RADIO BEACON" or args[7] == "SOFLAM" or args[7] == "T-UGS" then

	data_weapon_name = args[7]
	data_table_name = "tbl_recon_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "JNG-90" then
	if kill_JNG_90[s_Inflictor.name] == nil then kill_JNG_90[s_Inflictor.name] = 0; end
	kill_JNG_90[s_Inflictor.name] = kill_JNG_90[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "L96" then
	if kill_L96[s_Inflictor.name] == nil then kill_L96[s_Inflictor.name] = 0; end
	kill_L96[s_Inflictor.name] = kill_L96[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M39 EMR" then
	if kill_M39_EMR[s_Inflictor.name] == nil then kill_M39_EMR[s_Inflictor.name] = 0; end
	kill_M39_EMR[s_Inflictor.name] = kill_M39_EMR[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M40A5" then
	if kill_M40A5[s_Inflictor.name] == nil then kill_M40A5[s_Inflictor.name] = 0; end
	kill_M40A5[s_Inflictor.name] = kill_M40A5[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M417" then
	if kill_M417[s_Inflictor.name] == nil then kill_M417[s_Inflictor.name] = 0; end
	kill_M417[s_Inflictor.name] = kill_M417[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M98B" then
	if kill_M98B[s_Inflictor.name] == nil then kill_M98B[s_Inflictor.name] = 0; end
	kill_M98B[s_Inflictor.name] = kill_M98B[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MK11 MOD 0" then
	if kill_MK11_MOD_0[s_Inflictor.name] == nil then kill_MK11_MOD_0[s_Inflictor.name] = 0; end
	kill_MK11_MOD_0[s_Inflictor.name] = kill_MK11_MOD_0[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "QBU-88" then
	if kill_QBU_88[s_Inflictor.name] == nil then kill_QBU_88[s_Inflictor.name] = 0; end
	kill_QBU_88[s_Inflictor.name] = kill_QBU_88[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SKS" then
	if kill_SKS[s_Inflictor.name] == nil then kill_SKS[s_Inflictor.name] = 0; end
	kill_SKS[s_Inflictor.name] = kill_SKS[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SV98" then
	if kill_SV98[s_Inflictor.name] == nil then kill_SV98[s_Inflictor.name] = 0; end
	kill_SV98[s_Inflictor.name] = kill_SV98[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SVD" then
	if kill_SVD[s_Inflictor.name] == nil then kill_SVD[s_Inflictor.name] = 0; end
	kill_SVD[s_Inflictor.name] = kill_SVD[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "JNG-90"
	or args[7] == "L96" or args[7] == "M39 EMR" or args[7] == "M40A5" or args[7] == "M417"
	or args[7] == "M98B" or args[7] == "MK11 MOD 0" or args[7] == "QBU-88"
	or args[7] == "SKS" or args[7] == "SV98" or args[7] == "SVD" then

	data_weapon_name = args[7]
	data_table_name = "tbl_recon_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "USAS-12" then
	if kill_USAS_12[s_Inflictor.name] == nil then kill_USAS_12[s_Inflictor.name] = 0; end
	kill_USAS_12[s_Inflictor.name] = kill_USAS_12[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SPAS-12" then
	if kill_SPAS_12[s_Inflictor.name] == nil then kill_SPAS_12[s_Inflictor.name] = 0; end
	kill_SPAS_12[s_Inflictor.name] = kill_SPAS_12[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SAIGA 12K" then
	if kill_SAIGA_12K[s_Inflictor.name] == nil then kill_SAIGA_12K[s_Inflictor.name] = 0; end
	kill_SAIGA_12K[s_Inflictor.name] = kill_SAIGA_12K[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MK3A1" then
	if kill_MK3A1[s_Inflictor.name] == nil then kill_MK3A1[s_Inflictor.name] = 0; end
	kill_MK3A1[s_Inflictor.name] = kill_MK3A1[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1014" then
	if kill_M1014[s_Inflictor.name] == nil then kill_M1014[s_Inflictor.name] = 0; end
	kill_M1014[s_Inflictor.name] = kill_M1014[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DAO-12" then
	if kill_DAO_12[s_Inflictor.name] == nil then kill_DAO_12[s_Inflictor.name] = 0; end
	kill_DAO_12[s_Inflictor.name] = kill_DAO_12[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "870MCS" then
	if kill_870MCS[s_Inflictor.name] == nil then kill_870MCS[s_Inflictor.name] = 0; end
	kill_870MCS[s_Inflictor.name] = kill_870MCS[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "870MCS"
	or args[7] == "DAO-12" or args[7] == "M1014" or args[7] == "MK3A1"
	or args[7] == "SAIGA 12K" or args[7] == "SPAS-12" or args[7] == "USAS-12" then

	data_weapon_name = args[7]
	data_table_name = "tbl_shotguns_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AMMO BOX" then
	if kill_AMMO_BOX[s_Inflictor.name] == nil then kill_AMMO_BOX[s_Inflictor.name] = 0; end
	kill_AMMO_BOX[s_Inflictor.name] = kill_AMMO_BOX[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "C4 EXPLOSIVES" then
	if kill_C4_EXPLOSIVES[s_Inflictor.name] == nil then kill_C4_EXPLOSIVES[s_Inflictor.name] = 0; end
	kill_C4_EXPLOSIVES[s_Inflictor.name] = kill_C4_EXPLOSIVES[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M18 CLAYMORE" then
	if kill_M18_CLAYMORE[s_Inflictor.name] == nil then kill_M18_CLAYMORE[s_Inflictor.name] = 0; end
	kill_M18_CLAYMORE[s_Inflictor.name] = kill_M18_CLAYMORE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M224 MORTAR" then
	if kill_M224_MORTAR[s_Inflictor.name] == nil then kill_M224_MORTAR[s_Inflictor.name] = 0; end
	kill_M224_MORTAR[s_Inflictor.name] = kill_M224_MORTAR[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AMMO BOX"
	or args[7] == "C4 EXPLOSIVES" or args[7] == "M18 CLAYMORE" or args[7] == "M224 MORTAR" then

	data_weapon_name = args[7]
	data_table_name = "tbl_support_gadgets"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "L86A2" then
	if kill_L86A2[s_Inflictor.name] == nil then kill_L86A2[s_Inflictor.name] = 0; end
	kill_L86A2[s_Inflictor.name] = kill_L86A2[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "LSAT" then
	if kill_LSAT[s_Inflictor.name] == nil then kill_LSAT[s_Inflictor.name] = 0; end
	kill_LSAT[s_Inflictor.name] = kill_LSAT[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M240B" then
	if kill_M240B[s_Inflictor.name] == nil then kill_M240B[s_Inflictor.name] = 0; end
	kill_M240B[s_Inflictor.name] = kill_M240B[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M249" then
	if kill_M249[s_Inflictor.name] == nil then kill_M249[s_Inflictor.name] = 0; end
	kill_M249[s_Inflictor.name] = kill_M249[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M27 IAR" then
	if kill_M27_IAR[s_Inflictor.name] == nil then kill_M27_IAR[s_Inflictor.name] = 0; end
	kill_M27_IAR[s_Inflictor.name] = kill_M27_IAR[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M60E4" then
	if kill_M60E4[s_Inflictor.name] == nil then kill_M60E4[s_Inflictor.name] = 0; end
	kill_M60E4[s_Inflictor.name] = kill_M60E4[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MG36" then
	if kill_MG36[s_Inflictor.name] == nil then kill_MG36[s_Inflictor.name] = 0; end
	kill_MG36[s_Inflictor.name] = kill_MG36[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PKP PECHENEG" then
	if kill_PKP_PECHENEG[s_Inflictor.name] == nil then kill_PKP_PECHENEG[s_Inflictor.name] = 0; end
	kill_PKP_PECHENEG[s_Inflictor.name] = kill_PKP_PECHENEG[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "QBB-95" then
	if kill_QBB_95[s_Inflictor.name] == nil then kill_QBB_95[s_Inflictor.name] = 0; end
	kill_QBB_95[s_Inflictor.name] = kill_QBB_95[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "RPK-74M" then
	if kill_RPK_74M[s_Inflictor.name] == nil then kill_RPK_74M[s_Inflictor.name] = 0; end
	kill_RPK_74M[s_Inflictor.name] = kill_RPK_74M[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "TYPE 88 LMG" then
	if kill_TYPE_88_LMG[s_Inflictor.name] == nil then kill_TYPE_88_LMG[s_Inflictor.name] = 0; end
	kill_TYPE_88_LMG[s_Inflictor.name] = kill_TYPE_88_LMG[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "L86A2"
	or args[7] == "LSAT" or args[7] == "M240B" or args[7] == "M249"
	or args[7] == "M27 IAR" or args[7] == "M60E4" or args[7] == "MG36" or args[7] == "PKP PECHENEG"
	or args[7] == "QBB-95" or args[7] == "RPK-74M" or args[7] == "TYPE 88 LMG" then

	data_weapon_name = args[7]
	data_table_name = "tbl_support_weapons"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "TV MISSILE" then
	if kill_TV_MISSILE[s_Inflictor.name] == nil then kill_TV_MISSILE[s_Inflictor.name] = 0; end
	kill_TV_MISSILE[s_Inflictor.name] = kill_TV_MISSILE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "A-10 THUNDERBOLT" then
	if kill_A10_THUNDERBOLT[s_Inflictor.name] == nil then kill_A10_THUNDERBOLT[s_Inflictor.name] = 0; end
	kill_A10_THUNDERBOLT[s_Inflictor.name] = kill_A10_THUNDERBOLT[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AH-1Z VIPER" then
	if kill_AH_1Z_VIPER[s_Inflictor.name] == nil then kill_AH_1Z_VIPER[s_Inflictor.name] = 0; end
	kill_AH_1Z_VIPER[s_Inflictor.name] = kill_AH_1Z_VIPER[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AH-6J LITTLE BIRD" then
	if kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] == nil then kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] = 0; end
	kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] = kill_AH_6J_LITTLE_BIRD[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "F-35" then
	if kill_F_35[s_Inflictor.name] == nil then kill_F_35[s_Inflictor.name] = 0; end
	kill_F_35[s_Inflictor.name] = kill_F_35[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "F/A-18E SUPER HORNET" then
	if kill_FA_18E_SUPER_HORNET[s_Inflictor.name] == nil then kill_FA_18E_SUPER_HORNET[s_Inflictor.name] = 0; end
	kill_FA_18E_SUPER_HORNET[s_Inflictor.name] = kill_FA_18E_SUPER_HORNET[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GUNSHIP" then
	if kill_GUNSHIP[s_Inflictor.name] == nil then kill_GUNSHIP[s_Inflictor.name] = 0; end
	kill_GUNSHIP[s_Inflictor.name] = kill_GUNSHIP[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "KA-60 KASATKA" then
	if kill_KA_60_KASATKA[s_Inflictor.name] == nil then kill_KA_60_KASATKA[s_Inflictor.name] = 0; end
	kill_KA_60_KASATKA[s_Inflictor.name] = kill_KA_60_KASATKA[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "MI-28 HAVOC" then
	if kill_MI_28_HAVOC[s_Inflictor.name] == nil then kill_MI_28_HAVOC[s_Inflictor.name] = 0; end
	kill_MI_28_HAVOC[s_Inflictor.name] = kill_MI_28_HAVOC[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SU-25TM FROGFOOT" then
	if kill_SU_25TM_FROGFOOT[s_Inflictor.name] == nil then kill_SU_25TM_FROGFOOT[s_Inflictor.name] = 0; end
	kill_SU_25TM_FROGFOOT[s_Inflictor.name] = kill_SU_25TM_FROGFOOT[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SU-35BM FLANKER-E" then
	if kill_SU_35BM_FLANKER_E[s_Inflictor.name] == nil then kill_SU_35BM_FLANKER_E[s_Inflictor.name] = 0; end
	kill_SU_35BM_FLANKER_E[s_Inflictor.name] = kill_SU_35BM_FLANKER_E[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SU-37" then
	if kill_SU_37[s_Inflictor.name] == nil then kill_SU_37[s_Inflictor.name] = 0; end
	kill_SU_37[s_Inflictor.name] = kill_SU_37[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "UH-1Y VENOM" then
	if kill_UH_1Y_VENOM[s_Inflictor.name] == nil then kill_UH_1Y_VENOM[s_Inflictor.name] = 0; end
	kill_UH_1Y_VENOM[s_Inflictor.name] = kill_UH_1Y_VENOM[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "Z-11W" then
	if kill_Z_11W[s_Inflictor.name] == nil then kill_Z_11W[s_Inflictor.name] = 0; end
	kill_Z_11W[s_Inflictor.name] = kill_Z_11W[s_Inflictor.name] + 1
        end
--
--

	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "A-10 THUNDERBOLT"
	or args[7] == "AH-1Z VIPER" or args[7] == "AH-6J LITTLE BIRD" or args[7] == "F-35"
	or args[7] == "F/A-18E SUPER HORNET" or args[7] == "GUNSHIP" or args[7] == "KA-60 KASATKA" or args[7] == "MI-28 HAVOC"
	or args[7] == "SU-25TM FROGFOOT" or args[7] == "SU-35BM FLANKER-E" or args[7] == "SU-37"
	or args[7] == "TV MISSILE" or args[7] == "UH-1Y VENOM" or args[7] == "Z-11W" then

	data_weapon_name = args[7]
	data_table_name = "tbl_air_vehicles"
	data_playername = s_Inflictor.name
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end


	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "9K22 TUNGUSKA-M" then
	if kill_9K22_TUNGUSKA_M[s_Inflictor.name] == nil then kill_9K22_TUNGUSKA_M[s_Inflictor.name] = 0; end
	kill_9K22_TUNGUSKA_M[s_Inflictor.name] = kill_9K22_TUNGUSKA_M[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "9M133 KORNET LAUNCHER" then
	if kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] == nil then kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = 0; end
	kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] = kill_9M133_KORNET_LAUNCHER[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "AAV-7A1 AMTRAC" then
	if kill_AAV_7A1_AMTRAC[s_Inflictor.name] == nil then kill_AAV_7A1_AMTRAC[s_Inflictor.name] = 0; end
	kill_AAV_7A1_AMTRAC[s_Inflictor.name] = kill_AAV_7A1_AMTRAC[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BARSUK" then
	if kill_BARSUK[s_Inflictor.name] == nil then kill_BARSUK[s_Inflictor.name] = 0; end
	kill_BARSUK[s_Inflictor.name] = kill_BARSUK[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BM-23" then
	if kill_BM_23[s_Inflictor.name] == nil then kill_BM_23[s_Inflictor.name] = 0; end
	kill_BM_23[s_Inflictor.name] = kill_BM_23[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BMP-2M" then
	if kill_BMP_2M[s_Inflictor.name] == nil then kill_BMP_2M[s_Inflictor.name] = 0; end
	kill_BMP_2M[s_Inflictor.name] = kill_BMP_2M[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "BTR-90" then
	if kill_BTR_90[s_Inflictor.name] == nil then kill_BTR_90[s_Inflictor.name] = 0; end
	kill_BTR_90[s_Inflictor.name] = kill_BTR_90[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "CENTURION C-RAM" then
	if kill_CENTURION_C_RAM[s_Inflictor.name] == nil then kill_CENTURION_C_RAM[s_Inflictor.name] = 0; end
	kill_CENTURION_C_RAM[s_Inflictor.name] = kill_CENTURION_C_RAM[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "CIVILIAN CAR" then
	if kill_CIVILIAN_CAR[s_Inflictor.name] == nil then kill_CIVILIAN_CAR[s_Inflictor.name] = 0; end
	kill_CIVILIAN_CAR[s_Inflictor.name] = kill_CIVILIAN_CAR[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DELIVERY VAN" then
	if kill_DELIVERY_VAN[s_Inflictor.name] == nil then kill_DELIVERY_VAN[s_Inflictor.name] = 0; end
	kill_DELIVERY_VAN[s_Inflictor.name] = kill_DELIVERY_VAN[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DIRTBIKE" then
	if kill_DIRTBIKE[s_Inflictor.name] == nil then kill_DIRTBIKE[s_Inflictor.name] = 0; end
	kill_DIRTBIKE[s_Inflictor.name] = kill_DIRTBIKE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "DPV" then
	if kill_DPV[s_Inflictor.name] == nil then kill_DPV[s_Inflictor.name] = 0; end
	kill_DPV[s_Inflictor.name] = kill_DPV[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GAZ-3937 VODNIK" then
	if kill_GAZ_3937_VODNIK[s_Inflictor.name] == nil then kill_GAZ_3937_VODNIK[s_Inflictor.name] = 0; end
	kill_GAZ_3937_VODNIK[s_Inflictor.name] = kill_GAZ_3937_VODNIK[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "GROWLER ITV" then
	if kill_GROWLER_ITV[s_Inflictor.name] == nil then kill_GROWLER_ITV[s_Inflictor.name] = 0; end
	kill_GROWLER_ITV[s_Inflictor.name] = kill_GROWLER_ITV[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "HMMWV ASRAD" then
	if kill_HMMWV_ASRAD[s_Inflictor.name] == nil then kill_HMMWV_ASRAD[s_Inflictor.name] = 0; end
	kill_HMMWV_ASRAD[s_Inflictor.name] = kill_HMMWV_ASRAD[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "LAV-25" then
	if kill_LAV_25[s_Inflictor.name] == nil then kill_LAV_25[s_Inflictor.name] = 0; end
	kill_LAV_25[s_Inflictor.name] = kill_LAV_25[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "LAV-AD" then
	if kill_LAV_AD[s_Inflictor.name] == nil then kill_LAV_AD[s_Inflictor.name] = 0; end
	kill_LAV_AD[s_Inflictor.name] = kill_LAV_AD[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1 ABRAMS" then
	if kill_M1_ABRAMS[s_Inflictor.name] == nil then kill_M1_ABRAMS[s_Inflictor.name] = 0; end
	kill_M1_ABRAMS[s_Inflictor.name] = kill_M1_ABRAMS[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1114 HMMWV" then
	if kill_M1114_HMMWV[s_Inflictor.name] == nil then kill_M1114_HMMWV[s_Inflictor.name] = 0; end
	kill_M1114_HMMWV[s_Inflictor.name] = kill_M1114_HMMWV[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M1128" then
	if kill_M1128[s_Inflictor.name] == nil then kill_M1128[s_Inflictor.name] = 0; end
	kill_M1128[s_Inflictor.name] = kill_M1128[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M142" then
	if kill_M142[s_Inflictor.name] == nil then kill_M142[s_Inflictor.name] = 0; end
	kill_M142[s_Inflictor.name] = kill_M142[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "M220 TOW LAUNCHER" then
	if kill_M220_TOW_LAUNCHER[s_Inflictor.name] == nil then kill_M220_TOW_LAUNCHER[s_Inflictor.name] = 0; end
	kill_M220_TOW_LAUNCHER[s_Inflictor.name] = kill_M220_TOW_LAUNCHER[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PANTSIR-S1" then
	if kill_PANTSIR_S1[s_Inflictor.name] == nil then kill_PANTSIR_S1[s_Inflictor.name] = 0; end
	kill_PANTSIR_S1[s_Inflictor.name] = kill_PANTSIR_S1[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "PHOENIX" then
	if kill_PHOENIX[s_Inflictor.name] == nil then kill_PHOENIX[s_Inflictor.name] = 0; end
	kill_PHOENIX[s_Inflictor.name] = kill_PHOENIX[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "POLICE VAN" then
	if kill_POLICE_VAN[s_Inflictor.name] == nil then kill_POLICE_VAN[s_Inflictor.name] = 0; end
	kill_POLICE_VAN[s_Inflictor.name] = kill_POLICE_VAN[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "QUAD BIKE" then
	if kill_QUAD_BIKE[s_Inflictor.name] == nil then kill_QUAD_BIKE[s_Inflictor.name] = 0; end
	kill_QUAD_BIKE[s_Inflictor.name] = kill_QUAD_BIKE[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "RHIB BOAT" then
	if kill_RHIB_BOAT[s_Inflictor.name] == nil then kill_RHIB_BOAT[s_Inflictor.name] = 0; end
	kill_RHIB_BOAT[s_Inflictor.name] = kill_RHIB_BOAT[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "RHINO" then
	if kill_RHINO[s_Inflictor.name] == nil then kill_RHINO[s_Inflictor.name] = 0; end
	kill_RHINO[s_Inflictor.name] = kill_RHINO[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SKID LOADER" then
	if kill_SKID_LOADER[s_Inflictor.name] == nil then kill_SKID_LOADER[s_Inflictor.name] = 0; end
	kill_SKID_LOADER[s_Inflictor.name] = kill_SKID_LOADER[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SPRUT-SD" then
	if kill_SPRUT_SD[s_Inflictor.name] == nil then kill_SPRUT_SD[s_Inflictor.name] = 0; end
	kill_SPRUT_SD[s_Inflictor.name] = kill_SPRUT_SD[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "SUV" then
	if kill_SUV[s_Inflictor.name] == nil then kill_SUV[s_Inflictor.name] = 0; end
	kill_SUV[s_Inflictor.name] = kill_SUV[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "T-90A" then
	if kill_T_90A[s_Inflictor.name] == nil then kill_T_90A[s_Inflictor.name] = 0; end
	kill_T_90A[s_Inflictor.name] = kill_T_90A[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "TECHNICAL TRUCK" then
	if kill_TECHNICAL_TRUCK[s_Inflictor.name] == nil then kill_TECHNICAL_TRUCK[s_Inflictor.name] = 0; end
	kill_TECHNICAL_TRUCK[s_Inflictor.name] = kill_TECHNICAL_TRUCK[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "VDV Buggy" then
	if kill_VDV_Buggy[s_Inflictor.name] == nil then kill_VDV_Buggy[s_Inflictor.name] = 0; end
	kill_VDV_Buggy[s_Inflictor.name] = kill_VDV_Buggy[s_Inflictor.name] + 1
        end
--
	if getnamehuman[s_Inflictor.name] == s_Inflictor.name and args[7] == "VODNIK AA" then
	if kill_VODNIK_AA[s_Inflictor.name] == nil then kill_VODNIK_AA[s_Inflictor.name] = 0; end
	kill_VODNIK_AA[s_Inflictor.name] = kill_VODNIK_AA[s_Inflictor.name] + 1
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
	data_catagory = "Weapon data:"
	iamyourdaddy(data_playername)
	end

end)


return Combined()

