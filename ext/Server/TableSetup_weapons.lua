Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** TableSetup weapons loaded ***");
	end


		-- Auxiliary - global
		kill_M67_GRENADE = {}
		Death_M67_GRENADE = {}
		Headshot_M67_GRENADE = {}
		Bullet_shot_M67_GRENADE = {}
		Bullet_hit_M67_GRENADE = {}

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
--
		Bullet_shot_AS_VAL = {}
		Bullet_shot_M5K = {}
		Bullet_shot_MP7 = {}
		Bullet_shot_P90 = {}
		Bullet_shot_PDW_R = {}
		Bullet_shot_PP_19 = {}
		Bullet_shot_PP_2000 = {}
		Bullet_shot_UMP_45 = {}
		Bullet_shot_XBOW = {}
--
		Bullet_hit_AS_VAL = {}
		Bullet_hit_M5K = {}
		Bullet_hit_MP7 = {}
		Bullet_hit_P90 = {}
		Bullet_hit_PDW_R = {}
		Bullet_hit_PP_19 = {}
		Bullet_hit_PP_2000 = {}
		Bullet_hit_UMP_45 = {}
		Bullet_hit_XBOW = {}

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
--
		Bullet_shot_44_MAGNUM = {}
		Bullet_shot_93R = {}
		Bullet_shot_G17C = {}
		Bullet_shot_G18 = {}
		Bullet_shot_M1911 = {}
		Bullet_shot_M9 = {}
		Bullet_shot_MP443 = {}
		Bullet_shot_MP412_REX = {}
--
		Bullet_hit_44_MAGNUM = {}
		Bullet_hit_93R = {}
		Bullet_hit_G17C = {}
		Bullet_hit_G18 = {}
		Bullet_hit_M1911 = {}
		Bullet_hit_M9 = {}
		Bullet_hit_MP443 = {}
		Bullet_hit_MP412_REX = {}

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
--
		Bullet_shot_870MCS = {}
		Bullet_shot_DAO_12 = {}
		Bullet_shot_M1014 = {}
		Bullet_shot_MK3A1 = {}
		Bullet_shot_SAIGA_12K = {}
		Bullet_shot_SPAS_12 = {}
		Bullet_shot_USAS_12 = {}
--
		Bullet_hit_870MCS = {}
		Bullet_hit_DAO_12 = {}
		Bullet_hit_M1014 = {}
		Bullet_hit_MK3A1 = {}
		Bullet_hit_SAIGA_12K = {}
		Bullet_hit_SPAS_12 = {}
		Bullet_hit_USAS_12 = {}

		-- melee - Knifes
		kill_KNIFE = {}
		Death_KNIFE = {}
		Headshot_KNIFE = {}
		Bullet_shot_KNIFE = {}
		Bullet_hit_KNIFE = {}

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
--
		Bullet_shot_DEFIBRILLATOR = {}
		Bullet_shot_GP_30_BUCK = {}
		Bullet_shot_GP_30_DART = {}
		Bullet_shot_GP_30_HE = {}
		Bullet_shot_GP_30_LVG = {}
		Bullet_shot_GP_30_SMOKE = {}
		Bullet_shot_M26_DART = {}
		Bullet_shot_M26_FRAG = {}
		Bullet_shot_M26_MASS = {}
		Bullet_shot_M26_SLUG = {}
		Bullet_shot_M320_BUCK = {}
		Bullet_shot_M320_HE = {}
		Bullet_shot_M320_LVG = {}
		Bullet_shot_M320_SMOKE = {}
		Bullet_shot_MEDIC_KIT = {}
--
		Bullet_hit_DEFIBRILLATOR = {}
		Bullet_hit_GP_30_BUCK = {}
		Bullet_hit_GP_30_DART = {}
		Bullet_hit_GP_30_HE = {}
		Bullet_hit_GP_30_LVG = {}
		Bullet_hit_GP_30_SMOKE = {}
		Bullet_hit_M26_DART = {}
		Bullet_hit_M26_FRAG = {}
		Bullet_hit_M26_MASS = {}
		Bullet_hit_M26_SLUG = {}
		Bullet_hit_M320_BUCK = {}
		Bullet_hit_M320_HE = {}
		Bullet_hit_M320_LVG = {}
		Bullet_hit_M320_SMOKE = {}
		Bullet_hit_MEDIC_KIT = {}

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
--
		Bullet_shot_AEK_971 = {}
		Bullet_shot_AK_74M = {}
		Bullet_shot_AN_94 = {}
		Bullet_shot_AUG_A3 = {}
		Bullet_shot_F2000 = {}
		Bullet_shot_FAMAS = {}
		Bullet_shot_G3A3 = {}
		Bullet_shot_KH2002 = {}
		Bullet_shot_L85A2 = {}
		Bullet_shot_M16A3 = {}
		Bullet_shot_M16A4 = {}
		Bullet_shot_M416 = {}
		Bullet_shot_SCAR_L = {}
--
		Bullet_hit_AEK_971 = {}
		Bullet_hit_AK_74M = {}
		Bullet_hit_AN_94 = {}
		Bullet_hit_AUG_A3 = {}
		Bullet_hit_F2000 = {}
		Bullet_hit_FAMAS = {}
		Bullet_hit_G3A3 = {}
		Bullet_hit_KH2002 = {}
		Bullet_hit_L85A2 = {}
		Bullet_hit_M16A3 = {}
		Bullet_hit_M16A4 = {}
		Bullet_hit_M416 = {}
		Bullet_hit_SCAR_L = {}

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
--
		Bullet_shot_EOD_BOT = {}
		Bullet_shot_FGM_148_JAVELIN = {}
		Bullet_shot_FIM_92_STINGER = {}
		Bullet_shot_M15_AT_MINE = {}
		Bullet_shot_REPAIR_TOOL = {}
		Bullet_shot_RPG_7V2 = {}
		Bullet_shot_SA_18_IGLA = {}
		Bullet_shot_SMAW = {}
--
		Bullet_hit_EOD_BOT = {}
		Bullet_hit_FGM_148_JAVELIN = {}
		Bullet_hit_FIM_92_STINGER = {}
		Bullet_hit_M15_AT_MINE = {}
		Bullet_hit_REPAIR_TOOL = {}
		Bullet_hit_RPG_7V2 = {}
		Bullet_hit_SA_18_IGLA = {}
		Bullet_hit_SMAW = {}

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
--
		Bullet_shot_A_91 = {}
		Bullet_shot_ACW_R = {}
		Bullet_shot_AKS_74u = {}
		Bullet_shot_G36C = {}
		Bullet_shot_G53 = {}
		Bullet_shot_M4 = {}
		Bullet_shot_M4A1 = {}
		Bullet_shot_MTAR_21 = {}
		Bullet_shot_QBZ_95B = {}
		Bullet_shot_SCAR_H = {}
		Bullet_shot_SG553 = {}
--
		Bullet_hit_A_91 = {}
		Bullet_hit_ACW_R = {}
		Bullet_hit_AKS_74u = {}
		Bullet_hit_G36C = {}
		Bullet_hit_G53 = {}
		Bullet_hit_M4 = {}
		Bullet_hit_M4A1 = {}
		Bullet_hit_MTAR_21 = {}
		Bullet_hit_QBZ_95B = {}
		Bullet_hit_SCAR_H = {}
		Bullet_hit_SG553 = {}

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
--
		Bullet_shot_AMMO_BOX = {}
		Bullet_shot_C4_EXPLOSIVES = {}
		Bullet_shot_M18_CLAYMORE = {}
--
		Bullet_hit_AMMO_BOX = {}
		Bullet_hit_C4_EXPLOSIVES = {}
		Bullet_hit_M18_CLAYMORE = {}

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
--
		Bullet_shot_L86A2 = {}
		Bullet_shot_LSAT = {}
		Bullet_shot_M240B = {}
		Bullet_shot_M249 = {}
		Bullet_shot_M27_IAR = {}
		Bullet_shot_M60E4 = {}
		Bullet_shot_MG36 = {}
		Bullet_shot_PKP_PECHENEG = {}
		Bullet_shot_QBB_95 = {}
		Bullet_shot_RPK_74M = {}
		Bullet_shot_TYPE_88_LMG = {}
--
		Bullet_hit_L86A2 = {}
		Bullet_hit_LSAT = {}
		Bullet_hit_M240B = {}
		Bullet_hit_M249 = {}
		Bullet_hit_M27_IAR = {}
		Bullet_hit_M60E4 = {}
		Bullet_hit_MG36 = {}
		Bullet_hit_PKP_PECHENEG = {}
		Bullet_hit_QBB_95 = {}
		Bullet_hit_RPK_74M = {}
		Bullet_hit_TYPE_88_LMG = {}


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
--
		Bullet_shot_MAV = {}
		Bullet_shot_RADIO_BEACON = {}
		Bullet_shot_SOFLAM = {}
		Bullet_shot_T_UGS = {}
--
		Bullet_hit_MAV = {}
		Bullet_hit_RADIO_BEACON = {}
		Bullet_hit_SOFLAM = {}
		Bullet_hit_T_UGS = {}


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
--
		Bullet_shot_JNG_90 = {}
		Bullet_shot_L96 = {}
		Bullet_shot_M39_EMR = {}
		Bullet_shot_M40A5 = {}
		Bullet_shot_M417 = {}
		Bullet_shot_M98B = {}
		Bullet_shot_MK11_MOD_0 = {}
		Bullet_shot_QBU_88 = {}
		Bullet_shot_SKS = {}
		Bullet_shot_SV98 = {}
		Bullet_shot_SVD = {}
--
		Bullet_hit_JNG_90 = {}
		Bullet_hit_L96 = {}
		Bullet_hit_M39_EMR = {}
		Bullet_hit_M40A5 = {}
		Bullet_hit_M417 = {}
		Bullet_hit_M98B = {}
		Bullet_hit_MK11_MOD_0 = {}
		Bullet_hit_QBU_88 = {}
		Bullet_hit_SKS = {}
		Bullet_hit_SV98 = {}
		Bullet_hit_SVD = {}

	end
end)
