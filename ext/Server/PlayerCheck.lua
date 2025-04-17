-- Spaghetti code by iamadeadpixel
--[[
For some reason the mod nags to go bonkus when a player leaves the server when the round is over.
the content in PUE00_playerrounddata.lua wil go complete nuts
this stuff here should avoid it.... (should)
]]

---@class PlayerCheck
PlayerCheck = class 'PlayerCheck'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** PlayerCheck loaded ***");
	end
	end
end)

-- init stuff
CountPlayers = 0

getnameall = {}  -- value is name (this also gets bot names)
getnamehuman = {}  -- value is name
getnamebot = {}  -- value is name
playerishuman = {} -- False or true
playerisbot = {} -- False or true
playerteamID = {}  -- value is 1, 2, 3, 4 (US/RU or squad TDM alpha beta charlie delta)

Session_PlayTime_Start = {}
Session_PlayTime_End = {}

-- All other table / variable stuff goes in TableSetup.lua

Events:Subscribe('Level:Loaded', function()
	print("*** Level loaded and reseting stuff **")
	endofround = false

	s_startroundtime = os.date('%Y-%m-%d %H:%M:%S')
	roundoverstate = false
	end)

return PlayerCheck()
