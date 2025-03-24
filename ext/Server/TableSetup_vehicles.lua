Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam then
		print("*** TableSetup vehicles loaded ***");
	end

		-- experimental, transform all weapon stuff to tables
		-- Air Vehicles
		kill_A10_THUNDERBOLT = {}
		kill_AH_1Z_VIPER = {}
		kill_AH_6J_LITTLE_BIRD = {}
		kill_F_35 = {}
		kill_FA_18E_SUPER_HORNET = {}
		kill_GUNSHIP = {}
		kill_KA_60_KASATKA = {}
		kill_MI_28_HAVOC = {}
		kill_SU_25TM_FROGFOOT = {}
		kill_SU_35BM_FLANKER_E = {}
		kill_SU_37 = {}
		kill_TV_MISSILE = {}
		kill_UH_1Y_VENOM = {}
		kill_Z_11W = {}

		-- Land Vehicles
		kill_9K22_TUNGUSKA_M = {}
		kill_9M133_KORNET_LAUNCHER = {}
		kill_AAV_7A1_AMTRAC = {}
		kill_BARSUK = {}
		kill_BM_23 = {}
		kill_BMP_2M = {}
		kill_BTR_90 = {}
		kill_CENTURION_C_RAM = {}
		kill_CIVILIAN_CAR = {}
		kill_DELIVERY_VAN = {}
		kill_DIRTBIKE = {}
		kill_DPV = {}
		kill_GAZ_3937_VODNIK = {}
		kill_GROWLER_ITV = {}
		kill_HMMWV_ASRAD = {}
		kill_LAV_25 = {}
		kill_LAV_AD = {}
		kill_M1_ABRAMS = {}
		kill_M1114_HMMWV = {}
		kill_M1128 = {}
		kill_M142 = {}
		kill_M220_TOW_LAUNCHER = {}
		kill_M224_MORTAR = {}
		kill_PANTSIR_S1 = {}
		kill_PHOENIX = {}
		kill_POLICE_VAN = {}
		kill_QUAD_BIKE = {}
		kill_RHIB_BOAT = {}
		kill_RHINO = {}
		kill_SKID_LOADER = {}
		kill_SPRUT_SD = {}
		kill_SUV = {}
		kill_T_90A = {}
		kill_TECHNICAL_TRUCK = {}
		kill_VDV_Buggy = {}
		kill_VODNIK_AA = {}
	end
end)
