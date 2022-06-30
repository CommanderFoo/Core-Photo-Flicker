
-- Custom 
local TWEEN = require(script:GetCustomProperty("Tween"))

local UIPANEL_MAIN_BUTTONS = script:GetCustomProperty("UIPanelMainButtons"):WaitForObject()
local RESTART_BTN = script:GetCustomProperty("RestartBtn"):WaitForObject()
local SHUFFLE_BTN_SQUARE = script:GetCustomProperty("ShuffleBtnSquare"):WaitForObject()
local PAUSE_BTN = script:GetCustomProperty("PauseBtn"):WaitForObject()
local PAUSE_PANEL = script:GetCustomProperty("PausePanel"):WaitForObject()
local MATCHES = script:GetCustomProperty("Matches"):WaitForObject()

local CONGRAT_PANEL = script:GetCustomProperty("CongratPanel"):WaitForObject()
local CONGRAT_PANEL_TITLE_BTN = script:GetCustomProperty("CongratPanelTitleBtn"):WaitForObject()
local CONGRATS_PLAY_BTN = script:GetCustomProperty("Congrats_PlayBtn"):WaitForObject()


--Pause Panel Buttons
local RESTART_BTN_SMALL = script:GetCustomProperty("RestartBtnSmall"):WaitForObject()
local CONTINUE_BTN_SMALL = script:GetCustomProperty("ContinueBtnSmall"):WaitForObject()
local HELPT_BTN_SMALL = script:GetCustomProperty("HelptBtnSmall"):WaitForObject()
local TITLE_SCEEN_BTN_SMALL = script:GetCustomProperty("TitleSceenBtnSmall"):WaitForObject()

local HELP_PANEL = script:GetCustomProperty("HelpPanel"):WaitForObject()
local HELP_PANEL_CLOSE_BUTTON = script:GetCustomProperty("HelpPanelCloseButton"):WaitForObject()

--Title Screen Buttons
local TITLE_PLAY_BTN = script:GetCustomProperty("Title_PlayBtn"):WaitForObject()
local TITLE_ROOT = script:GetCustomProperty("Title_Root"):WaitForObject()

local PAUSE_PANEL_MATCHES_LEFT = script:GetCustomProperty("PausePanel_MatchesLeft"):WaitForObject()
local PAUSE_BEST_TIME_BOX = script:GetCustomProperty("Pause_BestTimeBox"):WaitForObject()

local CONGRAT_PANEL_BEST_TIME_BOX = script:GetCustomProperty("CongratPanelBestTimeBox"):WaitForObject()
local TOAL_WINS_BOX = script:GetCustomProperty("ToalWinsBox"):WaitForObject()

local TITLE_TUT_BTN = script:GetCustomProperty("Title_TutBtn"):WaitForObject()
local TITLE_LB_BTN = script:GetCustomProperty("Title_LB_Btn"):WaitForObject()

local tweens = {}

local pause_on = false
local congrats_on = false
local tutorial_on = false
local leaderboard_on = false
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

