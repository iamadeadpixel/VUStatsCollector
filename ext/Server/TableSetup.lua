Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then

	if Config.consolespam_header then
		print("*** Table setup stuff loaded ***");
	end

-- Table stuff for scoringsystem
	s_InstanceIds = {}
	playershot = {}
	playerhit = {}
	server_acc_shot = 0
	server_acc_hit = 0

	PDscore = 0
	PDkills = 0
	PDdeaths = 0
	PDsuicide = 0
	PDheadshot = 0
	PDteamkilled = 0
	PDdogtags = 0
	PDrevives = 0
	s_Wins = 0
	s_Lost = 0

	killstreak = {}
	killstreak_counter = {}
	killstreak_highest = {}
	killstreak_lowest = {}
	killstreak_lock = {}

	playerscore = {}
	playerscore1 = {}
	playerscore2 = {}
	playerscore3 = {}
	playerscore4 = {}
--	teamscoreUS = 0
--	teamscoreRU = 0
	teamscore1 = 0
	teamscore2 = 0
	teamscore3 = 0
	teamscore4 = 0
--	scoreUS = 0
--	scoreRU = 0

	team1score = 0
	team2score = 0
	team3score = 0
	team4score = 0

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
	Death_roadkills = {}
	Headshot_roadkills = {}

	eor_deaths = 0
	eor_dogtags = 0
	eor_headshots = 0
	eor_kills = 0
	eor_revives = 0
	eor_suicides = 0
	eor_teamskills = 0
	eor_roadkills = 0
	eor_killstreak = 0

	setplayervariable0 = {}
	setplayervariable1 = {}
	setplayervariable2 = {}
	setplayervariable3 = {}
	setplayervariable4 = {}
	setplayervariable5 = {}
	setplayervariable6 = {}
	setplayervariable7 = {}
	setplayervariable8 = {}
	setplayervariable9 = {}


	hs_tempdata = {}
	breakpoint = false
	roundoverstate = {}
	haltprocess = false
	PUE00_playerrounddata = false
	killstreak_trigger = false
	KS_limit = 5

		print("*** ALL Tables stuff reset at here ***");

	end
end)
