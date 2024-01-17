-- Configuration for each player

game:GetService("Players").PlayerAdded:Connect(function(player)
	local f = Instance.new("Folder", player)
	f.Name = "PracConfig"

	local isModerator = Instance.new("BoolValue", f)
	isModerator.Name = "isModerator"
	isModerator.Value = false

	local warningSpeed = Instance.new("IntValue", f)
	warningSpeed.Name = "warningSpeed"
	warningSpeed.Value = 0

	local warningHealth = Instance.new("IntValue", f)
	warningHealth.Name = "warningHealth"
	warningHealth.Value = 0

    local warningNoClip = Instance.new("IntValue", f)
    warningNoClip.Name = "warningNoClip"
    warningNoClip.Value = 0

    local warningFly = Instance.new("IntValue", f)
    warningFly.Name = "warningFly"
    warningFly.Value = 0
end)