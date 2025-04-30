Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** M-Com stuff loaded ***");
Mcom_Armed = {}
Mcom_Disarmed = {}
Mcom_Destroyed = {}

	end
	end
end)

Events:Subscribe('Level:Loaded', function()
	local mcomIterator = EntityManager:GetIterator("EventSplitterEntity")
	
	local mcomEntity = mcomIterator:Next()
	
	while mcomEntity do
		mcomEntity = Entity(mcomEntity)
		mcomEntity:RegisterEventCallback(function(ent, entityEvent)
			if ent.data.instanceGuid == Guid("87E78B77-78F9-4DE0-82FF-904CDC2F7D03") then
				Events:Dispatch('MCOM:Armed', entityEvent.player)
			end
			if ent.data.instanceGuid == Guid("74B7AD6D-8EB5-40B1-BB53-C0CFB956048E") then
				Events:Dispatch('MCOM:Disarmed', entityEvent.player)
			end
			if ent.data.instanceGuid == Guid("70B36E2F-0B6F-40EC-870B-1748239A63A8") then
				Events:Dispatch('MCOM:Destroyed', entityEvent.player)
			end
        end)
		
		mcomEntity = mcomIterator:Next()
	end
end)

-- ------------------------------------

Events:Subscribe('MCOM:Armed', function(player)

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[player.name] ~= player.name then return end
	end

-- ------------------------------------------------------
	if Config.consolespam_mcomevent then
	print("MCOM:Armed by " ..player.name)
	end

	Mcom_Armed[player.name] = Mcom_Armed[player.name] + 1

	data_mcom_event = "Armed"
	data_playername = player.name
	data_catagory = "Mcom data:"
	data_Mcom(data_playername)

end)

-- ------------------------------------

Events:Subscribe('MCOM:Disarmed', function(player)

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[player.name] ~= player.name then return end
	end

-- ------------------------------------------------------
	if Config.consolespam_mcomevent then
	print("MCOM:Disarmed by " ..player.name)
	end

	Mcom_Disarmed[player.name] = Mcom_Disarmed[player.name] + 1

	data_mcom_event = "Disarmed"
	data_playername = player.name
	data_catagory = "Mcom data:"
	data_Mcom(data_playername)

end)

-- ------------------------------------

Events:Subscribe('MCOM:Destroyed', function(player)

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[player.name] ~= player.name then return end
	end

-- ------------------------------------------------------
	if Config.consolespam_mcomevent then
	print("MCOM:Destroyed by " ..player.name)
	end

	Mcom_Destroyed[player.name] = Mcom_Destroyed[player.name] + 1

	data_mcom_event = "Destroyed"
	data_playername = player.name
	data_catagory = "Mcom data:"
	data_Mcom(data_playername)

end)

-- ------------------------------------

function data_Mcom(data_playername)
	data_mcom_event = tostring (data_mcom_event)
	data_playername = tostring (data_playername)

	if Config.consolespam_mcomevent then
	print ("")
	print (data_catagory.." Weapon name:"..data_mcom_event)
	print (data_catagory.." Player name:"..data_playername)
	print ("")

	print ("Accessing tbl_mcom")
	end

	Results = SQL:Query('SELECT Soldiername FROM tbl_mcom WHERE Soldiername = ?', data_playername)

	if not Results then
	print('Failed to execute query: ' .. SQL:Error())
	return
	end

	if Config.consolespam_mcomevent then
	print ("Done reading tbl_mcom")
	print ("")
	end

 --If no player data is found, injecting it now
if type(next(Results)) == "nil" then
	if Config.consolespam_mcomevent then
print("No player data for "..data_playername.." found for tbl_mcom - Injecting now")
	end

		           s_Query = 'INSERT INTO tbl_mcom     (Soldiername,     Armed, Disarmed, Destroyed) VALUES (?,?,?,?)'
			            if not SQL:Query(s_Query, data_playername,     0,      0,         0) then
			print(" - Failed to insert assault weapon data in tbl_mcom: " .. SQL:Error())
			return
	end

	if Config.consolespam_mcomevent then
	print("")
	print ("tbl_mcom injection done")
	end

	else
	if Config.consolespam_mcomevent then
		print('found M-com "'..data_mcom_event..'" data for : '..data_playername)
		print('M-com Stats for "'..data_mcom_event)
	end

	if data_mcom_event == "Armed" then 
	if Config.consolespam_mcomevent then
		print ("M-com armed this round: "..Mcom_Armed[data_playername])
		print ("Total M-com data this round: Armed:"..Mcom_Armed[data_playername].." Disarmed:"..Mcom_Disarmed[data_playername].." Destroyed:"..Mcom_Destroyed[data_playername])
	end

	elseif data_mcom_event == "Disarmed" then 
	if Config.consolespam_mcomevent then
		print ("M-com armed this round: "..Mcom_Disarmed[data_playername])
		print ("Total M-com data this round: Armed:"..Mcom_Armed[data_playername].." Disarmed:"..Mcom_Disarmed[data_playername].." Destroyed:"..Mcom_Destroyed[data_playername])
	end

	elseif data_mcom_event == "Destroyed" then 
	if Config.consolespam_mcomevent then
		print ("M-com armed this round: "..Mcom_Destroyed[data_playername])
		print ("Total M-com data this round: Armed:"..Mcom_Armed[data_playername].." Disarmed:"..Mcom_Disarmed[data_playername].." Destroyed:"..Mcom_Destroyed[data_playername])
	end
	end
end

end -- End of function call

-- ------------------------------------
