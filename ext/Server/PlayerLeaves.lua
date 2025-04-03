-- Spaghetti code by iamadeadpixel

---@class PlayerLeaves
PlayerLeaves = class 'PlayerLeaves'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** PlayerLeaves loaded ***");
	end
	end
end)

-- consolespam_leaves 
Events:Subscribe('Player:Left', function(player) -- player.name

	s_end_time = os.time()
	s_elapsed_time = os.difftime(s_end_time, Session_PlayTime_Start[player.name])
	s_elapsed_time = math.floor(s_elapsed_time)
	Session_PlayTime_End[player.name] = s_elapsed_time

	local guid_results = SQL:Query('SELECT  PlayTime FROM tbl_playerdata')
	if not guid_results then
		print('Failed to read Guid query: ' ..SQL:Error())
		return
	end

	for _, l_Row in pairs(guid_results) do
		temp_PlayTime = l_Row["PlayTime"]

			s_PlayTime = temp_PlayTime + s_elapsed_time
			if not SQL:Query('UPDATE tbl_playerdata SET PlayTime=? WHERE Soldiername = ?', s_PlayTime, getnamehuman[player.name]) then
				print('Failed to execute Update query: ' .. SQL:Error()) -- If everything works, this would never be printed...
				return
			end

		-- Removing table data on player left.
		Session_PlayTime_Start[player.name] = {}
		Session_PlayTime_End[player.name] = {}

		end
end)

return PlayerLeaves()
