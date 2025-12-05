local Library = {}

Library.Core = {
	Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/main/Core/Window.lua"))()
}

function Library:CreateWindow()
	local Window = Library.Core.Window()

	return Window
end

return Library
