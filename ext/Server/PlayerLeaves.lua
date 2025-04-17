-- Spaghetti code by iamadeadpixel

---@class PlayerLeaves
PlayerLeaves = class 'PlayerLeaves'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** PlayerLeaves loaded ***");
	end
	end
end)

-- consolespam_leaves 
Events:Subscribe('Player:Left', function(player) -- player.name

	s_end_time = os.time()
	s_elapsed_time = os.difftime(s_end_time, Session_PlayTime_Start[player.name])
	s_elapsed_time = math.floor(s_elapsed_time)
	Session_PlayTime_End[player.name] = s_elapsed_time

	local guid_results = SQL:Query('SELECT  PlayTime FROM tbl_playerdata')
	if not guid_results then
		print('Failed to read Guid query: ' ..SQL:Error())
		return
	end

	for _, l_Row in pairs(guid_results) do
		temp_PlayTime = l_Row["PlayTime"]

			s_PlayTime = temp_PlayTime + s_elapsed_time
			if not SQL:Query('UPDATE tbl_playerdata SET PlayTime=? WHERE Soldiername = ?', s_PlayTime, getnamehuman[player.name]) then
				print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
				return
			end

		-- Removing table data on player left.
		Session_PlayTime_Start[player.name] = {}
		Session_PlayTime_End[player.name] = {}

-- Big huge table reset stuff (experimental)
		-- player stuff
		getnamehuman[player.name] = {}
		playerishuman[player.name] = {}
		playerteamID[player.name] = {}

		-- Table stuff for scoringsystem
		playerscore[player.name] = {}
		playerscore1[player.name] = {}
		playerscore2[player.name] = {}
		playerscore3[player.name] = {}
		playerscore4[player.name] = {}

		-- player stuff
		playerkills[player.name] = {}
		playerdeaths[player.name] = {}
		playersuicides[player.name] = {}
		playerteamkilled[player.name] = {}
		playerheadshot[player.name] = {}
		playerdogtags[player.name] = {}
		playerrevivs[player.name] = {}

		-- Roadkill stuff
		kill_roadkills[player.name] = {}

		-- Mcom stuff
		Mcom_Armed[player.name] = {}
		Mcom_Disarmed[player.name] = {}
		Mcom_Destroyed[player.name] = {}

		-- Auxiliary - global
		kill_M67_GRENADE[player.name] = {}

		-- Common - global
		kill_AS_VAL[player.name] = {}
		kill_M5K[player.name] = {}
		kill_MP7[player.name] = {}
		kill_P90[player.name] = {}
		kill_PDW_R[player.name] = {}
		kill_PP_19[player.name] = {}
		kill_PP_2000[player.name] = {}
		kill_UMP_45[player.name] = {}
		kill_XBOW[player.name] = {}

		-- Auxiliary - Handguns
		kill_44_MAGNUM[player.name] = {}
		kill_93R[player.name] = {}
		kill_G17C[player.name] = {}
		kill_G18[player.name] = {}
		kill_M1911[player.name] = {}
		kill_M9[player.name] = {}
		kill_MP443[player.name] = {}
		kill_MP412_REX[player.name] = {}

		-- Shotguns
		kill_870MCS[player.name] = {}
		kill_DAO_12[player.name] = {}
		kill_M1014[player.name] = {}
		kill_MK3A1[player.name] = {}
		kill_SAIGA_12K[player.name] = {}
		kill_SPAS_12[player.name] = {}
		kill_USAS_12[player.name] = {}

		-- melee - Knifes
		kill_KNIFE[player.name] = {}

		-- Assault class Gadgets
		kill_DEFIBRILLATOR[player.name] = {}
		kill_GP_30_BUCK[player.name] = {}
		kill_GP_30_DART[player.name] = {}
		kill_GP_30_HE[player.name] = {}
		kill_GP_30_LVG[player.name] = {}
		kill_GP_30_SMOKE[player.name] = {}
		kill_M26_DART[player.name] = {}
		kill_M26_FRAG[player.name] = {}
		kill_M26_MASS[player.name] = {}
		kill_M26_SLUG[player.name] = {}
		kill_M320_BUCK[player.name] = {}
		kill_M320_HE[player.name] = {}
		kill_M320_LVG[player.name] = {}
		kill_M320_SMOKE[player.name] = {}
		kill_MEDIC_KIT[player.name] = {}

		-- Assault class Weapons
		kill_AEK_971[player.name] = {}
		kill_AK_74M[player.name] = {}
		kill_AN_94[player.name] = {}
		kill_AUG_A3[player.name] = {}
		kill_F2000[player.name] = {}
		kill_FAMAS[player.name] = {}
		kill_G3A3[player.name] = {}
		kill_KH2002[player.name] = {}
		kill_L85A2[player.name] = {}
		kill_M16A3[player.name] = {}
		kill_M16A4[player.name] = {}
		kill_M416[player.name] = {}
		kill_SCAR_L[player.name] = {}

		-- Demolition Gadgets
		kill_EOD_BOT[player.name] = {}
		kill_FGM_148_JAVELIN[player.name] = {}
		kill_FIM_92_STINGER[player.name] = {}
		kill_M15_AT_MINE[player.name] = {}
		kill_REPAIR_TOOL[player.name] = {}
		kill_RPG_7V2[player.name] = {}
		kill_SA_18_IGLA[player.name] = {}
		kill_SMAW[player.name] = {}

		-- Demolition Weapons
		kill_A_91[player.name] = {}
		kill_ACW_R[player.name] = {}
		kill_AKS_74u[player.name] = {}
		kill_G36C[player.name] = {}
		kill_G53[player.name] = {}
		kill_M4[player.name] = {}
		kill_M4A1[player.name] = {}
		kill_MTAR_21[player.name] = {}
		kill_QBZ_95B[player.name] = {}
		kill_SCAR_H[player.name] = {}
		kill_SG553[player.name] = {}

		-- Support Gadgets
		kill_AMMO_BOX[player.name] = {}
		kill_C4_EXPLOSIVES[player.name] = {}
		kill_M18_CLAYMORE[player.name] = {}

		-- Support Weapons
		kill_L86A2[player.name] = {}
		kill_LSAT[player.name] = {}
		kill_M240B[player.name] = {}
		kill_M249[player.name] = {}
		kill_M27_IAR[player.name] = {}
		kill_M60E4[player.name] = {}
		kill_MG36[player.name] = {}
		kill_PKP_PECHENEG[player.name] = {}
		kill_QBB_95[player.name] = {}
		kill_RPK_74M[player.name] = {}
		kill_TYPE_88_LMG[player.name] = {}

		-- Recon Gadgets
		kill_MAV[player.name] = {}
		kill_RADIO_BEACON[player.name] = {}
		kill_SOFLAM[player.name] = {}
		kill_T_UGS[player.name] = {}

		-- Recon Weapons
		kill_JNG_90[player.name] = {}
		kill_L96[player.name] = {}
		kill_M39_EMR[player.name] = {}
		kill_M40A5[player.name] = {}
		kill_M417[player.name] = {}
		kill_M98B[player.name] = {}
		kill_MK11_MOD_0[player.name] = {}
		kill_QBU_88[player.name] = {}
		kill_SKS[player.name] = {}
		kill_SV98[player.name] = {}
		kill_SVD[player.name] = {}

		-- Air Vehicles
		kill_A10_THUNDERBOLT[player.name] = {}
		kill_AH_1Z_VIPER[player.name] = {}
		kill_AH_6J_LITTLE_BIRD[player.name] = {}
		kill_F_35[player.name] = {}
		kill_FA_18E_SUPER_HORNET[player.name] = {}
		kill_GUNSHIP[player.name] = {}
		kill_KA_60_KASATKA[player.name] = {}
		kill_MI_28_HAVOC[player.name] = {}
		kill_SU_25TM_FROGFOOT[player.name] = {}
		kill_SU_35BM_FLANKER_E[player.name] = {}
		kill_SU_37[player.name] = {}
		kill_TV_MISSILE[player.name] = {}
		kill_UH_1Y_VENOM[player.name] = {}
		kill_Z_11W[player.name] = {}

		-- Land Vehicles
		kill_9K22_TUNGUSKA_M[player.name] = {}
		kill_9M133_KORNET_LAUNCHER[player.name] = {}
		kill_AAV_7A1_AMTRAC[player.name] = {}
		kill_BARSUK[player.name] = {}
		kill_BM_23[player.name] = {}
		kill_BMP_2M[player.name] = {}
		kill_BTR_90[player.name] = {}
		kill_CENTURION_C_RAM[player.name] = {}
		kill_CIVILIAN_CAR[player.name] = {}
		kill_DELIVERY_VAN[player.name] = {}
		kill_DIRTBIKE[player.name] = {}
		kill_DPV[player.name] = {}
		kill_GAZ_3937_VODNIK[player.name] = {}
		kill_GROWLER_ITV[player.name] = {}
		kill_HMMWV_ASRAD[player.name] = {}
		kill_LAV_25[player.name] = {}
		kill_LAV_AD[player.name] = {}
		kill_M1_ABRAMS[player.name] = {}
		kill_M1114_HMMWV[player.name] = {}
		kill_M1128[player.name] = {}
		kill_M142[player.name] = {}
		kill_M220_TOW_LAUNCHER[player.name] = {}
		kill_M224_MORTAR[player.name] = {}
		kill_PANTSIR_S1[player.name] = {}
		kill_PHOENIX[player.name] = {}
		kill_POLICE_VAN[player.name] = {}
		kill_QUAD_BIKE[player.name] = {}
		kill_RHIB_BOAT[player.name] = {}
		kill_RHINO[player.name] = {}
		kill_SKID_LOADER[player.name] = {}
		kill_SPRUT_SD[player.name] = {}
		kill_SUV[player.name] = {}
		kill_T_90A[player.name] = {}
		kill_TECHNICAL_TRUCK[player.name] = {}
		kill_VDV_Buggy[player.name] = {}
		kill_VODNIK_AA[player.name] = {}

		print("*** Table stuff reset for leaving player "..player.name);

		end
end)

return PlayerLeaves()
