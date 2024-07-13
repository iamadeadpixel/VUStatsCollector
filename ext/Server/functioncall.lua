-- Spaghetti code by iamadeadpixel

---@class functioncalls
functioncalls = class 'functioncalls'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** functioncall stuff mod loaded ***");
	end
end)

function iamyourdaddy(data_playername)
	
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

Results1 = tostring (Results)
	print ("STRING: "..Results1)
--	print (string.fromhex (Results1))


-- Sneaky workaround
if string.match(Results1, (data_playername)) then
  print ("The content "..data_playername.." was found.")
else
  print ("The content "..data_playername.." was not found.")
end


end -- End of function call

return functioncalls()
