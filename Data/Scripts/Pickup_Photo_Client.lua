
local TWEEN = require(script:GetCustomProperty("Tween"))
local CARDS = script:GetCustomProperty("Cards"):WaitForObject()
local MATCH_VFX = script:GetCustomProperty("MatchVFX")
local PICKUP_VFX = script:GetCustomProperty("PickupVFX")

local item = nil
local last_item = nil

local tweens = {}
local photos = {}

local pause_touch

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
			return
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
	
	for _, photo in ipairs(CARDS:GetChildren()) do
		if card1 == photo or card2 == photo then
			local position = photo:GetWorldPosition()

			-- card1:SetWorldPosition(Vector3.New(100, 0, -1000))
			-- card2:SetWorldPosition(Vector3.New(200, 0, -1000))

			Events.BroadcastToServer("destroy_card", photo:GetReference())

			if(Object.IsValid(photo)) then
				photo:SetWorldPosition(Vector3.New(100, 0, -1000))
				photo:Destroy()
			end

			local VFX = World.SpawnAsset(MATCH_VFX, {position = position, lifeSpan  = 1})
		end
	end
end

function CheckMatch(source)
	--print(source.photo.name)
	if source.intersected_with == nil then
		return
	end
	--print(source.photo.name, " interesected_with ", source.intersected_with.name)
	if source.photo.name == source.intersected_with.name then
		--print(source.photo.name, " interesected_with ", source.intersected_with.name, "remove match")
		RemoveMatchedCards(source.photo, source.intersected_with)
		
	else
		--print("No match ", source.photo.name, source.intersected_with.name )
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
		if(not Object.IsValid(source.photo)) then
			Task.GetCurrent():Cancel()
			return
		end

		if source.intersected == false then
			source.photo:SetWorldPosition(source.photo:GetWorldPosition() - Vector3.New(0, 0, 2))
		else
			source.photo:SetWorldPosition(source.photo:GetWorldPosition() + Vector3.New(0, 0, 2))
			CheckMatch(source)
			if Object.IsValid(source.photo) then
				source.photo.clientUserData.current = false
			end
			Task.GetCurrent():Cancel()
			last_item = nil
		end
	end)

	drop.repeatCount = -1
end

local function on_touch_started(position)
	if pause_touch then
		return
	end
	if(last_item ~= nil) then
		return
	end
	
	local hit = UI.GetHitResult(position)

	if(hit ~= nil and hit.other.name == "Frame") then
		item = hit.other
		last_item = item
		last_item.parent.parent.clientUserData.current = true
		local VFX = World.SpawnAsset(PICKUP_VFX, {lifeSpan  = 1})

	end
end

local function on_touch_stopped()
	if(item == nil) then
		return
	end

	if(Object.IsValid(item)) then
		DropOnTable(item.parent.parent)
	end

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
			if(last_item and Object.IsValid(last_item)) then
				last_item.parent.parent:SetWorldPosition(Vector3.New(c.x, c.y, c.z))
			end
		end)

		tween:on_complete(function()
			if(last_item ~= nil and Object.IsValid(last_item)) then
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

function PauseTouch()
	pause_touch = not pause_touch
end


function Tick(dt)
	if(item ~= nil) then
		local pointer = Input.GetPointerPosition()

		if(pointer ~= nil) then
			local hit = UI.GetHitResult(pointer)

			if(hit ~= nil and hit ~= item and Object.IsValid(item)) then
				item.parent.parent:SetWorldPosition(Vector3.New(hit:GetImpactPosition().x, hit:GetImpactPosition().y, 60))
			end
		end
	end

	for index, tween in pairs(tweens) do
		if(tween ~= nil) then
			tween:tween(dt)
		end
	end
end

Input.DisableVirtualControls()

Input.touchStartedEvent:Connect(on_touch_started)
Input.touchStoppedEvent:Connect(on_touch_stopped)


Events.Connect("Overlap",Overlap)
Events.Connect("EndOverlap",EndOverlap)
Events.Connect("Pause", PauseTouch)
-- Events.Connect("PhotosCreated",function ()
	-- for _, photo in ipairs(photos) do
	-- 	DropOnTable(photo.photo)
	-- end
-- end)