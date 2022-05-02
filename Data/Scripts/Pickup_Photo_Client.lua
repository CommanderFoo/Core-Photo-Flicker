local TWEEN = require(script:GetCustomProperty("Tween"))

local item = nil
local last_item = nil
local tween = nil

local function on_touch_started(position)
	local hit = UI.GetHitResult(position)

	if(hit ~= nil and hit.other.name == "Frame") then
		item = hit.other
		last_item = item
	end
end

local function on_touch_stopped()
	if(item == nil) then
		return		
	end

	item = nil
end

Input.touchStartedEvent:Connect(on_touch_started)
Input.touchStoppedEvent:Connect(on_touch_stopped)

Input.flickedEvent:Connect(function(angle)
	if(last_item ~= nil) then
		local pos = last_item.parent.parent:GetWorldPosition()
		
		tween = TWEEN:new(.5, { x = pos.x, y = pos.y, z = pos.z }, { x = pos.x + 400 * math.sin(math.rad(angle)), y = pos.y + 400 * math.cos(math.rad(angle)), z = 1 })
		tween:on_change(function(c)
			if(last_item) then
				last_item.parent.parent:SetWorldPosition(Vector3.New(c.x, c.y, c.z))
			end
		end)

		tween:on_complete(function()
			tween = nil
			last_item = nil
		end)

		tween:set_easing(TWEEN.Easings.Out_Cubic)
	end
end)

function Tick(dt)
	if(item ~= nil) then
		local pointer = Input.GetPointerPosition()

		if(pointer ~= nil) then
			local hit = UI.GetHitResult(pointer)

			if(hit ~= nil and hit ~= item) then
				item.parent.parent:SetWorldPosition(Vector3.New(hit:GetImpactPosition().x, hit:GetImpactPosition().y, 60))
			end
		end
	end

	if(tween ~= nil) then
		tween:tween(dt)
	end
end