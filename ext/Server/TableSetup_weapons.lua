Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** TableSetup weapons mod loaded ***");

		-- experimental, transform all weapon stuff to tables
		-- Auxiliary - global
		kill_M67_GRENADE = {}
		death_M67_GRENADE = {}


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
		death_AS_VAL = {}
		death_M5K = {}
		death_MP7 = {}
		death_P90 = {}
		death_PDW_R = {}
		death_PP_19 = {}
		death_PP_2000 = {}
		death_UMP_45 = {}
		death_XBOW = {}

		-- Auxiliary - Handguns
		kill_44_MAGNUM = {}
		kill_93R = {}
		kill_G17C = {}
		kill_G18 = {}
		kill_M1911 = {}
		kill_M9 = {}
		kill_MP443 = {}
		kill_MP412_REX = {}
		death_44_MAGNUM = {}
		death_93R = {}
		death_G17C = {}
		death_G18 = {}
		death_M1911 = {}
		death_M9 = {}
		death_MP443 = {}
		death_MP412_REX = {}

		-- Shotguns
		kill_870MCS = {}
		kill_DAO_12 = {}
		kill_M1014 = {}
		kill_MK3A1 = {}
		kill_SAIGA_12K = {}
		kill_SPAS_12 = {}
		kill_USAS_12 = {}
		death_870MCS = {}
		death_DAO_12 = {}
		death_M1014 = {}
		death_MK3A1 = {}
		death_SAIGA_12K = {}
		death_SPAS_12 = {}
		death_USAS_12 = {}

		-- melee - Knifes
		kill_KNIFE = {}
		death_KNIFE = {}

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
		death_DEFIBRILLATOR = {}
		death_GP_30_BUCK = {}
		death_GP_30_DART = {}
		death_GP_30_HE = {}
		death_GP_30_LVG = {}
		death_GP_30_SMOKE = {}
		death_M26_DART = {}
		death_M26_FRAG = {}
		death_M26_MASS = {}
		death_M26_SLUG = {}
		death_M320_BUCK = {}
		death_M320_HE = {}
		death_M320_LVG = {}
		death_M320_SMOKE = {}
		death_MEDIC_KIT = {}

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
		death_AEK_971 = {}
		death_AK_74M = {}
		death_AN_94 = {}
		death_AUG_A3 = {}
		death_F2000 = {}
		death_FAMAS = {}
		death_G3A3 = {}
		death_KH2002 = {}
		death_L85A2 = {}
		death_M16A3 = {}
		death_M16A4 = {}
		death_M416 = {}
		death_SCAR_L = {}

		-- Demolition Gadgets
		kill_EOD_BOT = {}
		kill_FGM_148_JAVELIN = {}
		kill_FIM_92_STINGER = {}
		kill_M15_AT_MINE = {}
		kill_REPAIR_TOOL = {}
		kill_RPG_7V2 = {}
		kill_SA_18_IGLA = {}
		kill_SMAW = {}
		death_EOD_BOT = {}
		death_FGM_148_JAVELIN = {}
		death_FIM_92_STINGER = {}
		death_M15_AT_MINE = {}
		death_REPAIR_TOOL = {}
		death_RPG_7V2 = {}
		death_SA_18_IGLA = {}
		death_SMAW = {}

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
		death_A_91 = {}
		death_ACW_R = {}
		death_AKS_74u = {}
		death_G36C = {}
		death_G53 = {}
		death_M4 = {}
		death_M4A1 = {}
		death_MTAR_21 = {}
		death_QBZ_95B = {}
		death_SCAR_H = {}
		death_SG553 = {}

		-- Support Gadgets
		kill_AMMO_BOX = {}
		kill_C4_EXPLOSIVES = {}
		kill_M18_CLAYMORE = {}
		death_AMMO_BOX = {}
		death_C4_EXPLOSIVES = {}
		death_M18_CLAYMORE = {}

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
		death_L86A2 = {}
		death_LSAT = {}
		death_M240B = {}
		death_M249 = {}
		death_M27_IAR = {}
		death_M60E4 = {}
		death_MG36 = {}
		death_PKP_PECHENEG = {}
		death_QBB_95 = {}
		death_RPK_74M = {}
		death_TYPE_88_LMG = {}

		-- Recon Gadgets
		kill_MAV = {}
		kill_RADIO_BEACON = {}
		kill_SOFLAM = {}
		kill_T_UGS = {}
		death_MAV = {}
		death_RADIO_BEACON = {}
		death_SOFLAM = {}
		death_T_UGS = {}

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
		death_JNG_90 = {}
		death_L96 = {}
		death_M39_EMR = {}
		death_M40A5 = {}
		death_M417 = {}
		death_M98B = {}
		death_MK11_MOD_0 = {}
		death_QBU_88 = {}
		death_SKS = {}
		death_SV98 = {}
		death_SVD = {}
	end
end)
