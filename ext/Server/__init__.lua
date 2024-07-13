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

	self.m_LevelPrint = require 'LevelPrint'        -- (Working code)
	self.m_Weapons_Tables = require 'Weapons_Tables' -- (Working code)
	self.m_Vehicles_Tables = require 'Vehicles_Tables' -- (Working code)

	self.m_PlayerLeaves = require 'PlayerLeaves'
	self.m_PlayerJoins = require 'PlayerJoins'

	self.m_Score = require 'Score'
	self.m_DatabaseSetup = require 'DatabaseSetup'
	self.m_TableSetup = require 'TableSetup'
	self.m_TableSetup_weapons = require 'TableSetup_weapons'
	self.m_TableSetup_vehicles = require 'TableSetup_vehicles'
	self.m_SqlTableSetup = require 'SqlTableSetup'

	self.m_PlayerKilled = require 'PlayerKilled'
	self.m_DumpData = require 'DumpData'
	self.m_functioncall = require 'functioncall'


	self.m_Roundover = require 'Roundover'
	self.m_PUE00_playerrounddata = require 'PUE00_playerrounddata'
	self.m_ChatCommands = require('ChatCommands') -- pull stats on command,ugly setup, but works
	self.m_spawn = require 'spawn'             -- play spawn sql stuff
	self.m_Revives = require('Revives')        -- Player revives SQL stuff


-- All data now in one file...
	self.m_All_vehicles_and_weapons = require('All_vehicles_and_weapons')
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

StatsCollector()
