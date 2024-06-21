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
--	self.m_updateCheck = require 'updateCheck'  -- Not recomended to use at this moment, it is messing up with stuff in playerjoins.lua file

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
	self.m_PlayerKilled = require 'PlayerKilled'

	self.m_Roundover = require 'Roundover'

	self.m_PUE00_playerrounddata = require 'PUE00_playerrounddata'
--	self.m_PUE01_mapstats = require 'PUE01_mapstats'
--	self.m_PUE02_vehiclekilldata = require 'PUE02_vehiclekilldata'

--	self.m_PUE04_playerstats = require 'PUE04_playerstats'
--	self.m_PUE05_weaponkillstats = require 'PUE05_weaponkillstats'

	self.m_ChatCommands = require('ChatCommands') -- pull stats on command,ugly setup, but works
	self.m_spawn = require 'spawn'             -- play spawn sql stuff
	self.m_Revives = require('Revives')        -- Player revives SQL stuff


	-- table stuff that counts kills
	-- Assault Gadgets / Weapons
	self.m_Gadget_assault = require('/Assault/Gadget_assault')
	self.m_Weapons_assault = require('/Assault/Weapons_assault')

	-- Engineer Gadgets / Weapons
	self.m_Gadget_engineer = require('/Engineer/Gadget_engineer')
	self.m_engineer_weapons = require('/Engineer/engineer_weapons')

	-- Support Gadgets / Weapons
	self.m_Gadget_support = require('/Support/Gadget_support')
	self.m_Weapons_support = require('/Support/Weapons_support')

	-- Recon Gadgets / Weapons
	self.m_Gadget_recon = require('/Recon/Gadget_recon')
	self.m_Weapons_recon = require('/Recon/Weapons_recon')

	-- Common weapons
	self.m_weapons_Common = require('/Common/weapons_Common')

	-- Shotgun weapons
	self.m_weapons_Shotguns = require('/Shotguns/weapons_Shotguns')

	-- handguns weapons
	self.m_handguns_weapons = require('/handguns/handguns_weapons')

	-- Air_Vehicles
	self.m_Air_Vehicles = require('/Vehicles/Air_Vehicles')

	-- Land_Vehicles
	self.m_Land_Vehicles = require('/Vehicles/Land_Vehicles')

	-- auxiliary (knife/M67/crossbow)
	self.m_weapons_auxiliary = require('/auxiliary/weapons_auxiliary')
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
