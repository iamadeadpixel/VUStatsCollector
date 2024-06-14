-- Spaghetti code by iamadeadpixel

---@class PUE03_vehicledeathdata
PUE03_vehicledeathdata = class 'PUE03_vehicledeathdata'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
		print("*** PUE03_vehicledeathdata mod loaded ***");
	end
end)


-- Kick in when a player joins the server
s_roundover_starttimer_PUE03 = os.time()
s_roundover_timer_PUE03 = 3

Events:Subscribe('Player:Update', function(player, deltaTime)
	s_roundover_end_timer_PUE03 = os.time()
	s_roundover_elapsed_timer_PUE03 = os.difftime(s_roundover_end_timer_PUE03, s_roundover_starttimer_PUE03)
	s_roundover_elapsed_timer_PUE03 = math.floor(s_roundover_elapsed_timer_PUE03)
	if s_roundover_elapsed_timer_PUE03 >= s_roundover_timer_PUE03 then
		if PUE03_vehicledeathdata == true then
			print(" Reading vehicle deaths from collected tables")

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Air vehicles stuff
			--	tbl_air_vehicles
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_A10_THUNDERBOLT) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_A10_THUNDERBOLT[data_playername]
				s_weapon = "A-10 THUNDERBOLT"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_AH_1Z_VIPER) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_AH_1Z_VIPER[data_playername]
				s_weapon = "AH-1Z VIPER"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_AH_6J_LITTLE_BIRD) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_AH_6J_LITTLE_BIRD[data_playername]
				s_weapon = "AH-6J LITTLE BIRD"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_F_35) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_F_35[data_playername]
				s_weapon = "F-35"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_FA_18E_SUPER_HORNET) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_FA_18E_SUPER_HORNET[data_playername]
				s_weapon = "F/A-18E SUPER HORNET"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_GUNSHIP) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_GUNSHIP[data_playername]
				s_weapon = "GUNSHIP"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_KA_60_KASATKA) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_KA_60_KASATKA[data_playername]
				s_weapon = "KA-60 KASATKA"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_MI_28_HAVOC) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_MI_28_HAVOC[data_playername]
				s_weapon = "MI-28 HAVOC"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_SU_25TM_FROGFOOT) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_SU_25TM_FROGFOOT[data_playername]
				s_weapon = "SU-25TM FROGFOOT"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_SU_35BM_FLANKER_E) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_SU_35BM_FLANKER_E[data_playername]
				s_weapon = "SU-35BM FLANKER-E"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_SU_37) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_SU_37[data_playername]
				s_weapon = "SU-37"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_TV_MISSILE) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_TV_MISSILE[data_playername]
				s_weapon = "TV MISSILE"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_UH_1Y_VENOM) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_UH_1Y_VENOM[data_playername]
				s_weapon = "UH-1Y VENOM"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_Z_11W) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_Z_11W[data_playername]
				s_weapon = "Z-11W"
				s_table = "tbl_air_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------
			--	Land vehicles stuff
			--	tbl_land_vehicles
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_9K22_TUNGUSKA_M) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_9K22_TUNGUSKA_M[data_playername]
				s_weapon = "9K22 TUNGUSKA-M"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_9M133_KORNET_LAUNCHER) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_9M133_KORNET_LAUNCHER[data_playername]
				s_weapon = "9M133 KORNET LAUNCHER"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_AAV_7A1_AMTRAC) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_AAV_7A1_AMTRAC[data_playername]
				s_weapon = "AAV-7A1 AMTRAC"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_BARSUK) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_BARSUK[data_playername]
				s_weapon = "BARSUK"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_BM_23) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_BM_23[data_playername]
				s_weapon = "BM-23"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_BMP_2M) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_BMP_2M[data_playername]
				s_weapon = "BMP-2M"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_BTR_90) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_BTR_90[data_playername]
				s_weapon = "BTR-90"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_CENTURION_C_RAM) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_CENTURION_C_RAM[data_playername]
				s_weapon = "CENTURION C-RAM"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_CIVILIAN_CAR) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_CIVILIAN_CAR[data_playername]
				s_weapon = "CIVILIAN CAR"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_DELIVERY_VAN) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_DELIVERY_VAN[data_playername]
				s_weapon = "DELIVERY VAN"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_DIRTBIKE) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_DIRTBIKE[data_playername]
				s_weapon = "DIRTBIKE"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_DIRTBIKE) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_DIRTBIKE[data_playername]
				s_weapon = "DIRTBIKE"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_DPV) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_DPV[data_playername]
				s_weapon = "DPV"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_GAZ_3937_VODNIK) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_GAZ_3937_VODNIK[data_playername]
				s_weapon = "GAZ-3937 VODNIK"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_GROWLER_ITV) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_GROWLER_ITV[data_playername]
				s_weapon = "GROWLER ITV"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_HMMWV_ASRAD) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_HMMWV_ASRAD[data_playername]
				s_weapon = "HMMWV ASRAD"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_LAV_25) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_LAV_25[data_playername]
				s_weapon = "LAV-25"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_LAV_AD) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_LAV_AD[data_playername]
				s_weapon = "LAV-AD"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_M1_ABRAMS) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_M1_ABRAMS[data_playername]
				s_weapon = "M1 ABRAMS"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_M1114_HMMWV) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_M1114_HMMWV[data_playername]
				s_weapon = "M1114 HMMWV"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_M1128) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_M1128[data_playername]
				s_weapon = "M1128"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_M142) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_M142[data_playername]
				s_weapon = "M142"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_M220_TOW_LAUNCHER) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_M220_TOW_LAUNCHER[data_playername]
				s_weapon = "M220 TOW LAUNCHER"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_PANTSIR_S1) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_PANTSIR_S1[data_playername]
				s_weapon = "PANTSIR-S1"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_PHOENIX) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_PHOENIX[data_playername]
				s_weapon = "PHOENIX"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_POLICE_VAN) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_POLICE_VAN[data_playername]
				s_weapon = "POLICE VAN"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_QUAD_BIKE) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_POLICE_VAN[data_playername]
				s_weapon = "QUAD BIKE"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_RHIB_BOAT) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_RHIB_BOAT[data_playername]
				s_weapon = "RHIB BOAT"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_RHINO) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_RHINO[data_playername]
				s_weapon = "RHINO"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_SKID_LOADER) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_SKID_LOADER[data_playername]
				s_weapon = "SKID LOADER"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_SPRUT_SD) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_SPRUT_SD[data_playername]
				s_weapon = "SPRUT-SD"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_SUV) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_SUV[data_playername]
				s_weapon = "SUV"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_T_90A) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_T_90A[data_playername]
				s_weapon = "T-90A"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_TECHNICAL_TRUCK) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_TECHNICAL_TRUCK[data_playername]
				s_weapon = "TECHNICAL TRUCK"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_VDV_Buggy) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_VDV_Buggy[data_playername]
				s_weapon = "VDV Buggy"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end
			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			for data_playername, count_deaths in pairs(death_VODNIK_AA) do
				;
				global_deaths = global_deaths + count_deaths
				r_deathdata = death_VODNIK_AA[data_playername]
				s_weapon = "VODNIK AA"
				s_table = "tbl_land_vehicles"
				s1 = "(1):Update only"
				s2 = "(2):player found"
				s3 = "(3):No entries"
				--
				print("")
				if global_deaths >= 1 then
					print("Found player " ..data_playername .. " in DEATH table, with the " .. s_weapon .. " - Deaths:" .. r_deathdata)
					global_deaths = 0
				end

				do
					updateweapondeathstats(player, data_playername)
				end
			end

			-- --------------------------------------------------
			-- --------------------------------------------------
			-- --------------------------------------------------

			PUE04_playerstats = true
			if PUE04_playerstats == true then
				print("")
				print("** Starting 5th event**")
				print("")
			end

			PUE03_vehicledeathdata = false -- ensure it prints one time only
		end

		s_roundover_starttimer_PUE03 = os.time()
	end
