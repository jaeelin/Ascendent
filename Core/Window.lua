local coreGui = game:GetService("CoreGui")

local Window = {}
Window.__index = Window

function Window.new(config)
	local self = setmetatable({}, Window)

	self.Title = config.Title or "Ascendent"
	
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = self.Title
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.Parent = coreGui

	local frame = Instance.new("Frame")
	frame.Name = "Background"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame.BackgroundTransparency = 1
	frame.Parent = screenGui
	self.Frame = frame

	return self
end

return Window
