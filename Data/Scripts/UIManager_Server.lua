
-- Custom 
local TWEEN = require(script:GetCustomProperty("Tween"))

local UIPANEL_MAIN_BUTTONS = script:GetCustomProperty("UIPanelMainButtons"):WaitForObject()
local RESTART_BTN = script:GetCustomProperty("RestartBtn"):WaitForObject()
local SHUFFLE_BTN_SQUARE = script:GetCustomProperty("ShuffleBtnSquare"):WaitForObject()
local PAUSE_BTN = script:GetCustomProperty("PauseBtn"):WaitForObject()
local PAUSE_PANEL = script:GetCustomProperty("PausePanel"):WaitForObject()
local MATCHES = script:GetCustomProperty("Matches"):WaitForObject()

local CONGRAT_PANEL = script:GetCustomProperty("CongratPanel"):WaitForObject()
local CONGRATS_PLAY_BTN = script:GetCustomProperty("Congrats_PlayBtn"):WaitForObject()

--Pause Panel Buttons
local RESTART_BTN_SMALL = script:GetCustomProperty("RestartBtnSmall"):WaitForObject()
local CONTINUE_BTN_SMALL = script:GetCustomProperty("ContinueBtnSmall"):WaitForObject()
local HELPT_BTN_SMALL = script:GetCustomProperty("HelptBtnSmall"):WaitForObject()
local TITLE_SCEEN_BTN_SMALL = script:GetCustomProperty("TitleSceenBtnSmall"):WaitForObject()

local HELP_PANEL = script:GetCustomProperty("HelpPanel"):WaitForObject()
local HELP_PANEL_CLOSE_BUTTON = script:GetCustomProperty("HelpPanelCloseButton"):WaitForObject()

--Title Screen
local TITLE_SCREEN_PANEL = script:GetCustomProperty("TitleScreenPanel"):WaitForObject()
local PLAY_BUTTON = script:GetCustomProperty("PlayButton"):WaitForObject()


local tweens = {}

local pause_on = false
local congrats_on = false
local tutorial_on = false
local title_on = true

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

    HELP_PANEL.x = 0
    HELP_PANEL.y = y_pos

    TITLE_SCREEN_PANEL.x = 0
    TITLE_SCREEN_PANEL.y = 0
end

function TogglePanel(panel, direction)
    --function Tween:new(duration, from, to, easing, change, complete)
    screen_size = UI.GetScreenSize()
    y_pos = 0
    local tween = nil

    if panel == TITLE_SCREEN_PANEL then

        y_pos = (CoreMath.Round(screen_size.y)) * (-4)

        if direction then
            tween = TWEEN:new(2, { x = 0, y = 0 }, { x = 0, y = y_pos })
        else
            tween = TWEEN:new(2, { x = 0, y = y_pos }, { x = 0, y = 0 } )
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

    else

        y_pos = CoreMath.Round(screen_size.y / 2) + 750

        if direction then
            tween = TWEEN:new(0.5, { x = 0, y = y_pos }, { x = 0, y = 0 })
        else
            tween = TWEEN:new(0.5, { x = 0, y = 0 }, { x = 0, y = y_pos } )
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
end


function OnClicked(button)

    if button == RESTART_BTN then
        button.isInteractable = false
        Events.Broadcast("Restart")
        Events.BroadcastToServer("Restart")
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == SHUFFLE_BTN_SQUARE then
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

        UIPANEL_MAIN_BUTTONS.visibility = Visibility.INHERIT

        Task.Wait(1.5)
        button.isInteractable = true

-- Pause Panel Buttons
    elseif button == RESTART_BTN_SMALL then
        button.isInteractable = false
        Events.Broadcast("Pause")
        Events.BroadcastToServer("Pause")
        pause_on =  not pause_on
        TogglePanel(PAUSE_PANEL, pause_on)
        Events.Broadcast("NewGame")
        Events.BroadcastToServer("NewGame")
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == CONTINUE_BTN_SMALL then
        button.isInteractable = false
        Events.Broadcast("Pause")
        Events.BroadcastToServer("Pause")
        pause_on =  not pause_on
        TogglePanel(PAUSE_PANEL, pause_on)
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == HELPT_BTN_SMALL then
        button.isInteractable = false
        tutorial_on = not tutorial_on
        TogglePanel(HELP_PANEL, pause_on)
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == HELP_PANEL_CLOSE_BUTTON then
        tutorial_on = not tutorial_on
        TogglePanel(HELP_PANEL, tutorial_on)

    elseif button == TITLE_SCEEN_BTN_SMALL then
        button.isInteractable = false
        print("Show Title Screen")
        Task.Wait(1.5)
        button.isInteractable = true

-- Title Screen Buttons
    elseif button == PLAY_BUTTON then
        TogglePanel(TITLE_SCREEN_PANEL, title_on)
        Events.Broadcast("NewGame")
        Events.BroadcastToServer("NewGame")
        title_on = not title_on

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
    UIPANEL_MAIN_BUTTONS.visibility = Visibility.FORCE_OFF
end

SetInitialScreenPos()

RESTART_BTN.clickedEvent:Connect(OnClicked)
SHUFFLE_BTN_SQUARE.clickedEvent:Connect(OnClicked)
PAUSE_BTN.clickedEvent:Connect(OnClicked)
CONGRATS_PLAY_BTN.clickedEvent:Connect(OnClicked)
--Pause Panel Buttons
RESTART_BTN_SMALL.clickedEvent:Connect(OnClicked)
CONTINUE_BTN_SMALL.clickedEvent:Connect(OnClicked)
HELPT_BTN_SMALL.clickedEvent:Connect(OnClicked)
HELP_PANEL_CLOSE_BUTTON.clickedEvent:Connect(OnClicked)
TITLE_SCEEN_BTN_SMALL.clickedEvent:Connect(OnClicked)
--Title Screen Buttons
PLAY_BUTTON.clickedEvent:Connect(OnClicked)


Events.Connect("match_UI", UpdateMatchUI)
Events.Connect("game_over", GameOver)