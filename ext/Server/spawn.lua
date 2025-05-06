-- Spaghetti code by iamadeadpixel

---@class spawn
spawn = class 'spawn'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Spawn and variables stuff loaded ***");
	end
	end
end)

-- spawn/respawn event
Events:Subscribe('Player:Respawn', function(player, recipientMask, message, info, yell, playerGuid, accountGuid)
	if haltprocess then return end

	data_playername = player.name

--[[
Here we set all kill/death/headshot variables
]]

	setplayervariables0(player, data_playername)
	setplayervariables1(player, data_playername)
	setplayervariables2(player, data_playername)
	setplayervariables3(player, data_playername)
	setplayervariables4(player, data_playername)
	setplayervariables5(player, data_playername)
	setplayervariables6(player, data_playername)
	setplayervariables7(player, data_playername)
	setplayervariables8(player, data_playername)
	setplayervariables9(player, data_playername)

--
	playerteamID[data_playername] = player.teamId
	getnameall[data_playername] = data_playername

	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[data_playername] ~= data_playername then return end
	end

	-- Return if the player has been announced already
	if playerishuman[data_playername] then return end


	do
	addbot2database(player, data_playername)
	end

end)

-- ---------


-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--[[
Reserved for ,what ever...
]]

function playerunknown(player, data_playername)


end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function addbot2database(player, data_playername)

	-- Return if the bot has been announced already
	if playerisbot[data_playername] then return end
	getnamebot[data_playername] = data_playername

	    -- Add the bot to the playerisBot table
	playerisbot[data_playername] = true

	local Botname_results = SQL:Query ('SELECT Soldiername FROM tbl_playerstats')
		if not Botname_results then
			print('*** Bot Info: - Failed to read Bot Guid query: '..SQL:Error())
			return end

		for _, l_Row in pairs(Botname_results) do
			Bottemp_Name = l_Row["Soldiername"]

		if getnamebot[data_playername] == Bottemp_Name then

	if Config.consolespam_spawn_msg then
		print("*** Bot Info: FOUND BOT IN DATABASE: " ..getnamebot[data_playername])
	end
		return end
	end

	if Config.consolespam_spawn_msg then
	print("*** Bot Info: Adding new BOT to database:" ..getnamebot[data_playername])
	end

	s_Query ='INSERT INTO tbl_playerstats     (Soldiername,         Score, Kills, Deaths, Suicide, Headshots, TeamKilled, Dogtags, Revives, Killstreaks, Wins, Losses, Shot, Hits) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)'
	if not SQL:Query(s_Query,	    getnamebot[data_playername],	  0,	 0,	0,	 0,	  0,	      0,	 0,	  0,         0,       0,      0,    0,    0) then

			print('*** BotGuid.lua - Failed to execute BOT query: ' .. SQL:Error())
			return end

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

--[[
All player variables that counts from 0 to xxx set here
]]

