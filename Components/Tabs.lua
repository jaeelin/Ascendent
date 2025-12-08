local Tabs = {}

function Tabs:Create(window, config)
	local tabName = config.Name or "NewTab"
	local tabImage = config.Image or "rbxassetid://0"

	local tabButton = Instance.new("ImageButton", window.tabHolder)
	tabButton.Size = UDim2.new(0.095, 0, 0.8, 0)
	tabButton.BackgroundTransparency = 1
	tabButton.AutoButtonColor = false
	tabButton.Name = tabName

	local icon = Instance.new("ImageLabel", tabButton)
	icon.ScaleType = Enum.ScaleType.Fit
	icon.BackgroundTransparency = 1
	icon.Size = UDim2.new(0.9, 0, 0.7, 0)
	icon.Position = UDim2.new(0.15, 0, 0.15, 0)
	icon.Image = tabImage

	window.Tabs[tabName] = { Button = tabButton }

	return window.Tabs[tabName]
end

return Tabs
