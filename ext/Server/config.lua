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
	consolespam = true, -- if true, the console wil spam all messages (this will increase log file)
	consolespam_chat = false, -- if true, the commands typed to get the stats are not shown in the console
	consolespam_section1 = true, -- if true, the console wil spam all  tbl_playerdata messages
	consolespam_section2 = true, -- if true, the console wil spam all tbl_serverstats messages
	consolespam_section3 = true, -- if true, the console wil spam all tbl_mapstats messages
	consolespam_section4 = true, -- if true, the console wil spam all tbl_playerstats messages
	consolespam_section5 = true, -- if true, the console wil spam all Weapon / Vehicle kill messages
	consolespam_section6 = true, -- if true, the console wil spam all tbl_mcom messages
	consolespam_killtable = true, -- if true, the console wil spam all SQL messages related to weapon/vehicle stuff
	consolespam_mcomtable = true, -- if true, the console wil spam all SQL messages related to M-com stuff
	consolespam_mcomevent = true, -- if true, the console wil spam all M-com event messages
	consolespam_join = false, -- if true, the console wil spam all Join messages
	consolespam_leaves = false, -- if true, the console wil spam all leaves messages
	consolespam_header = false, -- if true, the console wil spam header info on mapload..

	consolespam_common = true, -- if true, the console wil spam common weapon kills in the console
	consolespam_roadkill = true, -- if true, the console wil spam roadkill kills in the console
	consolespam_shotguns = true, -- if true, the console wil spam Shotgun kills in the console
	consolespam_handguns = true, -- if true, the console wil spam Handgun kills in the console
	consolespam_airvehicles = true, -- if true, the console wil spam air vehicle  kills in the console
	consolespam_landvehicles = true, -- if true, the console wil spam Land vehicles kills in the console
	consolespam_assault_gadgets = true, -- if true, the console wil spam Assault gadget kills in the console
	consolespam_assault_weapons = true, -- if true, the console wil spam Assault weapon kills in the console
	consolespam_engineer_gadgets = true, -- if true, the console wil spam Engineer gadget kills in the console
	consolespam_engineer_weapons = true, -- if true, the console wil spam Engineer weapon kills in the console
	consolespam_recon_gadgets = true, -- if true, the console wil spam Recon gadget kills in the console
	consolespam_recon_weapons = true, -- if true, the console wil spam Recon weapon kills in the console
	consolespam_support_gadgets = true, -- if true, the console wil spam support gadget kills in the console
	consolespam_support_weapons = true -- if true, the console wil spam Support weapon kills in the console



}

return Config
