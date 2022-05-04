local TRIGGER = script.parent
local ROOT = script:GetCustomProperty("Root"):WaitForObject()


function OnBeginOverlap(trigger, other)
    if other:IsA("Trigger") then
        local trigger_script = other:FindChildByName("TriggerCollision")
        local cardParent = trigger_script:GetCustomProperty("Root")
        Events.Broadcast("Overlap", ROOT, cardParent)
    else
        Events.Broadcast("Overlap", ROOT, other)
    end
	
end

function OnEndOverlap(trigger, other)
    Events.Broadcast("EndOverlap",ROOT, other)	
end

--Wait for cards to be spawned and dealt
Task.Wait(1)
TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap)