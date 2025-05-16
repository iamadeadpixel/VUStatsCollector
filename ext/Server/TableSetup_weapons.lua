Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** TableSetup weapons loaded ***");
	end

		-- Auxiliary - global
		kill_M67_GRENADE = {}
		Death_M67_GRENADE = {}
		Headshot_M67_GRENADE = {}

		-- Common - global
		kill_AS_VAL = {}
		kill_M5K = {}
		kill_MP7 = {}
		kill_P90 = {}
		kill_PDW_R = {}
		kill_PP_19 = {}
		kill_PP_2000 = {}
		kill_UMP_45 = {}
		kill_XBOW = {}
--
		Death_AS_VAL = {}
		Death_M5K = {}
		Death_MP7 = {}
		Death_P90 = {}
		Death_PDW_R = {}
		Death_PP_19 = {}
		Death_PP_2000 = {}
		Death_UMP_45 = {}
		Death_XBOW = {}
--
		Headshot_AS_VAL = {}
		Headshot_M5K = {}
		Headshot_MP7 = {}
		Headshot_P90 = {}
		Headshot_PDW_R = {}
		Headshot_PP_19 = {}
		Headshot_PP_2000 = {}
		Headshot_UMP_45 = {}
		Headshot_XBOW = {}

		-- Auxiliary - Handguns
		kill_44_MAGNUM = {}
		kill_93R = {}
		kill_G17C = {}
		kill_G18 = {}
		kill_M1911 = {}
		kill_M9 = {}
		kill_MP443 = {}
		kill_MP412_REX = {}
--
		Death_44_MAGNUM = {}
		Death_93R = {}
		Death_G17C = {}
		Death_G18 = {}
		Death_M1911 = {}
		Death_M9 = {}
		Death_MP443 = {}
		Death_MP412_REX = {}
--
		Headshot_44_MAGNUM = {}
		Headshot_93R = {}
		Headshot_G17C = {}
		Headshot_G18 = {}
		Headshot_M1911 = {}
		Headshot_M9 = {}
		Headshot_MP443 = {}
		Headshot_MP412_REX = {}

		-- Shotguns
		kill_870MCS = {}
		kill_DAO_12 = {}
		kill_M1014 = {}
		kill_MK3A1 = {}
		kill_SAIGA_12K = {}
		kill_SPAS_12 = {}
		kill_USAS_12 = {}
--
		Death_870MCS = {}
		Death_DAO_12 = {}
		Death_M1014 = {}
		Death_MK3A1 = {}
		Death_SAIGA_12K = {}
		Death_SPAS_12 = {}
		Death_USAS_12 = {}
--
		Headshot_870MCS = {}
		Headshot_DAO_12 = {}
		Headshot_M1014 = {}
		Headshot_MK3A1 = {}
		Headshot_SAIGA_12K = {}
		Headshot_SPAS_12 = {}
		Headshot_USAS_12 = {}

		-- melee - Knifes
		kill_KNIFE = {}
		Death_KNIFE = {}
		Headshot_KNIFE = {}

		-- Assault class Gadgets
		kill_DEFIBRILLATOR = {}
		kill_GP_30_BUCK = {}
		kill_GP_30_DART = {}
		kill_GP_30_HE = {}
		kill_GP_30_LVG = {}
		kill_GP_30_SMOKE = {}
		kill_M26_DART = {}
		kill_M26_FRAG = {}
		kill_M26_MASS = {}
		kill_M26_SLUG = {}
		kill_M320_BUCK = {}
		kill_M320_HE = {}
		kill_M320_LVG = {}
		kill_M320_SMOKE = {}
		kill_MEDIC_KIT = {}
--
		Death_DEFIBRILLATOR = {}
		Death_GP_30_BUCK = {}
		Death_GP_30_DART = {}
		Death_GP_30_HE = {}
		Death_GP_30_LVG = {}
		Death_GP_30_SMOKE = {}
		Death_M26_DART = {}
		Death_M26_FRAG = {}
		Death_M26_MASS = {}
		Death_M26_SLUG = {}
		Death_M320_BUCK = {}
		Death_M320_HE = {}
		Death_M320_LVG = {}
		Death_M320_SMOKE = {}
		Death_MEDIC_KIT = {}
