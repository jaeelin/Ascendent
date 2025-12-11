local Toggle = {}

local tweenService = game:GetService("TweenService")

function Toggle:Create(holder, config)
	local title = config.Name or "New Toggle"
	local default = config.Default or false
	local callback = config.Callback or function() end

	local list = holder:FindFirstChild("List")
	if not list then return end

	local toggle = Instance.new("TextButton", list)
	toggle.Name = "Toggle"
	toggle.Active = false
	toggle.BackgroundTransparency = 1
	toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BorderSizePixel = 0
	toggle.Position = UDim2.new(9.55083692e-08, 0, 0, 0)
	toggle.Selectable = false
	toggle.Size = UDim2.new(0.949999988, 0, 0.25, 0)
	toggle.AutoButtonColor = false
	toggle.Text = ""

	local uiCorner = Instance.new("UICorner", toggle)
	uiCorner.CornerRadius = UDim.new(0.1, 0)

	local title = Instance.new("TextLabel", toggle)
	title.Name = "Title"
	title.BackgroundTransparency = 1
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Position = UDim2.new(0.0399999991, 0, 0.264999986, 0)
	title.Size = UDim2.new(0.300000012, 0, 0.449999988, 0)
	title.Font = Enum.Font.ArialBold
	title.Text = "Toggle"
	title.TextColor3 = Color3.fromRGB(150, 150, 150)
	title.TextScaled = true
	title.TextSize = 14.
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left

	local uiTextSizeConstraint = Instance.new("UITextSizeConstraint", title)
	uiTextSizeConstraint.MaxTextSize = 15

	local innerToggle = Instance.new("TextLabel", toggle)
	innerToggle.Name = "Toggle"
	innerToggle.Active = true
	innerToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	innerToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	innerToggle.BorderSizePixel = 0
	innerToggle.Position = UDim2.new(0.769457102, 0, 0.269999921, 0)
	innerToggle.Selectable = true
	innerToggle.Size = UDim2.new(0.180000007, 0, 0.4, 0)
	innerToggle.Font = Enum.Font.SourceSans
	innerToggle.Text = ""
	innerToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
	innerToggle.TextSize = 14

	local uiCorner2 = Instance.new("UICorner", innerToggle)
	uiCorner2.CornerRadius = UDim.new(1, 0)

	local innerBar = Instance.new("TextLabel", innerToggle)
	innerBar.Name = "Inner"
	innerBar.Active = true
	innerBar.BackgroundColor3 = Color3.fromRGB(175, 175, 175)
	innerBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	innerBar.BorderSizePixel = 0
	innerBar.Position = UDim2.new(0.0700000003, 0, 0.100000001, 0)
	innerBar.Selectable = true
	innerBar.Size = UDim2.new(0.449999988, 0, 0.819999993, 0)
	innerBar.Font = Enum.Font.SourceSans
	innerBar.Text = ""
	innerBar.TextColor3 = Color3.fromRGB(0, 0, 0)
	innerBar.TextSize = 14

	local uiCorner3 = Instance.new("UICorner", innerBar)
	uiCorner3.CornerRadius = UDim.new(1, 0)


	local state = default

	local function updateVisual()
		local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

		if state then
			innerToggle.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
			innerBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			tweenService:Create(innerBar, tweenInfo, {Position = UDim2.new(0.47, 0, 0.1, 0)}):Play()
		else
			innerToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			innerBar.BackgroundColor3 = Color3.fromRGB(175, 175, 175)
			tweenService:Create(innerBar, tweenInfo, {Position = UDim2.new(0.07, 0, 0.1, 0)}):Play()
		end
	end

	updateVisual()

	toggle.MouseButton1Click:Connect(function()
		state = not state
		updateVisual()
		callback(state)
	end)

	local toggleObject = {}
	function toggleObject:Set(value)
		state = value
		updateVisual()
		callback(state)
	end

	function toggleObject:Get()
		return state
	end

	return toggleObject
end

return Toggle
