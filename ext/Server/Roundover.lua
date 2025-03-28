-- Spaghetti code by iamadeadpixel

---@class Roundover
Roundover = class 'Roundover'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Roundover loaded ***");
	end
	end
end)

Events:Subscribe('Server:RoundOver', function(roundTime, winningTeam)
	s_roundTime = math.floor(roundTime)
	s_winningTeam = winningTeam
	s_endroundtime = os.date('%Y-%m-%d %H:%M:%S')

	if SharedUtils:GetCurrentGameMode() == "ConquestLarge0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestLarge0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestLarge0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "ConquestSmall0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestSmall0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestSmall0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "GunMaster0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "GunMaster0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "GunMaster0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "Domination0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "Domination0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "Domination0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "TankSuperiority0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "TankSuperiority0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "TankSuperiority0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "Scavenger0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "Scavenger0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "Scavenger0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "AirSuperiority0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "AirSuperiority0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "AirSuperiority0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "KingOfTheHill0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "KingOfTheHill0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "KingOfTheHill0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "HeliSuperiority0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "HeliSuperiority0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "HeliSuperiority0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "SquadRush0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "SquadRush0" and s_winningTeam == 1 then n_winningTeam = "Atackers"; end
	if SharedUtils:GetCurrentGameMode() == "SquadRush0" and s_winningTeam == 2 then n_winningTeam = "Defenders"; end

	if SharedUtils:GetCurrentGameMode() == "RushLarge0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "RushLarge0" and s_winningTeam == 1 then n_winningTeam = "Atackers"; end
	if SharedUtils:GetCurrentGameMode() == "RushLarge0" and s_winningTeam == 2 then n_winningTeam = "Defenders"; end

	if SharedUtils:GetCurrentGameMode() == "TeamDeathMatch0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "TeamDeathMatch0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "TeamDeathMatch0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "TeamDeathMatchC0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "TeamDeathMatchC0" and s_winningTeam == 1 then n_winningTeam = "US"; end
	if SharedUtils:GetCurrentGameMode() == "TeamDeathMatchC0" and s_winningTeam == 2 then n_winningTeam = "RU"; end

	if SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" and s_winningTeam == 0 then n_winningTeam = "DRAW"; end
	if SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" and s_winningTeam == 1 then n_winningTeam = "Alpha"; end
	if SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" and s_winningTeam == 2 then n_winningTeam = "Bravo"; end
	if SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" and s_winningTeam == 3 then n_winningTeam = "Charlie"; end
	if SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" and s_winningTeam == 4 then n_winningTeam = "Delta"; end

	PUE00_playerrounddata = true

	if Config.consolespam then
	if PUE00_playerrounddata == true then print("** Round over ! - Starting SQL event stuff **"); end
	end

	haltprocess = true -- used in playerkilled.lua
end)

return Roundover()
