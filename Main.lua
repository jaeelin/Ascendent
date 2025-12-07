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
    
    local Window = Library.Core.Window({
		Title = config.Title or "Ascendent",
		Keybind = config.Keybind or Enum.KeyCode.LeftShift
	})
    Library.Window = Window
	Library.GUI = Window.MainGUI

    return Window
end

function Library:Destroy()
    if Library.Window then
        if Library.Window.MainGUI then
            Library.Window.MainGUI:Destroy()
        end
		
        Library.Window = nil
        Library.GUI = nil
    end
end

function Library:GetVersion()
    return Library.Version
end

return Library
