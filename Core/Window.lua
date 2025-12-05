local coreGui = game:GetService("CoreGui")

local Window = {}
Window.__index = Window

function Window.new(config)
	local self = setmetatable({}, Window)

	self.Title = config.Title or "Ascendent"
	self.Size = config.Size or UDim2.fromOffset(450, 300)
	self.Parent = coreGui
	
	local frame = Instance.new("Frame")
	frame.Size = self.Size
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	frame.Position = UDim2.new(0.5, -self.Size.X.Offset / 2, 0.5, -self.Size.Y.Offset / 2)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Parent = self.Parent
	self.Frame = frame
	
	local title = Instance.new("TextLabel")
	title.Text = self.Title
	title.Size = UDim2.new(1, 0, 0, 30)
	title.BackgroundTransparency = 1
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.Parent = frame
	self.TitleLabel = title

	return self
end

return Window
