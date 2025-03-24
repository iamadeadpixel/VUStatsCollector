Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam then
		print("*** Config loaded ***");
	end
	end
end)

-- Here you can turn on, or off modules.
Config = {
	humansonly = false, -- true = Only humans are logged / false = includes bots in logging.
	updatecheck = false, -- if true, it checks for updates (disabled due ises)
	consolespam = false, -- if true, the console wil spam all messages (this will increase log file)
	consolespam1 = true, -- if true, the console wil spam all join/leave messages (not defined yet) (this will increase log file)
	consolespam2 = true -- if true, the console wil spam all (not defined yet) (this will increase log file)
}

return Config
