Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** TableSetup mod loaded ***");

		print("*** ALL Tables empty at here ***");

		-- Table stuff for scoringsystem
		data_weaponkills = {}
		getIDplayers = {}
		playerscore = {}
		playerscore1 = {}
		playerscore2 = {}
		playerscore3 = {}
		playerscore4 = {}

	Mcom_Armed = {}
	Mcom_Disarmed = {}
	Mcom_Destroyed = {}

		playerguid = {}
		playerscore = {}
		playerkills = {}
		playerdeaths = {}
		playersuicides = {}
		playerteamkilled = {}
		playerheadshot = {}
		playerdogtags = {}
		playerrevivs = {}


-- We do not yet remove this..
		kill_roadkills = {}

		playerisbot = {}
		getnamebot = {}

		playerscollected = {}
		tablebot = {}
		tablehuman = {}

		announcedhumannames = {}
		announcedbotnames = {}

		-- Vars for roundover score calculations
		teamscoreUS = 0
		teamscoreRU = 0
		teamscore3 = 0
		teamscore4 = 0
		scoreUS = 0
		scoreRU = 0
		scoreUSA = 0
		scoreRUS = 0
		eor_deaths = 0
		eor_dogtags = 0
		eor_headshots = 0
		eor_kills = 0
		eor_revives = 0
		eor_suicides = 0
		eor_teamskills = 0
		eor_roadkills = 0


		roundoverstate = {}
		roundoverstate1 = false
		roundoverstate2 = false
		roundoverstate3 = false
		roundoverstate4 = false
		haltprocess = false
		--
		PUE_test = false
		PUE00_playerrounddata = false
		PUE01_mapstats = false
		PUE02_vehiclekilldata = false
		PUE03_vehicledeathdata = false
		PUE04_playerstats = false
		PUE05_weaponkillstats = false
		PUE06_weapondeathstats = false
		PUE07_roadkillkilldata = false
		PUE08_roadkilldeathdata = false
	end
end)
