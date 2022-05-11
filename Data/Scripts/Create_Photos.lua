local TWEEN = require(script:GetCustomProperty("Tween"))
--local PHOTO = script:GetCustomProperty("3DPhoto")
local CARDS = script:GetCustomProperty("Cards"):WaitForObject()
local THEMES = require(script:GetCustomProperty("Themes"))

local TIMER = script:GetCustomProperty("Timer"):WaitForObject()



local CARD_SET = nil

local tweens = {}
local z = 0.001
local height_offset = 0.001
local ui_z_offset = 0.01

local timer = 0
local timer_pause = false

local matches_remaining = 0

function DealPhotos()
	CARD_SET = THEMES[math.random(#THEMES)].cards
	--Deal each card in the theme twice so have pairs
	for i = 1, 2 do
		CreatePhotos()
	end
	timer = 0
	matches_remaining = #CARD_SET
end

function ThrowPhoto(photo)
	local pos = Vector3.New(-450, 0, z)
	local duration = CoreMath.Clamp(math.random(), 0.4, .8)
	local tween = TWEEN:new(duration, { x = -700, y = 0 }, { x = math.random(-150, 800), y = math.random(-600, 600) })
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

		photo:SetPosition(pos)
	end)

	local can_delay = math.random(2)

	tween:set_delay(can_delay == 1 and .5 or 0)
	tween:set_easing(TWEEN.Easings.Out_Cubic)

	table.insert(tweens, tween)
	z = z + .1

end


function CreatePhotos()
	for i = 1, #CARD_SET do
		-- spawn the photos under a folder so PickupPhotoClient can find them easy
		local current_card = CARD_SET[i].photo
		local photo = World.SpawnAsset(current_card, { parent = CARDS })
		
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
		
		ThrowPhoto(photo)
		
	end
end

function Restart()
	for _, photo in ipairs(CARDS:GetChildren()) do
		photo:Destroy()
	end
	z = 0.001
	DealPhotos()
	timer = 0
end

function Reshuffle()
	z = 0.001
	for _, photo in ipairs(CARDS:GetChildren()) do
		photo:SetWorldPosition(CARDS:GetWorldPosition())
		ThrowPhoto(photo)
	end
	
end

function PauseGame()
	timer_pause = not(timer_pause )
	
end

function Tick(dt)
	if not timer_pause then
		timer = timer + dt
	end
	if timer <= 0 then
		TIMER.text = "00:00"
	else
		--format timer
		local hours = string.format("%02.f", math.floor(timer/3600))
    	local mins = string.format("%02.f", math.floor(timer/60 - (hours*60)))
    	local secs = string.format("%02.f", math.floor(timer - hours*3600 - mins *60))

		TIMER.text = mins..":"..secs
		--TIMER.text = string.format("%.2f", timer)
		for index, t in ipairs(tweens) do
			if(t ~= nil) then
				t:tween(dt)
			end
		end
	end
end

Game.playerJoinedEvent:Connect(DealPhotos)

Events.Connect("Pause",PauseGame)
Events.Connect("Reshuffle", Reshuffle)
Events.Connect("Restart", Restart)
Events.Connect("destroy_card", function(card)
	if(card ~= nil and Object.IsValid(card:GetObject())) then
		card:GetObject():SetWorldPosition(Vector3.New(100, 0, -1000))
		card:GetObject():Destroy()
		Events.Broadcast("increase_score", 100)
	end
end)