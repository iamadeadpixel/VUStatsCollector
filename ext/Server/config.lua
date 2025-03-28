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
	consolespam_section4 = false, -- if true, the console wil spam all tbl_playerstats messages
	consolespam_section5 = false, -- if true, the console wil spam all Weapon / Vehicle kill messages
	consolespam_section6 = false, -- if true, the console wil spam all tbl_mcom messages
	consolespam_killtable = false, -- if true, the console wil spam all SQL messages related to weapon/vehicle stuff
	consolespam_mcomtable = false, -- if true, the console wil spam all SQL messages related to M-com stuff
	consolespam_mcomevent = false, -- if true, the console wil spam all M-com event messages
	consolespam_join = false, -- if true, the console wil spam all Join messages
	consolespam_leaves = false, -- if true, the console wil spam all leaves messages
	consolespam_header = false, -- if true, the console wil spam header info on mapload..

	consolespam_common = false, -- if true, the console wil spam header info on common weapons
	consolespam_roadkill = false, -- if true, the console wil spam 
	consolespam_shotguns = false, -- if true, the console wil spam 
	consolespam_handguns = false, -- if true, the console wil spam 
	consolespam_airvehicles = false, -- if true, the console wil spam 
	consolespam_landvehicles = false, -- if true, the console wil spam 
	consolespam_assault_gadgets = false, -- if true, the console wil spam 
	consolespam_assault_weapons = false, -- if true, the console wil spam 
	consolespam_engineer_gadgets = false, -- if true, the console wil spam 
	consolespam_engineer_weapons = false, -- if true, the console wil spam 
	consolespam_recon_gadgets = false, -- if true, the console wil spam 
	consolespam_recon_weapons = false, -- if true, the console wil spam 
	consolespam_support_gadgets = false, -- if true, the console wil spam 
	consolespam_support_weapons = false -- if true, the console wil spam 



}

return Config