end)
-- end of the player:update event stuff

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------

-- Here we do some function calls

function updateweapondeathstats(player, data_playername)
	WeaponResults = SQL:Query(
		'SELECT Weaponname, Soldiername FROM ' .. s_table .. ' WHERE Soldiername = ? and Weaponname = ?', data_playername,s_weapon)
	if not WeaponResults then
		print('Failed to read "..s_table.." DEATH query: ' .. SQL:Error()); return
	end

	for victim, data in pairs(WeaponResults) do
		founddata_Soldiername = data["Soldiername"]
		founddata_Weaponname = data["Weaponname"]
	end

	-- New player stuff
	if founddata_Soldiername ~= data_playername and founddata_Weaponname ~= s_weapon then
		print(s3 .. " - Inserting " .. data_playername .. " with " .. r_deathdata .. " deaths in " .. s_table)
		s_Query = 'INSERT INTO ' .. s_table .. '    (Weaponname,    Soldiername,   Kills,    Deaths) VALUES (?,?,?,?)'
		if not SQL:Query(s_Query, s_weapon, data_playername, 0, r_deathdata) then
			print('(3):No entries - Failed to insert kill data in "..s_table..": ' .. SQL:Error())
			return
		end
		print(s3 .. " - Done inserting " .. data_playername)
	else
		-- Updating existing playerdata
		if founddata_Soldiername == data_playername and founddata_Weaponname == s_weapon then
			print(s1 .. " - Kill data for Soldier " .. data_playername .." found with weapon " .. s_weapon .. " in " .. s_table)
			if not SQL:Query('UPDATE ' .. s_table .. ' SET Deaths=Deaths+? WHERE Soldiername = ? and Weaponname = ?', r_deathdata, data_playername, s_weapon) then
				print('(1):Update only - Failed to update kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s1 .. " - Done updating " .. data_playername)
		else
			-- player exists, but not with the specified weapon, so we insert it
			s_Query = 'INSERT INTO ' .. s_table ..'    (Weaponname,    Soldiername,   Kills,    Deaths) VALUES (?,?,?,?)'
			if not SQL:Query(s_Query, s_weapon, data_playername, 0, r_deathdata) then
				print('Failed to insert kill data in "..s_table..": ' .. SQL:Error())
				return
			end
			print(s2 .. " - not weapon: Done inserting " .. data_playername)
		end
	end
end -- End of function call

return PUE03_vehicledeathdata()
