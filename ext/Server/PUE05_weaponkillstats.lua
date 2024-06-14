-- Spaghetti code by iamadeadpixel

---@class PUE05_weaponkillstats
PUE05_weaponkillstats = class 'PUE05_weaponkillstats'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PUE05_weaponkillstats mod loaded ***");
	end
end)


-- Kick in when a player joins the server
s_roundover_starttimer_PUE05 = os.time()
s_roundover_timer_PUE05 = 3

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE05 = os.time()
	s_roundover_elapsed_timer_PUE05 = os.difftime(s_roundover_end_timer_PUE05, s_roundover_starttimer_PUE05)
	s_roundover_elapsed_timer_PUE05 = math.floor(s_roundover_elapsed_timer_PUE05)
	if s_roundover_elapsed_timer_PUE05 >= s_roundover_timer_PUE05 then
		if PUE05_weaponkillstats == true then
			print(" Reading weapon kills from collected tables")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	auxiliary weapon stuff
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_XBOW) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_XBOW[data_playername]
				s_weapon = "XBOW"
				s_table = "tbl_auxiliary_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_KNIFE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_KNIFE[data_playername]
				s_weapon = "KNIFE"
				s_table = "tbl_auxiliary_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M67_GRENADE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M67_GRENADE[data_playername]
				s_weapon = "M67 GRENADE"
				s_table = "tbl_auxiliary_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_P90) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_P90[data_playername]
				s_weapon = "P90"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AS_VAL) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_AS_VAL[data_playername]
				s_weapon = "AS VAL"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M5K) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M5K[data_playername]
				s_weapon = "M5K"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MP7) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MP7[data_playername]
				s_weapon = "MP7"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PDW_R) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_PDW_R[data_playername]
				s_weapon = "PDW-R"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PP_19) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_PP_19[data_playername]
				s_weapon = "PP-19"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PP_2000) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_PP_2000[data_playername]
				s_weapon = "PP-2000"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_UMP_45) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_UMP_45[data_playername]
				s_weapon = "UMP-45"
				s_table = "tbl_primary_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_44_MAGNUM) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_44_MAGNUM[data_playername]
				s_weapon = ".44 MAGNUM"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_93R) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_93R[data_playername]
				s_weapon = "93R"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G17C) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_G17C[data_playername]
				s_weapon = "G17C"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G18) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_G18[data_playername]
				s_weapon = "G18"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M1911) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M1911[data_playername]
				s_weapon = "M1911"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M9) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M9[data_playername]
				s_weapon = "M9"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MP443) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MP443[data_playername]
				s_weapon = "MP443"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MP412_REX) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MP412_REX[data_playername]
				s_weapon = "MP412 REX"
				s_table = "tbl_handguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_870MCS) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_870MCS[data_playername]
				s_weapon = "870 MCS"
				s_table = "tbl_shotguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_DAO_12) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_DAO_12[data_playername]
				s_weapon = "DAO-12"
				s_table = "tbl_shotguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M1014) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M1014[data_playername]
				s_weapon = "M1014"
				s_table = "tbl_shotguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MK3A1) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MK3A1[data_playername]
				s_weapon = "MK3A1"
				s_table = "tbl_shotguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SAIGA_12K) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SAIGA_12K[data_playername]
				s_weapon = "SAIGA 12K"
				s_table = "tbl_shotguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SPAS_12) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SPAS_12[data_playername]
				s_weapon = "SPAS-12"
				s_table = "tbl_shotguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_USAS_12) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_USAS_12[data_playername]
				s_weapon = "USAS-12"
				s_table = "tbl_shotguns_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_DEFIBRILLATOR) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_DEFIBRILLATOR[data_playername]
				s_weapon = "DEFIBRILLATOR"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_BUCK) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_GP_30_BUCK[data_playername]
				s_weapon = "GP-30 BUCK"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_DART) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_GP_30_DART[data_playername]
				s_weapon = "GP-30 DART"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_HE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_GP_30_HE[data_playername]
				s_weapon = "GP-30 HE"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_LVG) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_GP_30_LVG[data_playername]
				s_weapon = "GP-30 LVG"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_GP_30_SMOKE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_GP_30_SMOKE[data_playername]
				s_weapon = "GP-30 SMOKE"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_DART) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M26_DART[data_playername]
				s_weapon = "M26 DART"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_FRAG) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M26_FRAG[data_playername]
				s_weapon = "M26 FRAG"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_MASS) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M26_MASS[data_playername]
				s_weapon = "M26 MASS"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M26_SLUG) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M26_SLUG[data_playername]
				s_weapon = "M26 SLUG"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_BUCK) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M320_BUCK[data_playername]
				s_weapon = "M320 BUCK"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_HE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M320_HE[data_playername]
				s_weapon = "M320 HE"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_LVG) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M320_LVG[data_playername]
				s_weapon = "M320 LVG"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M320_SMOKE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M320_SMOKE[data_playername]
				s_weapon = "M320 SMOKE"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MEDIC_KIT) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MEDIC_KIT[data_playername]
				s_weapon = "MEDIC KIT"
				s_table = "tbl_assault_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_AEK_971) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_AEK_971[data_playername]
				s_weapon = "AEK-971"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AK_74M) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_AK_74M[data_playername]
				s_weapon = "AK-74M"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AN_94) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_AN_94[data_playername]
				s_weapon = "AN-94"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AUG_A3) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_AUG_A3[data_playername]
				s_weapon = "AUG A3"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_F2000) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_F2000[data_playername]
				s_weapon = "F2000"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_FAMAS) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_FAMAS[data_playername]
				s_weapon = "FAMAS"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G3A3) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_G3A3[data_playername]
				s_weapon = "G3A3"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_KH2002) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_KH2002[data_playername]
				s_weapon = "KH2002"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_L85A2) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_L85A2[data_playername]
				s_weapon = "L85A2"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M16A3) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M16A3[data_playername]
				s_weapon = "M16A3"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M16A4) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M16A4[data_playername]
				s_weapon = "M16A4"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M416) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M416[data_playername]
				s_weapon = "M416"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SCAR_L) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SCAR_L[data_playername]
				s_weapon = "SCAR-L"
				s_table = "tbl_assault_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_EOD_BOT) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_EOD_BOT[data_playername]
				s_weapon = "EOD BOT"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_FGM_148_JAVELIN) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_FGM_148_JAVELIN[data_playername]
				s_weapon = "FGM-148 JAVELIN"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_FIM_92_STINGER) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_FIM_92_STINGER[data_playername]
				s_weapon = "FIM-92 STINGER"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M15_AT_MINE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M15_AT_MINE[data_playername]
				s_weapon = "M15 AT MINE"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_REPAIR_TOOL) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_REPAIR_TOOL[data_playername]
				s_weapon = "REPAIR TOOL"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RPG_7V2) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_RPG_7V2[data_playername]
				s_weapon = "RPG-7V2"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SA_18_IGLA) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SA_18_IGLA[data_playername]
				s_weapon = "SA-18 IGLA"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SMAW) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SMAW[data_playername]
				s_weapon = "SMAW"
				s_table = "tbl_engineer_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_A_91) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_A_91[data_playername]
				s_weapon = "A-91"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_ACW_R) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_ACW_R[data_playername]
				s_weapon = "ACW-R"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AKS_74u) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_AKS_74u[data_playername]
				s_weapon = "AKS-74u"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G36C) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_G36C[data_playername]
				s_weapon = "G36C"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_G53) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_G53[data_playername]
				s_weapon = "G53"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M4) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M4[data_playername]
				s_weapon = "M4"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M4A1) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M4A1[data_playername]
				s_weapon = "M4A1"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MTAR_21) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MTAR_21[data_playername]
				s_weapon = "MTAR-21"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_QBZ_95B) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_QBZ_95B[data_playername]
				s_weapon = "QBZ-95B"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SCAR_H) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SCAR_H[data_playername]
				s_weapon = "SCAR-H"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SG553) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SG553[data_playername]
				s_weapon = "SG553"
				s_table = "tbl_engineer_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_M224_MORTAR) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M224_MORTAR[data_playername]
				s_weapon = "M224 MORTAR"
				s_table = "tbl_support_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_AMMO_BOX) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_AMMO_BOX[data_playername]
				s_weapon = "AMMO BOX"
				s_table = "tbl_support_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_C4_EXPLOSIVES) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_C4_EXPLOSIVES[data_playername]
				s_weapon = "C4 EXPLOSIVES"
				s_table = "tbl_support_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M18_CLAYMORE) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M18_CLAYMORE[data_playername]
				s_weapon = "M18 CLAYMORE"
				s_table = "tbl_support_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_L86A2) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_L86A2[data_playername]
				s_weapon = "L86A2"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_LSAT) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_LSAT[data_playername]
				s_weapon = "LSAT"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M240B) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M240B[data_playername]
				s_weapon = "M240B"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M249) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M249[data_playername]
				s_weapon = "M249"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M27_IAR) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M27_IAR[data_playername]
				s_weapon = "M27 IAR"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M60E4) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M60E4[data_playername]
				s_weapon = "M60E4"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MG36) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MG36[data_playername]
				s_weapon = "MG36"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_PKP_PECHENEG) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_PKP_PECHENEG[data_playername]
				s_weapon = "PKP PECHENEG"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_QBB_95) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_QBB_95[data_playername]
				s_weapon = "QBB-95"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RPK_74M) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_RPK_74M[data_playername]
				s_weapon = "RPK-74M"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_TYPE_88_LMG) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_TYPE_88_LMG[data_playername]
				s_weapon = "TYPE 88 LMG"
				s_table = "tbl_support_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_MAV) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MAV[data_playername]
				s_weapon = "MAV"
				s_table = "tbl_recon_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_RADIO_BEACON) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_RADIO_BEACON[data_playername]
				s_weapon = "RADIO BEACON"
				s_table = "tbl_recon_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SOFLAM) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SOFLAM[data_playername]
				s_weapon = "SOFLAM"
				s_table = "tbl_recon_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_T_UGS) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_T_UGS[data_playername]
				s_weapon = "T-UGS"
				s_table = "tbl_recon_gadgets"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
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

			for data_playername, count_kills in pairs(kill_JNG_90) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_JNG_90[data_playername]
				s_weapon = "JNG-90"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_L96) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_L96[data_playername]
				s_weapon = "L96"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M39_EMR) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M39_EMR[data_playername]
				s_weapon = "M39 EMR"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M40A5) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M40A5[data_playername]
				s_weapon = "M40A5"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M417) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M417[data_playername]
				s_weapon = "M417"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_M98B) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_M98B[data_playername]
				s_weapon = "M98B"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_MK11_MOD_0) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_MK11_MOD_0[data_playername]
				s_weapon = "MK11 MOD 0"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_QBU_88) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_QBU_88[data_playername]
				s_weapon = "QBU-88"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SKS) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SKS[data_playername]
				s_weapon = "SKS"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SV98) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SV98[data_playername]
				s_weapon = "SV98"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_kills in pairs(kill_SVD) do
				;
				global_kills = global_kills + count_kills
				r_killdata = kill_SVD[data_playername]
				s_weapon = "SVD"
				s_table = "tbl_recon_weapons"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_kills >= 1 then
					print("Found player " ..data_playername .. " in KILL table, with the " .. s_weapon .. " - Kills:" .. r_killdata)
					global_kills = 0
				end

				do
					updateweaponkillstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			PUE06_weapondeathstats = true
			if PUE06_weapondeathstats == true then
				print("")
				print("** Starting 7th event**")
				print("")
			end

			PUE05_weaponkillstats = false -- ensure it prints one time only
		end

		s_roundover_starttimer_PUE05 = os.time()
	end
