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

-- Speed
local getDefaultSpeed = rs.getMinSpeed
local getMaxSpeed = rs.getMinSpeed

local function getDefaultSpeedFunction(player)
    return ss:FindFirstChild("PracGlobalConfig"):FindFirstChild("defaultSpeed").Value
end
getDefaultSpeed.OnServerInvoke = getDefaultSpeedFunction

local function getMaxSpeedFunction(player)
    return ss:FindFirstChild("PracGlobalConfig"):FindFirstChild("maxSpeed").Value
end
getMaxSpeed.OnServerInvoke = getMaxSpeedFunction

-- Health
local getDefaultSpeed = rs.getMinSpeed
local getMaxSpeed = rs.getMinSpeed

local function getDefaultSpeedFunction(player)
    return ss:FindFirstChild("PracGlobalConfig"):FindFirstChild("defaultSpeed").Value
end
getDefaultSpeed.OnServerInvoke = getDefaultSpeedFunction

local function getMaxSpeedFunction(player)
    return ss:FindFirstChild("PracGlobalConfig"):FindFirstChild("maxSpeed").Value
end
getMaxSpeed.OnServerInvoke = getMaxSpeedFunction

----------------------------------- Remote Events -----------------------------------

local kick = rs.kick

kick.OnServerEvent:Connect(function(player, reason)
    player:kick(reason)
end)