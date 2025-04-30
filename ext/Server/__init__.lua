---@class StatsCollector
StatsCollector = class 'StatsCollector'

 
function StatsCollector:__init()
	Events:Subscribe('Extension:Loaded', self, self.OnExtensionLoaded)
end


function StatsCollector:OnExtensionLoaded()
	print("Initializing StatsCollector")
	self.m_HotReloadTimer = 0
	self.m_IsHotReload = self:GetIsHotReload()
	self:RegisterEvents()
end

function StatsCollector:RegisterEvents()
	Events:Subscribe('Engine:Init', self, self.OnEngineInit)
	Events:Subscribe('Level:Destroy', self, self.OnLevelDestroy)
end

function StatsCollector:OnEngineInit()
-- Experimental, Reserved for, eh, what ever i want to do with it..

	self.m_config = require 'config'

	self.m_LevelPrint = require 'LevelPrint'
	self.m_DatabaseSetup = require 'DatabaseSetup'
	self.m_TableSetup = require 'TableSetup'
	self.m_TableSetup_weapons = require 'TableSetup_weapons'
	self.m_TableSetup_vehicles = require 'TableSetup_vehicles'

--[[
Not sure if this is used.................
Se we disable it for now

	self.m_SqlTableSetup = require 'SqlTableSetup'
]]
	self.m_Weapons_Tables = require 'Weapons_Tables'
	self.m_Vehicles_Tables = require 'Vehicles_Tables'

	self.m_PlayerLeaves = require 'PlayerLeaves'
	self.m_PlayerJoins = require 'PlayerJoins'
	self.m_PlayerCheck = require 'PlayerCheck'
	self.m_Score = require 'Score'
	self.m_Roundover = require 'Roundover'
	self.m_PUE00_playerrounddata = require 'PUE00_playerrounddata'
	self.m_ChatCommands = require('ChatCommands') -- pull stats on command,ugly setup, but works
	self.m_spawn = require 'spawn'             -- not needed under normal conditions, information only...
	self.m_Revives = require('Revives')

--[[
Here set all kill data per class
]]


	self.m_Collect_killstreak_data = require('Collect_killstreak_data')
	self.m_Collect_base_data = require('Collect_base_data')
	self.m_Collect_roadkill_data = require('Collect_roadkill_data')
	self.m_Collect_mcom_data = require('Collect_mcom_data')
	self.m_Collect_common_data = require('Collect_common_data')
	self.m_Collect_airvehicle_data = require('Collect_airvehicle_data')
	self.m_Collect_landvehicle_data = require('Collect_landvehicle_data')
	self.m_Collect_shotguns_data = require('Collect_shotguns_data')
	self.m_Collect_handgun_data = require('Collect_handgun_data')

	self.m_Collect_assault_weapons_data = require('Collect_assault_weapons_data')
	self.m_Collect_engineer_weapons_data = require('Collect_engineer_weapons_data')
	self.m_Collect_support_weapons_data = require('Collect_support_weapons_data')
	self.m_Collect_recon_weapons_data = require('Collect_recon_weapons_data')

	self.m_Collect_assault_gadgets_data = require('Collect_assault_gadgets_data')
	self.m_Collect_engineer_gadgets_data = require('Collect_engineer_gadgets_data')
	self.m_Collect_support_gadgets_data = require('Collect_support_gadgets_data')
	self.m_Collect_recon_gadgets_data = require('Collect_recon_gadgets_data')
end


function StatsCollector:OnLevelDestroy()
	print("********* data whiped on level destroy *********");

	local s_OldMemory = math.floor(collectgarbage("count") / 1024)
	collectgarbage('collect')
	print("*Collecting Garbage on Level Destroy: " ..
	math.floor(collectgarbage("count") / 1024) .. " MB | Old Memory: " .. s_OldMemory .. " MB")
end

function StatsCollector:GetIsHotReload()
	if #SharedUtils:GetContentPackages() == 0 then
		return false
	else
		return true
	end
end

-- -----------------------------

StatsCollector()