function TitleScreenAnimation(direction)
    
    local BTNS_PANEL = TITLE_ROOT:GetCustomProperty("BtnsPanel"):WaitForObject()
    local BG_PANEL = TITLE_ROOT:GetCustomProperty("BGPanel"):WaitForObject()
    local TITLE_TEXT_PANEL = TITLE_ROOT:GetCustomProperty("TitleTextPanel"):WaitForObject()

    local BG_Indiv_Panels = BG_PANEL:GetChildren()
    
    screen_size = UI.GetScreenSize()
    y_pos = CoreMath.Round(screen_size.y) * 5
    
    local tween = nil
    local tween_BG = nil
    
    --Fade opacity on btns and title text to 0
    --BG Height to - screensize
    
    
    --function Tween:new(duration, from, to, easing, change, complete)
    if direction then
        tween = TWEEN:new(1,{opacity = 1},{opacity = 0})
        tween_BG = TWEEN:new(1.5,{height = 0}, {height = -y_pos})
    else
        tween = TWEEN:new(1,{opacity = 0},{opacity = 1} )
        tween_BG = TWEEN:new(1.5,{height = -y_pos}, {height = 0})
    end


    tween_BG:on_complete(function ()
        if not direction then
            table.insert(tweens, tween)
        end
        tween_BG = nil
    end)

    tween_BG:on_change(function(c)
        
        --BG_PANEL.height =CoreMath.Round(c.height)
        --BG_PANEL.y =CoreMath.Round(c.height)

        for _, panel in ipairs(BG_Indiv_Panels) do
            panel.y = CoreMath.Round(c.height)
        end


    end)

    tween:on_complete(function()
        if direction then
            table.insert(tweens, tween_BG)
            BTNS_PANEL.isEnabled = false
        else
            BTNS_PANEL.isEnabled = true
        end
        tween = nil
    end)

    tween:on_change(function(c)

        BTNS_PANEL.opacity = c.opacity
        TITLE_TEXT_PANEL.opacity = c.opacity

    end)


    tween:set_easing(TWEEN.Easings.OutSine)
    tween_BG:set_easing((TWEEN.Easings.OutSine))

    if direction then
        table.insert(tweens, tween)
    else
        table.insert(tweens, tween_BG)
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

        --PAUSE_PANEL_MATCHES_LEFT.text = matches
	    --PAUSE_PANEL_TIME.text = timer
	    --PAUSE_PANEL_BEST_TIME = bestTime

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

    elseif button == CONGRAT_PANEL_TITLE_BTN then
        button.isInteractable = false
        congrats_on = not congrats_on
        TogglePanel(CONGRAT_PANEL, congrats_on)
        TitleScreenAnimation(false)
        Task.Wait(1.5)
        button.isInteractable = true

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
        TitleScreenAnimation(false)          -- Add functionality here
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == TITLE_PLAY_BTN then
        button.isInteractable = false
        TitleScreenAnimation(true)
        Events.Broadcast("NewGame")
        Events.BroadcastToServer("NewGame")
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == TITLE_TUT_BTN then
        button.isInteractable = false
        tutorial_on = not tutorial_on
        TogglePanel(HELP_PANEL, tutorial_on)
        Task.Wait(1.5)
        button.isInteractable = true

    elseif button == TITLE_LB_BTN then
        print("Broadcast to Leaderboard ToggleLeaderBoard")
        button.isInteractable = false
        --leaderboard_on = not leaderboard_on
        Events.Broadcast("ToggleLeaderBoard")
        Task.Wait(1.5)
        button.isInteractable = true
    end

end

function UpdateMatchUI(matches)
    MATCHES.text = "Left: " ..tostring(matches)
    local photosFound = string.format("%02.f", (20 - tostring(matches)))
    PAUSE_PANEL_MATCHES_LEFT.text = photosFound .. " / " .. "20"
end

function Tick(dt)
	
    for index, t in ipairs(tweens) do
        if(t ~= nil) then
            t:tween(dt)
        end
    end
	
end

function ShowPausePanelStats(bestTime)
    
    local mins = string.format("%02.f", math.floor(bestTime/60))
	local secs = string.format("%02.f", math.floor(bestTime - mins *60))
	PAUSE_BEST_TIME_BOX.text.text = mins..":"..secs
end

function ShowStats(wins, bestTime)
    local mins = string.format("%02.f", math.floor(bestTime/60))
	local secs = string.format("%02.f", math.floor(bestTime - mins *60))

	CONGRAT_PANEL_BEST_TIME_BOX.text = mins..":"..secs
    TOAL_WINS_BOX.text = tostring(wins)
    PAUSE_BEST_TIME_BOX.text = mins..":"..secs
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
CONGRAT_PANEL_TITLE_BTN.clickedEvent:Connect(OnClicked)

RESTART_BTN_SMALL.clickedEvent:Connect(OnClicked)
CONTINUE_BTN_SMALL.clickedEvent:Connect(OnClicked)
HELPT_BTN_SMALL.clickedEvent:Connect(OnClicked)
HELP_PANEL_CLOSE_BUTTON.clickedEvent:Connect(OnClicked)
TITLE_SCEEN_BTN_SMALL.clickedEvent:Connect(OnClicked)
TITLE_PLAY_BTN.clickedEvent:Connect(OnClicked)
TITLE_TUT_BTN.clickedEvent:Connect(OnClicked)
TITLE_LB_BTN.clickedEvent:Connect(OnClicked)

Events.Connect("match_UI", UpdateMatchUI)
Events.Connect("game_over", GameOver)
Events.Connect("show_stats", ShowStats)