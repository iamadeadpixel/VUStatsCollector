-- Spaghetti code by iamadeadpixel

---@class functioncalls
functioncalls = class 'functioncalls'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** functioncall stuff mod loaded ***");
	end
end)

function iamyourdaddy(data_playername)

	data_weapon_name = tostring (data_weapon_name)
	data_playername = tostring (data_playername)

	print ("")
	print (data_catagory.." Weapon name:"..data_weapon_name)
	print (data_catagory.." Mod DB Table name:"..data_table_name)
	print (data_catagory.." Player name:"..data_playername)
	print ("")

	print ("Accessing "..data_table_name)
	Results = SQL:Query('SELECT Weaponname, Soldiername FROM '..data_table_name..' WHERE Soldiername = ? and Weaponname = ?', data_playername,data_weapon_name) -- works

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	print ("Done reading "..data_table_name)
	print (Results)

if type(next(Results)) == "nil" then
print("No data found for "..data_playername.." and "..data_weapon_name.." Injecting now")
 --add new entry 

		           s_Query = 'INSERT INTO ' ..data_table_name..'     (Weaponname,     Soldiername,    Kills) VALUES (?,?,?)'
				                        if not SQL:Query(s_Query, data_weapon_name,   data_playername,  0) then
			print(" - Failed to insert assault weapon data in "..data_table_name..": " .. SQL:Error())
			return
	end
	print("")
	print (data_table_name.." injection done")

else
 --do some thing with results
print('found data'..data_playername..' and '..data_weapon_name)
end

end -- End of function call

return functioncalls()
