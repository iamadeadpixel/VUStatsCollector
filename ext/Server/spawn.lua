-- Spaghetti code by iamadeadpixel

---@class spawn
spawn = class 'spawn'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Spawn and variables stuff loaded ***");
	end
	end
end)

-- spawn/respawn event
Events:Subscribe('Player:Respawn', function(player, recipientMask, message, info, yell, playerGuid, accountGuid)
	if haltprocess then return end

	data_playername = player.name

	do
	setplayervariables(player, data_playername)
	end

	playerteamID[data_playername] = player.teamId
	getnameall[data_playername] = data_playername

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[data_playername] ~= data_playername then return end
	end

	-- Return if the player has been announced already
	if playerishuman[data_playername] then return end


	do
	addbot2database(player, data_playername)
	end

end)

-- ---------


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--[[
Reserved for ,what ever...
]]

function playerunknown(player, data_playername)


end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

--[[
]]

function addbot2database(player, data_playername)

	-- Return if the bot has been announced already
	if playerisbot[data_playername] then return end
	getnamebot[data_playername] = data_playername

	    -- Add the bot to the playerisBot table
	playerisbot[data_playername] = true

	local Botname_results = SQL:Query ('SELECT Soldiername FROM tbl_playerstats')
		if not Botname_results then
			print('*** Bot Info: - Failed to read Bot Guid query: '..SQL:Error())
			return end

		for _, l_Row in pairs(Botname_results) do
			Bottemp_Name = l_Row["Soldiername"]

		if getnamebot[data_playername] == Bottemp_Name then print("*** Bot Info: FOUND BOT IN DATABASE: " ..getnamebot[data_playername]) ;return end
	end

	print("*** Bot Info: Adding new BOT to database:" ..getnamebot[data_playername])

	s_Query ='INSERT INTO tbl_playerstats     (Soldiername,         Score, Kills, Deaths, Suicide, Headshots, TeamKilled, Dogtags, Revives, Killstreaks, Wins, Losses, Shot, Hits) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
	if not SQL:Query(s_Query,	    getnamebot[data_playername],	  0,	 0,	0,	 0,	  0,	      0,	 0,	  0,         0,       0,      0,    0,    0) then

			print('*** BotGuid.lua - Failed to execute BOT query: ' .. SQL:Error())
			return end

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

--[[
All player variables that counts from 0 to xxx set here
]]

