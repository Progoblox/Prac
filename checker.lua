local rs = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players")
local mouse = plr:GetMouse()
local char = plr.Character or plr.CharacterAdded:Wait()
local humanoid = char:FindFirstChild("Humanoid")

humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function(onWalkSpeedChanged)
    if rs.isSpeedHack:InvokeServer(humanoid.WalkSpeed) then
        rs.warnings:FireServer("1")
    end
end)

humanoid:GetPropertyChangedSignal("Health"):Connect(function(onWalkSpeedChanged)
    if rs.isHealthHack:InvokeServer(humanoid.Health) then
        rs.warnings:FireServer("2")
    end
end)

local function onMouseMove()
    local target = mouse.Target
    if target then
        local isAimingPlayer = rs.aimingAtPlayer:InvokeServer(target)
        local success = 0
        for i = 1, 20, 1 do
            if rs.aimingAtPlayer:InvokeServer(target) then success = success+1 end
        end

        if success >= 18 then
            rs.kick(plr, "Possible WallHack")
        end
    end
end
mouse.Move:Connect(onMouseMove)

humanoid.Running:Connect(function(speed)
    if speed > 0 then
        -- NoClip
        if rs.isNoClip:InvokeServer(plr.Character) then
            rs.warnings:FireServer("3")
        end
        -- Fly
        if rs.isFlying:InvokeServer(plr.Character) then
            rs.warnings:FireServer("4")
        end
    end
    task.wait(0.3)
end)