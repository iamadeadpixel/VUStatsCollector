Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Short variables loaded ***");
	end

	shorty = {
	"kill",
	"Death",
	"Headshot"
	}

	aux = {
		-- Auxiliary - global
	"_M67_GRENADE",
	"_XBOW",
	"_KNIFE",

		-- Common - global
	"_AS_VAL",
	"_M5K",
	"_MP7",
	"_P90",
	"_PDW_R",
	"_PP_19",
	"_PP_2000",
	"_UMP_45",

		-- Auxiliary - Handguns
	"_44_MAGNUM",
	"_93R",
	"_G17C",
	"_G18",
	"_M1911",
	"_M9",
	"_MP443",
	"_MP412_REX",

		-- Shotguns
	"_870MCS",
	"_DAO_12",
	"_M1014",
	"_MK3A1",
	"_SAIGA_12K",
	"_SPAS_12",
	"_USAS_12",

		-- Assault class Gadgets
	"_DEFIBRILLATOR",
	"_GP_30_BUCK",
	"_GP_30_DART",
	"_GP_30_HE",
	"_GP_30_LVG",
	"_GP_30_SMOKE",
	"_M26_DART",
	"_M26_FRAG",
	"_M26_MASS",
	"_M26_SLUG",
	"_M320_BUCK",
	"_M320_HE",
	"_M320_LVG",
	"_M320_SMOKE",
	"_MEDIC_KIT",

		-- Assault class Weapons
	"_AEK_971",
	"_AK_74M",
	"_AN_94",
	"_AUG_A3",
	"_F2000",
	"_FAMAS",
	"_G3A3",
	"_KH2002",
	"_L85A2",
	"_M16A3",
	"_M16A4",
	"_M416",
	"_SCAR_L",

		-- Demolition Gadgets
	"_EOD_BOT",
	"_FGM_148_JAVELIN",
	"_FIM_92_STINGER",
	"_M15_AT_MINE",
	"_REPAIR_TOOL",
	"_RPG_7V2",
	"_SA_18_IGLA",
	"_SMAW",

		-- Demolition Weapons
	"_A_91",
	"_ACW_R",
	"_AKS_74u",
	"_G36C",
	"_G53",
	"_M4",
	"_M4A1",
	"_MTAR_21",
	"_QBZ_95B",
	"_SCAR_H",
	"_SG553",

		-- Support Gadgets
	"_AMMO_BOX",
	"_C4_EXPLOSIVES",
	"_M18_CLAYMORE",

		-- Support Weapons
	"_L86A2",
	"_LSAT",
	"_M240B",
	"_M249",
	"_M27_IAR",
	"_M60E4",
	"_MG36",
	"_PKP_PECHENEG",
	"_QBB_95",
	"_RPK_74M",
	"_TYPE_88_LMG",

		-- Recon Gadgets
	"_MAV",
	"_RADIO_BEACON",
	"_SOFLAM",
	"_T_UGS",

		-- Recon Weapons
	"_JNG_90",
	"_L96",
	"_M39_EMR",
	"_M40A5",
	"_M417",
	"_M98B",
	"_MK11_MOD_0",
	"_QBU_88",
	"_SKS",
	"_SV98",
	"_SVD",

		-- Air Vehicles
	"_A10_THUNDERBOLT",
	"_AH_1Z_VIPER",
	"_AH_6J_LITTLE_BIRD",
	"_F_35",
	"_FA_18E_SUPER_HORNET",
	"_GUNSHIP",
	"_KA_60_KASATKA",
	"_MI_28_HAVOC",
	"_SU_25TM_FROGFOOT",
	"_SU_35BM_FLANKER_E",
	"_SU_37",
	"_TV_MISSILE",
	"_UH_1Y_VENOM",
	"_Z_11W",

		-- Land Vehicles
	"_9K22_TUNGUSKA_M",
	"_9M133_KORNET_LAUNCHER",
	"_AAV_7A1_AMTRAC",
	"_BARSUK",
	"_BM_23",
	"_BMP_2M",
	"_BTR_90",
	"_CENTURION_C_RAM",
	"_CIVILIAN_CAR",
	"_DELIVERY_VAN",
	"_DIRTBIKE",
	"_DPV",
	"_GAZ_3937_VODNIK",
	"_GROWLER_ITV",
	"_HMMWV_ASRAD",
	"_LAV_25",
	"_LAV_AD",
	"_M1_ABRAMS",
	"_M1114_HMMWV",
	"_M1128",
	"_M142",
	"_M220_TOW_LAUNCHER",
	"_M224_MORTAR",
	"_PANTSIR_S1",
	"_PHOENIX",
	"_POLICE_VAN",
	"_QUAD_BIKE",
	"_RHIB_BOAT",
	"_RHINO",
	"_SKID_LOADER",
	"_SPRUT_SD",
	"_SUV",
	"_T_90A",
	"_TECHNICAL_TRUCK",
	"_VDV_Buggy",
	"_VODNIK_AA"
	}

	s_combo={}

	for _, type in pairs(shorty) do
    for index, weapon in pairs(aux) do

    table.insert(s_combo, {""..type..""..weapon.."" ,0})
    print (s_combo[index][1]..'='..s_combo[index][2])  
    end    
end


end
end)
