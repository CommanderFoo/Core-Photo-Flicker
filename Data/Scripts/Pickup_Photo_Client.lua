local item = nil

local function on_touch_started(position)
	local hit = UI.GetHitResult(position)

	if(hit ~= nil and hit.other.name == "Frame") then
		item = hit.other
	end
end

local function on_touch_stopped()
	if(item == nil) then
		return		
	end

	local pos = item.parent.parent:GetWorldPosition()

	pos.z = 1
	item.parent.parent:SetWorldPosition(pos)
	item = nil
end

Input.touchStartedEvent:Connect(on_touch_started)
Input.touchStoppedEvent:Connect(on_touch_stopped)

function Tick()
	if(item ~= nil) then
		local pointer = Input.GetPointerPosition()

		if(pointer ~= nil) then
			local hit = UI.GetHitResult(pointer)

			if(hit ~= nil and hit ~= item) then
				item.parent.parent:SetWorldPosition(Vector3.New(hit:GetImpactPosition().x, hit:GetImpactPosition().y, 60))
			end
		end
	end
end