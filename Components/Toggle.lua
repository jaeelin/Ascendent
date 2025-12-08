local Toggle = {}

function Toggle:Create(tabs, config)
	local toggleButton = Instance.new("TextButton", tabs.List)
	toggleButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	toggleButton.Size = UDim2.new(0.95, 0, 0.145, 0)
	toggleButton.AutoButtonColor = false
	
	local uiCorner = Instance.new("UICorner", toggleButton)
	uiCorner.CornerRadius = UDim.new(0.1, 0)
	
	local toggleTitle = Instance.new("TextLabel", toggleButton)
	toggleTitle.BackgroundTransparency = 1
	toggleTitle.Position = UDim2.new(0.04, 0, 0.265, 0)
	toggleTitle.Size = UDim2.new(0.3, 0, 0.45, 0)
	toggleTitle.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold,Enum.FontStyle.Normal)
	toggleTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
	toggleTitle.TextScaled = true
	toggleTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	local uiTextConstraint = Instance.new("UITextSizeConstraint", toggleTitle)
	uiTextConstraint.MaxTextSize = 20
	
	local toggleVisual = Instance.new("TextLabel", toggleButton)
	toggleVisual.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	toggleVisual.Position = UDim2.new(0.825, 0, 0.3, 0)
	toggleVisual.Size = UDim2.new(0.125, 0, 0.35, 0)
	
	local uiCorner2 = Instance.new("UICorner", toggleVisual)
	uiCorner2.CornerRadius = UDim.new(1, 0)
	
	local uiStroke = Instance.new("UIStroke", toggleVisual)
	uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uiStroke.Color = Color3.fromRGB(100, 100, 100)
	uiStroke.Thickness = 2
	
	local innerToggle = Instance.new("TextLabel", toggleVisual)
	toggleVisual.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	toggleVisual.Position = UDim2.new(0.1, 0, 0.09, 0)
	toggleVisual.Size = UDim2.new(0.4, 0, 0.815, 0)
end

return Toggle
