local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

local protectGui = (syn and syn.protect_gui)

local Tabs = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Components/Tabs.lua"))()

return function(config)
	local window = {}

	window.Tabs = {}

	local title = config.Title or "Ascendent"
	local keybind = config.Keybind

	window.MainGUI = Instance.new("ScreenGui", coreGui)
	window.MainGUI.Name = title
	window.MainGUI.ResetOnSpawn = false
	window.MainGUI.IgnoreGuiInset = true

	config.GUI = window.MainGUI

	if protectGui then protectGui(window.MainGUI) end

	window.background = Instance.new("Frame", window.MainGUI)
	window.background.Name = "Background"
	window.background.Size = UDim2.new(0.3, 0, 0.75, 0)
	window.background.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	window.background.AnchorPoint = Vector2.new(0.5, 0.5)
	window.background.Position = UDim2.new(0.5, 0, 0.5, 0)
	window.background.ClipsDescendants = true
	
	local uiCorner = Instance.new("UICorner", window.background)
	uiCorner.CornerRadius = UDim.new(0.025, 0)

	window.mainFrame = Instance.new("Frame", window.background)
	window.mainFrame.Name = "Main"
	window.mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.mainFrame.Size = UDim2.new(0.85, 0, 0.75, 0)
	window.mainFrame.Position = UDim2.new(0.075, 0, 0.125, 0)
	
	local uiCorner2 = Instance.new("UICorner", window.mainFrame)
	uiCorner2.CornerRadius = UDim.new(0.025, 0)
	
	window.bottomBar = Instance.new("Frame", window.background)
	window.bottomBar.Name = "BottomBar"
	window.bottomBar.Size = UDim2.new(1, 0, 0.1, 0)
	window.bottomBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.bottomBar.Position = UDim2.new(0, 0, 1.05, 0)
	window.bottomBar.ZIndex = 2
	
	local uiCorner3 = Instance.new("UICorner", window.bottomBar)
	uiCorner3.CornerRadius = UDim.new(0.25, 0)
	
	window.bottomBarCover = Instance.new("Frame", window.bottomBar)
	window.bottomBarCover.Name = "BottomBarCover"
	window.bottomBarCover.Size = UDim2.new(1, 0, 0.1, 0)
	window.bottomBarCover.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.bottomBarCover.Position = UDim2.new(0, 0, -0.007, 0)
	window.bottomBarCover.BorderSizePixel = 0
	
	window.tabHolder = Instance.new("Frame", window.bottomBar)
	window.tabHolder.Name = "TabHolder"
	window.tabHolder.Size = UDim2.new(0.75, 0, 1, 0)
	window.tabHolder.Position = UDim2.new(0.125, 0, 0, 0)
	window.tabHolder.BackgroundTransparency = 1
	
	local uiListLayout = Instance.new("UIListLayout", window.tabHolder)
	uiListLayout.FillDirection = Enum.FillDirection.Horizontal
	uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	local uiCorner4 = Instance.new("UICorner", window.tabHolder)
	uiCorner4.CornerRadius = UDim.new(0.25, 0)
	
	window.hoverFrame = Instance.new("Frame", window.background)
	window.hoverFrame.Name = "Hover"
	window.hoverFrame.Size = UDim2.new(1, 0, 0.1, 0)
	window.hoverFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	window.hoverFrame.BackgroundTransparency = 1
	window.hoverFrame.Position = UDim2.new(0, 0, 0.9, 0)
	window.hoverFrame.ZIndex = 2
	
	local uiCorner5 = Instance.new("UICorner", window.hoverFrame)
	uiCorner5.CornerRadius = UDim.new(0.25, 0)
	
	window.hoverFrameBar = Instance.new("Frame", window.hoverFrame)
	window.hoverFrameBar.Name = "Bar"
	window.hoverFrameBar.Size = UDim2.new(0.2, 0, .08, 0)
	window.hoverFrameBar.Position = UDim2.new(0.4, 0, 0.75, 0)
	window.hoverFrameBar.BackgroundColor3 = Color3.fromRGB(255, 100, 200)
	
	local uiCorner6 = Instance.new("UICorner", window.hoverFrameBar)
	uiCorner6.CornerRadius = UDim.new(1, 0)
	
	window.exitButton = Instance.new("TextButton", window.background)
	window.exitButton.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	window.exitButton.TextColor3 = Color3.fromRGB(255, 100, 200)
	window.exitButton.TextScaled = true
	window.exitButton.Size = UDim2.new(0.085, 0, 0.07, 0)
	window.exitButton.Position = UDim2.new(0.9, 0, 0.015, 0)
	window.exitButton.BackgroundTransparency = 1
	window.exitButton.Text = "X"
	
	local uiCorner7 = Instance.new("UICorner", window.exitButton)
	uiCorner6.CornerRadius = UDim.new(0.25, 0)
	
	local uiTextConstraint = Instance.new("UITextSizeConstraint", window.exitButton)
	uiTextConstraint.MaxTextSize = 20
	
	window.hoverFrame.MouseEnter:Connect(function()
		local bottomTween = tweenService:Create(
			window.bottomBar,
			TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			{Position = UDim2.new(0, 0, 0.9, 0)}
		)
		bottomTween:Play()
	end)

	window.hoverFrame.MouseLeave:Connect(function()
		local bottomTween = tweenService:Create(
			window.bottomBar,
			TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			{Position = UDim2.new(0, 0, 1.05, 0)}
		)
		bottomTween:Play()
	end)

	userInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == keybind then
				window.MainGUI.Enabled = not window.MainGUI.Enabled
			end
		end
	end)

	function window:CreateTab(config)
		return Tabs:Create(window, config)
	end

	return window
end
