local coreGui = game:GetService("CoreGui")

local protectGui = (syn and syn.protect_gui)

return function(config)
	self.Title = config.Title or "Ascendent"

	local screenGui = Instance.new("ScreenGui", coreGui)
	screenGui.Name = config.Title
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true

	if protectGui then protectGui(screenGui) end

	local background = Instance.new("Frame", screenGui)
	background.Name = "Background"
	background.Size = UDim2.new(1, 0, 1, 0)
	background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	background.BackgroundTransparency = 1

	local mainFrame = Instance.new("Frame", background)
	mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	mainFrame.BackgroundTransparency = 0.05
	mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	mainFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainFrame.Parent = background

	local uiCorner = Instance.new("UICorner", mainFrame)
	uiCorner.CornerRadius = UDim.new(0.01, 0)
end
