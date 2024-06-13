-- Spaghetti code by iamadeadpixel

---@class PUE06_weapondeathstats
PUE06_weapondeathstats = class 'PUE06_weapondeathstats'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	print("*** PUE06_weapondeathstats mod loaded ***"); 
	end
end)


-- Kick in when a player joins the server
	s_roundover_starttimer_PUE06 = os.time()
	s_roundover_timer_PUE06 = 3

	Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE06 = os.time()
	s_roundover_elapsed_timer_PUE06 = os.difftime(s_roundover_end_timer_PUE06, s_roundover_starttimer_PUE06)
	s_roundover_elapsed_timer_PUE06 = math.floor(s_roundover_elapsed_timer_PUE06)
	if s_roundover_elapsed_timer_PUE06 >= s_roundover_timer_PUE06 then

if PUE06_weapondeathstats == true then 

	print (" Reading weapon deaths from collected tables")

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	auxiliary weapon stuff
--	tbl_auxiliary_gadgets
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_XBOW) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_XBOW[data_playername]
	s_weapon = "XBOW"
	s_table = "tbl_auxiliary_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_KNIFE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_KNIFE[data_playername]
	s_weapon = "KNIFE"
	s_table = "tbl_auxiliary_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M67_GRENADE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M67_GRENADE[data_playername]
	s_weapon = "M67 GRENADE"
	s_table = "tbl_auxiliary_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Common weapon stuff
--	tbl_primary_weapons
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_P90) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_P90[data_playername]
	s_weapon = "P90"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_AS_VAL) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_AS_VAL[data_playername]
	s_weapon = "AS VAL"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M5K) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M5K[data_playername]
	s_weapon = "M5K"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MP7) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MP7[data_playername]
	s_weapon = "MP7"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_PDW_R) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_PDW_R[data_playername]
	s_weapon = "PDW-R"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_PP_19) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_PP_19[data_playername]
	s_weapon = "PP-19"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_PP_2000) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_PP_2000[data_playername]
	s_weapon = "PP-2000"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_UMP_45) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_UMP_45[data_playername]
	s_weapon = "UMP-45"
	s_table = "tbl_primary_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Handguns stuff
--	tbl_handguns_weapons
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_44_MAGNUM) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_44_MAGNUM[data_playername]
	s_weapon = ".44 MAGNUM"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_93R) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_93R[data_playername]
	s_weapon = "93R"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_G17C) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_G17C[data_playername]
	s_weapon = "G17C"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_G18) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_G18[data_playername]
	s_weapon = "G18"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M1911) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M1911[data_playername]
	s_weapon = "M1911"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M9) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M9[data_playername]
	s_weapon = "M9"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MP443) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MP443[data_playername]
	s_weapon = "MP443"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MP412_REX) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MP412_REX[data_playername]
	s_weapon = "MP412 REX"
	s_table = "tbl_handguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Shotgun stuff
--	tbl_shotguns_weapons
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_870MCS) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_870MCS[data_playername]
	s_weapon = "870 MCS"
	s_table = "tbl_shotguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_DAO_12) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_DAO_12[data_playername]
	s_weapon = "DAO-12"
	s_table = "tbl_shotguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M1014) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M1014[data_playername]
	s_weapon = "M1014"
	s_table = "tbl_shotguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MK3A1) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MK3A1[data_playername]
	s_weapon = "MK3A1"
	s_table = "tbl_shotguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SAIGA_12K) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SAIGA_12K[data_playername]
	s_weapon = "SAIGA 12K"
	s_table = "tbl_shotguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SPAS_12) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SPAS_12[data_playername]
	s_weapon = "SPAS-12"
	s_table = "tbl_shotguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_USAS_12) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_USAS_12[data_playername]
	s_weapon = "USAS-12"
	s_table = "tbl_shotguns_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Assault gadget stuff
--	tbl_assault_gadgets
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_DEFIBRILLATOR) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_DEFIBRILLATOR[data_playername]
	s_weapon = "DEFIBRILLATOR"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_GP_30_BUCK) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_GP_30_BUCK[data_playername]
	s_weapon = "GP-30 BUCK"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_GP_30_DART) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_GP_30_DART[data_playername]
	s_weapon = "GP-30 DART"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_GP_30_HE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_GP_30_HE[data_playername]
	s_weapon = "GP-30 HE"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_GP_30_LVG) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_GP_30_LVG[data_playername]
	s_weapon = "GP-30 LVG"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_GP_30_SMOKE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_GP_30_SMOKE[data_playername]
	s_weapon = "GP-30 SMOKE"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M26_DART) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M26_DART[data_playername]
	s_weapon = "M26 DART"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M26_FRAG) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M26_FRAG[data_playername]
	s_weapon = "M26 FRAG"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M26_MASS) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M26_MASS[data_playername]
	s_weapon = "M26 MASS"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M26_SLUG) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M26_SLUG[data_playername]
	s_weapon = "M26 SLUG"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M320_BUCK) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M320_BUCK[data_playername]
	s_weapon = "M320 BUCK"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M320_HE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M320_HE[data_playername]
	s_weapon = "M320 HE"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M320_LVG) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M320_LVG[data_playername]
	s_weapon = "M320 LVG"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M320_SMOKE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M320_SMOKE[data_playername]
	s_weapon = "M320 SMOKE"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MEDIC_KIT) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MEDIC_KIT[data_playername]
	s_weapon = "MEDIC KIT"
	s_table = "tbl_assault_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Assault Weapons stuff
