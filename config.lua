-- Configuration for each player

game:GetService("Players").PlayerAdded:Connect(function(player)
    local f = Instance.new("Folder", player)
    f.Name = "PracConfig"
    
    local isModerator = Instance.new("BoolValue", f)
    isModerator.Name = "isModerator"
    isModerator.Value = false
end)