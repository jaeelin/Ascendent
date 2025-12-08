local Tabs = {}

local tabCount = 0
local currentTab = nil

function Tabs:Create(window, config)
	local tabName = config.Name or "NewTab"
	local tabDescription = config.Description or ""
	local tabImage = config.Image or "rbxassetid://0"
	
	tabCount += 1
	
	local tabOrder = config.Order or 0
	
	local tabButton = Instance.new("ImageButton", window.tabHolder)
	tabButton.Size = UDim2.new(0.125, 0, 0.8, 0)
	tabButton.BackgroundTransparency = 1
	tabButton.AutoButtonColor = false
	tabButton.LayoutOrder = tabOrder
	tabButton.Name = tabName
	
	local icon = Instance.new("ImageLabel", tabButton)
	icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
	icon.ScaleType = Enum.ScaleType.Fit
	icon.BackgroundTransparency = 1
	icon.Size = UDim2.new(0.7, 0, 0.7, 0)
	icon.Position = UDim2.new(0.15, 0, 0.15, 0)
	icon.Image = tabImage
	icon.Name = "Icon"
	
	local iconBar = Instance.new("Frame", tabButton)
	iconBar.BackgroundTransparency = 1
	iconBar.BackgroundColor3 = Color3.fromRGB(255, 100, 200)
	iconBar.Size = UDim2.new(0.5, 0, 0.025, 0)
	iconBar.Position = UDim2.new(0.25, 0, 0.85, 0)
	iconBar.Name = "IconBar"
	
	local function selectTab()
		if currentTab then
			currentTab.Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)
			currentTab.IconBar.BackgroundTransparency = 1
		end
		
		currentTab = window.Tabs[tabName]
		
		window.tabTitle.Text = tabName
		window.tabDescription.Text = tabDescription
		
		icon.ImageColor3 = Color3.fromRGB(255, 100, 200)
		iconBar.BackgroundTransparency = 0
	end

	window.Tabs[tabName] = { 
		Button = tabButton,
		Icon = icon,
		IconBar = iconBar,
	}
	
	if tabCount == 1 then
		selectTab()
	end

	tabButton.MouseButton1Click:Connect(selectTab)

	return window.Tabs[tabName]
end

return Tabs
