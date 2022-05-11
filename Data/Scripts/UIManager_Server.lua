
-- Custom 
local UICONTAINER = script:GetCustomProperty("UIContainer"):WaitForObject()


local RESTART_BTN = script:GetCustomProperty("RestartBtn"):WaitForObject()
local SHUFFLE_BTN = script:GetCustomProperty("ShuffleBtn"):WaitForObject()
local PAUSE_BTN = script:GetCustomProperty("PauseBtn"):WaitForObject()
local PAUSE_PANEL = script:GetCustomProperty("PausePanel"):WaitForObject()


local TWEEN = require(script:GetCustomProperty("Tween"))

local tweens = {}

local pause_on = false
local screen_size = nil
local y_pos = nil

--set initial pause screen position
function SetPauseScreenPos()
    screen_size = UI.GetScreenSize()
    y_pos  = CoreMath.Round(screen_size.y / 2) + 750
    print(screen_size, y_pos)
    PAUSE_PANEL.x = 0
    PAUSE_PANEL.y = y_pos
end



function OnClicked(button)
    
    if button == RESTART_BTN then
        button.isInteractable = false
        Events.Broadcast("Restart")
        Events.BroadcastToServer("Restart")
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == SHUFFLE_BTN then
       
        button.isInteractable = false
        Events.Broadcast("Reshuffle")
        Events.BroadcastToServer("Reshuffle")
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == PAUSE_BTN then
        Events.Broadcast("Pause")
        Events.BroadcastToServer("Pause")
        pause_on =  not pause_on
        --function Tween:new(duration, from, to, easing, change, complete)
        screen_size = UI.GetScreenSize()
        y_pos = CoreMath.Round(screen_size.y / 2) + 750

        local tween = nil

        if pause_on then
            tween = TWEEN:new(1.2, { x = 0, y = y_pos }, { x = 0, y = 0 })
        else
            tween = TWEEN:new(1.2, { x = 0, y = 0 }, { x = 0, y = y_pos } )
        end


        tween:on_complete(function()
            tween = nil
        end)
    
        tween:on_change(function(c)
    

            PAUSE_PANEL.x = c.x
            PAUSE_PANEL.y = c.y

        end)

        tween:set_easing(TWEEN.Easings.OutSine)

        table.insert(tweens, tween)

        -- if PAUSE_BTN.text == "Pause" then
        --     PAUSE_BTN.text = "Resume"
        -- else
        --     PAUSE_BTN.text = "Pause"
        -- end

    end
	
end


function Tick(dt)
	
    for index, t in ipairs(tweens) do
        if(t ~= nil) then
            t:tween(dt)
        end
    end
	
end

SetPauseScreenPos()

RESTART_BTN.clickedEvent:Connect(OnClicked)
SHUFFLE_BTN.clickedEvent:Connect(OnClicked)
PAUSE_BTN.clickedEvent:Connect(OnClicked)