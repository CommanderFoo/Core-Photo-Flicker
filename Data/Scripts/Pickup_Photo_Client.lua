
local TWEEN = require(script:GetCustomProperty("Tween"))
local CARDS = script:GetCustomProperty("Cards"):WaitForObject()

local item = nil
local last_item = nil
local is_rotating = false
local is_pinching = false
local current_rotation = 0

local tweens = {}
local photos = {}

CARDS.childAddedEvent:Connect(function ()
	local exists = false

	for _, card in ipairs(CARDS:GetChildren()) do
		for _, photo in ipairs(photos) do
			if photo.photo == card then
				exists = true

			end
		end

		if not exists then
			photos[card] = {photo = card, intersected = false, intersected_with = nil}
		end

		exists = false
	end
end)

--Photo trigger overlaps
function Overlap(sourcePhoto, collision)
	--print(sourcePhoto, " collided with ", collision)
	
	for i, photo in pairs(photos) do
		if photo.photo == sourcePhoto then
			photo.intersected = true
			if not collision:IsA("StaticMesh") then
				if photo.intersected_with ~= collision:GetObject() then
					photo.intersected_with = collision:GetObject()
				end
			else
				--hit the "Foor" or Floor as it is more commonly know!
				photo.intersected_with = collision
			end
		end
	end

end

--Photo trigger  end overlaps
function EndOverlap(sourcePhoto, collision)
	for i, photo in pairs(photos) do
		if photo.photo == sourcePhoto then
			photo.intersected = false
			--photo.intersected_with = nil
		end
	end
end

function RemoveMatchedCards(card1, card2)
	--NEED TO: add score
	--NEED TO: Play sound & visual effect
	
	for _, photo in ipairs(CARDS:GetChildren()) do
		if card1 == photo or card2 == photo then
			photo:Destroy()
		end
	end
end

function CheckMatch(source)
	--print(source.photo.name)
	if source.intersected_with == nil then
		return
	end
	if source.photo.name == source.intersected_with.name then
		RemoveMatchedCards(source.photo, source.intersected_with)
		
	else
		print("No match ", source.photo.name, source.intersected_with.name )
	end
end


function DropOnTable(SourcePhoto)
	local source = nil
	-- retrieve the photo from the photos table
	for i, photo in pairs(photos) do
		if photo.photo == SourcePhoto then
			source = photo
		end
	end

	if source == nil then
		return
	end

	--Spawn task to drop the card
	local drop = Task.Spawn(function()
		if source.intersected == false then
			source.photo:SetWorldPosition(source.photo:GetWorldPosition() - Vector3.New(0, 0, 2))
		else
			source.photo:SetWorldPosition(source.photo:GetWorldPosition() + Vector3.New(0, 0, 2))
			Task.GetCurrent():Cancel()
			CheckMatch(source)
		end
	end)

	drop.repeatCount = -1
end

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

	DropOnTable(item.parent.parent)
	item = nil
end

Input.flickedEvent:Connect(function(angle)
	if(last_item ~= nil) then
		local pos = last_item.parent.parent:GetWorldPosition()
		local tween = TWEEN:new(.8,

			{ x = pos.x, y = pos.y, z = pos.z },
			{ x = pos.x + 600 * math.sin(math.rad(angle)), y = pos.y + 600 * math.cos(math.rad(angle)), z = 5 }

		)

		tween:on_change(function(c)
			if(last_item) then
				last_item.parent.parent:SetWorldPosition(Vector3.New(c.x, c.y, c.z))
			end
		end)

		tween:on_complete(function()
			if(last_item ~= nil) then
				DropOnTable(last_item.parent.parent)
			end

			last_item = nil
			tweens[tween] = nil
			tween = nil
		end)

		tween:set_easing(TWEEN.Easings.Out_Cubic)
		tweens[tween] = tween
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

	for index, tween in pairs(tweens) do
		if(tween ~= nil) then
			tween:tween(dt)
		end
	end

	if(is_pinching) then
		local pinch = Input.GetPinchValue()
		local cam = Game.GetLocalPlayer():GetActiveCamera()

		cam.currentDistance = (cam.maxDistance - cam.minDistance) * pinch
	end
	
	-- if(is_rotating) then
	-- 	local rotation = Input.GetRotateValue()

	-- 	rotation = rotation > 0 and (rotation) or rotation

	-- 	local cam = Game.GetLocalPlayer():GetActiveCamera()
	-- 	local cam_rotation = cam:GetWorldRotation()

	-- 	cam:SetRotationOffset(Rotation.New(rotation + current_rotation, 0, 0))
	-- end
end

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

Input.touchStartedEvent:Connect(on_touch_started)
Input.touchStoppedEvent:Connect(on_touch_stopped)
Input.DisableVirtualControls()

Events.Connect("Overlap",Overlap)
Events.Connect("EndOverlap",EndOverlap)
-- Events.Connect("PhotosCreated",function ()
	for _, photo in ipairs(photos) do
		DropOnTable(photo.photo)
	end
-- end)