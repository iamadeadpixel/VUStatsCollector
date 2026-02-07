-- Spaghetti code by iamadeadpixel

---@class Revives
Revives = class 'Revives'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Revives stuff loaded ***");
	end
	end
end)


Events:Subscribe('Player:ReviveAccepted', function(player, reviver)

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[reviver.name] ~= reviver.name then return end
	end
-- ------------------------------------------------------

	if playerdeaths[player.name] == nil then playerdeaths[player.name] = 0; end
	if Revives_Give[reviver.name] == nil then Revives_Give[reviver.name] = 0; end
	if Revives_Take[player.name] == nil then Revives_Take[player.name] = 0; end

		Revives_Give[reviver.name] = Revives_Give[reviver.name] + 1
		Revives_Take[player.name] = Revives_Take[player.name] + 1
		playerdeaths[player.name] = playerdeaths[player.name] - 1

	if Config.consolespam_revives_msg then
 data_revives_msg(player,reviver, data_playername)
	end
-- ------------------------------------------------------

	data_playername = reviver.name
	data_revives(data_playername)

	data_playername = player.name
	data_revives(data_playername)

end)

-- ------------------------------------------------------

function data_revives_msg(player,reviver, data_playername)

	print ("player "..player.name.." got revived "..Revives_Take[player.name].." times, thanks to "..reviver.name.."`s DEFIBRILLATOR")
end -- End of function call

-- ------------------------------------------------------

function data_revives(data_playername)

	if Config.consolespam_revives1 then
	print ("")
	print ("Accessing tbl_revives")
	print ("")
	end

	Results = SQL:Query('SELECT Soldiername FROM tbl_revives WHERE Soldiername = ?', data_playername) -- works

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	if Config.consolespam_revives2 then
	print ("Done reading "..data_table_name)
	print (Results)
	print ("")
	end

if type(next(Results)) == "nil" then
	if Config.consolespam_revives3 then
print("No data found for "..data_playername.." and Revive stuff - Injecting now")
	end

		           s_Query = 'INSERT INTO tbl_revives      (Soldiername,    Revives_Give, Revives_Take) VALUES (?,?,?)'
		                        if not SQL:Query(s_Query, data_playername,     0,              0) then
			print(" - Failed to insert Revive data in tbl_revives: " .. SQL:Error())
			return
	end

	if Config.consolespam_revives4 then
	print("")
	print ("tbl_revives injection done")
	end

else

	if Config.consolespam_revives5 then
print("found data: "..data_playername.." and Revive stuff")
	end

end
end -- End of function call

-- ------------------------------------------------------

return Revives()

