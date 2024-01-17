local rs = game:GetService("ReplicatedStorage")
local ss = game:GetService("ServerStorage")

----------------------------------- Configuration -----------------------------------

local defaultSpeed = 16 -- the default speed
local maxSpeed = 16 -- max speed you gave
local defaultHealth = 100 -- the default health
local maxHealth = 100 -- max health you have
local maxDistanceCheckWallHack = 100 -- max distance you give to check when there is a possible wallhack
local maxHeigh = 10 -- max maximum height difference -> the ground and the player's feet
local defaultAnchored = false

local maxWarningsSpeed = 3 -- max warnings for speed hack
local maxWarningsHealth = 3 -- max warnings for health hack
local maxWarningsNoClip = 30 -- max warnings for noclip (1 warning for 1 part)
local maxWarningsFly = 18 -- max warnings for fly (1 warning for 1 part)

----------------------------------- Functions -----------------------------------
local function resetArgumentsHumanoidPlayer(plr, target)
	if target == "speed" then
		plr.Character.Humanoid.WalkSpeed = defaultSpeed
	elseif target == "health" then
		plr.Character.Humanoid.Health = defaultHealth
	elseif target == "fly" then
		for i, p_char in ipairs(plr.Character:GetChildren()) do
			if p_char:IsA("MeshPart") or p_char:IsA("Part") then
				p_char.Anchored = defaultAnchored
			end
		end
	end
end

-- SpeedHack
local isSpeedHack = rs.isSpeedHack -- RF
local function isSpeedHackFunction(player, current)
	if not player.PracConfig.isModerator.Value and current > maxSpeed then
		resetArgumentsHumanoidPlayer(player, "speed")
		return true
	end
	return false
end
isSpeedHack.OnServerInvoke = isSpeedHackFunction

-- HealthHack
local isHealthHack = rs.isHealthHack -- RF
local function isHealthHackFunction(player, current)
	if not player.PracConfig.isModerator.Value and current > maxHealth then
		resetArgumentsHumanoidPlayer(player, "health")
		return true
	end
	return false
end
isHealthHack.OnServerInvoke = isHealthHackFunction

-- WallHack
local aimingAtPlayer = rs.aimingAtPlayer -- RF
local function aimingAtPlayerFunction(player, targetPlayer)
	local playerHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	local targetHRP = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")

	if playerHRP and targetHRP then
		local direction = (targetHRP.Position - playerHRP.Position).unit
		local ray = Ray.new(playerHRP.Position, direction * maxDistanceCheckWallHack)
		local hitPart, hitPosition = workspace:FindPartOnRay(ray, player)
		if hitPart and hitPart:IsA("Humanoid") and hitPart.Parent == targetPlayer.Character and not player.PracConfig.isModerator.Value then
			return true
		end
	end
	return false
end

aimingAtPlayer.OnServerInvoke = aimingAtPlayerFunction

-- NoClip
local isNoClip = rs.isNoClip -- RF
local function isNoClipFunction(player, clientState)
	for i, p_char in ipairs(player.Character:GetChildren()) do
		if ( p_char:IsA("MeshPart") or p_char:IsA("Part") ) and p_char.CanCollide ~= clientState and not player.PracConfig.isModerator.Value then
			return true
		end
	end
	return false
end
isNoClip.OnServerInvoke = isNoClipFunction

-- Fly
local isFlying = rs.isFlying -- RF
local function isFlyingFunction(player, clientState)
	for i, p_char in ipairs(player.Character:GetChildren()) do
		if ( p_char:IsA("MeshPart") or p_char:IsA("Part") ) and p_char.Anchored ~= clientState and not player.PracConfig.isModerator.Value then
			return true
		end
	end
	return false
end
isFlying.OnServerInvoke = isFlyingFunction


-- Utilities for management

local warnings = rs.warnings -- RE
warnings.OnServerEvent:Connect(function(player, source)
	if source == "1" then -- Speed Hack
		player.PracConfig.warningSpeed.Value = player.PracConfig.warningSpeed.Value + 1
		if player.PracConfig.warningSpeed.Value >= maxWarningsSpeed then
			player:kick("[PRAC] Possible Speed Hack")
		end
	elseif source == "2" then -- Health Hack
		player.PracConfig.warningHealth.Value = player.PracConfig.warningHealth.Value + 1
		if player.PracConfig.warningHealth.Value >= maxWarningsHealth then
			player:kick("[PRAC] Possible Health Hack")
		end
	elseif source == "3" then -- NoClip
		player.PracConfig.warningNoClip.Value = player.PracConfig.warningNoClip.Value + 1
		if player.PracConfig.warningNoClip.Value >= maxWarningsNoClip then
			player:kick("[PRAC] Possible NoClip")
		end
	elseif source == "4" then -- NoClip
		player.PracConfig.warningFly.Value = player.PracConfig.warningFly.Value + 1
		if player.PracConfig.warningFly.Value >= maxWarningsFly then
			player:kick("[PRAC] Possible Fly")
		end
	else
		player:kick("[PRAC] Possible Script Modification")
	end
end)

local kick = rs.kick -- RE
kick.OnServerEvent:Connect(function(player, reason)
	player:kick(reason)
end)