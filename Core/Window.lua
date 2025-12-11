local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local playerService = game:GetService("Players")

local player = playerService.LocalPlayer

local protectGui = (syn and syn.protect_gui)

local Tabs = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Components/Tabs.lua"))()
local Dragify = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Utilities/Dragify.lua"))()

return function(config)
	local window = {}

	window.Tabs = {}

	local title = config.Title or "Ascendent"
	local description = config.Description or "An advanced script that utilizes Ascendent UI Library."
	local keybind = config.Keybind

	window.MainGUI = Instance.new("ScreenGui", coreGui)
	window.MainGUI.Name = title
	window.MainGUI.ResetOnSpawn = false
	window.MainGUI.IgnoreGuiInset = true
	window.MainGUI.ZIndexBehavior = Enum.ZIndexBehavior.Global

	config.GUI = window.MainGUI

	if protectGui then protectGui(window.MainGUI) end

	window.background = Instance.new("Frame", window.MainGUI)
	window.background.Name = "Background"
	window.background.AnchorPoint = Vector2.new(0.5, 0.5)
	window.background.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	window.background.BackgroundTransparency = 0.1
	window.background.BorderSizePixel = 0
	window.background.Position = UDim2.new(0.5, 0, 0.5, 0)
	window.background.Size = UDim2.new(0.5, 0, 0.75, 0)

	Dragify.Dragify(window.background, true)

	local uiCorner = Instance.new("UICorner", window.background)
	uiCorner.CornerRadius = UDim.new(0.025, 0)

	local uiAspectRatio = Instance.new("UIAspectRatioConstraint", window.background)
	uiAspectRatio.AspectRatio = 1.5

	window.sidebar = Instance.new("Frame", window.background)
	window.sidebar.Name = "Sidebar"
	window.sidebar.BackgroundTransparency = 1
	window.sidebar.BorderSizePixel = 0
	window.sidebar.Position = UDim2.new(0, 0, 0.2, 0)
	window.sidebar.Size = UDim2.new(0.3, 0, 0.65, 0)

	local uiListLayout = Instance.new("UIListLayout", window.sidebar)
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Padding = UDim.new(0.015, 0)

	window.bottomBar = Instance.new("Frame", window.background)
	window.bottomBar.Name = "BottomBar"
	window.bottomBar.BackgroundTransparency = 1
	window.bottomBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bottomBar.BorderSizePixel = 0
	window.bottomBar.Position = UDim2.new(0, 0, 0.85, 0)
	window.bottomBar.Size = UDim2.new(0.3, 0, 0.15, 0)

	window.bar1 = Instance.new("Frame", window.bottomBar)
	window.bar1.Name = "Bar"
	window.bar1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	window.bar1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar1.BorderSizePixel = 0
	window.bar1.Position = UDim2.new(0.07, 0, -0.007, 0)
	window.bar1.Size = UDim2.new(0.85, 0, 0.025, 0)

	window.informationBar = Instance.new("Frame", window.background)
	window.informationBar.Name = "InformationBar"
	window.informationBar.BackgroundTransparency = 1
	window.informationBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.informationBar.BorderSizePixel = 0
	window.informationBar.Size = UDim2.new(0.3, 0, 0.2, 0)

	window.bar2 = Instance.new("Frame", window.informationBar)
	window.bar2.Name = "Bar"
	window.bar2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	window.bar2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar2.BorderSizePixel = 0
	window.bar2.Position = UDim2.new(0, 0, 0.933, 0)
	window.bar2.Size = UDim2.new(0.995, 0, 0.02, 0)

	window.bar3 = Instance.new("Frame", window.informationBar)
	window.bar3.Name = "Bar"
	window.bar3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	window.bar3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar3.BorderSizePixel = 0
	window.bar3.Position = UDim2.new(0, 0, 0.262, 0)
	window.bar3.Size = UDim2.new(0.995, 0, 0.02, 0)

	window.title = Instance.new("TextLabel", window.informationBar)
	window.title.Name = "Title"
	window.title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	window.title.BackgroundTransparency = 1
	window.title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.title.BorderSizePixel = 0
	window.title.Position = UDim2.new(0.05, 0, 0.35, 0)
	window.title.Size = UDim2.new(0.758, 0, 0.209, 0)
	window.title.Font = Enum.Font.GothamBold
	window.title.Text = title
	window.title.TextColor3 = Color3.fromRGB(255, 255, 255)
	window.title.TextScaled = true
	window.title.TextSize = 14
	window.title.TextWrapped = true
	window.title.TextXAlignment = Enum.TextXAlignment.Left

	local uiTextSizeConstraint = Instance.new("UITextSizeConstraint", window.title)
	uiTextSizeConstraint.MaxTextSize = 20

	window.description = Instance.new("TextLabel", window.informationBar)
	window.description.Name = "Description"
	window.description.BackgroundTransparency = 1
	window.description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.description.BorderSizePixel = 0
	window.description.Position = UDim2.new(0.071, 0, 0.555, 0)
	window.description.Size = UDim2.new(0.924, 0, 0.379, 0)
	window.description.Font = Enum.Font.GothamBold
	window.description.Text = description
	window.description.TextColor3 = Color3.fromRGB(225, 225, 225)
	window.description.TextScaled = true
	window.description.TextSize = 14
	window.description.TextWrapped = true
	window.description.TextXAlignment = Enum.TextXAlignment.Left
	window.description.TextYAlignment = Enum.TextYAlignment.Top

	local uiTextSizeConstraint2 = Instance.new("UITextSizeConstraint", window.description)
	uiTextSizeConstraint2.MaxTextSize = 15

	window.topBar = Instance.new("Frame", window.background)
	window.topBar.Name = "TopBar"
	window.topBar.BackgroundTransparency = 1
	window.topBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.topBar.BorderSizePixel = 0
	window.topBar.Position = UDim2.new(0.299, 0, 0, 0)
	window.topBar.Size = UDim2.new(0.7, 0, 0.149, 0)

	window.exit = Instance.new("TextButton", window.topBar)
	window.exit.Name = "Exit"
	window.exit.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
	window.exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.exit.BorderSizePixel = 0
	window.exit.Position = UDim2.new(0.95, 0, 0.25, 0)
	window.exit.Size = UDim2.new(0.032, 0, 0.22, 0)
	window.exit.Font = Enum.Font.SourceSans
	window.exit.Text = ""
	window.exit.TextColor3 = Color3.fromRGB(0, 0, 0)
	window.exit.TextSize = 14

	local uiCorner2 = Instance.new("UICorner", window.exit)
	uiCorner2.CornerRadius = UDim.new(1, 0)

	window.minimize = Instance.new("TextButton", window.topBar)
	window.minimize.Name = "Minimize"
	window.minimize.BackgroundColor3 = Color3.fromRGB(255, 225, 75)
	window.minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.minimize.BorderSizePixel = 0
	window.minimize.Position = UDim2.new(0.9, 0, 0.25, 0)
	window.minimize.Size = UDim2.new(0.032, 0, 0.22, 0)
	window.minimize.Font = Enum.Font.SourceSans
	window.minimize.Text = ""
	window.minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
	window.minimize.TextSize = 14

	local uiCorner3 = Instance.new("UICorner", window.minimize)
	uiCorner3.CornerRadius = UDim.new(1, 0)

	window.bar4 = Instance.new("Frame", window.topBar)
	window.bar4.Name = "Bar"
	window.bar4.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	window.bar4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar4.BorderSizePixel = 0
	window.bar4.Position = UDim2.new(0.004, 0, 0.842, 0)
	window.bar4.Size = UDim2.new(0.995, 0, 0.025, 0)
	
	window.tabTitle = Instance.new("TextLabel", window.topBar)
	window.tabTitle.Name = "Title"
	window.tabTitle.BackgroundTransparency = 1
	window.tabTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.tabTitle.BorderSizePixel = 0
	window.tabTitle.Position = UDim2.new(0.05, 0, 0.35, 0)
	window.tabTitle.Size = UDim2.new(0.45, 0, 0.4, 0)
	window.tabTitle.Font = Enum.Font.GothamBold
	window.tabTitle.Text = "Home"
	window.tabTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
	window.tabTitle.TextScaled = true
	window.tabTitle.TextSize = 14
	window.tabTitle.TextWrapped = true
	window.tabTitle.TextXAlignment = Enum.TextXAlignment.Left

	local uiTextSizeConstraint3 = Instance.new("UITextSizeConstraint", window.tabTitle)
	uiTextSizeConstraint3.MaxTextSize = 20

	window.frames = Instance.new("Frame", window.background)
	window.frames.Name = "Frames"
	window.frames.BackgroundTransparency = 1
	window.frames.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.frames.BorderSizePixel = 0
	window.frames.Position = UDim2.new(0.299, 0, 0.147, 0)
	window.frames.Size = UDim2.new(0.7, 0, 0.853, 0)

	window.bar5 = Instance.new("Frame", window.background)
	window.bar5.Name = "Bar"
	window.bar5.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	window.bar5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar5.BorderSizePixel = 0
	window.bar5.Position = UDim2.new(0.299, 0, 0, 0)
	window.bar5.Size = UDim2.new(0.0025, 0, 1, 0)
	
	window.holder = Instance.new("Frame", window.bottomBar)
	window.holder.Name = "Holder"
	window.holder.BackgroundTransparency = 1
	window.holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.holder.BorderSizePixel = 0
	window.holder.Position = UDim2.new(0.119999997, 0, 0.150000006, 0)
	window.holder.Size = UDim2.new(0.75, 0, 0.5, 0)
	
	local uiCorner4 = Instance.new("UICorner", window.holder)
	uiCorner4.CornerRadius = UDim.new(0.15, 0)
	
	local uiStroke = Instance.new("UIStroke", window.holder)
	uiStroke.Color = Color3.fromRGB(45, 45, 45)
	uiStroke.Transparency = 1
	uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	window.userIcon = Instance.new("ImageLabel", window.holder)
	window.userIcon.Name = "Icon"
	window.userIcon.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	window.userIcon.BackgroundTransparency = 0.1
	window.userIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.userIcon.BorderSizePixel = 0
	window.userIcon.Position = UDim2.new(0.06, 0, 0.08, 0)
	window.userIcon.Size = UDim2.new(0.203, 0, 0.92, 0)
	window.userIcon.ScaleType = Enum.ScaleType.Fit
	
	local uiCorner5 = Instance.new("UICorner", window.userIcon)
	uiCorner5.CornerRadius = UDim.new(1, 0)
	
	local uiStroke2 = Instance.new("UIStroke", window.userIcon)
	uiStroke2.Color = Color3.fromRGB(45, 45, 45)
	uiStroke2.Thickness = 1.5
	uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	window.username = Instance.new("ImageLabel", window.holder)
	window.username.Name = "Username"
	window.username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	window.username.BackgroundTransparency = 1
	window.username.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.username.BorderSizePixel = 0
	window.username.Position = UDim2.new(0.325, 0, 0, 0)
	window.username.Size = UDim2.new(0.673, 0, 0.6, 0)
	window.username.Font = Enum.Font.GothamBold
	window.username.Text = "Username"
	window.username.TextColor3 = Color3.fromRGB(255, 255, 255)
	window.username.TextScaled = true
	window.username.TextSize = 14
	window.username.TextWrapped = true
	window.username.TextXAlignment = Enum.TextXAlignment.Left
	
	local uiTextSizeConstraint4 = Instance.new("UITextSizeConstraint", window.username)
	uiTextSizeConstraint4.MaxTextSize = 15
	
	window.display = Instance.new("ImageLabel", window.holder)
	window.display.Name = "Display"
	window.display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	window.display.BackgroundTransparency = 1.000
	window.display.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.display.BorderSizePixel = 0
	window.display.Position = UDim2.new(0.324600458, 0, 0.576195002, 0)
	window.display.Size = UDim2.new(0.673043489, 0, 0.423805147, 0)
	window.display.Font = Enum.Font.GothamBold
	window.display.Text = "@Display"
	window.display.TextColor3 = Color3.fromRGB(255, 255, 255)
	window.display.TextScaled = true
	window.display.TextSize = 14.000
	window.display.TextWrapped = true
	window.display.TextXAlignment = Enum.TextXAlignment.Left
	
	local uiTextSizeConstraint5 = Instance.new("UITextSizeConstraint", window.display)
	uiTextSizeConstraint5.MaxTextSize = 10
	
	window.username.Text = player.Name
	window.display.Text = string.format("@%s", player.DisplayName)
	window.userIcon.Image = playerService:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	
	userInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == keybind then
				window.MainGUI.Enabled = not window.MainGUI.Enabled
			end
		end
	end)
	
	window.minimize.MouseButton1Click:Connect(function()
		window.MainGUI.Enabled = false
	end)

	function window:CreateTab(config)
		return Tabs:CreateTab(window, config)
	end

	return window
end
