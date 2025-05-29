
Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** Config loaded ***");
	end
	end
end)

-- Here you can turn on, or off modules.
Config = {
	humansonly = false,
--[[
true = Only humans are logged / false = includes bots in logging.
]]
-- ----



		consolespam_chat = false,
--[[
if true, the commands typed to get the stats are not shown in the console
This is used in ChatCommands.lua
]]
-- ----



	consolespam_header = false,
--[[
if true, the console wil spam header info on mapload..
This is used in any lua file
]]
-- ----



--[[
Under normal operations: this should be true, ex for the _msg statement, that is optional.
]]
	consolespam_functioncalls = true,
	consolespam_functioncalls_msg = false,
	consolespam_functioncalls_sql = true,
--[[
if true, function.lua will be called.
This is used in PUE00_playerrounddata.lua
Remark: if consolespam_functioncalls is false, it ends all further output
Remark: if consolespam_functioncalls_msg is true, the console spams all kill message (Massive log increase)
Remark: if consolespam_functioncalls_sql is false, no SQL data is written, it still spams the kill message (if _msg is true)
        This is for the updateweaponstats(player, data_playername) call only
]]
-- ----



	consolespam_spawn_msg = false,
--[[
if true, the console wil spam all spawn info about bots messages
This is used in spawn.lua
]]
-- ----



	consolespam_score_msg = false,
--	consolespam_score2_msg = false, -- (experimental, aka, work in progress)
--[[
if true, the console wil spam all score data in the console
This is used in Score.lua
]]
-- ----



--[[
	consolespam_variables_msg = false, -- if true, the console wil spam all variable config messages
Removed: Not used any more for now
]]
-- ----



	consolespam_newplayerjoins_msg = true,
--[[
if true, the console wil spam all new player joins
Adviced to set to true
This is used in PlayerJoins.lua
 ]]
-- ----



	consolespam_spambullitdata = false,
--[[
if true, the console wil spam all shots and hits messages
This is used in /Shared/__init__.lua
This is used in Pewpew.lua -- workin progress, not in use..
 ]]
-- ----



	consolespam_base = false,
--[[
if true, the console wil spam all base kill/death/headshot/teamkill messages
Used in Collect_base_data.lua
]]
-- ----



	consolespam_mcomevent = false,
--[[
if true, the console wil spam all M-com event messages (Armed/Disarmed/Destroyed)
Used in Collect_mcom_data.lua
]]
-- ----



	consolespam_dogtag1 = false,
	consolespam_dogtag2 = false,
	consolespam_dogtag3 = false,
	consolespam_dogtag4 = false,
	consolespam_dogtag5 = false,
	consolespam_dogtag_msg = false,
--[[
if true, the console wil spam dogtag SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_dogtag_msg
Used in Collect_dogtag_data.lua
]]
-- ----



	consolespam_headshot1 = false,
	consolespam_headshot2 = false,
	consolespam_headshot3 = false,
	consolespam_headshot4 = false,
	consolespam_headshot5 = false,
	consolespam_headshot_msg = false,
--[[
if true, the console wil spam headshot SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_headshot_msg
Used in Collect_headshot_data.lua
]]
-- ----



	consolespam_revives1 = false,
	consolespam_revives2 = false,
	consolespam_revives3 = false,
	consolespam_revives4 = false,
	consolespam_revives5 = false,
	consolespam_revives_msg = false,
--[[
if true, the console wil spam revives SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_revives_msg
Used in Collect_revives_data.lua
]]
-- ----



	consolespam_teamkill1 = false,
	consolespam_teamkill2 = false,
	consolespam_teamkill3 = false,
	consolespam_teamkill4 = false,
	consolespam_teamkill5 = false,
	consolespam_teamkill_msg = false,
--[[
if true, the console wil spam teamkill SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_teamkill_msg
Used in Collect_teamkill_data.lua
]]
-- ----



	consolespam_common1 = false,
	consolespam_common2 = false,
	consolespam_common3 = false,
	consolespam_common4 = false,
	consolespam_common5 = false,
	consolespam_common_msg = false,
--[[
if true, the console wil spam common weapon kill SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_common_msg
Used in Collect_common_data.lua
]]
-- ----



	consolespam_roadkill1 = false,
	consolespam_roadkill2 = false,
	consolespam_roadkill3 = false,
	consolespam_roadkill4 = false,
	consolespam_roadkill5 = false,
	consolespam_roadkill_msg = false,
--[[
if true, the console wil spam roadkill kill SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_roadkill_msg 
Used in Collect_roadkill_data.lua
]]
-- ----



	consolespam_shotguns1 = false,
	consolespam_shotguns2 = false,
	consolespam_shotguns3 = false,
	consolespam_shotguns4 = false,
	consolespam_shotguns5 = false,
	consolespam_shotguns_msg = false,
--[[
if true, the console wil spam Shotgun kill SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_shotguns_msg 
Used in Collect_shotguns_data.lua
]]
-- ----



	consolespam_handguns1 = false,
	consolespam_handguns2 = false,
	consolespam_handguns3 = false,
	consolespam_handguns4 = false,
	consolespam_handguns5 = false,
	consolespam_handguns_msg = false,
--[[
if true, the console wil spam Handgun kill SQL data in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_handguns_msg 
Used in Collect_handgun_data.lua
]]
-- ----



	consolespam_airvehicles1 = false,
	consolespam_airvehicles2 = false,
	consolespam_airvehicles3 = false,
	consolespam_airvehicles4 = false,
	consolespam_airvehicles5 = false,
	consolespam_airvehicles_msg = false,
--[[
if true, the console wil spam air vehicle  kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_airvehicles_msg 
Used in Collect_airvehicle_data.lua
]]
-- ----



	consolespam_landvehicles1 = false,
	consolespam_landvehicles2 = false,
	consolespam_landvehicles3 = false,
	consolespam_landvehicles4 = false,
	consolespam_landvehicles5 = false,
	consolespam_landvehicles_msg = false,
--[[
if true, the console wil spam Land vehicles kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_landvehicles_msg 
Used in Collect_landvehicle_data.lua
]]
-- ----



	consolespam_assault_gadgets1 = false,
	consolespam_assault_gadgets2 = false,
	consolespam_assault_gadgets3 = false,
	consolespam_assault_gadgets4 = false,
	consolespam_assault_gadgets5 = false,
	consolespam_assault_gadgets_msg = false,
--[[
if true, the console wil spam Assault gadget kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_assault_gadgets_msg 
Used in Collect_assault_gadgets_data.lua
]]
-- ----



	consolespam_assault_weapons1 = false,
	consolespam_assault_weapons2 = false,
	consolespam_assault_weapons3 = false,
	consolespam_assault_weapons4 = false,
	consolespam_assault_weapons5 = false,
	consolespam_assault_weapons_msg = false,
--[[
if true, the console wil spam Assault weapon kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_assault_weapons_msg 
Used in Collect_assault_weapons_data.lua
]]
-- ----



	consolespam_engineer_gadgets1 = false,
	consolespam_engineer_gadgets2 = false,
	consolespam_engineer_gadgets3 = false,
	consolespam_engineer_gadgets4 = false,
	consolespam_engineer_gadgets5 = false,
	consolespam_engineer_gadgets_msg = false,
--[[
if true, the console wil spam Engineer gadget kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_engineer_gadgets_msg 
Used in Collect_engineer_gadgets_data.lua
]]
-- ----



	consolespam_engineer_weapons1 = false,
	consolespam_engineer_weapons2 = false,
	consolespam_engineer_weapons3 = false,
	consolespam_engineer_weapons4 = false,
	consolespam_engineer_weapons5 = false,
	consolespam_engineer_weapons_msg = false,
--[[
if true, the console wil spam Engineer weapon kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_engineer_weapons_msg 
Used in Collect_engineer_weapons_data.lua
]]
-- ----



	consolespam_recon_gadgets1 = false,
	consolespam_recon_gadgets2 = false,
	consolespam_recon_gadgets3 = false,
	consolespam_recon_gadgets4 = false,
	consolespam_recon_gadgets5 = false,
	consolespam_recon_gadgets_msg = false,
--[[
if true, the console wil spam Recon gadget kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_recon_gadgets_msg 
Used in Collect_recon_gadgets_data.lua
]]
-- ----



	consolespam_recon_weapons1 = false,
	consolespam_recon_weapons2 = false,
	consolespam_recon_weapons3 = false,
	consolespam_recon_weapons4 = false,
	consolespam_recon_weapons5 = false,
	consolespam_recon_weapons_msg = false,
--[[
if true, the console wil spam Recon weapon kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_recon_weapons_msg 
Used in Collect_recon_weapons_data.lua
]]
-- ----



	consolespam_support_gadgets1 = false,
	consolespam_support_gadgets2 = false,
	consolespam_support_gadgets3 = false,
	consolespam_support_gadgets4 = false,
	consolespam_support_gadgets5 = false,
	consolespam_support_gadgets_msg = false,
--[[
if true, the console wil spam support gadget kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_support_gadgets_msg 
Used in Collect_support_gadgets_data.lua
]]
-- ----



	consolespam_support_weapons1 = false,
	consolespam_support_weapons2 = false,
	consolespam_support_weapons3 = false,
	consolespam_support_weapons4 = false,
	consolespam_support_weapons5 = false,
	consolespam_support_weapons_msg = false
--[[
if true, the console wil spam Support weapon kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_support_weapons_msg 
Used in Collect_support_weapons_data.lua
]]
-- ----



}

return Config