function setplayervariables(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable[data_playername] then
	return
	end


--	print ("### Setting variables for "..data_playername)

-- Killstreak stuff
	if killstreak[data_playername] == nil then killstreak[data_playername] = 0; end
	if killstreak[data_playername] == nil then killstreak[data_playername] = 0; end
	if killstreak_counter[data_playername] == nil then killstreak_counter[data_playername] = 0; end
	if killstreak_counter[data_playername] == nil then killstreak_counter[data_playername] = 0; end
	if killstreak_lock[data_playername] == nil then killstreak_lock[data_playername] = 0; end

-- air vehicle stuff
	if kill_A10_THUNDERBOLT[data_playername] == nil then kill_A10_THUNDERBOLT[data_playername] = 0; end
	if kill_AH_1Z_VIPER[data_playername] == nil then kill_AH_1Z_VIPER[data_playername] = 0; end
	if kill_AH_6J_LITTLE_BIRD[data_playername] == nil then kill_AH_6J_LITTLE_BIRD[data_playername] = 0; end
	if kill_F_35[data_playername] == nil then kill_F_35[data_playername] = 0; end
	if kill_FA_18E_SUPER_HORNET[data_playername] == nil then kill_FA_18E_SUPER_HORNET[data_playername] = 0; end
	if kill_GUNSHIP[data_playername] == nil then kill_GUNSHIP[data_playername] = 0; end
	if kill_KA_60_KASATKA[data_playername] == nil then kill_KA_60_KASATKA[data_playername] = 0; end
	if kill_MI_28_HAVOC[data_playername] == nil then kill_MI_28_HAVOC[data_playername] = 0; end
	if kill_SU_25TM_FROGFOOT[data_playername] == nil then kill_SU_25TM_FROGFOOT[data_playername] = 0; end
	if kill_SU_35BM_FLANKER_E[data_playername] == nil then kill_SU_35BM_FLANKER_E[data_playername] = 0; end
	if kill_SU_37[data_playername] == nil then kill_SU_37[data_playername] = 0; end
	if kill_TV_MISSILE[data_playername] == nil then kill_TV_MISSILE[data_playername] = 0; end
	if kill_UH_1Y_VENOM[data_playername] == nil then kill_UH_1Y_VENOM[data_playername] = 0; end
	if kill_Z_11W[data_playername] == nil then kill_Z_11W[data_playername] = 0; end

-- assault Gadget stuff
	if kill_DEFIBRILLATOR[data_playername] == nil then kill_DEFIBRILLATOR[data_playername] = 0; end
	if kill_MEDIC_KIT[data_playername] == nil then kill_MEDIC_KIT[data_playername] = 0; end
	if kill_GP_30_BUCK[data_playername] == nil then kill_GP_30_BUCK[data_playername] = 0; end
	if kill_GP_30_DART[data_playername] == nil then kill_GP_30_DART[data_playername] = 0; end
	if kill_GP_30_HE[data_playername] == nil then kill_GP_30_HE[data_playername] = 0; end
	if kill_GP_30_LVG[data_playername] == nil then kill_GP_30_LVG[data_playername] = 0; end
	if kill_GP_30_SMOKE[data_playername] == nil then kill_GP_30_SMOKE[data_playername] = 0; end
	if kill_M26_DART[data_playername] == nil then kill_M26_DART[data_playername] = 0; end
	if kill_M26_FRAG[data_playername] == nil then kill_M26_FRAG[data_playername] = 0; end
	if kill_M26_MASS[data_playername] == nil then kill_M26_MASS[data_playername] = 0; end
	if kill_M26_SLUG[data_playername] == nil then kill_M26_SLUG[data_playername] = 0; end
	if kill_M320_BUCK[data_playername] == nil then kill_M320_BUCK[data_playername] = 0; end
	if kill_M320_HE[data_playername] == nil then kill_M320_HE[data_playername] = 0; end
	if kill_M320_LVG[data_playername] == nil then kill_M320_LVG[data_playername] = 0; end
	if kill_M320_SMOKE[data_playername] == nil then kill_M320_SMOKE[data_playername] = 0; end

-- assault weapon
	if kill_AEK_971[data_playername] == nil then kill_AEK_971[data_playername] = 0; end
	if kill_AK_74M[data_playername] == nil then kill_AK_74M[data_playername] = 0; end
	if kill_AN_94[data_playername] == nil then kill_AN_94[data_playername] = 0; end
	if kill_AUG_A3[data_playername] == nil then kill_AUG_A3[data_playername] = 0; end
	if kill_F2000[data_playername] == nil then kill_F2000[data_playername] = 0; end
	if kill_FAMAS[data_playername] == nil then kill_FAMAS[data_playername] = 0; end
	if kill_G3A3[data_playername] == nil then kill_G3A3[data_playername] = 0; end
	if kill_KH2002[data_playername] == nil then kill_KH2002[data_playername] = 0; end
	if kill_L85A2[data_playername] == nil then kill_L85A2[data_playername] = 0; end
	if kill_M16A3[data_playername] == nil then kill_M16A3[data_playername] = 0; end
	if kill_M16A4[data_playername] == nil then kill_M16A4[data_playername] = 0; end
	if kill_M416[data_playername] == nil then kill_M416[data_playername] = 0; end
	if kill_SCAR_L[data_playername] == nil then kill_SCAR_L[data_playername] = 0; end

-- Base kill / death stuff
	if playerdeaths[data_playername] == nil then playerdeaths[data_playername] = 0; end
	if playerheadshot[data_playername] == nil then playerheadshot[data_playername] = 0; end
	if playerkills[data_playername] == nil then playerkills[data_playername] = 0; end
	if playersuicides[data_playername] == nil then playersuicides[data_playername] = 0; end
	if playerteamkilled[data_playername] == nil then playerteamkilled[data_playername] = 0; end

-- common weapon stuff
	if kill_AS_VAL[data_playername] == nil then kill_AS_VAL[data_playername] = 0; end
	if kill_KNIFE[data_playername] == nil then kill_KNIFE[data_playername] = 0; end
	if kill_M5K[data_playername] == nil then kill_M5K[data_playername] = 0; end
	if kill_M67_GRENADE[data_playername] == nil then kill_M67_GRENADE[data_playername] = 0; end
	if kill_MP7[data_playername] == nil then kill_MP7[data_playername] = 0; end
	if kill_P90[data_playername] == nil then kill_P90[data_playername] = 0; end
	if kill_PDW_R[data_playername] == nil then kill_PDW_R[data_playername] = 0; end
	if kill_PP_19[data_playername] == nil then kill_PP_19[data_playername] = 0; end
	if kill_PP_2000[data_playername] == nil then kill_PP_2000[data_playername] = 0; end
	if kill_UMP_45[data_playername] == nil then kill_UMP_45[data_playername] = 0; end
	if kill_XBOW[data_playername] == nil then kill_XBOW[data_playername] = 0; end
	if playerdogtags[data_playername] == nil then playerdogtags[data_playername] = 0; end

-- engineer gadget stuff
	if kill_EOD_BOT[data_playername] == nil then kill_EOD_BOT[data_playername] = 0; end
	if kill_FGM_148_JAVELIN[data_playername] == nil then kill_FGM_148_JAVELIN[data_playername] = 0; end
	if kill_FIM_92_STINGER[data_playername] == nil then kill_FIM_92_STINGER[data_playername] = 0; end
	if kill_M15_AT_MINE[data_playername] == nil then kill_M15_AT_MINE[data_playername] = 0; end
	if kill_REPAIR_TOOL[data_playername] == nil then kill_REPAIR_TOOL[data_playername] = 0; end
	if kill_RPG_7V2[data_playername] == nil then kill_RPG_7V2[data_playername] = 0; end
	if kill_SA_18_IGLA[data_playername] == nil then kill_SA_18_IGLA[data_playername] = 0; end
	if kill_SMAW[data_playername] == nil then kill_SMAW[data_playername] = 0; end

-- engineer weapon stuff
	if kill_A_91[data_playername] == nil then kill_A_91[data_playername] = 0; end
	if kill_ACW_R[data_playername] == nil then kill_ACW_R[data_playername] = 0; end
	if kill_AKS_74u[data_playername] == nil then kill_AKS_74u[data_playername] = 0; end
	if kill_G36C[data_playername] == nil then kill_G36C[data_playername] = 0; end
	if kill_G53[data_playername] == nil then kill_G53[data_playername] = 0; end
	if kill_M4[data_playername] == nil then kill_M4[data_playername] = 0; end
	if kill_M4A1[data_playername] == nil then kill_M4A1[data_playername] = 0; end
	if kill_MTAR_21[data_playername] == nil then kill_MTAR_21[data_playername] = 0; end
	if kill_QBZ_95B[data_playername] == nil then kill_QBZ_95B[data_playername] = 0; end
	if kill_SCAR_H[data_playername] == nil then kill_SCAR_H[data_playername] = 0; end
	if kill_SG553[data_playername] == nil then kill_SG553[data_playername] = 0; end

-- handguns  stuff
	if kill_44_MAGNUM[data_playername] == nil then kill_44_MAGNUM[data_playername] = 0; end
	if kill_93R[data_playername] == nil then kill_93R[data_playername] = 0; end
	if kill_G17C[data_playername] == nil then kill_G17C[data_playername] = 0; end
	if kill_G18[data_playername] == nil then kill_G18[data_playername] = 0; end
	if kill_M1911[data_playername] == nil then kill_M1911[data_playername] = 0; end
	if kill_M9[data_playername] == nil then kill_M9[data_playername] = 0; end
	if kill_MP412_REX[data_playername] == nil then kill_MP412_REX[data_playername] = 0; end
	if kill_MP443[data_playername] == nil then kill_MP443[data_playername] = 0; end

-- land vehicle stuff
	if kill_9K22_TUNGUSKA_M[data_playername] == nil then kill_9K22_TUNGUSKA_M[data_playername] = 0; end
	if kill_9M133_KORNET_LAUNCHER[data_playername] == nil then kill_9M133_KORNET_LAUNCHER[data_playername] = 0; end
	if kill_AAV_7A1_AMTRAC[data_playername] == nil then kill_AAV_7A1_AMTRAC[data_playername] = 0; end
	if kill_BARSUK[data_playername] == nil then kill_BARSUK[data_playername] = 0; end
	if kill_BM_23[data_playername] == nil then kill_BM_23[data_playername] = 0; end
	if kill_BMP_2M[data_playername] == nil then kill_BMP_2M[data_playername] = 0; end
	if kill_BTR_90[data_playername] == nil then kill_BTR_90[data_playername] = 0; end
	if kill_CENTURION_C_RAM[data_playername] == nil then kill_CENTURION_C_RAM[data_playername] = 0; end
	if kill_CIVILIAN_CAR[data_playername] == nil then kill_CIVILIAN_CAR[data_playername] = 0; end
	if kill_DELIVERY_VAN[data_playername] == nil then kill_DELIVERY_VAN[data_playername] = 0; end
	if kill_DIRTBIKE[data_playername] == nil then kill_DIRTBIKE[data_playername] = 0; end
	if kill_DPV[data_playername] == nil then kill_DPV[data_playername] = 0; end
	if kill_GAZ_3937_VODNIK[data_playername] == nil then kill_GAZ_3937_VODNIK[data_playername] = 0; end
	if kill_GROWLER_ITV[data_playername] == nil then kill_GROWLER_ITV[data_playername] = 0; end
	if kill_HMMWV_ASRAD[data_playername] == nil then kill_HMMWV_ASRAD[data_playername] = 0; end
	if kill_LAV_25[data_playername] == nil then kill_LAV_25[data_playername] = 0; end
	if kill_LAV_AD[data_playername] == nil then kill_LAV_AD[data_playername] = 0; end
	if kill_M1114_HMMWV[data_playername] == nil then kill_M1114_HMMWV[data_playername] = 0; end
	if kill_M1128[data_playername] == nil then kill_M1128[data_playername] = 0; end
	if kill_M142[data_playername] == nil then kill_M142[data_playername] = 0; end
	if kill_M1_ABRAMS[data_playername] == nil then kill_M1_ABRAMS[data_playername] = 0; end
	if kill_M220_TOW_LAUNCHER[data_playername] == nil then kill_M220_TOW_LAUNCHER[data_playername] = 0; end
	if kill_PANTSIR_S1[data_playername] == nil then kill_PANTSIR_S1[data_playername] = 0; end
	if kill_PHOENIX[data_playername] == nil then kill_PHOENIX[data_playername] = 0; end
	if kill_POLICE_VAN[data_playername] == nil then kill_POLICE_VAN[data_playername] = 0; end
	if kill_QUAD_BIKE[data_playername] == nil then kill_QUAD_BIKE[data_playername] = 0; end
	if kill_RHIB_BOAT[data_playername] == nil then kill_RHIB_BOAT[data_playername] = 0; end
	if kill_RHINO[data_playername] == nil then kill_RHINO[data_playername] = 0; end
	if kill_SKID_LOADER[data_playername] == nil then kill_SKID_LOADER[data_playername] = 0; end
	if kill_SPRUT_SD[data_playername] == nil then kill_SPRUT_SD[data_playername] = 0; end
	if kill_SUV[data_playername] == nil then kill_SUV[data_playername] = 0; end
	if kill_T_90A[data_playername] == nil then kill_T_90A[data_playername] = 0; end
	if kill_TECHNICAL_TRUCK[data_playername] == nil then kill_TECHNICAL_TRUCK[data_playername] = 0; end
	if kill_VDV_Buggy[data_playername] == nil then kill_VDV_Buggy[data_playername] = 0; end
	if kill_VODNIK_AA[data_playername] == nil then kill_VODNIK_AA[data_playername] = 0; end

-- Mcom stuff
	if Mcom_Armed[data_playername] == nil then Mcom_Armed[data_playername] = 0 ; end 
	if Mcom_Destroyed[data_playername] == nil then Mcom_Destroyed[data_playername] = 0 ; end
	if Mcom_Disarmed[data_playername] == nil then Mcom_Disarmed[data_playername] = 0 ; end

-- recon gadgets stuff
	if kill_MAV[data_playername] == nil then kill_MAV[data_playername] = 0; end
	if kill_RADIO_BEACON[data_playername] == nil then kill_RADIO_BEACON[data_playername] = 0; end
	if kill_SOFLAM[data_playername] == nil then kill_SOFLAM[data_playername] = 0; end
	if kill_T_UGS[data_playername] == nil then kill_T_UGS[data_playername] = 0; end

-- recon weapon stuff
	if kill_JNG_90[data_playername] == nil then kill_JNG_90[data_playername] = 0; end
	if kill_L96[data_playername] == nil then kill_L96[data_playername] = 0; end
	if kill_M39_EMR[data_playername] == nil then kill_M39_EMR[data_playername] = 0; end
	if kill_M40A5[data_playername] == nil then kill_M40A5[data_playername] = 0; end
	if kill_M417[data_playername] == nil then kill_M417[data_playername] = 0; end
	if kill_M98B[data_playername] == nil then kill_M98B[data_playername] = 0; end
	if kill_MK11_MOD_0[data_playername] == nil then kill_MK11_MOD_0[data_playername] = 0; end
	if kill_QBU_88[data_playername] == nil then kill_QBU_88[data_playername] = 0; end
	if kill_SKS[data_playername] == nil then kill_SKS[data_playername] = 0; end
	if kill_SV98[data_playername] == nil then kill_SV98[data_playername] = 0; end
	if kill_SVD[data_playername] == nil then kill_SVD[data_playername] = 0; end

-- roadkill stuff
	if kill_roadkills[data_playername] == nil then kill_roadkills[data_playername] = 0; end

-- shotgun stuff
	if kill_USAS_12[data_playername] == nil then kill_USAS_12[data_playername] = 0; end
	if kill_SPAS_12[data_playername] == nil then kill_SPAS_12[data_playername] = 0; end
	if kill_SAIGA_12K[data_playername] == nil then kill_SAIGA_12K[data_playername] = 0; end
	if kill_MK3A1[data_playername] == nil then kill_MK3A1[data_playername] = 0; end
	if kill_M1014[data_playername] == nil then kill_M1014[data_playername] = 0; end
	if kill_DAO_12[data_playername] == nil then kill_DAO_12[data_playername] = 0; end
	if kill_870MCS[data_playername] == nil then kill_870MCS[data_playername] = 0; end

-- support gadgets stuff
	if kill_AMMO_BOX[data_playername] == nil then kill_AMMO_BOX[data_playername] = 0; end
	if kill_C4_EXPLOSIVES[data_playername] == nil then kill_C4_EXPLOSIVES[data_playername] = 0; end
	if kill_M18_CLAYMORE[data_playername] == nil then kill_M18_CLAYMORE[data_playername] = 0; end
	if kill_M224_MORTAR[data_playername] == nil then kill_M224_MORTAR[data_playername] = 0; end

-- support weapon stuff
	if kill_L86A2[data_playername] == nil then kill_L86A2[data_playername] = 0; end
	if kill_LSAT[data_playername] == nil then kill_LSAT[data_playername] = 0; end
	if kill_M240B[data_playername] == nil then kill_M240B[data_playername] = 0; end
	if kill_M249[data_playername] == nil then kill_M249[data_playername] = 0; end
	if kill_M27_IAR[data_playername] == nil then kill_M27_IAR[data_playername] = 0; end
	if kill_M60E4[data_playername] == nil then kill_M60E4[data_playername] = 0; end
	if kill_MG36[data_playername] == nil then kill_MG36[data_playername] = 0; end
	if kill_PKP_PECHENEG[data_playername] == nil then kill_PKP_PECHENEG[data_playername] = 0; end
	if kill_QBB_95[data_playername] == nil then kill_QBB_95[data_playername] = 0; end
	if kill_RPK_74M[data_playername] == nil then kill_RPK_74M[data_playername] = 0; end
	if kill_TYPE_88_LMG[data_playername] == nil then kill_TYPE_88_LMG[data_playername] = 0; end

-- Revive stuff
	if playerrevivs[data_playername] == nil then playerrevivs[data_playername] = 0; end

-- Score stuff
	if playerscore[data_playername] == nil then playerscore[data_playername] = 0; end
	if playerscore1[data_playername] == nil then playerscore1[data_playername] = 0; end
	if playerscore2[data_playername] == nil then playerscore2[data_playername] = 0; end
	if playerscore3[data_playername] == nil then playerscore3[data_playername] = 0; end
	if playerscore4[data_playername] == nil then playerscore4[data_playername] = 0; end

--	print ("### Done setting variables for "..data_playername)
	setplayervariable[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------


return spawn()
