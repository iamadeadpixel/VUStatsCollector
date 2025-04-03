Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Table setup stuff loaded ***");
		print("*** ALL Tables empty at here ***");
	end

		-- Table stuff for scoringsystem
		playerscore = {}
		playerscore1 = {}
		playerscore2 = {}
		playerscore3 = {}
		playerscore4 = {}
		teamscoreUS = 0
		teamscoreRU = 0
		teamscore3 = 0
		teamscore4 = 0
		scoreUS = 0
		scoreRU = 0

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

		data_weaponkills = {}
		kill_roadkills = {}
		eor_deaths = 0
		eor_dogtags = 0
		eor_headshots = 0
		eor_kills = 0
		eor_revives = 0
		eor_suicides = 0
		eor_teamskills = 0
		eor_roadkills = 0

		roundoverstate = {}
		haltprocess = false
		PUE00_playerrounddata = false

	end
end)
