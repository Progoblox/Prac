local rs = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local char = plr.Character or plr.CharacterAdded:Wait()
local humanoid = char:FindFirstChild("Humanoid")

humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function(onWalkSpeedChanged)
	if rs.isSpeedHack:InvokeServer(humanoid.WalkSpeed) then
		print("speed hack detected")
		rs.warnings:FireServer("1")
	end
end)

humanoid:GetPropertyChangedSignal("Health"):Connect(function(onWalkSpeedChanged)
	if rs.isHealthHack:InvokeServer(humanoid.Health) then
		print("health hack detected")
		rs.warnings:FireServer("2")
	end
end)

for i, p_char in ipairs(char:GetChildren()) do
    if ( p_char:IsA("MeshPart") or p_char:IsA("Part") ) then
        p_char:GetPropertyChangedSignal("CanCollide"):Connect(function(onCanCollideChange)
            if rs.isNoClip:InvokeServer(p_char.CanCollide) then
                print("noclip detected")
                rs.warnings:FireServer("3")
            end
        end)

        p_char:GetPropertyChangedSignal("Anchored"):Connect(function(onAnchoredChange)
            if rs.isFlying:InvokeServer(p_char.Anchored) then
                print("fly detected")
                rs.warnings:FireServer("3")
            end
        end)
    end
end

local function onMouseMove()
    local target = mouse.Target
    if target and target:IsA("Model") then
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