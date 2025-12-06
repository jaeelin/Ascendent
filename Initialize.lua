local Library = {}

Library.Core = {
	Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/main/Core/Window.lua"))()
}

local Library = {
	Version = "1.0.0"
	Window = nil,
}

function Library:CreateWindow(config)
	if Library.Window then warn("multiple windows not supported") return end
	
	local Window = Library.Core.Window(config)
	
	Library.Window = Window

	return Window
end

function Library:GetVersion()
	return Library.Version
end

return Library
