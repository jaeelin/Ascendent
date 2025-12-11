local Holder = {}

local tabHolders = {}

local Toggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Components/Toggle.lua"))()
local Slider = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Components/Slider.lua"))()

function Holder:Create(tab, config)
	local tabHolder = tab.List
	local holderSize = config.Size / 100

	if not tabHolders[tab] then
		tabHolders[tab] = {column1 = {}, column2 = {}}
	end

	local col1 = tabHolders[tab].column1
	local col2 = tabHolders[tab].column2

	local column, posX
	if #col1 < 2 then
		column = col1
		posX = 0.025
	else
		column = col2
		posX = 0.52
	end

	local posY
	if #column == 0 then
		posY = 0.035
	else
		local last = column[#column]
		posY = last.Position.Y.Scale + last.Size.Y.Scale + 0.025
	end

	if column == col2 and #col2 >= 2 then
		warn("Reached maximum of 4 holders.")
		return
	end

	local frame = Instance.new("Frame", tabHolder)
	frame.Name = config.Name or "Holder"
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame.BackgroundTransparency = 0.2
	frame.Size = UDim2.new(0.45, 0, holderSize, 0)
	frame.Position = UDim2.new(posX, 0, posY, 0)
	frame.BorderSizePixel = 0

	local uiStroke = Instance.new("UIStroke", frame)
	uiStroke.Color = Color3.fromRGB(45, 45, 45)

	local uiCorner = Instance.new("UICorner", frame)
	uiCorner.CornerRadius = UDim.new(0.025, 0)

	local list = Instance.new("ScrollingFrame", frame)
	list.Name = "List"
	list.Active = true
	list.Size = UDim2.new(1, 0, 1, 0)
	list.BackgroundTransparency = 1
	list.ScrollBarThickness = 0
	list.AutomaticCanvasSize = Enum.AutomaticSize.XY

	Instance.new("UIListLayout", list).HorizontalAlignment = Enum.HorizontalAlignment.Center
	Instance.new("UIPadding", list).PaddingTop = UDim.new(0.05, 0)

	table.insert(column, frame)

	local holderObject = {}
	holderObject.frame = frame
	holderObject.list = list

	function holderObject:CreateToggle(config)
		return Toggle:Create(self.frame, config)
	end

	function holderObject:CreateSlider(config)
		return Slider:Create(self.frame, config)
	end

	return holderObject
end

return Holder
