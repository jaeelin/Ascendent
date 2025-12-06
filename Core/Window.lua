local coreGui = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")

local protectGui = (syn and syn.protect_gui)

return function(config)
		local window = {}
	
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
		
		window.sideBar = Instance.new("Frame", window.background)
		window.sideBar.AnchorPoint = Vector2.new(0.5, 0.5)
		window.sideBar.BackgroundTransparency = 1
		window.sideBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		window.sideBar.Size = UDim2.new(0.05, 0, 0.5, 0)
		window.sideBar.Position = UDim2.new(0.035, 0, 0.5, 0)
		
		local uiCorner2 = Instance.new("UICorner", window.sideBar)
		uiCorner2.CornerRadius = UDim.new(0.025, 0)
		
		window.bar = Instance.new("Frame", window.sideBar)
		window.bar.AnchorPoint = Vector2.new(0.5, 0.5)
		window.bar.BackgroundTransparency = 0.05
		window.bar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		window.bar.Size = UDim2.new(0.05, 0, 0.5, 0)
		window.bar.Position = UDim2.new(1.2, 0, 0.5, 0)
		
		local uiCorner3 = Instance.new("UICorner", window.bar)
		uiCorner3.CornerRadius = UDim.new(1, 0)
		
		window.listFrame = Instance.new("Frame", window.sideBar)
		window.listFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		window.listFrame.BackgroundTransparency = 1
		window.listFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		window.listFrame.Size = UDim2.new(1, 0, 1, 0)
		window.listFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		
		local uiCorner4 = Instance.new("UICorner", window.listFrame)
		uiCorner4.CornerRadius = UDim.new(0.025, 0, 0)
		
		local uiListLayout = Instance.new("UIListLayout", window.listFrame)
		uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

		userInputService.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == keybind then
					window.MainGUI.Enabled = not window.MainGUI.Enabled
				end
			end
		end)
	
		return window
	end
