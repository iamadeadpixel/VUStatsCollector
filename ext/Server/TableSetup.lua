Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then

	if Config.consolespam_header then
		print("*** Table setup stuff loaded ***");
	end

-- Table stuff for scoring system
	s_InstanceIds = {}
	playershot = {}
	playerhit = {}

	pScore = 0
	pKills = 0
	pDeaths = 0
	pSuicide = 0
	pHeadshots = 0
	pTeamKilled = 0
	pDogtags = 0
	pRevives = 0
	pKillstreaks = 0
	pshots = 0
	phits = 0

	eor_deaths = 0
	eor_dogtags = 0
	eor_headshots = 0
	eor_kills = 0
	eor_revives = 0
	eor_suicides = 0
	eor_teamskills = 0
	eor_roadkills = 0
	eor_killstreak = 0

	r_data_Armed = 0
	r_data_Disarmed = 0
	r_data_Destroyed = 0

	pWins = 0
	pLosses = 0

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

	pshots = 0
	phits = 0 
	killstreak = {}
	killstreak_counter = {}
	killstreak_highest = {}
	killstreak_lock = {}

	playerscore = {}
	playerscore1 = {}
	playerscore2 = {}
	playerscore3 = {}
	playerscore4 = {}
	teamscore1 = 0
	teamscore2 = 0
	teamscore3 = 0
	teamscore4 = 0

	team1score = 0
	team2score = 0
	team3score = 0
	team4score = 0

	r_killdata = 0
	r_headshotdata = 0
	r_deathdata = 0
	r_var1data = 0


	Mcom_Armed = {}
	Mcom_Disarmed = {}
	Mcom_Destroyed = {}

	playerguid = {}
	playerscore = {}
	playerkills = {}
	playerdeaths = {}
	playersuicides = {}

	Dogtags_Killer = {}
	Dogtags_Victim = {}
	Headshots_Killer = {}
	Headshots_Victim = {}
	Revives_Give = {}
	Revives_Take = {}
	TeamKilled_Killer = {}
	TeamKilled_Victim = {}

	data_weaponkills = {}
	kill_roadkills = {}
	Death_roadkills = {}
	Headshot_roadkills = {}

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
