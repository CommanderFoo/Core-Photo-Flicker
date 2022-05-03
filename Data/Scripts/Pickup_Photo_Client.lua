
local TWEEN = require(script:GetCustomProperty("Tween"))
local CARDS = script:GetCustomProperty("Cards"):WaitForObject()

local item = nil
local last_item = nil
local tween = nil

local photos = {}

CARDS.childAddedEvent:Connect(function ()
	--photos = {}
	local exists = false
	for _, card in ipairs(CARDS:GetChildren()) do
		for _, photo in ipairs(photos) do
			if photo.photo == card then
				exists = true
				
			end
		end
		if not exists then
			table.insert(photos, {photo = card, intersected = false})
		end
		exists = false
		
	end
end)

--Photo trigger overlaps
function Overlap(sourcePhoto, collision)
	--print(sourcePhoto, " collided with ", collision)
	for i, photo in ipairs(photos) do
		if photo.photo == sourcePhoto then
			photo.intersected = true
		end
	end
	
end
--Photo trigger  end overlaps
function EndOverlap(sourcePhoto, collision)
	for i, photo in ipairs(photos) do
		if photo.photo == sourcePhoto then
			photo.intersected = false
		end
	end
end

function DropOnTable(SourcePhoto)
	local source = nil
	-- retrieve the photo from the photos table 
	for i, photo in ipairs(photos) do
		if photo.photo == SourcePhoto then
			source = photo
		end
	end
	
	if source == nil then
		return
	end
	--Spawn task to drop the card
	local drop = Task.Spawn(function ()
		if source.intersected == false then
			source.photo:SetWorldPosition(source.photo:GetWorldPosition() - Vector3.New(0,0,2))
		else
			source.photo:SetWorldPosition(source.photo:GetWorldPosition() + Vector3.New(0,0,2))
			Task.GetCurrent():Cancel()
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
			DropOnTable(last_item.parent.parent)
			tween = nil
			last_item = nil
		end)

		tween:set_easing(TWEEN.Easings.Out_Cubic)
	end
end)


Events.Connect("Overlap",Overlap)
Events.Connect("EndOverlap",EndOverlap)
Events.Connect("PhotosCreated",function ()
	for _, photo in ipairs(photos) do
		DropOnTable(photo.photo)
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