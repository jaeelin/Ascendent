local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

local protectGui = (syn and syn.protect_gui)

local Tabs = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Components/Tabs.lua"))()
local Dragify = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Utilities/Dragify.lua"))()

return function(config)
	local window = {}

	window.Tabs = {}

	local title = config.Title or "Ascendent"
	local keybind = config.Keybind

	window.MainGUI = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
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
	uiListLayout.Parent = window.sidebar
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

	window.bottomBar = Instance.new("Frame", window.bottomBar)
	window.bottomBar.Name = "Bar"
	window.bottomBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.bottomBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bottomBar.BorderSizePixel = 0
	window.bottomBar.Position = UDim2.new(0.07, 0, -0.007, 0)
	window.bottomBar.Size = UDim2.new(0.85, 0, 0.025, 0)

	window.informationBar = Instance.new("Frame", window.background)
	window.informationBar.Name = "InformationBar"
	window.informationBar.BackgroundTransparency = 1
	window.informationBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.informationBar.BorderSizePixel = 0
	window.informationBar.Size = UDim2.new(0.3, 0, 0.2, 0)

	window.bar1 = Instance.new("Frame", window.informationBar)
	window.bar1.Name = "Bar"
	window.bar1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.bar1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar1.BorderSizePixel = 0
	window.bar1.Position = UDim2.new(0, 0, 0.933, 0)
	window.bar1.Size = UDim2.new(0.995, 0, 0.025, 0)

	window.bar2 = Instance.new("Frame", window.informationBar)
	window.bar2.Name = "Bar"
	window.bar2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.bar2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar2.BorderSizePixel = 0
	window.bar2.Position = UDim2.new(0, 0, 0.262, 0)

	window.title = Instance.new("TextLabel", window.informationBar)
	window.title.Name = "Title"
	window.title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	window.title.BackgroundTransparency = 1
	window.title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.title.BorderSizePixel = 0
	window.title.Position = UDim2.new(0.05, 0, 0.35, 0)
	window.title.Size = UDim2.new(0.758, 0, 0.209, 0)
	window.title.Font = Enum.Font.GothamBold
	window.title.Text = "Ascendent Hub"
	window.title.TextColor3 = Color3.fromRGB(255, 255, 255)
	window.title.TextScaled = true
	window.title.TextSize = 14
	window.title.TextWrapped = true
	window.title.TextXAlignment = Enum.TextXAlignment.Left

	local uiTextSizeConstraint = Instance.new("UITextSizeConstraint", window.title)
	uiTextSizeConstraint.MaxTextSize = 20

	window.description = Instance.new("TextLabel", window.informationBar)
	window.description.Name = "Description"
	window.description.BackgroundTransparency = 1.000
	window.description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.description.BorderSizePixel = 0
	window.description.Position = UDim2.new(0.071, 0, 0.555, 0)
	window.description.Size = UDim2.new(0.924, 0, 0.379, 0)
	window.description.Font = Enum.Font.GothamBold
	window.description.Text = "An advanced script library that includes multiple game support. "
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
	window.topBar.BackgroundTransparency = 1.000
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
	window.exit.Size = UDim2.new(0.032, 0, 0.24, 0)
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
	window.minimize.Size = UDim2.new(0.032, 0, 0.24, 0)
	window.minimize.Font = Enum.Font.SourceSans
	window.minimize.Text = ""
	window.minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
	window.minimize.TextSize = 14

	local uiCorner3 = Instance.new("UICorner", window.minimize)
	uiCorner3.CornerRadius = UDim.new(1, 0)

	window.bar3 = Instance.new("Frame", window.topBar)
	window.bar3.Name = "Bar"
	window.bar3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.bar3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar3.BorderSizePixel = 0
	window.bar3.Position = UDim2.new(0.007, 0, 0.842, 0)
	window.bar3.Size = UDim2.new(0.995, 0, 0.025, 0)

	window.tabTitle = Instance.new("TextLabel", window.topBar)
	window.tabTitle.Name = "Title"
	window.tabTitle.BackgroundTransparency = 1.000
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
	uiTextSizeConstraint3.MaxTextSize = 15

	window.frames = Instance.new("Frame", window.background)
	window.frames.Name = "Frames"
	window.frames.BackgroundTransparency = 1
	window.frames.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.frames.BorderSizePixel = 0
	window.frames.Position = UDim2.new(0.299, 0, 0.147, 0)
	window.frames.Size = UDim2.new(0.7, 0, 0.853, 0)

	window.bar3 = Instance.new("Frame", window.background)
	window.bar3.Name = "Bar"
	window.bar3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.bar3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	window.bar3.BorderSizePixel = 0
	window.bar3.Position = UDim2.new(0.299, 0, 0, 0)
	window.bar3.Size = UDim2.new(0.005, 0, 1, 0)

	userInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == keybind then
				window.MainGUI.Enabled = not window.MainGUI.Enabled
			end
		end
	end)

	function window:CreateTab(config)
		return Tabs:CreateTab(window, config)
	end

	return window
end