end)
-- end of the player:update event stuff

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we do some function calls

function updateweaponkillstats(player, data_playername)
	WeaponResults = SQL:Query(
		'SELECT Weaponname, Soldiername FROM ' .. s_table .. ' WHERE Soldiername = ? and Weaponname = ?', data_playername,s_weapon)
	if not WeaponResults then
		print('Failed to read "..s_table.." KILL query: ' .. SQL:Error()); return
	end

	for killer, data in pairs(WeaponResults) do
		founddata_Soldiername = data["Soldiername"]
		founddata_Weaponname = data["Weaponname"]
	end

	-- New player stuff
	if founddata_Soldiername ~= data_playername and founddata_Weaponname ~= s_weapon then
		print(s3 .. " - Inserting " .. data_playername .. " with " .. r_killdata .. " kills in " .. s_table)
		s_Query = 'INSERT INTO ' .. s_table ..'    (Weaponname,    Soldiername,       Kills,     Deaths) VALUES (?,?,?,?)'
		if not SQL:Query(s_Query, s_weapon, data_playername, r_killdata, 0) then
			print('(3):No entries - Failed to insert kill data in "..s_table..": ' .. SQL:Error())
			return
		end
		print(s3 .. " - Done inserting " .. data_playername)
	else
		-- Updating existing playerdata
		if founddata_Soldiername == data_playername and founddata_Weaponname == s_weapon then
			print(s1 .. " - Kill data for Soldier " .. data_playername .." found with weapon " .. s_weapon .. " in " .. s_table)
			if not SQL:Query('UPDATE ' .. s_table .. ' SET Kills=Kills+? WHERE Soldiername = ? and Weaponname = ?', r_killdata, data_playername, s_weapon) then
				print('(1):Update only - Failed to update kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s1 .. " - Done updating " .. data_playername)
		else
			-- player exists, but not with the specified weapon, so we insert it
			s_Query = 'INSERT INTO ' ..s_table .. '    (Weaponname,    Soldiername,       Kills,     Deaths) VALUES (?,?,?,?)'
			if not SQL:Query(s_Query, s_weapon, data_playername, r_killdata, 0) then
				print('Failed to insert kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s2 .. " - not weapon: Done inserting " .. data_playername)
		end
	end
end -- End of function call

return PUE05_weaponkillstats()
