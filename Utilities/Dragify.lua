local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

local Dragify = {}

Dragify.Dragify = function(object, smooth)
	local dragging = false
	local dragStart
	local startPosition
	
	object.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPosition = object.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	object.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			local newPos = UDim2.new(
				startPosition.X.Scale, startPosition.X.Offset + delta.X,
				startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
			)
			
			if smooth then
				tweenService:Create(object, TweenInfo.new(0.1), {Position = newPos}):Play()
			else
				object.Position = newPos
			end
		end
	end)
end

return Dragify
