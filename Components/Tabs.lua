local Tabs = {}

function Tabs:Create(window, config)
	local tabName = config.Name or "NewTab"
	local tabImage = config.Image or "rbxassetid://0"
	
	local tabButton = Instance.new("ImageButton", window.listFrame)
	tabButton.Size = UDim2.new(1, 0, 0.15, 0)
	tabButton.BackgroundTransparency = 1
	tabButton.AutoButtonColor = false
	tabButton.Name = tabName

	local icon = Instance.new("ImageLabel", tabButton)
	icon.BackgroundTransparency = 1
	icon.Size = UDim2.new(0.7, 0, 0.7, 0)
	icon.Position = UDim2.new(0.15, 0, 0.15, 0)
	icon.Image = tabImage
	
	window.Tabs[tabName] = { Button = tabButton }

	return window.Tabs[tabName]
end

return Tabs
