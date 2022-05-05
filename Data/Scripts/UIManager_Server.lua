
-- Custom 
local UICONTAINER = script:GetCustomProperty("UIContainer"):WaitForObject()


local RESTART_BTN = script:GetCustomProperty("RestartBtn"):WaitForObject()
local SHUFFLE_BTN = script:GetCustomProperty("ShuffleBtn"):WaitForObject()



function OnClicked(button)
    print(button, SHUFFLE_BTN)
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
    end
	
end

RESTART_BTN.clickedEvent:Connect(OnClicked)
SHUFFLE_BTN.clickedEvent:Connect(OnClicked)