--	tbl_assault_weapons
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_AEK_971) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_AEK_971[data_playername]
	s_weapon = "AEK-971"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_AK_74M) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_AK_74M[data_playername]
	s_weapon = "AK-74M"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_AN_94) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_AN_94[data_playername]
	s_weapon = "AN-94"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_AUG_A3) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_AUG_A3[data_playername]
	s_weapon = "AUG A3"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_F2000) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_F2000[data_playername]
	s_weapon = "F2000"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_FAMAS) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_FAMAS[data_playername]
	s_weapon = "FAMAS"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_G3A3) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_G3A3[data_playername]
	s_weapon = "G3A3"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_KH2002) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_KH2002[data_playername]
	s_weapon = "KH2002"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_L85A2) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_L85A2[data_playername]
	s_weapon = "L85A2"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M16A3) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M16A3[data_playername]
	s_weapon = "M16A3"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M16A4) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M16A4[data_playername]
	s_weapon = "M16A4"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M416) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M416[data_playername]
	s_weapon = "M416"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SCAR_L) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SCAR_L[data_playername]
	s_weapon = "SCAR-L"
	s_table = "tbl_assault_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Engineer gadgets stuff
--	tbl_engineer_gadgets
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_EOD_BOT) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_EOD_BOT[data_playername]
	s_weapon = "EOD BOT"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_FGM_148_JAVELIN) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_FGM_148_JAVELIN[data_playername]
	s_weapon = "FGM-148 JAVELIN"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_FIM_92_STINGER) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_FIM_92_STINGER[data_playername]
	s_weapon = "FIM-92 STINGER"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M15_AT_MINE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M15_AT_MINE[data_playername]
	s_weapon = "M15 AT MINE"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_REPAIR_TOOL) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_REPAIR_TOOL[data_playername]
	s_weapon = "REPAIR TOOL"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_RPG_7V2) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_RPG_7V2[data_playername]
	s_weapon = "RPG-7V2"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SA_18_IGLA) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SA_18_IGLA[data_playername]
	s_weapon = "SA-18 IGLA"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SMAW) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SMAW[data_playername]
	s_weapon = "SMAW"
	s_table = "tbl_engineer_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Engineer Weapons stuff
--	tbl_engineer_weapons
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_A_91) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_A_91[data_playername]
	s_weapon = "A-91"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_ACW_R) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_ACW_R[data_playername]
	s_weapon = "ACW-R"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_AKS_74u) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_AKS_74u[data_playername]
	s_weapon = "AKS-74u"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_G36C) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_G36C[data_playername]
	s_weapon = "G36C"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_G53) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_G53[data_playername]
	s_weapon = "G53"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M4) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M4[data_playername]
	s_weapon = "M4"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M4A1) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M4A1[data_playername]
	s_weapon = "M4A1"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MTAR_21) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MTAR_21[data_playername]
	s_weapon = "MTAR-21"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_QBZ_95B) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_QBZ_95B[data_playername]
	s_weapon = "QBZ-95B"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SCAR_H) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SCAR_H[data_playername]
	s_weapon = "SCAR-H"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SG553) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SG553[data_playername]
	s_weapon = "SG553"
	s_table = "tbl_engineer_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Support gadgets stuff
--	tbl_support_gadgets
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M224_MORTAR) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M224_MORTAR[data_playername]
	s_weapon = "M224 MORTAR"
	s_table = "tbl_support_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_AMMO_BOX) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_AMMO_BOX[data_playername]
	s_weapon = "AMMO BOX"
	s_table = "tbl_support_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_C4_EXPLOSIVES) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_C4_EXPLOSIVES[data_playername]
	s_weapon = "C4 EXPLOSIVES"
	s_table = "tbl_support_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M18_CLAYMORE) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M18_CLAYMORE[data_playername]
	s_weapon = "M18 CLAYMORE"
	s_table = "tbl_support_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Support Weapons stuff
--	tbl_support_weapons
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_L86A2) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_L86A2[data_playername]
	s_weapon = "L86A2"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_LSAT) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_LSAT[data_playername]
	s_weapon = "LSAT"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M240B) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M240B[data_playername]
	s_weapon = "M240B"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M249) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M249[data_playername]
	s_weapon = "M249"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M27_IAR) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M27_IAR[data_playername]
	s_weapon = "M27 IAR"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M60E4) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M60E4[data_playername]
	s_weapon = "M60E4"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MG36) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MG36[data_playername]
	s_weapon = "MG36"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_PKP_PECHENEG) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_PKP_PECHENEG[data_playername]
	s_weapon = "PKP PECHENEG"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_QBB_95) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_QBB_95[data_playername]
	s_weapon = "QBB-95"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_RPK_74M) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_RPK_74M[data_playername]
	s_weapon = "RPK-74M"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_TYPE_88_LMG) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_TYPE_88_LMG[data_playername]
	s_weapon = "TYPE 88 LMG"
	s_table = "tbl_support_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Recon gadgets stuff
