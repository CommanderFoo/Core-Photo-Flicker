
-- Custom 
local UICONTAINER = script:GetCustomProperty("UIContainer"):WaitForObject()


local RESTART_BTN = script:GetCustomProperty("RestartBtn"):WaitForObject()
local SHUFFLE_BTN = script:GetCustomProperty("ShuffleBtn"):WaitForObject()
local PAUSE_BTN = script:GetCustomProperty("PauseBtn"):WaitForObject()



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

        if PAUSE_BTN.text == "Pause" then
            PAUSE_BTN.text = "Resume"
        else
            PAUSE_BTN.text = "Pause"
        end

    end
	
end

RESTART_BTN.clickedEvent:Connect(OnClicked)
SHUFFLE_BTN.clickedEvent:Connect(OnClicked)
PAUSE_BTN.clickedEvent:Connect(OnClicked)