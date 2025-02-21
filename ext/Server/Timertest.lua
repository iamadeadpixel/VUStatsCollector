-- Spaghetti code by iamadeadpixel

---@class Timertest
Timertest = class 'Timertest'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** Timer test only mod loaded ***");
	end
end)

-- Kicks in when a player joins the server
	delay_roundover_starttimer_PUE00 = os.time()
	delay_roundover_timer_PUE00 = 5
	clip = false
-- --------------------------------------------------

Events:Subscribe('Player:Update', function(player, deltaTime)
	delay_roundover_end_timer_PUE00 = os.time()
	delay_roundover_elapsed_timer_PUE00 = os.difftime(delay_roundover_end_timer_PUE00, delay_roundover_starttimer_PUE00)
	delay_roundover_elapsed_timer_PUE00 = math.floor(delay_roundover_elapsed_timer_PUE00)
	if delay_roundover_elapsed_timer_PUE00 >= delay_roundover_timer_PUE00 then
	if clip == false then

	print ("")
	print ("*** Timer test 01 ***")
	print ("")

-- --------------------------------------------------

	clip = true
	delay_roundover_starttimer_PUE01 = os.time()
	delay_roundover_timer_PUE01 = 5

	delay_roundover_end_timer_PUE01 = os.time()
	delay_roundover_elapsed_timer_PUE01 = os.difftime(delay_roundover_end_timer_PUE01, delay_roundover_starttimer_PUE01)
	delay_roundover_elapsed_timer_PUE01 = math.floor(delay_roundover_elapsed_timer_PUE01)
	if delay_roundover_elapsed_timer_PUE01 >= delay_roundover_timer_PUE01 then
	if clip == false then

	print ("")
	print ("*** Timer test 02 ***")
	print ("")

	clip = false
	delay_roundover_starttimer_PUE00 = os.time()

	end
	end
	end
	end

-- --------------------------------------------------

end)

return Timertest()