--	tbl_recon_gadgets
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MAV) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MAV[data_playername]
	s_weapon = "MAV"
	s_table = "tbl_recon_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_RADIO_BEACON) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_RADIO_BEACON[data_playername]
	s_weapon = "RADIO BEACON"
	s_table = "tbl_recon_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SOFLAM) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SOFLAM[data_playername]
	s_weapon = "SOFLAM"
	s_table = "tbl_recon_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_T_UGS) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_T_UGS[data_playername]
	s_weapon = "T-UGS"
	s_table = "tbl_recon_gadgets"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
--	Recon Weapons stuff
--	tbl_recon_weapons
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_JNG_90) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_JNG_90[data_playername]
	s_weapon = "JNG-90"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_L96) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_L96[data_playername]
	s_weapon = "L96"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M39_EMR) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M39_EMR[data_playername]
	s_weapon = "M39 EMR"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M40A5) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M40A5[data_playername]
	s_weapon = "M40A5"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M417) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M417[data_playername]
	s_weapon = "M417"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_M98B) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_M98B[data_playername]
	s_weapon = "M98B"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_MK11_MOD_0) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_MK11_MOD_0[data_playername]
	s_weapon = "MK11 MOD 0"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_QBU_88) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_QBU_88[data_playername]
	s_weapon = "QBU-88"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SKS) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SKS[data_playername]
	s_weapon = "SKS"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SV98) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SV98[data_playername]
	s_weapon = "SV98"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

    for data_playername, count_deaths in pairs(death_SVD) do ;
	global_deaths = global_deaths + count_deaths
	r_deathdata = death_SVD[data_playername]
	s_weapon = "SVD"
	s_table = "tbl_recon_weapons"
	s1 = "(1):Update only"
	s2 = "(2):player found"
	s3 = "(3):No entries"
--
	print ("") 
	if global_deaths >= 1 then print ("Found player "..data_playername.." in DEATH table, with the "..s_weapon.." - Deaths:"..r_deathdata)
		global_deaths = 0
		end

	do updateweapondeathstats(player,data_playername)
	end

end
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

























-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

--	PUE07_roadkillkilldata = true -- Disabled till i get a proper fix
	if PUE07_roadkillkilldata == true then
	print ("")
	print ("** Starting the 8th event **")
	print ("")
	end

	PUE06_weapondeathstats = false -- ensure it prints one time only
	end

	s_roundover_starttimer_PUE06 = os.time()
	end
end)
-- end of the player:update event stuff

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we do some function calls

	function updateweapondeathstats(player,data_playername)
	WeaponResults = SQL:Query('SELECT Weaponname, Soldiername FROM '..s_table..' WHERE Soldiername = ? and Weaponname = ?', data_playername, s_weapon)
      if not WeaponResults then print('Failed to read "..s_table.." DEATH query: ' .. SQL:Error()) ; return end

		for victim, data in pairs(WeaponResults) do
			founddata_Soldiername = data["Soldiername"]
			founddata_Weaponname = data["Weaponname"]
	end

-- New player stuff
	if founddata_Soldiername ~= data_playername and founddata_Weaponname ~= s_weapon then print (s3.." - Inserting "..data_playername.." with "..r_deathdata.." deaths in "..s_table)
	    s_Query = 'INSERT INTO '..s_table..'    (Weaponname,    Soldiername,   Kills,    Deaths) VALUES (?,?,?,?)'
			if not SQL:Query(s_Query,     s_weapon,   data_playername,   0,    r_deathdata) then
	print('(3):No entries - Failed to insert kill data in "..s_table..": ' .. SQL:Error()) return end
		print (s3.." - Done inserting "..data_playername)

    else

-- Updating existing playerdata
	if founddata_Soldiername == data_playername and founddata_Weaponname == s_weapon then print (s1.." - Kill data for Soldier "..data_playername.." found with weapon "..s_weapon.." in "..s_table)
 	if not SQL:Query('UPDATE '..s_table..' SET Deaths=Deaths+? WHERE Soldiername = ? and Weaponname = ?',  r_deathdata,data_playername,s_weapon) then
	print('(1):Update only - Failed to update kill data in "..s_table..": ' .. SQL:Error()) return end
		print (s1.." - Done updating "..data_playername)

	else

-- player exists, but not with the specified weapon, so we insert it
	    s_Query = 'INSERT INTO '..s_table..'    (Weaponname,    Soldiername,   Kills,    Deaths) VALUES (?,?,?,?)'
			if not SQL:Query(s_Query,     s_weapon,   data_playername,   0,    r_deathdata) then
	print('Failed to insert kill data in "..s_table..": ' .. SQL:Error()) return end
		print (s2.." - not weapon: Done inserting "..data_playername)
end
end

	end -- End of function call

return PUE06_weapondeathstats()

