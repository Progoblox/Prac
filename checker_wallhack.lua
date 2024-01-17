local rs = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()

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