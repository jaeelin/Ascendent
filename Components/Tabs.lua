local Tabs = {}

local tabCount = 0
local currentTab = nil

local Toggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Components/Toggle.lua"))()

function Tabs:CreateTab(window, config)
	local tabName = config.Name or "NewTab"
	local tabImage = config.Image or "rbxassetid://4034483344"

	tabCount += 1

	local tabOrder = config.Order or 0

	local tabButton = Instance.new("TextButton", window.sidebar)
	tabButton.Name = "Home"
	tabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabButton.BorderSizePixel = 0
	tabButton.Size = UDim2.new(0.9, 0, 0.12, 0)
	tabButton.Font = Enum.Font.SourceSans
	tabButton.Text = ""
	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.TextSize = 14

	local uiCorner = Instance.new("UICorner", tabButton)
	uiCorner.CornerRadius = UDim.new(0.15, 0)

	local icon = Instance.new("ImageLabel", tabButton)
	icon.Name = "Icon"
	icon.BackgroundTransparency = 1
	icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	icon.BorderSizePixel = 0
	icon.Position = UDim2.new(0.1, 0, 0.08, 0)
	icon.Size = UDim2.new(0.15, 0, 0.8, 0)
	icon.Image = tabImage
	icon.ScaleType = Enum.ScaleType.Fit

	local title = Instance.new("TextLabel", tabButton)
	title.Name = "Title"
	title.BackgroundTransparency = 1
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Position = UDim2.new(0.298, 0, 0, 0)
	title.Size = UDim2.new(0.7, 0, 1, 0)
	title.Font = Enum.Font.GothamBold
	title.Text = "Home"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.TextSize = 14
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left

	local uiTextSizeConstraint = Instance.new("UITextSizeConstraint", title)
	uiTextSizeConstraint.MaxTextSize = 15

	local function selectTab()
		if currentTab then
			currentTab.Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
		end

		currentTab = window.Tabs[tabName]

		window.tabTitle.Text = tabName

		icon.ImageColor3 = Color3.fromRGB(255, 100, 200)
	end

	window.Tabs[tabName] = { 
		Button = tabButton,
		Icon = icon,
	}
	
	if tabCount == 1 then
		--list.Visible = true
		selectTab()
	end

	tabButton.MouseButton1Click:Connect(selectTab)

	function Tabs:CreateToggle(config)
		return Toggle:Create(window.Tabs[tabName], config)
	end

	return window.Tabs[tabName]
end

return Tabs
