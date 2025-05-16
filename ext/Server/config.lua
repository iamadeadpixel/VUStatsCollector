
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
	consolespam_functioncalls = true,
	consolespam_functioncallskills = true,
	consolespam_functioncalls_msg = true,
--[[
if true, function.lua will be called.
This is used in PUE00_playerrounddata.lua
]]
-- ----
	consolespam_spawn_msg = false,
--[[
if true, the console wil spam all spawn info about bots messages
This is used in spawn.lua
]]
-- ----
	consolespam_score_msg = false,
	consolespam_score2_msg = false, -- (experimental, aka, work in progress)
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
 ]]
-- ----
	consolespam_base = false,
--[[
if true, the console wil spam all base kill/death/headshot/teamkill messages
Used in Collect_base_data.lua
]]
-- ----
	consolespam_mcomevent = true,
--[[
if true, the console wil spam all M-com event messages (Armed/Disarmed/Destroyed)
Used in Collect_mcom_data.lua
]]
-- ----
	consolespam_common1 = false,
	consolespam_common2 = false,
	consolespam_common3 = false,
	consolespam_common4 = false,
	consolespam_common5 = false,
	consolespam_common_msg = true,
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
	consolespam_roadkill_msg = true,
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
	consolespam_shotguns_msg = true,
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
	consolespam_handguns_msg = true,
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
	consolespam_airvehicles_msg = true,
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
	consolespam_landvehicles_msg = true,
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
	consolespam_assault_gadgets_msg = true,
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
	consolespam_assault_weapons_msg = true,
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
	consolespam_engineer_gadgets_msg = true,
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
	consolespam_engineer_weapons_msg = true,
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
	consolespam_recon_gadgets_msg = true,
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
	consolespam_recon_weapons_msg = true,
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
	consolespam_support_gadgets_msg = true,
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
	consolespam_support_weapons_msg = true
--[[
if true, the console wil spam Support weapon kills in the console
Should be turned off normaly, use for debug stuff
Ex for consolespam_support_weapons_msg 
Used in Collect_support_weapons_data.lua
]]
-- ----



}

return Config
