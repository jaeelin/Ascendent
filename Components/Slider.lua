local Slider = {}

local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")

function Slider:Create(holder, config)
	local titleText = config.Name or "New Slider"
	local default = config.Default or 0
	local min = config.Min or 0
	local max = config.Max or 100
	local callback = config.Callback or function() end

	local list = holder:FindFirstChild("List")
	if not list then return end

	local slider = Instance.new("Frame", list)
	slider.Name = "Slider"
	slider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	slider.BackgroundTransparency = 1
	slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	slider.BorderSizePixel = 0
	slider.Position = UDim2.new(9.55083692e-08, 0, 0, 0)
	slider.Size = UDim2.new(0.949999988, 0, 0.219999999, 0)

	local uiCorner = Instance.new("UICorner", slider)
	uiCorner.CornerRadius = UDim.new(0.1, 0)

	local title = Instance.new("TextLabel", slider)
	title.Name = "Title"
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Position = UDim2.new(0.0399999991, 0, 0.264999986, 0)
	title.Size = UDim2.new(0.300000012, 0, 0.449999988, 0)
	title.Font = Enum.Font.ArialBold
	title.Text = "Slider"
	title.TextColor3 = Color3.fromRGB(150, 150, 150)
	title.TextScaled = true
	title.TextSize = 14.000
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left

	local uiTextSizeConstraint = Instance.new("UITextSizeConstraint", title)
	uiTextSizeConstraint.MaxTextSize = 15

	local input = Instance.new("TextBox", slider)
	input.Name = "Input"
	input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	input.BorderColor3 = Color3.fromRGB(0, 0, 0)
	input.BorderSizePixel = 0
	input.Position = UDim2.new(0.769457102, 0, 0.269999921, 0)
	input.Size = UDim2.new(0.200000003, 0, 0.449999988, 0)
	input.Font = Enum.Font.GothamBold
	input.PlaceholderText = "0"
	input.Text = ""
	input.TextColor3 = Color3.fromRGB(255, 255, 255)
	input.TextSize = 14.000

	local uiCorner2 = Instance.new("UICorner", input)
	uiCorner2.CornerRadius = UDim.new(0.26, 0)

	local uiStroke = Instance.new("UIStroke", input)
	uiStroke.Color = Color3.fromRGB(45, 45, 45)
	uiStroke.Thickness = 1.5
	uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	local innerFrame = Instance.new("Frame", slider)
	innerFrame.Name = "Inner"
	innerFrame.BackgroundTransparency = 1
	innerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	innerFrame.BorderSizePixel = 0
	innerFrame.Position = UDim2.new(0.375633299, 0, 0.142911911, 0)
	innerFrame.Size = UDim2.new(0.349999994, 0, 0.699999988, 0)

	local innerBar = Instance.new("Frame", innerFrame)
	innerBar.Name = "Bar"
	innerBar.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	innerBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	innerBar.BorderSizePixel = 0
	innerBar.Position = UDim2.new(0.0727203339, 0, 0.374291182, 0)
	innerBar.Size = UDim2.new(0.850000024, 0, 0.150000006, 0)

	local uiCorner3 = Instance.new("UICorner", innerBar)
	uiCorner3.CornerRadius = UDim.new(1, 0)

	local innerText = Instance.new("TextLabel", innerBar)
	innerText.Name = "Inner"
	innerText.Active = true
	innerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	innerText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	innerText.BorderSizePixel = 0
	innerText.Position = UDim2.new(-0.00544323027, 0, -0.862215698, 0)
	innerText.Selectable = true
	innerText.Size = UDim2.new(0.190588906, 0, 2.47580767, 0)
	innerText.Font = Enum.Font.SourceSans
	innerText.Text = ""
	innerText.TextColor3 = Color3.fromRGB(0, 0, 0)
	innerText.TextSize = 14

	local uiCorner4 = Instance.new("UICorner", innerText)
	uiCorner4.CornerRadius = UDim.new(1, 0)

	local dragging = false
	local currentValue = default

	local function updateVisual(newValue)
		newValue = math.clamp(newValue, min, max)
		currentValue = newValue

		local percent = (newValue - min) / (max - min)

		local newPosition = UDim2.new(0 + 0.9 * percent, 0, -0.862, 0)

		tweenService:Create(innerText, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { Position = newPosition }):Play()

		input.Text = string.format("%.0f", newValue)

		callback(newValue)
	end

	innerFrame.InputBegan:Connect(function(inputObject)
		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
		end
	end)

	innerFrame.InputEnded:Connect(function(inputObject)
		if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	userInputService.InputChanged:Connect(function(inputObject)
		if dragging and inputObject.UserInputType == Enum.UserInputType.MouseMovement then
			local mouseX = inputObject.Position.X
			local frameX = innerFrame.AbsolutePosition.X
			local frameWidth = innerFrame.AbsoluteSize.X
			local percent = math.clamp((mouseX - frameX) / frameWidth, 0, 1)
			local valueFromMouse = min + percent * (max - min)

			updateVisual(valueFromMouse)
		end
	end)

	input.FocusLost:Connect(function()
		local parsedValue = tonumber(input.Text)
		if parsedValue then
			updateVisual(parsedValue)
		else
			input.Text = tostring(currentValue)
		end
	end)

	updateVisual(default)

	local sliderObject = {}

	function sliderObject:Set(valueToSet)
		updateVisual(valueToSet)
	end

	function sliderObject:Get()
		return currentValue
	end

	return sliderObject
end

return Slider