--
		Headshot_DEFIBRILLATOR = {}
		Headshot_GP_30_BUCK = {}
		Headshot_GP_30_DART = {}
		Headshot_GP_30_HE = {}
		Headshot_GP_30_LVG = {}
		Headshot_GP_30_SMOKE = {}
		Headshot_M26_DART = {}
		Headshot_M26_FRAG = {}
		Headshot_M26_MASS = {}
		Headshot_M26_SLUG = {}
		Headshot_M320_BUCK = {}
		Headshot_M320_HE = {}
		Headshot_M320_LVG = {}
		Headshot_M320_SMOKE = {}
		Headshot_MEDIC_KIT = {}

		-- Assault class Weapons
		kill_AEK_971 = {}
		kill_AK_74M = {}
		kill_AN_94 = {}
		kill_AUG_A3 = {}
		kill_F2000 = {}
		kill_FAMAS = {}
		kill_G3A3 = {}
		kill_KH2002 = {}
		kill_L85A2 = {}
		kill_M16A3 = {}
		kill_M16A4 = {}
		kill_M416 = {}
		kill_SCAR_L = {}
--
		Death_AEK_971 = {}
		Death_AK_74M = {}
		Death_AN_94 = {}
		Death_AUG_A3 = {}
		Death_F2000 = {}
		Death_FAMAS = {}
		Death_G3A3 = {}
		Death_KH2002 = {}
		Death_L85A2 = {}
		Death_M16A3 = {}
		Death_M16A4 = {}
		Death_M416 = {}
		Death_SCAR_L = {}
--
		Headshot_AEK_971 = {}
		Headshot_AK_74M = {}
		Headshot_AN_94 = {}
		Headshot_AUG_A3 = {}
		Headshot_F2000 = {}
		Headshot_FAMAS = {}
		Headshot_G3A3 = {}
		Headshot_KH2002 = {}
		Headshot_L85A2 = {}
		Headshot_M16A3 = {}
		Headshot_M16A4 = {}
		Headshot_M416 = {}
		Headshot_SCAR_L = {}

		-- Demolition Gadgets
		kill_EOD_BOT = {}
		kill_FGM_148_JAVELIN = {}
		kill_FIM_92_STINGER = {}
		kill_M15_AT_MINE = {}
		kill_REPAIR_TOOL = {}
		kill_RPG_7V2 = {}
		kill_SA_18_IGLA = {}
		kill_SMAW = {}
--
		Death_EOD_BOT = {}
		Death_FGM_148_JAVELIN = {}
		Death_FIM_92_STINGER = {}
		Death_M15_AT_MINE = {}
		Death_REPAIR_TOOL = {}
		Death_RPG_7V2 = {}
		Death_SA_18_IGLA = {}
		Death_SMAW = {}
--
		Headshot_EOD_BOT = {}
		Headshot_FGM_148_JAVELIN = {}
		Headshot_FIM_92_STINGER = {}
		Headshot_M15_AT_MINE = {}
		Headshot_REPAIR_TOOL = {}
		Headshot_RPG_7V2 = {}
		Headshot_SA_18_IGLA = {}
		Headshot_SMAW = {}

		-- Demolition Weapons
		kill_A_91 = {}
		kill_ACW_R = {}
		kill_AKS_74u = {}
		kill_G36C = {}
		kill_G53 = {}
		kill_M4 = {}
		kill_M4A1 = {}
		kill_MTAR_21 = {}
		kill_QBZ_95B = {}
		kill_SCAR_H = {}
		kill_SG553 = {}
