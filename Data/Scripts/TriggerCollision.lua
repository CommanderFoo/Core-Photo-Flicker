local TRIGGER = script.parent
local ROOT = script:GetCustomProperty("Root"):WaitForObject()


function OnBeginOverlap(trigger, other)
	
	Events.Broadcast("Overlap", ROOT, other)
	
end

function OnEndOverlap(trigger, other)
	
    Events.Broadcast("EndOverlap",ROOT, other)
	
end

--Wait for cards to be spawned and dealt
Task.Wait(1)
TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap)