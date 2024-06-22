Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** TableSetup weapons mod loaded ***");

		-- experimental, transform all weapon stuff to tables
		-- Auxiliary - global
		kill_M67_GRENADE = {}

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

		-- Auxiliary - Handguns
		kill_44_MAGNUM = {}
		kill_93R = {}
		kill_G17C = {}
		kill_G18 = {}
		kill_M1911 = {}
		kill_M9 = {}
		kill_MP443 = {}
		kill_MP412_REX = {}

		-- Shotguns
		kill_870MCS = {}
		kill_DAO_12 = {}
		kill_M1014 = {}
		kill_MK3A1 = {}
		kill_SAIGA_12K = {}
		kill_SPAS_12 = {}
		kill_USAS_12 = {}

		-- melee - Knifes
		kill_KNIFE = {}

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

		-- Demolition Gadgets
		kill_EOD_BOT = {}
		kill_FGM_148_JAVELIN = {}
		kill_FIM_92_STINGER = {}
		kill_M15_AT_MINE = {}
		kill_REPAIR_TOOL = {}
		kill_RPG_7V2 = {}
		kill_SA_18_IGLA = {}
		kill_SMAW = {}

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

		-- Support Gadgets
		kill_AMMO_BOX = {}
		kill_C4_EXPLOSIVES = {}
		kill_M18_CLAYMORE = {}

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

		-- Recon Gadgets
		kill_MAV = {}
		kill_RADIO_BEACON = {}
		kill_SOFLAM = {}
		kill_T_UGS = {}

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
	end
end)
