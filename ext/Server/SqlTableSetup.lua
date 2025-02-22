Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** SqlTableSetup mod loaded ***");

	s0 = "New player entries"

	air_vehicles = {
	-- Air Vehicles
	"A-10 THUNDERBOLT",
	"AH-1Z VIPER",
	"AH-6J LITTLE BIRD",
	"F-35",
	"F/A-18E SUPER HORNET",
	"GUNSHIP",
	"KA-60 KASATKA",
	"MI-28 HAVOC",
	"SU-25TM FROGFOOT",
	"SU-35BM FLANKER-E",
	"SU-37",
	"TV MISSILE",
	"UH-1Y VENOM",
	"Z-11W"
	}

	land_vehicles = {
	-- Land Vehicles
	"9K22 TUNGUSKA-M",
	"9M133 KORNET LAUNCHER",
	"AAV-7A1 AMTRAC",
	"BARSUK",
	"BM-23",
	"BMP-2M",
	"BTR-90",
	"CENTURION C-RAM",
	"CIVILIAN CAR",
	"DELIVERY VAN",
	"DIRTBIKE",
	"DPV",
	"GAZ-3937 VODNIK",
	"GROWLER ITV",
	"HMMWV ASRAD",
	"LAV-25",
	"LAV-AD",
	"M1 ABRAMS",
	"M1114 HMMWV",
	"M1128",
	"M142",
	"M220 TOW LAUNCHER",
	"PANTSIR-S1",
	"PHOENIX",
	"POLICE VAN",
	"QUAD BIKE",
	"RHIB BOAT",
	"RHINO",
	"SKID LOADER",
	"SPRUT-SD",
	"SUV",
	"T-90A",
	"TECHNICAL TRUCK",
	"VDV Buggy",
	"VODNIK AA"
	}

	auxiliary_gadgets = {
	-- Auxiliary - global
	"M67 GRENADE",
	"XBOW",
	"KNIFE"
	}

	primary_weapons = {
	-- Primary - global
	"AS VAL",
	"M5K",
	"MP7",
	"P90",
	"PDW-R",
	"PP-19",
	"PP-2000",
	"UMP-45"
	}

	handguns_weapons = {
	-- Auxiliary - Handguns
	".44 MAGNUM",
	"93R",
	"G17C",
	"G18",
	"M1911",
	"M9",
	"MP412 REX",
	"MP443"
	}

	shotguns_weapons = {
	-- Shotguns
	"870 MCS",
	"DAO-12",
	"M1014",
	"MK3A1",
	"SAIGA 12K",
	"SPAS-12",
	"USAS-12"
	}

	assault_gadgets = {
	-- Assault class Gadgets
	"DEFIBRILLATOR",
	"GP-30 BUCK",
	"GP-30 DART",
	"GP-30 HE",
	"GP-30 LVG",
	"GP-30 SMOKE",
	"M26 DART",
	"M26 FRAG",
	"M26 MASS",
	"M26 SLUG",
	"M320 BUCK",
	"M320 HE",
	"M320 LVG",
	"M320 SMOKE",
	"MEDIC KIT"
	}

	assault_weapons = {
	-- Assault class Weapons
	"AEK-971",
	"AK-74M",
	"AN-94",
	"AUG A3",
	"F2000",
	"FAMAS",
	"G3A3",
	"KH2002",
	"L85A2",
	"M16A3",
	"M16A4",
	"M416",
	"SCAR-L"
	}

	engineer_gadgets = {
	-- Demolition Gadgets
	"EOD BOT",
	"FGM-148 JAVELIN",
	"FIM-92 STINGER",
	"M15 AT MINE",
	"REPAIR TOOL",
	"RPG-7V2",
	"SA-18 IGLA",
	"SMAW"
	}

	engineer_weapons = {
	-- Demolition Weapons
	"A-91",
	"ACW-R",
	"AKS-74u",
	"G36C",
	"G53",
	"M4",
	"M4A1",
	"MTAR-21",
	"QBZ-95B",
	"SCAR-H",
	"SG553"
	}

	support_gadgets = {
	-- Support Gadgets
	"AMMO BOX",
	"C4 EXPLOSIVES",
	"M18 CLAYMORE",
	"M224 MORTAR"
	}

	support_weapons = {
	-- Support Weapons
	"L86A2",
	"LSAT",
	"M240B",
	"M249",
	"M27 IAR",
	"M60E4",
	"MG36",
	"PKP PECHENEG",
	"QBB-95",
	"RPK-74M",
	"TYPE 88 LMG"
	}

	recon_gadgets = {
	-- Recon Gadgets
	"MAV",
	"RADIO BEACON",
	"SOFLAM",
	"T-UGS"
	}

	recon_weapons = {
	-- Recon Weapons
	"JNG-90",
	"L96",
	"M39 EMR",
	"M40A5",
	"M417",
	"M98B",
	"MK11 MOD 0",
	"QBU-88",
	"SKS",
	"SV98",
	"SVD"
	}

	roadkills = {
	-- Roadkills
	"Roadkills"
	}

	end
end)
