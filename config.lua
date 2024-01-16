-- Configuration for each player

game:GetService("Players").PlayerAdded:Connect(function(player)
    local f = Instance.new("Folder", player)
    f.Name = "PracConfig"
    
    local defaultSpeed = Instance.new("NumberValue", f)
    defaultSpeed.Name = "defaultSpeed"
    defaultSpeed.Value = 16
    
    local isModerator = Instance.new("BoolValue", f)
    isModerator.Name = "isModerator"
    isModerator.Value = false
end)