--
		Death_A_91 = {}
		Death_ACW_R = {}
		Death_AKS_74u = {}
		Death_G36C = {}
		Death_G53 = {}
		Death_M4 = {}
		Death_M4A1 = {}
		Death_MTAR_21 = {}
		Death_QBZ_95B = {}
		Death_SCAR_H = {}
		Death_SG553 = {}
--
		Headshot_A_91 = {}
		Headshot_ACW_R = {}
		Headshot_AKS_74u = {}
		Headshot_G36C = {}
		Headshot_G53 = {}
		Headshot_M4 = {}
		Headshot_M4A1 = {}
		Headshot_MTAR_21 = {}
		Headshot_QBZ_95B = {}
		Headshot_SCAR_H = {}
		Headshot_SG553 = {}

		-- Support Gadgets
		kill_AMMO_BOX = {}
		kill_C4_EXPLOSIVES = {}
		kill_M18_CLAYMORE = {}
--
		Death_AMMO_BOX = {}
		Death_C4_EXPLOSIVES = {}
		Death_M18_CLAYMORE = {}
--
		Headshot_AMMO_BOX = {}
		Headshot_C4_EXPLOSIVES = {}
		Headshot_M18_CLAYMORE = {}

		-- Support Weapons
		kill_L86A2 = {}
		kill_LSAT = {}
		kill_M240B = {}
		kill_M249 = {}
		kill_M27_IAR = {}
		kill_M60E4 = {}
		kill_MG36 = {}
		kill_PKP_PECHENEG = {}
		kill_QBB_95 = {}
		kill_RPK_74M = {}
		kill_TYPE_88_LMG = {}
--
		Death_L86A2 = {}
		Death_LSAT = {}
		Death_M240B = {}
		Death_M249 = {}
		Death_M27_IAR = {}
		Death_M60E4 = {}
		Death_MG36 = {}
		Death_PKP_PECHENEG = {}
		Death_QBB_95 = {}
		Death_RPK_74M = {}
		Death_TYPE_88_LMG = {}
--
		Headshot_L86A2 = {}
		Headshot_LSAT = {}
		Headshot_M240B = {}
		Headshot_M249 = {}
		Headshot_M27_IAR = {}
		Headshot_M60E4 = {}
		Headshot_MG36 = {}
		Headshot_PKP_PECHENEG = {}
		Headshot_QBB_95 = {}
		Headshot_RPK_74M = {}
		Headshot_TYPE_88_LMG = {}

		-- Recon Gadgets
		kill_MAV = {}
		kill_RADIO_BEACON = {}
		kill_SOFLAM = {}
		kill_T_UGS = {}
--
		Death_MAV = {}
		Death_RADIO_BEACON = {}
		Death_SOFLAM = {}
		Death_T_UGS = {}
--
		Headshot_MAV = {}
		Headshot_RADIO_BEACON = {}
		Headshot_SOFLAM = {}
		Headshot_T_UGS = {}


		-- Recon Weapons
		kill_JNG_90 = {}
		kill_L96 = {}
		kill_M39_EMR = {}
		kill_M40A5 = {}
		kill_M417 = {}
		kill_M98B = {}
		kill_MK11_MOD_0 = {}
		kill_QBU_88 = {}
		kill_SKS = {}
		kill_SV98 = {}
		kill_SVD = {}
--
		Death_JNG_90 = {}
		Death_L96 = {}
		Death_M39_EMR = {}
		Death_M40A5 = {}
		Death_M417 = {}
		Death_M98B = {}
		Death_MK11_MOD_0 = {}
		Death_QBU_88 = {}
		Death_SKS = {}
		Death_SV98 = {}
		Death_SVD = {}
--
		Headshot_JNG_90 = {}
		Headshot_L96 = {}
		Headshot_M39_EMR = {}
		Headshot_M40A5 = {}
		Headshot_M417 = {}
		Headshot_M98B = {}
		Headshot_MK11_MOD_0 = {}
		Headshot_QBU_88 = {}
		Headshot_SKS = {}
		Headshot_SV98 = {}
		Headshot_SVD = {}

	end
end)
