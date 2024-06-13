-- Spaghetti code by iamadeadpixel

---@class PUE00_setplayerrounds
PUE00_setplayerrounds = class 'PUE00_setplayerrounds'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** PUE00_setplayerrounds mod loaded ***"); 
	end
end)


-- Kick in when a player joins the server
	s_roundover_starttimer_PUE00 = os.time()
	s_roundover_timer_PUE00 = 3

	Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE00 = os.time()
	s_roundover_elapsed_timer_PUE00 = os.difftime(s_roundover_end_timer_PUE00, s_roundover_starttimer_PUE00)
	s_roundover_elapsed_timer_PUE00 = math.floor(s_roundover_elapsed_timer_PUE00)
	if s_roundover_elapsed_timer_PUE00 >= s_roundover_timer_PUE00 then

	if PUE00_playerrounddata == true then 

	print ("")
	print ("Round is over, Writing player round data")
	print ("")

-- No BS mode needed, default data is written when the player joinded the first time
	if player.name == getnamehuman[player.name] then -- if we dont do this, things wil go wrong.

			if not SQL:Query('UPDATE tbl_playerdata SET Rounds=Rounds+?  WHERE Soldiername = ?', 1, getnamehuman[player.name]) then
				print('Failed to execute Update Rounds query: ' .. SQL:Error())
				return end
	end
--
	PUE01_mapstats = true
	if PUE01_mapstats == true then
	print ("")
	print ("** Starting 2st event **")
	print ("")
	end

	PUE00_playerrounddata = false -- ensure it prints one time only
	end

	s_roundover_starttimer_PUE00 = os.time()
	end
end)

return PUE00_setplayerrounds()

