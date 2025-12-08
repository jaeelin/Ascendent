local Tabs = {}

local tabCount = 0
local currentTab = nil

function Tabs:Create(window, config)
	local tabName = config.Name or "NewTab"
	local tabImage = config.Image or "rbxassetid://0"
	
	tabCount += 1
	
	local tabOrder = config.Order or 0

	local tabButton = Instance.new("ImageButton", window.tabHolder)
	tabButton.Size = UDim2.new(0.095, 0, 0.8, 0)
	tabButton.BackgroundTransparency = 1
	tabButton.AutoButtonColor = false
	tabButton.LayoutOrder = tabOrder
	tabButton.Name = tabName

	local icon = Instance.new("ImageLabel", tabButton)
	icon.ScaleType = Enum.ScaleType.Fit
	icon.BackgroundTransparency = 1
	icon.Size = UDim2.new(0.9, 0, 0.7, 0)
	icon.Position = UDim2.new(0.15, 0, 0.15, 0)
	icon.Image = tabImage
	
	local iconBar = Instance.new("Frame", tabButton)
	icon.BackgroundTransparency = 1
	icon.Size = UDim2.new(0.5, 0, 0.07, 0)
	icon.Position = UDim2.new(0.25, 0, 0.85, 0)
	
	local function selectTab()
		if currentTab and currentTab.IconBar then
			currentTab.IconBar.BackgroundTransparency = 1
		end
		
		currentTab = window.Tabs[tabName]
		
		iconBar.BackgroundTransparency = 0
	end
	
	if tabCount == 1 then
		selectTab()
	end
	
	tabButton.MouseButton1Click:Connect(selectTab)

	window.Tabs[tabName] = { Button = tabButton }

	return window.Tabs[tabName]
end

return Tabs
