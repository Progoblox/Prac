local SS = game:GetService("ServerStorage")

local f = Instance.new("Folder", SS)
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