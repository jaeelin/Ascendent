local Library = {}

Library.Core = {
	Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/main/Core/Window.lua"))()
}

function Library:CreateWindow(config)
	local Window = Library.Core.Window(config)

	return Window
end

return Library
