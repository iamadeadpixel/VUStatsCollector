Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Config loaded ***");
	end
	end
end)

-- Here you can turn on, or off modules.
Config = {
	humansonly = false, -- true = Only humans are logged / false = includes bots in logging.
	consolespam = false, -- if true, the console wil spam all messages (this will increase log file)
	consolespam_chat = false, -- if true, the commands typed to get the stats are not shown in the console
	consolespam_section1 = false, -- if true, the console wil spam all  tbl_playerdata messages
	consolespam_section2 = false, -- if true, the console wil spam all tbl_serverstats messages
	consolespam_section3 = false, -- if true, the console wil spam all tbl_mapstats messages
	consolespam_section4 = true, -- if true, the console wil spam all tbl_playerstats messages
	consolespam_section5 = true, -- if true, the console wil spam all Weapon / Vehicle kill messages
	consolespam_section6 = false, -- if true, the console wil spam all tbl_mcom messages
	consolespam_section7 = false, -- if true, the console wil spam all accuracy stuff messages
	consolespam_section8 = true, -- if true, the console wil spam all Weapon / Vehicle death messages
	consolespam_section9 = true, -- if true, the console wil spam all Weapon / Vehicle headshot messages

--[[
This stuff is not yet used.
	consolespam_section10 = true, -- if true, the console wil spam all 
]]

	consolespam_spawn_msg = false, -- if true, the console wil spam all spawn info about bots messages
	consolespam_variables_msg = false, -- if true, the console wil spam all variable config messages

	consolespam_killstreak_msg = false, -- if true, the console wil spam all killstreak / Deathstreak messages
	consolespam_killstreak = false, -- if true, the console wil spam all killstreak / Deathstreak messages
	consolespam_base = false, -- if true, the console wil spam all base kill/death/revives etc,etc messages
	consolespam_hook01 = false, -- if true, the console wil spam all shots and hits messages
	consolespam_playerstatsstuff = false, -- if true, the console wil spam all SQL messages related to player SQL stuff stuff
	consolespam_killtable = false, -- if true, the console wil spam all SQL messages related to weapon/vehicle stuff
	consolespam_mcomtable = false, -- if true, the console wil spam all SQL messages related to M-com stuff
	consolespam_mcomevent = false, -- if true, the console wil spam all M-com event messages
	consolespam_join = false, -- if true, the console wil spam all Join messages
	consolespam_leaves = false, -- if true, the console wil spam all leaves messages
	consolespam_header = false, -- if true, the console wil spam header info on mapload..

	consolespam_common1 = false, -- if true, the console wil spam common weapon kills in the console
	consolespam_roadkill1 = false, -- if true, the console wil spam roadkill kills in the console
	consolespam_shotguns1 = false, -- if true, the console wil spam Shotgun kills in the console
	consolespam_handguns1 = false, -- if true, the console wil spam Handgun kills in the console
	consolespam_airvehicles1 = false, -- if true, the console wil spam air vehicle  kills in the console
	consolespam_landvehicles1 = false, -- if true, the console wil spam Land vehicles kills in the console
	consolespam_assault_gadgets1 = false, -- if true, the console wil spam Assault gadget kills in the console
	consolespam_assault_weapons1 = false, -- if true, the console wil spam Assault weapon kills in the console
	consolespam_engineer_gadgets1 = false, -- if true, the console wil spam Engineer gadget kills in the console
	consolespam_engineer_weapons1 = false, -- if true, the console wil spam Engineer weapon kills in the console
	consolespam_recon_gadgets1 = false, -- if true, the console wil spam Recon gadget kills in the console
	consolespam_recon_weapons1 = false, -- if true, the console wil spam Recon weapon kills in the console
	consolespam_support_gadgets1 = false, -- if true, the console wil spam support gadget kills in the console
	consolespam_support_weapons1 = false, -- if true, the console wil spam Support weapon kills in the console

	consolespam_common2 = false, -- if true, the console wil spam common weapon kills in the console
	consolespam_roadkill2 = false, -- if true, the console wil spam roadkill kills in the console
	consolespam_shotguns2 = false, -- if true, the console wil spam Shotgun kills in the console
	consolespam_handguns2 = false, -- if true, the console wil spam Handgun kills in the console
	consolespam_airvehicles2 = false, -- if true, the console wil spam air vehicle  kills in the console
	consolespam_landvehicles2 = false, -- if true, the console wil spam Land vehicles kills in the console
	consolespam_assault_gadgets2 = false, -- if true, the console wil spam Assault gadget kills in the console
	consolespam_assault_weapons2 = false, -- if true, the console wil spam Assault weapon kills in the console
	consolespam_engineer_gadgets2 = false, -- if true, the console wil spam Engineer gadget kills in the console
	consolespam_engineer_weapons2 = false, -- if true, the console wil spam Engineer weapon kills in the console
	consolespam_recon_gadgets2 = false, -- if true, the console wil spam Recon gadget kills in the console
	consolespam_recon_weapons2 = false, -- if true, the console wil spam Recon weapon kills in the console
	consolespam_support_gadgets2 = false, -- if true, the console wil spam support gadget kills in the console
	consolespam_support_weapons2 = false, -- if true, the console wil spam Support weapon kills in the console

	consolespam_common3 = false, -- if true, the console wil spam common weapon kills in the console
	consolespam_roadkill3 = false, -- if true, the console wil spam roadkill kills in the console
	consolespam_shotguns3 = false, -- if true, the console wil spam Shotgun kills in the console
	consolespam_handguns3 = false, -- if true, the console wil spam Handgun kills in the console
	consolespam_airvehicles3 = false, -- if true, the console wil spam air vehicle  kills in the console
	consolespam_landvehicles3 = false, -- if true, the console wil spam Land vehicles kills in the console
	consolespam_assault_gadgets3 = false, -- if true, the console wil spam Assault gadget kills in the console
	consolespam_assault_weapons3 = false, -- if true, the console wil spam Assault weapon kills in the console
	consolespam_engineer_gadgets3 = false, -- if true, the console wil spam Engineer gadget kills in the console
	consolespam_engineer_weapons3 = false, -- if true, the console wil spam Engineer weapon kills in the console
	consolespam_recon_gadgets3 = false, -- if true, the console wil spam Recon gadget kills in the console
	consolespam_recon_weapons3 = false, -- if true, the console wil spam Recon weapon kills in the console
	consolespam_support_gadgets3 = false, -- if true, the console wil spam support gadget kills in the console
	consolespam_support_weapons3 = false, -- if true, the console wil spam Support weapon kills in the console

	consolespam_common4 = false, -- if true, the console wil spam common weapon kills in the console
	consolespam_roadkill4 = false, -- if true, the console wil spam roadkill kills in the console
	consolespam_shotguns4 = false, -- if true, the console wil spam Shotgun kills in the console
	consolespam_handguns4 = false, -- if true, the console wil spam Handgun kills in the console
	consolespam_airvehicles4 = false, -- if true, the console wil spam air vehicle  kills in the console
	consolespam_landvehicles4 = false, -- if true, the console wil spam Land vehicles kills in the console
	consolespam_assault_gadgets4 = false, -- if true, the console wil spam Assault gadget kills in the console
	consolespam_assault_weapons4 = false, -- if true, the console wil spam Assault weapon kills in the console
	consolespam_engineer_gadgets4 = false, -- if true, the console wil spam Engineer gadget kills in the console
	consolespam_engineer_weapons4 = false, -- if true, the console wil spam Engineer weapon kills in the console
	consolespam_recon_gadgets4 = false, -- if true, the console wil spam Recon gadget kills in the console
	consolespam_recon_weapons4 = false, -- if true, the console wil spam Recon weapon kills in the console
	consolespam_support_gadgets4 = false, -- if true, the console wil spam support gadget kills in the console
	consolespam_support_weapons4 = false, -- if true, the console wil spam Support weapon kills in the console

	consolespam_common5 = false, -- if true, the console wil spam common weapon kills in the console
	consolespam_roadkill5 = false, -- if true, the console wil spam roadkill kills in the console
	consolespam_shotguns5 = false, -- if true, the console wil spam Shotgun kills in the console
	consolespam_handguns5 = false, -- if true, the console wil spam Handgun kills in the console
	consolespam_airvehicles5 = false, -- if true, the console wil spam air vehicle  kills in the console
	consolespam_landvehicles5 = false, -- if true, the console wil spam Land vehicles kills in the console
	consolespam_assault_gadgets5 = false, -- if true, the console wil spam Assault gadget kills in the console
	consolespam_assault_weapons5 = false, -- if true, the console wil spam Assault weapon kills in the console
	consolespam_engineer_gadgets5 = false, -- if true, the console wil spam Engineer gadget kills in the console
	consolespam_engineer_weapons5 = false, -- if true, the console wil spam Engineer weapon kills in the console
	consolespam_recon_gadgets5 = false, -- if true, the console wil spam Recon gadget kills in the console
	consolespam_recon_weapons5 = false, -- if true, the console wil spam Recon weapon kills in the console
	consolespam_support_gadgets5 = false, -- if true, the console wil spam support gadget kills in the console
	consolespam_support_weapons5 = false, -- if true, the console wil spam Support weapon kills in the console

	consolespam_common_msg = false, -- if true, the console wil spam common weapon kills in the console
	consolespam_roadkill_msg = false, -- if true, the console wil spam roadkill kills in the console
	consolespam_shotguns_msg = false, -- if true, the console wil spam Shotgun kills in the console
	consolespam_handguns_msg = false, -- if true, the console wil spam Handgun kills in the console
	consolespam_airvehicles_msg = false, -- if true, the console wil spam air vehicle  kills in the console
	consolespam_landvehicles_msg = false, -- if true, the console wil spam Land vehicles kills in the console
	consolespam_assault_gadgets_msg = false, -- if true, the console wil spam Assault gadget kills in the console
	consolespam_assault_weapons_msg = false, -- if true, the console wil spam Assault weapon kills in the console
	consolespam_engineer_gadgets_msg = false, -- if true, the console wil spam Engineer gadget kills in the console
	consolespam_engineer_weapons_msg = false, -- if true, the console wil spam Engineer weapon kills in the console
	consolespam_recon_gadgets_msg = false, -- if true, the console wil spam Recon gadget kills in the console
	consolespam_recon_weapons_msg = false, -- if true, the console wil spam Recon weapon kills in the console
	consolespam_support_gadgets_msg = false, -- if true, the console wil spam support gadget kills in the console
	consolespam_support_weapons_msg = false -- if true, the console wil spam Support weapon kills in the console

}

return Config
