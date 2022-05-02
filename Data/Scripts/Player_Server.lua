local function on_player_joined(player)
	Task.Wait()
	player.isVisible = false
	player.isMovementEnabled = false
end

Game.playerJoinedEvent:Connect(on_player_joined)