local Library = {
    Version = "1.0.0",
    Window = nil,
    GUI = nil,
}

Library.Core = {
    Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Core/Window.lua"))()
}

function Library:CreateWindow(config)
    if Library.Window then warn("multiple windows not supported") return end
    
    local Window = Library.Core.Window(config)
    Library.Window = Window

    return Window
end

function Library:Destroy()
	if Library.Window and Library.GUI then
		Library.GUI:Destroy()
	end
end

function Library:GetVersion()
    return Library.Version
end

return Library
