---@class ServerOwner
ServerOwner = class 'ServerOwner'

-- used for future stuff.

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** Server Owner mod loaded ***"); 
end
end)

---@type GeneralSettings

	serverowner = {}

Events:Subscribe('Player:Joining', function(name, playerGuid, ipAddress, accountGuid)
	Serverowner_player = name
	Serverowner_accountGuid = tostring(accountGuid)
	Serverowner_GetDateTime = os.date('%Y-%m-%d %H:%M:%S')

-- Here we read the players accountguid from the table

		print("*** OwnerInfo: Accessing table 'tbl_server_owner'")
	
	local owner_results = SQL:Query('SELECT VU_GUID, Lock FROM tbl_server_owner')
	if not owner_results then
		print('Failed to read Guid query: ' .. SQL:Error())
		return
	end

		print("*** OwnerInfo: Reading rows from table 'tbl_server_owner'")
		print("");

-- Here we try to read the row that contains the players accountguid.
	for _, l_Row in pairs(owner_results) do
		Serverowner_tblGuid = l_Row["VU_GUID"]
		Serverowner_tblLock = l_Row["Lock"]
    end

		print("*** OwnerInfo: Done Reading rows from table 'tbl_server_owner'")

		if Serverowner_tblGuid == nil and Serverowner_tblLock == nil then
	print("*** OwnerInfo: No data found, Inserting server owner")
	print("");

		s_Query = 'INSERT INTO tbl_server_owner (Soldiername, VU_GUID, Lock, FirstSeenOnServer) VALUES (?,?,?,?)'
		if not SQL:Query(s_Query, Serverowner_player, Serverowner_accountGuid, "Lock", Serverowner_GetDateTime ) then
			print('Failed to execute query: ' .. SQL:Error())
			return

	print("*** OwnerInfo: Done inserting server owner data")
    end

    else
	print("*** OwnerInfo: Check for existing data")

		if Serverowner_tblGuid == Serverowner_accountGuid  then
		print("*** OwnerInfo: GUID FOUND FOR PLAYER: " ..Serverowner_player.. " - Guid:" ..Serverowner_tblGuid)
		print("");
		end

		if Serverowner_tblLock == "Lock" then
		print("*** OwnerInfo: Lock data found")
		print("");
	serverowner[Serverowner_player] = true
		end

end

end)

Events:Subscribe('Player:Chat', function(player, recipientMask, message)
	if message == ".test" then
	if serverowner[Serverowner_player] == true then

		ChatManager:SendMessage("** (TRUE) TEST MESSAGE **" .. player.name, player)
		print("** (TRUE) TEST MESSAGE ** for " .. player.name .. " **");

	serverowner[Serverowner_player] = false
	else

		ChatManager:SendMessage("** (FALSE) TEST MESSAGE **" .. player.name, player)
		print("** (FALSE) TEST MESSAGE ** for " .. player.name .. " **");
	serverowner[Serverowner_player] = true


end
end
end)

Events:Subscribe('Player:Left', function(player)
		serverowner[Serverowner_player] = {}
		Serverowner_tblGuid = {}
		Serverowner_tblLock = {}

end)

return ServerOwner()
