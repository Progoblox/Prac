local rs = game:GetService("ReplicatedStorage")
local ss = game:GetService("ServerStorage")

----------------------------------- Configuration -----------------------------------

local f = Instance.new("Folder", ss)
f.Name = "PracGlobalConfig"

-- Configuration global values

local v_defaultSpeed = 16 -- the default speed
local v_maxSpeed = 16 -- max speed you gave
local v_defaultHealth = 100 -- the default health
local v_maxHealth = 100 -- max health you have

-- Saving in a folder

local defaultSpeed = Instance.new("NumberValue", f)
defaultSpeed.Name = "defaultSpeed"
defaultSpeed.Value = v_defaultSpeed

local maxSpeed = Instance.new("NumberValue", f)
maxSpeed.Name = "maxSpeed"
maxSpeed.Value = v_maxSpeed

local defaultHealth = Instance.new("NumberValue", f)
defaultHealth.Name = "defaultHealth"
defaultHealth.Value = v_defaultHealth

local maxHealth = Instance.new("NumberValue", f)
maxHealth.Name = "maxHealth"
maxHealth.Value = v_maxHealth


----------------------------------- Remote Functions -----------------------------------
-- Is Moderator
local plrIsModerator = rs.plrIsModerator
local function plrIsModeratorFunction(player)
    return plr.PracConfig.isModerator.Value
end
plrIsModerator.OnServerInvoke = plrIsModeratorFunction

-- SpeedHack
local isSpeedHack = rs.isSpeedHack
local function isSpeedHackFunction(player, current)
    if not player.PracConfig.isModerator.Value and current > ss:FindFirstChild(f.name).maxSpeed.Value then
       return true
    end
    return false
end
isSpeedHack.OnServerInvoke = isSpeedHackFunction

-- HealthHack
local isHealthHack = rs.isHealthHack
local function isHealthHackFunction(player, current)
    if not player.PracConfig.isModerator.Value and current > ss:FindFirstChild(f.name).maxHealth.Value then
        return true
    end
    return false
end
isHealthHack.OnServerInvoke = isHealthHackFunction

----------------------------------- Remote Events -----------------------------------

local kick = rs.kick

kick.OnServerEvent:Connect(function(player, reason)
    player:kick(reason)
end)