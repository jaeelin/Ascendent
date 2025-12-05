local Library = {}

Library.Core = {
	Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/main/Core/Window.lua"))()
}

function Library:CreateWindow()
	Library.Core.Window.new()
end

return Library
