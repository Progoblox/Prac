local rs = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players")
local char = plr.Character or plr.CharacterAdded:Wait()
local humanoid = char:FindFirstChild("Humanoid")

humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function(onWalkSpeedChanged)
    local current = humanoid.WalkSpeed
    local isMod = rs.plrIsModerator:InvokeServer()
    local defaultSpeed = rs.getDefaultSpeed:InvokeServer()
    local maxSpeed = rs.getMaxSpeed:InvokeServer()
    if (not isMod and current > maxSpeed) or (not isMod and current < defaultSpeed) then
        rs.kick:FireServer("Possible Speed Hack")
    end
end)

humanoid:GetPropertyChangedSignal("Health"):Connect(function(onWalkSpeedChanged)
    local current = humanoid.Health
    local isMod = rs.plrIsModerator:InvokeServer()
    local defaultHealth = rs.getDefaultHealth:InvokeServer()
    local maxHealth = rs.getMaxHealth:InvokeServer()
    if (not isMod and current > maxHealth) or (not isMod and current < defaultHealth) then
        rs.kick:FireServer("Possible Health Hack")
    end
end)