local TRIGGER = script.parent
local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local overlaps = {}



function OnBeginOverlap(trigger, other)
    if other:IsA("Trigger") then
        local trigger_script = other:FindChildByName("TriggerCollision")
        local cardParent = trigger_script:GetCustomProperty("Root")
        --print(ROOT.name, ROOT.clientUserData.current)
        if ROOT.clientUserData.current then
            --print(ROOT.name, ROOT:GetWorldPosition().z,cardParent:GetObject().name, cardParent:GetObject():GetWorldPosition().z)
            table.insert(overlaps, {cardParent, z=other:GetWorldPosition().z})
            if #overlaps > 1 then
                --Make sure all overlaps still exist
                -- for i, photo in ipairs(overlaps) do
                --     if not (Object:IsValid(photo[1]:GetObject()) ) then
                --         table.remove(overlaps,i)
                --     end
                -- end
                --Sort overlaps in order of highest Z height
                table.sort(overlaps, function (z1, z2) return z1.z > z2.z end) 
            end
            --print(ROOT, ROOT.name, cardParent, cardParent:GetObject().name, #overlaps)
            --print("Broadcast overlap, ", ROOT, overlaps[1])
            Events.Broadcast("Overlap", ROOT, overlaps[1][1])
            
        end
    else
        --print("Overlaps: ", #overlaps)
        Events.Broadcast("Overlap", ROOT, other)
    end
	
end

function OnEndOverlap(trigger, other)
   -- print("EndOverlap", other)
    if other:IsA("Trigger") then
        local trigger_script = other:FindChildByName("TriggerCollision")
        if Object.IsValid(trigger_script) then
        	local cardParent = trigger_script:GetCustomProperty("Root")
        	
	        for i,card in pairs(overlaps) do
	            if card[1] == cardParent then
	                table.remove(overlaps, i)
	                if i ~= 1 then
	                    Events.Broadcast("Overlap", ROOT, overlaps[1][1])
	                end
	            end
	        end
        end
    end
    Events.Broadcast("EndOverlap",ROOT, other)	
end

--Wait for cards to be spawned and dealt
Task.Wait(1)
TRIGGER.beginOverlapEvent:Connect(OnBeginOverlap)
TRIGGER.endOverlapEvent:Connect(OnEndOverlap)