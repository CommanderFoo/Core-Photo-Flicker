local TWEEN = require(script:GetCustomProperty("Tween"))
local PHOTO = script:GetCustomProperty("3DPhoto")
local CARDS = script:GetCustomProperty("Cards"):WaitForObject()


local tweens = {}
local z = 5


for i = 1, 20 do
	-- spawn the photos under a folder so PickupPhotoClient can find them easy
	local photo = World.SpawnAsset(PHOTO, {parent = CARDS})
	local pos = Vector3.New(-450, 0, z)
	local duration = CoreMath.Clamp(math.random(), 0.4, .8)

	local tween = TWEEN:new(duration, { x = -350, y = 0 }, { x = math.random(-150, 800), y = math.random(-600, 600) })
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
	z = z + 1
end

function Tick(dt)
	for index, t in ipairs(tweens) do
		if(t ~= nil) then
			t:tween(dt)
		end
	end
end



