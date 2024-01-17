local rs = game:GetService("ReplicatedStorage")
local ss = game:GetService("ServerStorage")

----------------------------------- Configuration -----------------------------------

local f = Instance.new("Folder", ss)
f.Name = "PracGlobalConfig"

local defaultSpeed = 16 -- the default speed
local maxSpeed = 16 -- max speed you gave
local defaultHealth = 100 -- the default health
local maxHealth = 100 -- max health you have
local maxDistanceCheckWallHack = 100 -- max distance you give to check when there is a possible wallhack


----------------------------------- Functions -----------------------------------
local function resetArgumentsHumanoidPlayer(plr, target)
    if target == "speed" then
        plr.Character.Humanoid.WalkSpeed = defaultSpeed
    elseif target == "health" then
        plr.Character.Humanoid.Health = defaultHealth
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
        if hitPart and hitPart:IsA("Humanoid") and hitPart.Parent == targetPlayer.Character then
            return true
        end
    end
    return false
end)
aimingAtPlayer.OnServerInvoke = aimingAtPlayerFunction



-- Utilities for management

local warnings = rs.warnings -- RE
warnings.OnServerEvent:Connect(function(player, source)
    v = 0
    r = ""
    if source == "speed" then
        player.PracConfig.warningSpeed.Value = player.PracConfig.warningSpeed.Value + 1
        v = player.PracConfig.warningSpeed.Value
        r = "Possible Speed Hack"
    elseif source == "health" then
        player.PracConfig.warningHealth.Value = player.PracConfig.warningHealth.Value + 1
        v = player.PracConfig.warningHealth.Value
        r = "Possible Health Hack"
    end

    if v >= 3 then
        player:kick(r)
    end
end)

local kick = rs.kick -- RE
kick.OnServerEvent:Connect(function(player, reason)
    player:kick(reason)
end)