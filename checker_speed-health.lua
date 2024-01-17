local rs = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players")
local char = plr.Character or plr.CharacterAdded:Wait()
local humanoid = char:FindFirstChild("Humanoid")

humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function(onWalkSpeedChanged)
    if rs.isSpeedHack:InvokeServer(humanoid.WalkSpeed) then
        rs.kick:FireServer("Possible Speed Hack")
    end
end)

humanoid:GetPropertyChangedSignal("Health"):Connect(function(onWalkSpeedChanged)
    if rs.isSpeedHack:InvokeServer(humanoid.Health) then
        rs.kick:FireServer("Possible Health Hack")
    end
end)