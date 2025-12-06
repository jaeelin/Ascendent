local coreGui = game:GetService("CoreGui")

local protectGui = (syn and syn.protect_gui)

return function(config)
	local window = {}
	
	local title = config.Title or "Ascendent"

	window.MainGUI = Instance.new("ScreenGui", coreGui)
	window.MainGUI.Name = title
	window.MainGUI.ResetOnSpawn = false
	window.MainGUI.IgnoreGuiInset = true

	if protectGui then protectGui(window.MainGUI) end

	window.background = Instance.new("Frame", window.MainGUI)
	window.background.Name = "Background"
	window.background.Size = UDim2.new(1, 0, 1, 0)
	window.background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	window.background.BackgroundTransparency = 1

	window.mainFrame = Instance.new("Frame", window.background)
	window.mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	window.mainFrame.BackgroundTransparency = 0.05
	window.mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	window.mainFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
	window.mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

	local uiCorner = Instance.new("UICorner", window.mainFrame)
	uiCorner.CornerRadius = UDim.new(0.01, 0)

	return window
end
