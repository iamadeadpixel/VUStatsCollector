--[[
Spaghetti code by iamadeadpixel
Original mod: VU Stats by Doc
Revamped by iamadeadpixel as intergration for statscollector
Test version..

]]

---@class accuracy
accuracy = class 'accuracy'

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.consolespam_header then
		print("*** accuracy stuff loaded R2a ***");

	end
	end

--	playershot = {}
--	playerhit = {}
--	s_InstanceIds = {}

end)

-- -----------------------

function Round(num, dp)
    local mult = 10^(dp or 0)
    return math.floor(num * mult + 0.5)/mult
end

-- -----------------------

Hooks:Install('BulletEntity:Collision', 1, function(p_HookCtx, p_Entity, p_Hit, p_Shooter)
	if Config.humansonly then -- true = Only humans are logged / false = includes bots in logging.
	if getnamehuman[p_Shooter.giver.name] ~= p_Shooter.giver.name then return end
	end

	if p_Shooter == nil  then
		return
	end

	if s_InstanceIds[p_Entity.instanceId] == nil then
	if playershot[p_Shooter.giver.name] == nil then playershot[p_Shooter.giver.name] = 0 ; end
	playershot[p_Shooter.giver.name] = playershot[p_Shooter.giver.name] + 1
	server_acc_shot = server_acc_shot + 1

	if Config.consolespam_spambullitdata then
		print ("Player "..p_Shooter.giver.name.." shot "..playershot[p_Shooter.giver.name].." Times")
	end
	
		s_InstanceIds[p_Entity.instanceId] = true
		p_Entity:RegisterDestroyCallback(function(p_DestroyedEntity)
			s_InstanceIds[p_DestroyedEntity.instanceId] = nil
		end)
	end

	if p_Hit.rigidBody ~= nil and p_Hit.rigidBody:Is("CharacterPhysicsEntity") then
	if playerhit[p_Shooter.giver.name] == nil then playerhit[p_Shooter.giver.name] = 0 ; end
	playerhit[p_Shooter.giver.name] = playerhit[p_Shooter.giver.name] + 1
	server_acc_hit = server_acc_hit + 1

	if Config.consolespam_spambullitdata then
		print ("Player "..p_Shooter.giver.name.." hitted a player "..playerhit[p_Shooter.giver.name].." Times")
	end	
	end
end)

-- --------------------------------------------

Events:Subscribe('Vehicle:Damage', function(vehicle, damage, info)
vehicleNameDamage = VehicleEntityData(vehicle.data).controllableType:gsub(".+/.+/","")
	if info ~= nil and info.giver ~= nil then
	--print(vehicleNameDamage, tostring(damage), info.giver.name)
	-- example: "vehicle.onDamage F16 25.0 Flash_Hit"
	end
end)

-- -----------------------

return accuracy()







