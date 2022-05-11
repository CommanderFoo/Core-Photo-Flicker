
-- Custom 
local TWEEN = require(script:GetCustomProperty("Tween"))



local RESTART_BTN = script:GetCustomProperty("RestartBtn"):WaitForObject()
local SHUFFLE_BTN = script:GetCustomProperty("ShuffleBtn"):WaitForObject()
local PAUSE_BTN = script:GetCustomProperty("PauseBtn"):WaitForObject()
local PAUSE_PANEL = script:GetCustomProperty("PausePanel"):WaitForObject()
local MATCHES = script:GetCustomProperty("Matches"):WaitForObject()

local CONGRAT_PANEL = script:GetCustomProperty("CongratPanel"):WaitForObject()
local CONGRATS_PLAY_BTN = script:GetCustomProperty("Congrats_PlayBtn"):WaitForObject()



local tweens = {}

local pause_on = false
local congrats_on = false
local screen_size = nil
local y_pos = nil

--set initial pause screen position
function SetInitialScreenPos()
    screen_size = UI.GetScreenSize()
    y_pos  = CoreMath.Round(screen_size.y / 2) + 750
    
    PAUSE_PANEL.x = 0
    PAUSE_PANEL.y = y_pos

    CONGRAT_PANEL.x = 0
    CONGRAT_PANEL.y = y_pos
end

function TogglePanel(panel, direction)
    --function Tween:new(duration, from, to, easing, change, complete)
    screen_size = UI.GetScreenSize()
    y_pos = CoreMath.Round(screen_size.y / 2) + 750

    local tween = nil

    if direction then
        tween = TWEEN:new(1.2, { x = 0, y = y_pos }, { x = 0, y = 0 })
    else
        tween = TWEEN:new(1.2, { x = 0, y = 0 }, { x = 0, y = y_pos } )
    end


    tween:on_complete(function()
        tween = nil
    end)

    tween:on_change(function(c)


        panel.x = c.x
        panel.y = c.y

    end)

    tween:set_easing(TWEEN.Easings.OutSine)

    table.insert(tweens, tween)
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
        TogglePanel(PAUSE_PANEL, pause_on)

    elseif button == CONGRATS_PLAY_BTN then
        button.isInteractable = false
        congrats_on = not congrats_on
        TogglePanel(CONGRAT_PANEL, congrats_on)
        Events.Broadcast("NewGame")
        Events.BroadcastToServer("NewGame")
        Task.Wait(1.5)
        button.isInteractable = true
       

    end
	
end

function UpdateMatchUI(matches)
    MATCHES.text = "Left: " ..tostring(matches)
end

function Tick(dt)
	
    for index, t in ipairs(tweens) do
        if(t ~= nil) then
            t:tween(dt)
        end
    end
	
end

function GameOver()
    congrats_on = not congrats_on
    TogglePanel(CONGRAT_PANEL, congrats_on)
end

SetInitialScreenPos()

RESTART_BTN.clickedEvent:Connect(OnClicked)
SHUFFLE_BTN.clickedEvent:Connect(OnClicked)
PAUSE_BTN.clickedEvent:Connect(OnClicked)
CONGRATS_PLAY_BTN.clickedEvent:Connect(OnClicked)

Events.Connect("match_UI", UpdateMatchUI)
Events.Connect("game_over", GameOver)