function setplayervariables0(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable0[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting various variables for "..data_playername)
	end

-- Shots fired and hit stuff
	if playershot[data_playername] == nil then playershot[data_playername] = 0; end
	if playerhit[data_playername] == nil then playerhit[data_playername] = 0; end

-- Base kill / death stuff
	if playerdeaths[data_playername] == nil then playerdeaths[data_playername] = 0; end
	if playerheadshot[data_playername] == nil then playerheadshot[data_playername] = 0; end
	if playerkills[data_playername] == nil then playerkills[data_playername] = 0; end
	if playersuicides[data_playername] == nil then playersuicides[data_playername] = 0; end
	if playerteamkilled[data_playername] == nil then playerteamkilled[data_playername] = 0; end
	if playerdogtags[data_playername] == nil then playerdogtags[data_playername] = 0; end
	if playerrevivs[data_playername] == nil then playerrevivs[data_playername] = 0; end

-- Killstreak stuff
	if killstreak[data_playername] == nil then killstreak[data_playername] = 0; end
	if killstreak_counter[data_playername] == nil then killstreak_counter[data_playername] = 0; end
	if killstreak_lock[data_playername] == nil then killstreak_lock[data_playername] = 0; end

-- Mcom stuff
	if Mcom_Armed[data_playername] == nil then Mcom_Armed[data_playername] = 0 ; end 
	if Mcom_Destroyed[data_playername] == nil then Mcom_Destroyed[data_playername] = 0 ; end
	if Mcom_Disarmed[data_playername] == nil then Mcom_Disarmed[data_playername] = 0 ; end

-- Score stuff
	if playerscore[data_playername] == nil then playerscore[data_playername] = 0; end
	if playerscore1[data_playername] == nil then playerscore1[data_playername] = 0; end
	if playerscore2[data_playername] == nil then playerscore2[data_playername] = 0; end
	if playerscore3[data_playername] == nil then playerscore3[data_playername] = 0; end
	if playerscore4[data_playername] == nil then playerscore4[data_playername] = 0; end

-- roadkill stuff
	if kill_roadkills[data_playername] == nil then kill_roadkills[data_playername] = 0; end
	if Death_roadkills[data_playername] == nil then Death_roadkills[data_playername] = 0; end
	if Headshot_roadkills[data_playername] == nil then Headshot_roadkills[data_playername] = 0; end

	setplayervariable0[data_playername] = true

end


function setplayervariables1(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable1[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Assault stuff for "..data_playername)
	end

-- assault Gadget stuff
	   if Death_DEFIBRILLATOR[data_playername] == nil then Death_DEFIBRILLATOR[data_playername] = 0; end
	if Headshot_DEFIBRILLATOR[data_playername] == nil then Headshot_DEFIBRILLATOR[data_playername] = 0; end
	    if kill_DEFIBRILLATOR[data_playername] == nil then kill_DEFIBRILLATOR[data_playername] = 0; end
	   if Death_GP_30_BUCK[data_playername] == nil then Death_GP_30_BUCK[data_playername] = 0; end
	if Headshot_GP_30_BUCK[data_playername] == nil then Headshot_GP_30_BUCK[data_playername] = 0; end
	    if kill_GP_30_BUCK[data_playername] == nil then kill_GP_30_BUCK[data_playername] = 0; end
	   if Death_GP_30_DART[data_playername] == nil then Death_GP_30_DART[data_playername] = 0; end
	if Headshot_GP_30_DART[data_playername] == nil then Headshot_GP_30_DART[data_playername] = 0; end
	    if kill_GP_30_DART[data_playername] == nil then kill_GP_30_DART[data_playername] = 0; end
	   if Death_GP_30_HE[data_playername] == nil then Death_GP_30_HE[data_playername] = 0; end
	if Headshot_GP_30_HE[data_playername] == nil then Headshot_GP_30_HE[data_playername] = 0; end
	    if kill_GP_30_HE[data_playername] == nil then kill_GP_30_HE[data_playername] = 0; end
	   if Death_GP_30_LVG[data_playername] == nil then Death_GP_30_LVG[data_playername] = 0; end
	if Headshot_GP_30_LVG[data_playername] == nil then Headshot_GP_30_LVG[data_playername] = 0; end
	    if kill_GP_30_LVG[data_playername] == nil then kill_GP_30_LVG[data_playername] = 0; end
	   if Death_GP_30_SMOKE[data_playername] == nil then Death_GP_30_SMOKE[data_playername] = 0; end
	if Headshot_GP_30_SMOKE[data_playername] == nil then Headshot_GP_30_SMOKE[data_playername] = 0; end
	    if kill_GP_30_SMOKE[data_playername] == nil then kill_GP_30_SMOKE[data_playername] = 0; end
	   if Death_M26_DART[data_playername] == nil then Death_M26_DART[data_playername] = 0; end
	if Headshot_M26_DART[data_playername] == nil then Headshot_M26_DART[data_playername] = 0; end
	    if kill_M26_DART[data_playername] == nil then kill_M26_DART[data_playername] = 0; end
	   if Death_M26_FRAG[data_playername] == nil then Death_M26_FRAG[data_playername] = 0; end
	if Headshot_M26_FRAG[data_playername] == nil then Headshot_M26_FRAG[data_playername] = 0; end
	    if kill_M26_FRAG[data_playername] == nil then kill_M26_FRAG[data_playername] = 0; end
	   if Death_M26_MASS[data_playername] == nil then Death_M26_MASS[data_playername] = 0; end
	if Headshot_M26_MASS[data_playername] == nil then Headshot_M26_MASS[data_playername] = 0; end
	    if kill_M26_MASS[data_playername] == nil then kill_M26_MASS[data_playername] = 0; end
	   if Death_M26_SLUG[data_playername] == nil then Death_M26_SLUG[data_playername] = 0; end
	if Headshot_M26_SLUG[data_playername] == nil then Headshot_M26_SLUG[data_playername] = 0; end
	    if kill_M26_SLUG[data_playername] == nil then kill_M26_SLUG[data_playername] = 0; end
	   if Death_M320_BUCK[data_playername] == nil then Death_M320_BUCK[data_playername] = 0; end
	if Headshot_M320_BUCK[data_playername] == nil then Headshot_M320_BUCK[data_playername] = 0; end
	    if kill_M320_BUCK[data_playername] == nil then kill_M320_BUCK[data_playername] = 0; end
	   if Death_M320_HE[data_playername] == nil then Death_M320_HE[data_playername] = 0; end
	if Headshot_M320_HE[data_playername] == nil then Headshot_M320_HE[data_playername] = 0; end
	    if kill_M320_HE[data_playername] == nil then kill_M320_HE[data_playername] = 0; end
	   if Death_M320_LVG[data_playername] == nil then Death_M320_LVG[data_playername] = 0; end
	if Headshot_M320_LVG[data_playername] == nil then Headshot_M320_LVG[data_playername] = 0; end
	    if kill_M320_LVG[data_playername] == nil then kill_M320_LVG[data_playername] = 0; end
	   if Death_M320_SMOKE[data_playername] == nil then Death_M320_SMOKE[data_playername] = 0; end
	if Headshot_M320_SMOKE[data_playername] == nil then Headshot_M320_SMOKE[data_playername] = 0; end
	    if kill_M320_SMOKE[data_playername] == nil then kill_M320_SMOKE[data_playername] = 0; end
	   if Death_MEDIC_KIT[data_playername] == nil then Death_MEDIC_KIT[data_playername] = 0; end
	if Headshot_MEDIC_KIT[data_playername] == nil then Headshot_MEDIC_KIT[data_playername] = 0; end
	    if kill_MEDIC_KIT[data_playername] == nil then kill_MEDIC_KIT[data_playername] = 0; end

-- assault weapon
	   if Death_AEK_971[data_playername] == nil then Death_AEK_971[data_playername] = 0; end
	if Headshot_AEK_971[data_playername] == nil then Headshot_AEK_971[data_playername] = 0; end
	    if kill_AEK_971[data_playername] == nil then kill_AEK_971[data_playername] = 0; end
	   if Death_AK_74M[data_playername] == nil then Death_AK_74M[data_playername] = 0; end
	if Headshot_AK_74M[data_playername] == nil then Headshot_AK_74M[data_playername] = 0; end
	    if kill_AK_74M[data_playername] == nil then kill_AK_74M[data_playername] = 0; end
	   if Death_AN_94[data_playername] == nil then Death_AN_94[data_playername] = 0; end
	if Headshot_AN_94[data_playername] == nil then Headshot_AN_94[data_playername] = 0; end
	    if kill_AN_94[data_playername] == nil then kill_AN_94[data_playername] = 0; end
	   if Death_AUG_A3[data_playername] == nil then Death_AUG_A3[data_playername] = 0; end
	if Headshot_AUG_A3[data_playername] == nil then Headshot_AUG_A3[data_playername] = 0; end
	    if kill_AUG_A3[data_playername] == nil then kill_AUG_A3[data_playername] = 0; end
	   if Death_F2000[data_playername] == nil then Death_F2000[data_playername] = 0; end
	if Headshot_F2000[data_playername] == nil then Headshot_F2000[data_playername] = 0; end
	    if kill_F2000[data_playername] == nil then kill_F2000[data_playername] = 0; end
	   if Death_FAMAS[data_playername] == nil then Death_FAMAS[data_playername] = 0; end
	if Headshot_FAMAS[data_playername] == nil then Headshot_FAMAS[data_playername] = 0; end
	    if kill_FAMAS[data_playername] == nil then kill_FAMAS[data_playername] = 0; end
	   if Death_G3A3[data_playername] == nil then Death_G3A3[data_playername] = 0; end
	if Headshot_G3A3[data_playername] == nil then Headshot_G3A3[data_playername] = 0; end
	    if kill_G3A3[data_playername] == nil then kill_G3A3[data_playername] = 0; end
	   if Death_KH2002[data_playername] == nil then Death_KH2002[data_playername] = 0; end
	if Headshot_KH2002[data_playername] == nil then Headshot_KH2002[data_playername] = 0; end
	    if kill_KH2002[data_playername] == nil then kill_KH2002[data_playername] = 0; end
	   if Death_L85A2[data_playername] == nil then Death_L85A2[data_playername] = 0; end
	if Headshot_L85A2[data_playername] == nil then Headshot_L85A2[data_playername] = 0; end
	    if kill_L85A2[data_playername] == nil then kill_L85A2[data_playername] = 0; end
	   if Death_M16A3[data_playername] == nil then Death_M16A3[data_playername] = 0; end
	if Headshot_M16A3[data_playername] == nil then Headshot_M16A3[data_playername] = 0; end
	    if kill_M16A3[data_playername] == nil then kill_M16A3[data_playername] = 0; end
	   if Death_M16A4[data_playername] == nil then Death_M16A4[data_playername] = 0; end
	if Headshot_M16A4[data_playername] == nil then Headshot_M16A4[data_playername] = 0; end
	    if kill_M16A4[data_playername] == nil then kill_M16A4[data_playername] = 0; end
	   if Death_M416[data_playername] == nil then Death_M416[data_playername] = 0; end
	if Headshot_M416[data_playername] == nil then Headshot_M416[data_playername] = 0; end
	    if kill_M416[data_playername] == nil then kill_M416[data_playername] = 0; end
	   if Death_SCAR_L[data_playername] == nil then Death_SCAR_L[data_playername] = 0; end
	if Headshot_SCAR_L[data_playername] == nil then Headshot_SCAR_L[data_playername] = 0; end
	    if kill_SCAR_L[data_playername] == nil then kill_SCAR_L[data_playername] = 0; end
	setplayervariable1[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables2(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable2[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Air vehicle stuff for "..data_playername)
	end

-- air vehicle stuff
	   if Death_A10_THUNDERBOLT[data_playername] == nil then Death_A10_THUNDERBOLT[data_playername] = 0; end
	if Headshot_A10_THUNDERBOLT[data_playername] == nil then Headshot_A10_THUNDERBOLT[data_playername] = 0; end
	    if kill_A10_THUNDERBOLT[data_playername] == nil then kill_A10_THUNDERBOLT[data_playername] = 0; end
	   if Death_AH_1Z_VIPER[data_playername] == nil then Death_AH_1Z_VIPER[data_playername] = 0; end
	if Headshot_AH_1Z_VIPER[data_playername] == nil then Headshot_AH_1Z_VIPER[data_playername] = 0; end
	    if kill_AH_1Z_VIPER[data_playername] == nil then kill_AH_1Z_VIPER[data_playername] = 0; end
	   if Death_AH_6J_LITTLE_BIRD[data_playername] == nil then Death_AH_6J_LITTLE_BIRD[data_playername] = 0; end
	if Headshot_AH_6J_LITTLE_BIRD[data_playername] == nil then Headshot_AH_6J_LITTLE_BIRD[data_playername] = 0; end
	    if kill_AH_6J_LITTLE_BIRD[data_playername] == nil then kill_AH_6J_LITTLE_BIRD[data_playername] = 0; end
	   if Death_F_35[data_playername] == nil then Death_F_35[data_playername] = 0; end
	if Headshot_F_35[data_playername] == nil then Headshot_F_35[data_playername] = 0; end
	    if kill_F_35[data_playername] == nil then kill_F_35[data_playername] = 0; end
	   if Death_FA_18E_SUPER_HORNET[data_playername] == nil then Death_FA_18E_SUPER_HORNET[data_playername] = 0; end
	if Headshot_FA_18E_SUPER_HORNET[data_playername] == nil then Headshot_FA_18E_SUPER_HORNET[data_playername] = 0; end
	    if kill_FA_18E_SUPER_HORNET[data_playername] == nil then kill_FA_18E_SUPER_HORNET[data_playername] = 0; end
	   if Death_GUNSHIP[data_playername] == nil then Death_GUNSHIP[data_playername] = 0; end
	if Headshot_GUNSHIP[data_playername] == nil then Headshot_GUNSHIP[data_playername] = 0; end
	    if kill_GUNSHIP[data_playername] == nil then kill_GUNSHIP[data_playername] = 0; end
	   if Death_KA_60_KASATKA[data_playername] == nil then Death_KA_60_KASATKA[data_playername] = 0; end
	if Headshot_KA_60_KASATKA[data_playername] == nil then Headshot_KA_60_KASATKA[data_playername] = 0; end
	    if kill_KA_60_KASATKA[data_playername] == nil then kill_KA_60_KASATKA[data_playername] = 0; end
	   if Death_MI_28_HAVOC[data_playername] == nil then Death_MI_28_HAVOC[data_playername] = 0; end
	if Headshot_MI_28_HAVOC[data_playername] == nil then Headshot_MI_28_HAVOC[data_playername] = 0; end
	    if kill_MI_28_HAVOC[data_playername] == nil then kill_MI_28_HAVOC[data_playername] = 0; end
	   if Death_SU_25TM_FROGFOOT[data_playername] == nil then Death_SU_25TM_FROGFOOT[data_playername] = 0; end
	if Headshot_SU_25TM_FROGFOOT[data_playername] == nil then Headshot_SU_25TM_FROGFOOT[data_playername] = 0; end
	    if kill_SU_25TM_FROGFOOT[data_playername] == nil then kill_SU_25TM_FROGFOOT[data_playername] = 0; end
	   if Death_SU_35BM_FLANKER_E[data_playername] == nil then Death_SU_35BM_FLANKER_E[data_playername] = 0; end
	if Headshot_SU_35BM_FLANKER_E[data_playername] == nil then Headshot_SU_35BM_FLANKER_E[data_playername] = 0; end
	    if kill_SU_35BM_FLANKER_E[data_playername] == nil then kill_SU_35BM_FLANKER_E[data_playername] = 0; end
	   if Death_SU_37[data_playername] == nil then Death_SU_37[data_playername] = 0; end
	if Headshot_SU_37[data_playername] == nil then Headshot_SU_37[data_playername] = 0; end
	    if kill_SU_37[data_playername] == nil then kill_SU_37[data_playername] = 0; end
	   if Death_TV_MISSILE[data_playername] == nil then Death_TV_MISSILE[data_playername] = 0; end
	if Headshot_TV_MISSILE[data_playername] == nil then Headshot_TV_MISSILE[data_playername] = 0; end
	    if kill_TV_MISSILE[data_playername] == nil then kill_TV_MISSILE[data_playername] = 0; end
	   if Death_UH_1Y_VENOM[data_playername] == nil then Death_UH_1Y_VENOM[data_playername] = 0; end
	if Headshot_UH_1Y_VENOM[data_playername] == nil then Headshot_UH_1Y_VENOM[data_playername] = 0; end
	    if kill_UH_1Y_VENOM[data_playername] == nil then kill_UH_1Y_VENOM[data_playername] = 0; end
	   if Death_Z_11W[data_playername] == nil then Death_Z_11W[data_playername] = 0; end
	if Headshot_Z_11W[data_playername] == nil then Headshot_Z_11W[data_playername] = 0; end
	    if kill_Z_11W[data_playername] == nil then kill_Z_11W[data_playername] = 0; end

	setplayervariable2[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables3(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable3[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Common weapons for "..data_playername)
	end

-- common weapon stuff
	if kill_AS_VAL[data_playername] == nil then kill_AS_VAL[data_playername] = 0; end
	if Death_AS_VAL[data_playername] == nil then Death_AS_VAL[data_playername] = 0; end
	if Headshot_AS_VAL[data_playername] == nil then Headshot_AS_VAL[data_playername] = 0; end
	if kill_KNIFE[data_playername] == nil then kill_KNIFE[data_playername] = 0; end
	if Death_KNIFE[data_playername] == nil then Death_KNIFE[data_playername] = 0; end
	if Headshot_KNIFE[data_playername] == nil then Headshot_KNIFE[data_playername] = 0; end
	if kill_M5K[data_playername] == nil then kill_M5K[data_playername] = 0; end
	if Death_M5K[data_playername] == nil then Death_M5K[data_playername] = 0; end
	if Headshot_M5K[data_playername] == nil then Headshot_M5K[data_playername] = 0; end
	if kill_M67_GRENADE[data_playername] == nil then kill_M67_GRENADE[data_playername] = 0; end
	if Death_M67_GRENADE[data_playername] == nil then Death_M67_GRENADE[data_playername] = 0; end
	if Headshot_M67_GRENADE[data_playername] == nil then Headshot_M67_GRENADE[data_playername] = 0; end
	if kill_MP7[data_playername] == nil then kill_MP7[data_playername] = 0; end
	if Death_MP7[data_playername] == nil then Death_MP7[data_playername] = 0; end
	if Headshot_MP7[data_playername] == nil then Headshot_MP7[data_playername] = 0; end
	if kill_P90[data_playername] == nil then kill_P90[data_playername] = 0; end
	if Death_P90[data_playername] == nil then Death_P90[data_playername] = 0; end
	if Headshot_P90[data_playername] == nil then Headshot_P90[data_playername] = 0; end
	if kill_PDW_R[data_playername] == nil then kill_PDW_R[data_playername] = 0; end
	if Death_PDW_R[data_playername] == nil then Death_PDW_R[data_playername] = 0; end
	if Headshot_PDW_R[data_playername] == nil then Headshot_PDW_R[data_playername] = 0; end
	if kill_PP_19[data_playername] == nil then kill_PP_19[data_playername] = 0; end
	if Death_PP_19[data_playername] == nil then Death_PP_19[data_playername] = 0; end
	if Headshot_PP_19[data_playername] == nil then Headshot_PP_19[data_playername] = 0; end
	if kill_PP_2000[data_playername] == nil then kill_PP_2000[data_playername] = 0; end
	if Death_PP_2000[data_playername] == nil then Death_PP_2000[data_playername] = 0; end
	if Headshot_PP_2000[data_playername] == nil then Headshot_PP_2000[data_playername] = 0; end
	if kill_UMP_45[data_playername] == nil then kill_UMP_45[data_playername] = 0; end
	if Death_UMP_45[data_playername] == nil then Death_UMP_45[data_playername] = 0; end
	if Headshot_UMP_45[data_playername] == nil then Headshot_UMP_45[data_playername] = 0; end
	if kill_XBOW[data_playername] == nil then kill_XBOW[data_playername] = 0; end
	if Death_XBOW[data_playername] == nil then Death_XBOW[data_playername] = 0; end
	if Headshot_XBOW[data_playername] == nil then Headshot_XBOW[data_playername] = 0; end

	setplayervariable3[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables4(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable4[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Engineer stuff for "..data_playername)
	end

-- engineer gadget stuff
	   if Death_EOD_BOT[data_playername] == nil then Death_EOD_BOT[data_playername] = 0; end
	if Headshot_EOD_BOT[data_playername] == nil then Headshot_EOD_BOT[data_playername] = 0; end
	    if kill_EOD_BOT[data_playername] == nil then kill_EOD_BOT[data_playername] = 0; end
	   if Death_FGM_148_JAVELIN[data_playername] == nil then Death_FGM_148_JAVELIN[data_playername] = 0; end
	if Headshot_FGM_148_JAVELIN[data_playername] == nil then Headshot_FGM_148_JAVELIN[data_playername] = 0; end
	    if kill_FGM_148_JAVELIN[data_playername] == nil then kill_FGM_148_JAVELIN[data_playername] = 0; end
	   if Death_FIM_92_STINGER[data_playername] == nil then Death_FIM_92_STINGER[data_playername] = 0; end
	if Headshot_FIM_92_STINGER[data_playername] == nil then Headshot_FIM_92_STINGER[data_playername] = 0; end
	    if kill_FIM_92_STINGER[data_playername] == nil then kill_FIM_92_STINGER[data_playername] = 0; end
	   if Death_M15_AT_MINE[data_playername] == nil then Death_M15_AT_MINE[data_playername] = 0; end
	if Headshot_M15_AT_MINE[data_playername] == nil then Headshot_M15_AT_MINE[data_playername] = 0; end
	    if kill_M15_AT_MINE[data_playername] == nil then kill_M15_AT_MINE[data_playername] = 0; end
	   if Death_REPAIR_TOOL[data_playername] == nil then Death_REPAIR_TOOL[data_playername] = 0; end
	if Headshot_REPAIR_TOOL[data_playername] == nil then Headshot_REPAIR_TOOL[data_playername] = 0; end
	    if kill_REPAIR_TOOL[data_playername] == nil then kill_REPAIR_TOOL[data_playername] = 0; end
	   if Death_RPG_7V2[data_playername] == nil then Death_RPG_7V2[data_playername] = 0; end
	if Headshot_RPG_7V2[data_playername] == nil then Headshot_RPG_7V2[data_playername] = 0; end
	    if kill_RPG_7V2[data_playername] == nil then kill_RPG_7V2[data_playername] = 0; end
	   if Death_SA_18_IGLA[data_playername] == nil then Death_SA_18_IGLA[data_playername] = 0; end
	if Headshot_SA_18_IGLA[data_playername] == nil then Headshot_SA_18_IGLA[data_playername] = 0; end
	    if kill_SA_18_IGLA[data_playername] == nil then kill_SA_18_IGLA[data_playername] = 0; end
	   if Death_SMAW[data_playername] == nil then Death_SMAW[data_playername] = 0; end
	if Headshot_SMAW[data_playername] == nil then Headshot_SMAW[data_playername] = 0; end
	    if kill_SMAW[data_playername] == nil then kill_SMAW[data_playername] = 0; end

-- engineer weapon stuff
	   if Death_A_91[data_playername] == nil then Death_A_91[data_playername] = 0; end
	if Headshot_A_91[data_playername] == nil then Headshot_A_91[data_playername] = 0; end
	    if kill_A_91[data_playername] == nil then kill_A_91[data_playername] = 0; end
	   if Death_ACW_R[data_playername] == nil then Death_ACW_R[data_playername] = 0; end
	if Headshot_ACW_R[data_playername] == nil then Headshot_ACW_R[data_playername] = 0; end
	    if kill_ACW_R[data_playername] == nil then kill_ACW_R[data_playername] = 0; end
	   if Death_AKS_74u[data_playername] == nil then Death_AKS_74u[data_playername] = 0; end
	if Headshot_AKS_74u[data_playername] == nil then Headshot_AKS_74u[data_playername] = 0; end
	    if kill_AKS_74u[data_playername] == nil then kill_AKS_74u[data_playername] = 0; end
	   if Death_G36C[data_playername] == nil then Death_G36C[data_playername] = 0; end
	if Headshot_G36C[data_playername] == nil then Headshot_G36C[data_playername] = 0; end
	    if kill_G36C[data_playername] == nil then kill_G36C[data_playername] = 0; end
	   if Death_G53[data_playername] == nil then Death_G53[data_playername] = 0; end
	if Headshot_G53[data_playername] == nil then Headshot_G53[data_playername] = 0; end
	    if kill_G53[data_playername] == nil then kill_G53[data_playername] = 0; end
	   if Death_M4[data_playername] == nil then Death_M4[data_playername] = 0; end
	if Headshot_M4[data_playername] == nil then Headshot_M4[data_playername] = 0; end
	    if kill_M4[data_playername] == nil then kill_M4[data_playername] = 0; end
	   if Death_M4A1[data_playername] == nil then Death_M4A1[data_playername] = 0; end
	if Headshot_M4A1[data_playername] == nil then Headshot_M4A1[data_playername] = 0; end
	    if kill_M4A1[data_playername] == nil then kill_M4A1[data_playername] = 0; end
	   if Death_MTAR_21[data_playername] == nil then Death_MTAR_21[data_playername] = 0; end
	if Headshot_MTAR_21[data_playername] == nil then Headshot_MTAR_21[data_playername] = 0; end
	    if kill_MTAR_21[data_playername] == nil then kill_MTAR_21[data_playername] = 0; end
	   if Death_QBZ_95B[data_playername] == nil then Death_QBZ_95B[data_playername] = 0; end
	if Headshot_QBZ_95B[data_playername] == nil then Headshot_QBZ_95B[data_playername] = 0; end
	    if kill_QBZ_95B[data_playername] == nil then kill_QBZ_95B[data_playername] = 0; end
	   if Death_SCAR_H[data_playername] == nil then Death_SCAR_H[data_playername] = 0; end
	if Headshot_SCAR_H[data_playername] == nil then Headshot_SCAR_H[data_playername] = 0; end
	    if kill_SCAR_H[data_playername] == nil then kill_SCAR_H[data_playername] = 0; end
	   if Death_SG553[data_playername] == nil then Death_SG553[data_playername] = 0; end
	if Headshot_SG553[data_playername] == nil then Headshot_SG553[data_playername] = 0; end
	    if kill_SG553[data_playername] == nil then kill_SG553[data_playername] = 0; end

	setplayervariable4[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables5(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable5[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Handgun stuff for "..data_playername)
	end

-- handguns  stuff
	   if Death_44_MAGNUM[data_playername] == nil then Death_44_MAGNUM[data_playername] = 0; end
	if Headshot_44_MAGNUM[data_playername] == nil then Headshot_44_MAGNUM[data_playername] = 0; end
	    if kill_44_MAGNUM[data_playername] == nil then kill_44_MAGNUM[data_playername] = 0; end
	   if Death_93R[data_playername] == nil then Death_93R[data_playername] = 0; end
	if Headshot_93R[data_playername] == nil then Headshot_93R[data_playername] = 0; end
	    if kill_93R[data_playername] == nil then kill_93R[data_playername] = 0; end
	   if Death_G17C[data_playername] == nil then Death_G17C[data_playername] = 0; end
	if Headshot_G17C[data_playername] == nil then Headshot_G17C[data_playername] = 0; end
	    if kill_G17C[data_playername] == nil then kill_G17C[data_playername] = 0; end
	   if Death_G18[data_playername] == nil then Death_G18[data_playername] = 0; end
	if Headshot_G18[data_playername] == nil then Headshot_G18[data_playername] = 0; end
	    if kill_G18[data_playername] == nil then kill_G18[data_playername] = 0; end
	   if Death_M1911[data_playername] == nil then Death_M1911[data_playername] = 0; end
	if Headshot_M1911[data_playername] == nil then Headshot_M1911[data_playername] = 0; end
	    if kill_M1911[data_playername] == nil then kill_M1911[data_playername] = 0; end
	   if Death_M9[data_playername] == nil then Death_M9[data_playername] = 0; end
	if Headshot_M9[data_playername] == nil then Headshot_M9[data_playername] = 0; end
	    if kill_M9[data_playername] == nil then kill_M9[data_playername] = 0; end
	   if Death_MP412_REX[data_playername] == nil then Death_MP412_REX[data_playername] = 0; end
	if Headshot_MP412_REX[data_playername] == nil then Headshot_MP412_REX[data_playername] = 0; end
	    if kill_MP412_REX[data_playername] == nil then kill_MP412_REX[data_playername] = 0; end
	   if Death_MP443[data_playername] == nil then Death_MP443[data_playername] = 0; end
	if Headshot_MP443[data_playername] == nil then Headshot_MP443[data_playername] = 0; end
	    if kill_MP443[data_playername] == nil then kill_MP443[data_playername] = 0; end

	setplayervariable5[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables6(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable6[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Recon stuff for "..data_playername)
	end

-- recon gadgets stuff
	   if Death_MAV[data_playername] == nil then Death_MAV[data_playername] = 0; end
	if Headshot_MAV[data_playername] == nil then Headshot_MAV[data_playername] = 0; end
	    if kill_MAV[data_playername] == nil then kill_MAV[data_playername] = 0; end
	   if Death_RADIO_BEACON[data_playername] == nil then Death_RADIO_BEACON[data_playername] = 0; end
	if Headshot_RADIO_BEACON[data_playername] == nil then Headshot_RADIO_BEACON[data_playername] = 0; end
	    if kill_RADIO_BEACON[data_playername] == nil then kill_RADIO_BEACON[data_playername] = 0; end
	   if Death_SOFLAM[data_playername] == nil then Death_SOFLAM[data_playername] = 0; end
	if Headshot_SOFLAM[data_playername] == nil then Headshot_SOFLAM[data_playername] = 0; end
	    if kill_SOFLAM[data_playername] == nil then kill_SOFLAM[data_playername] = 0; end
	   if Death_T_UGS[data_playername] == nil then Death_T_UGS[data_playername] = 0; end
	if Headshot_T_UGS[data_playername] == nil then Headshot_T_UGS[data_playername] = 0; end
	    if kill_T_UGS[data_playername] == nil then kill_T_UGS[data_playername] = 0; end

-- recon weapon stuff
	   if Death_JNG_90[data_playername] == nil then Death_JNG_90[data_playername] = 0; end
	if Headshot_JNG_90[data_playername] == nil then Headshot_JNG_90[data_playername] = 0; end
	    if kill_JNG_90[data_playername] == nil then kill_JNG_90[data_playername] = 0; end
	   if Death_L96[data_playername] == nil then Death_L96[data_playername] = 0; end
	if Headshot_L96[data_playername] == nil then Headshot_L96[data_playername] = 0; end
	    if kill_L96[data_playername] == nil then kill_L96[data_playername] = 0; end
	   if Death_M39_EMR[data_playername] == nil then Death_M39_EMR[data_playername] = 0; end
	if Headshot_M39_EMR[data_playername] == nil then Headshot_M39_EMR[data_playername] = 0; end
	    if kill_M39_EMR[data_playername] == nil then kill_M39_EMR[data_playername] = 0; end
	   if Death_M40A5[data_playername] == nil then Death_M40A5[data_playername] = 0; end
	if Headshot_M40A5[data_playername] == nil then Headshot_M40A5[data_playername] = 0; end
	    if kill_M40A5[data_playername] == nil then kill_M40A5[data_playername] = 0; end
	   if Death_M417[data_playername] == nil then Death_M417[data_playername] = 0; end
	if Headshot_M417[data_playername] == nil then Headshot_M417[data_playername] = 0; end
	    if kill_M417[data_playername] == nil then kill_M417[data_playername] = 0; end
	   if Death_M98B[data_playername] == nil then Death_M98B[data_playername] = 0; end
	if Headshot_M98B[data_playername] == nil then Headshot_M98B[data_playername] = 0; end
	    if kill_M98B[data_playername] == nil then kill_M98B[data_playername] = 0; end
	   if Death_MK11_MOD_0[data_playername] == nil then Death_MK11_MOD_0[data_playername] = 0; end
	if Headshot_MK11_MOD_0[data_playername] == nil then Headshot_MK11_MOD_0[data_playername] = 0; end
	    if kill_MK11_MOD_0[data_playername] == nil then kill_MK11_MOD_0[data_playername] = 0; end
	   if Death_QBU_88[data_playername] == nil then Death_QBU_88[data_playername] = 0; end
	if Headshot_QBU_88[data_playername] == nil then Headshot_QBU_88[data_playername] = 0; end
	    if kill_QBU_88[data_playername] == nil then kill_QBU_88[data_playername] = 0; end
	   if Death_SKS[data_playername] == nil then Death_SKS[data_playername] = 0; end
	if Headshot_SKS[data_playername] == nil then Headshot_SKS[data_playername] = 0; end
	    if kill_SKS[data_playername] == nil then kill_SKS[data_playername] = 0; end
	   if Death_SV98[data_playername] == nil then Death_SV98[data_playername] = 0; end
	if Headshot_SV98[data_playername] == nil then Headshot_SV98[data_playername] = 0; end
	    if kill_SV98[data_playername] == nil then kill_SV98[data_playername] = 0; end
	   if Death_SVD[data_playername] == nil then Death_SVD[data_playername] = 0; end
	if Headshot_SVD[data_playername] == nil then Headshot_SVD[data_playername] = 0; end
	    if kill_SVD[data_playername] == nil then kill_SVD[data_playername] = 0; end

	setplayervariable6[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables7(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable7[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Shotgun stuff for "..data_playername)
	end

-- shotgun stuff
	   if Death_870MCS[data_playername] == nil then Death_870MCS[data_playername] = 0; end
	if Headshot_870MCS[data_playername] == nil then Headshot_870MCS[data_playername] = 0; end
	    if kill_870MCS[data_playername] == nil then kill_870MCS[data_playername] = 0; end
	   if Death_DAO_12[data_playername] == nil then Death_DAO_12[data_playername] = 0; end
	if Headshot_DAO_12[data_playername] == nil then Headshot_DAO_12[data_playername] = 0; end
	    if kill_DAO_12[data_playername] == nil then kill_DAO_12[data_playername] = 0; end
	   if Death_M1014[data_playername] == nil then Death_M1014[data_playername] = 0; end
	if Headshot_M1014[data_playername] == nil then Headshot_M1014[data_playername] = 0; end
	    if kill_M1014[data_playername] == nil then kill_M1014[data_playername] = 0; end
	   if Death_MK3A1[data_playername] == nil then Death_MK3A1[data_playername] = 0; end
	if Headshot_MK3A1[data_playername] == nil then Headshot_MK3A1[data_playername] = 0; end
	    if kill_MK3A1[data_playername] == nil then kill_MK3A1[data_playername] = 0; end
	   if Death_SAIGA_12K[data_playername] == nil then Death_SAIGA_12K[data_playername] = 0; end
	if Headshot_SAIGA_12K[data_playername] == nil then Headshot_SAIGA_12K[data_playername] = 0; end
	    if kill_SAIGA_12K[data_playername] == nil then kill_SAIGA_12K[data_playername] = 0; end
	   if Death_SPAS_12[data_playername] == nil then Death_SPAS_12[data_playername] = 0; end
	if Headshot_SPAS_12[data_playername] == nil then Headshot_SPAS_12[data_playername] = 0; end
	    if kill_SPAS_12[data_playername] == nil then kill_SPAS_12[data_playername] = 0; end
	   if Death_USAS_12[data_playername] == nil then Death_USAS_12[data_playername] = 0; end
	if Headshot_USAS_12[data_playername] == nil then Headshot_USAS_12[data_playername] = 0; end
	    if kill_USAS_12[data_playername] == nil then kill_USAS_12[data_playername] = 0; end

	setplayervariable7[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables8(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable8[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Support stuff for "..data_playername)
	end

-- support gadgets stuff
	   if Death_AMMO_BOX[data_playername] == nil then Death_AMMO_BOX[data_playername] = 0; end
	if Headshot_AMMO_BOX[data_playername] == nil then Headshot_AMMO_BOX[data_playername] = 0; end
	    if kill_AMMO_BOX[data_playername] == nil then kill_AMMO_BOX[data_playername] = 0; end
	   if Death_C4_EXPLOSIVES[data_playername] == nil then Death_C4_EXPLOSIVES[data_playername] = 0; end
	if Headshot_C4_EXPLOSIVES[data_playername] == nil then Headshot_C4_EXPLOSIVES[data_playername] = 0; end
	    if kill_C4_EXPLOSIVES[data_playername] == nil then kill_C4_EXPLOSIVES[data_playername] = 0; end
	   if Death_M18_CLAYMORE[data_playername] == nil then Death_M18_CLAYMORE[data_playername] = 0; end
	if Headshot_M18_CLAYMORE[data_playername] == nil then Headshot_M18_CLAYMORE[data_playername] = 0; end
	    if kill_M18_CLAYMORE[data_playername] == nil then kill_M18_CLAYMORE[data_playername] = 0; end
	   if Death_M224_MORTAR[data_playername] == nil then Death_M224_MORTAR[data_playername] = 0; end
	if Headshot_M224_MORTAR[data_playername] == nil then Headshot_M224_MORTAR[data_playername] = 0; end
	    if kill_M224_MORTAR[data_playername] == nil then kill_M224_MORTAR[data_playername] = 0; end

-- support weapon stuff
	   if Death_L86A2[data_playername] == nil then Death_L86A2[data_playername] = 0; end
	if Headshot_L86A2[data_playername] == nil then Headshot_L86A2[data_playername] = 0; end
	    if kill_L86A2[data_playername] == nil then kill_L86A2[data_playername] = 0; end
	   if Death_LSAT[data_playername] == nil then Death_LSAT[data_playername] = 0; end
	if Headshot_LSAT[data_playername] == nil then Headshot_LSAT[data_playername] = 0; end
	    if kill_LSAT[data_playername] == nil then kill_LSAT[data_playername] = 0; end
	   if Death_M240B[data_playername] == nil then Death_M240B[data_playername] = 0; end
	if Headshot_M240B[data_playername] == nil then Headshot_M240B[data_playername] = 0; end
	    if kill_M240B[data_playername] == nil then kill_M240B[data_playername] = 0; end
	   if Death_M249[data_playername] == nil then Death_M249[data_playername] = 0; end
	if Headshot_M249[data_playername] == nil then Headshot_M249[data_playername] = 0; end
	    if kill_M249[data_playername] == nil then kill_M249[data_playername] = 0; end
	   if Death_M27_IAR[data_playername] == nil then Death_M27_IAR[data_playername] = 0; end
	if Headshot_M27_IAR[data_playername] == nil then Headshot_M27_IAR[data_playername] = 0; end
	    if kill_M27_IAR[data_playername] == nil then kill_M27_IAR[data_playername] = 0; end
	   if Death_M60E4[data_playername] == nil then Death_M60E4[data_playername] = 0; end
	if Headshot_M60E4[data_playername] == nil then Headshot_M60E4[data_playername] = 0; end
	    if kill_M60E4[data_playername] == nil then kill_M60E4[data_playername] = 0; end
	   if Death_MG36[data_playername] == nil then Death_MG36[data_playername] = 0; end
	if Headshot_MG36[data_playername] == nil then Headshot_MG36[data_playername] = 0; end
	    if kill_MG36[data_playername] == nil then kill_MG36[data_playername] = 0; end
	   if Death_PKP_PECHENEG[data_playername] == nil then Death_PKP_PECHENEG[data_playername] = 0; end
	if Headshot_PKP_PECHENEG[data_playername] == nil then Headshot_PKP_PECHENEG[data_playername] = 0; end
	    if kill_PKP_PECHENEG[data_playername] == nil then kill_PKP_PECHENEG[data_playername] = 0; end
	   if Death_QBB_95[data_playername] == nil then Death_QBB_95[data_playername] = 0; end
	if Headshot_QBB_95[data_playername] == nil then Headshot_QBB_95[data_playername] = 0; end
	    if kill_QBB_95[data_playername] == nil then kill_QBB_95[data_playername] = 0; end
	   if Death_RPK_74M[data_playername] == nil then Death_RPK_74M[data_playername] = 0; end
	if Headshot_RPK_74M[data_playername] == nil then Headshot_RPK_74M[data_playername] = 0; end
	    if kill_RPK_74M[data_playername] == nil then kill_RPK_74M[data_playername] = 0; end
	   if Death_TYPE_88_LMG[data_playername] == nil then Death_TYPE_88_LMG[data_playername] = 0; end
	if Headshot_TYPE_88_LMG[data_playername] == nil then Headshot_TYPE_88_LMG[data_playername] = 0; end
	    if kill_TYPE_88_LMG[data_playername] == nil then kill_TYPE_88_LMG[data_playername] = 0; end

	setplayervariable8[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

function setplayervariables9(player, data_playername)

	-- Return if the player has been announced already
	if setplayervariable9[data_playername] then
	return
	end

	if Config.consolespam_variables_msg then
	print ("### Setting Land vehicle stuff for "..data_playername)
	end

-- land vehicle stuff
	   if Death_9K22_TUNGUSKA_M[data_playername] == nil then Death_9K22_TUNGUSKA_M[data_playername] = 0; end
	if Headshot_9K22_TUNGUSKA_M[data_playername] == nil then Headshot_9K22_TUNGUSKA_M[data_playername] = 0; end
	    if kill_9K22_TUNGUSKA_M[data_playername] == nil then kill_9K22_TUNGUSKA_M[data_playername] = 0; end
	   if Death_9M133_KORNET_LAUNCHER[data_playername] == nil then Death_9M133_KORNET_LAUNCHER[data_playername] = 0; end
	if Headshot_9M133_KORNET_LAUNCHER[data_playername] == nil then Headshot_9M133_KORNET_LAUNCHER[data_playername] = 0; end
	    if kill_9M133_KORNET_LAUNCHER[data_playername] == nil then kill_9M133_KORNET_LAUNCHER[data_playername] = 0; end
	   if Death_AAV_7A1_AMTRAC[data_playername] == nil then Death_AAV_7A1_AMTRAC[data_playername] = 0; end
	if Headshot_AAV_7A1_AMTRAC[data_playername] == nil then Headshot_AAV_7A1_AMTRAC[data_playername] = 0; end
	    if kill_AAV_7A1_AMTRAC[data_playername] == nil then kill_AAV_7A1_AMTRAC[data_playername] = 0; end
	   if Death_BARSUK[data_playername] == nil then Death_BARSUK[data_playername] = 0; end
	if Headshot_BARSUK[data_playername] == nil then Headshot_BARSUK[data_playername] = 0; end
	    if kill_BARSUK[data_playername] == nil then kill_BARSUK[data_playername] = 0; end
	   if Death_BM_23[data_playername] == nil then Death_BM_23[data_playername] = 0; end
	if Headshot_BM_23[data_playername] == nil then Headshot_BM_23[data_playername] = 0; end
	    if kill_BM_23[data_playername] == nil then kill_BM_23[data_playername] = 0; end
	   if Death_BMP_2M[data_playername] == nil then Death_BMP_2M[data_playername] = 0; end
	if Headshot_BMP_2M[data_playername] == nil then Headshot_BMP_2M[data_playername] = 0; end
	    if kill_BMP_2M[data_playername] == nil then kill_BMP_2M[data_playername] = 0; end
	   if Death_BTR_90[data_playername] == nil then Death_BTR_90[data_playername] = 0; end
	if Headshot_BTR_90[data_playername] == nil then Headshot_BTR_90[data_playername] = 0; end
	    if kill_BTR_90[data_playername] == nil then kill_BTR_90[data_playername] = 0; end
	   if Death_CENTURION_C_RAM[data_playername] == nil then Death_CENTURION_C_RAM[data_playername] = 0; end
	if Headshot_CENTURION_C_RAM[data_playername] == nil then Headshot_CENTURION_C_RAM[data_playername] = 0; end
	    if kill_CENTURION_C_RAM[data_playername] == nil then kill_CENTURION_C_RAM[data_playername] = 0; end
	   if Death_CIVILIAN_CAR[data_playername] == nil then Death_CIVILIAN_CAR[data_playername] = 0; end
	if Headshot_CIVILIAN_CAR[data_playername] == nil then Headshot_CIVILIAN_CAR[data_playername] = 0; end
	    if kill_CIVILIAN_CAR[data_playername] == nil then kill_CIVILIAN_CAR[data_playername] = 0; end
	   if Death_DELIVERY_VAN[data_playername] == nil then Death_DELIVERY_VAN[data_playername] = 0; end
	if Headshot_DELIVERY_VAN[data_playername] == nil then Headshot_DELIVERY_VAN[data_playername] = 0; end
	    if kill_DELIVERY_VAN[data_playername] == nil then kill_DELIVERY_VAN[data_playername] = 0; end
	   if Death_DIRTBIKE[data_playername] == nil then Death_DIRTBIKE[data_playername] = 0; end
	if Headshot_DIRTBIKE[data_playername] == nil then Headshot_DIRTBIKE[data_playername] = 0; end
	    if kill_DIRTBIKE[data_playername] == nil then kill_DIRTBIKE[data_playername] = 0; end
	   if Death_DPV[data_playername] == nil then Death_DPV[data_playername] = 0; end
	if Headshot_DPV[data_playername] == nil then Headshot_DPV[data_playername] = 0; end
	    if kill_DPV[data_playername] == nil then kill_DPV[data_playername] = 0; end
	   if Death_GAZ_3937_VODNIK[data_playername] == nil then Death_GAZ_3937_VODNIK[data_playername] = 0; end
	if Headshot_GAZ_3937_VODNIK[data_playername] == nil then Headshot_GAZ_3937_VODNIK[data_playername] = 0; end
	    if kill_GAZ_3937_VODNIK[data_playername] == nil then kill_GAZ_3937_VODNIK[data_playername] = 0; end
	   if Death_GROWLER_ITV[data_playername] == nil then Death_GROWLER_ITV[data_playername] = 0; end
	if Headshot_GROWLER_ITV[data_playername] == nil then Headshot_GROWLER_ITV[data_playername] = 0; end
	    if kill_GROWLER_ITV[data_playername] == nil then kill_GROWLER_ITV[data_playername] = 0; end
	   if Death_HMMWV_ASRAD[data_playername] == nil then Death_HMMWV_ASRAD[data_playername] = 0; end
	if Headshot_HMMWV_ASRAD[data_playername] == nil then Headshot_HMMWV_ASRAD[data_playername] = 0; end
	    if kill_HMMWV_ASRAD[data_playername] == nil then kill_HMMWV_ASRAD[data_playername] = 0; end
	   if Death_LAV_25[data_playername] == nil then Death_LAV_25[data_playername] = 0; end
	if Headshot_LAV_25[data_playername] == nil then Headshot_LAV_25[data_playername] = 0; end
	    if kill_LAV_25[data_playername] == nil then kill_LAV_25[data_playername] = 0; end
	   if Death_LAV_AD[data_playername] == nil then Death_LAV_AD[data_playername] = 0; end
	if Headshot_LAV_AD[data_playername] == nil then Headshot_LAV_AD[data_playername] = 0; end
	    if kill_LAV_AD[data_playername] == nil then kill_LAV_AD[data_playername] = 0; end
	   if Death_M1114_HMMWV[data_playername] == nil then Death_M1114_HMMWV[data_playername] = 0; end
	if Headshot_M1114_HMMWV[data_playername] == nil then Headshot_M1114_HMMWV[data_playername] = 0; end
	    if kill_M1114_HMMWV[data_playername] == nil then kill_M1114_HMMWV[data_playername] = 0; end
	   if Death_M1128[data_playername] == nil then Death_M1128[data_playername] = 0; end
	if Headshot_M1128[data_playername] == nil then Headshot_M1128[data_playername] = 0; end
	    if kill_M1128[data_playername] == nil then kill_M1128[data_playername] = 0; end
	   if Death_M142[data_playername] == nil then Death_M142[data_playername] = 0; end
	if Headshot_M142[data_playername] == nil then Headshot_M142[data_playername] = 0; end
	    if kill_M142[data_playername] == nil then kill_M142[data_playername] = 0; end
	   if Death_M1_ABRAMS[data_playername] == nil then Death_M1_ABRAMS[data_playername] = 0; end
	if Headshot_M1_ABRAMS[data_playername] == nil then Headshot_M1_ABRAMS[data_playername] = 0; end
	    if kill_M1_ABRAMS[data_playername] == nil then kill_M1_ABRAMS[data_playername] = 0; end
	   if Death_M220_TOW_LAUNCHER[data_playername] == nil then Death_M220_TOW_LAUNCHER[data_playername] = 0; end
	if Headshot_M220_TOW_LAUNCHER[data_playername] == nil then Headshot_M220_TOW_LAUNCHER[data_playername] = 0; end
	    if kill_M220_TOW_LAUNCHER[data_playername] == nil then kill_M220_TOW_LAUNCHER[data_playername] = 0; end
	   if Death_PANTSIR_S1[data_playername] == nil then Death_PANTSIR_S1[data_playername] = 0; end
	if Headshot_PANTSIR_S1[data_playername] == nil then Headshot_PANTSIR_S1[data_playername] = 0; end
	    if kill_PANTSIR_S1[data_playername] == nil then kill_PANTSIR_S1[data_playername] = 0; end
	   if Death_PHOENIX[data_playername] == nil then Death_PHOENIX[data_playername] = 0; end
	if Headshot_PHOENIX[data_playername] == nil then Headshot_PHOENIX[data_playername] = 0; end
	    if kill_PHOENIX[data_playername] == nil then kill_PHOENIX[data_playername] = 0; end
	   if Death_POLICE_VAN[data_playername] == nil then Death_POLICE_VAN[data_playername] = 0; end
	if Headshot_POLICE_VAN[data_playername] == nil then Headshot_POLICE_VAN[data_playername] = 0; end
	    if kill_POLICE_VAN[data_playername] == nil then kill_POLICE_VAN[data_playername] = 0; end
	   if Death_QUAD_BIKE[data_playername] == nil then Death_QUAD_BIKE[data_playername] = 0; end
	if Headshot_QUAD_BIKE[data_playername] == nil then Headshot_QUAD_BIKE[data_playername] = 0; end
	    if kill_QUAD_BIKE[data_playername] == nil then kill_QUAD_BIKE[data_playername] = 0; end
	   if Death_RHIB_BOAT[data_playername] == nil then Death_RHIB_BOAT[data_playername] = 0; end
	if Headshot_RHIB_BOAT[data_playername] == nil then Headshot_RHIB_BOAT[data_playername] = 0; end
	    if kill_RHIB_BOAT[data_playername] == nil then kill_RHIB_BOAT[data_playername] = 0; end
	   if Death_RHINO[data_playername] == nil then Death_RHINO[data_playername] = 0; end
	if Headshot_RHINO[data_playername] == nil then Headshot_RHINO[data_playername] = 0; end
	    if kill_RHINO[data_playername] == nil then kill_RHINO[data_playername] = 0; end
	   if Death_SKID_LOADER[data_playername] == nil then Death_SKID_LOADER[data_playername] = 0; end
	if Headshot_SKID_LOADER[data_playername] == nil then Headshot_SKID_LOADER[data_playername] = 0; end
	    if kill_SKID_LOADER[data_playername] == nil then kill_SKID_LOADER[data_playername] = 0; end
	   if Death_SPRUT_SD[data_playername] == nil then Death_SPRUT_SD[data_playername] = 0; end
	if Headshot_SPRUT_SD[data_playername] == nil then Headshot_SPRUT_SD[data_playername] = 0; end
	    if kill_SPRUT_SD[data_playername] == nil then kill_SPRUT_SD[data_playername] = 0; end
	   if Death_SUV[data_playername] == nil then Death_SUV[data_playername] = 0; end
	if Headshot_SUV[data_playername] == nil then Headshot_SUV[data_playername] = 0; end
	    if kill_SUV[data_playername] == nil then kill_SUV[data_playername] = 0; end
	   if Death_T_90A[data_playername] == nil then Death_T_90A[data_playername] = 0; end
	if Headshot_T_90A[data_playername] == nil then Headshot_T_90A[data_playername] = 0; end
	    if kill_T_90A[data_playername] == nil then kill_T_90A[data_playername] = 0; end
	   if Death_TECHNICAL_TRUCK[data_playername] == nil then Death_TECHNICAL_TRUCK[data_playername] = 0; end
	if Headshot_TECHNICAL_TRUCK[data_playername] == nil then Headshot_TECHNICAL_TRUCK[data_playername] = 0; end
	    if kill_TECHNICAL_TRUCK[data_playername] == nil then kill_TECHNICAL_TRUCK[data_playername] = 0; end
	   if Death_VDV_Buggy[data_playername] == nil then Death_VDV_Buggy[data_playername] = 0; end
	if Headshot_VDV_Buggy[data_playername] == nil then Headshot_VDV_Buggy[data_playername] = 0; end
	    if kill_VDV_Buggy[data_playername] == nil then kill_VDV_Buggy[data_playername] = 0; end
	   if Death_VODNIK_AA[data_playername] == nil then Death_VODNIK_AA[data_playername] = 0; end
	if Headshot_VODNIK_AA[data_playername] == nil then Headshot_VODNIK_AA[data_playername] = 0; end
	    if kill_VODNIK_AA[data_playername] == nil then kill_VODNIK_AA[data_playername] = 0; end

	setplayervariable9[data_playername] = true

end 

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

return spawn()
