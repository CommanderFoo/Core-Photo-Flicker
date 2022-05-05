local fingers = 0
local is_rotating = false
local is_pinching = false
local current_rotation = 0

function Tick(dt)
	if(is_pinching) then
		local pinch = Input.GetPinchValue()
		local cam = Game.GetLocalPlayer():GetActiveCamera()

		cam.currentDistance = (cam.maxDistance - cam.minDistance) * pinch
	end

	if(is_rotating) then
		local rotation = Input.GetRotateValue()

		rotation = rotation > 0 and (rotation) or rotation

		local cam = Game.GetLocalPlayer():GetActiveCamera()

		cam:SetRotationOffset(Rotation.New(rotation + current_rotation, 0, 0))
	end
end

Input.touchStartedEvent:Connect(function()
    fingers = fingers + 1

    if(fingers == 3) then
        Events.Broadcast("Restart")
        Events.BroadcastToServer("Restart")
    end
end)

Input.touchStoppedEvent:Connect(function()
    fingers = fingers - 1
end)

Input.pinchStartedEvent:Connect(function()
	is_pinching = true
end)

Input.pinchStoppedEvent:Connect(function()
	is_pinching = false
end)

Input.rotateStartedEvent:Connect(function()
	current_rotation = Game.GetLocalPlayer():GetActiveCamera():GetRotationOffset().x
	is_rotating = true
end)

Input.rotateStoppedEvent:Connect(function()
	is_rotating = false
end)