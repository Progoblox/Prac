local rs = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players")
local char = plr.Character or plr.CharacterAdded:Wait()
local humanoid = char:FindFirstChild("Humanoid")

humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function(onWalkSpeedChanged)
    if rs.isSpeedHack:InvokeServer(humanoid.WalkSpeed) then
        rs.warnings:FireServer("speed")
    end
end)

humanoid:GetPropertyChangedSignal("Health"):Connect(function(onWalkSpeedChanged)
    if rs.isHealthHack:InvokeServer(humanoid.Health) then
        rs.warnings:FireServer("health")
    end
end)