local Library = {
    Version = "1.0.0",
    Window = nil
}

Library.Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaeelin/Ascendent/refs/heads/main/Core/Window.lua"))()

function Library:CreateWindow(config)
    if Library.Window then warn("multiple windows not supported") return end
    
    local Window = Library.Window(config)
    Library.Window = Window

    return Window
end

return Library
