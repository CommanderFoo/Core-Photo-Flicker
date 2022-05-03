local TWEEN = require(script:GetCustomProperty("Tween"))
local PHOTO = script:GetCustomProperty("3DPhoto")
local CARDS = script:GetCustomProperty("Cards"):WaitForObject()

local tweens = {}
local z = 0
local height_offset = 0.001
local ui_z_offset = 0.01

for i = 1, 20 do
	-- spawn the photos under a folder so PickupPhotoClient can find them easy
	local photo = World.SpawnAsset(PHOTO, { parent = CARDS })
	local pos = Vector3.New(-450, 0, z)
	local duration = CoreMath.Clamp(math.random(), 0.4, .8)
	local tween = TWEEN:new(duration, { x = -350, y = 0 }, { x = math.random(-150, 800), y = math.random(-600, 600) })
	local frame = photo:FindDescendantByName("Frame")
	local container = photo:FindDescendantByName("UI")
	local trigger = photo:FindDescendantByName("Trigger")

	local container_pos = container:GetPosition()
	local frame_scale = frame:GetScale()

	frame_scale.z = frame_scale.z + height_offset
	container_pos.x = container_pos.x + ui_z_offset

	frame:SetScale(frame_scale)
	container:SetPosition(container_pos)
	trigger:SetScale(frame_scale)
	
	height_offset = height_offset + 0.001
	ui_z_offset = ui_z_offset + 0.05

	photo:SetWorldRotation(Rotation.New(0, 0, math.random(360)))
	photo:SetWorldPosition(pos)

	tween:on_complete(function()
		tween = nil
	end)

	tween:on_change(function(c)
		pos.x = c.x
		pos.y = c.y

		photo:SetWorldPosition(pos)
	end)

	local can_delay = math.random(2)

	tween:set_delay(can_delay == 1 and .5 or 0)
	tween:set_easing(TWEEN.Easings.Out_Cubic)

	table.insert(tweens, tween)
	z = z + .02
end

function Tick(dt)
	for index, t in ipairs(tweens) do
		if(t ~= nil) then
			t:tween(dt)
		end
	end
end



