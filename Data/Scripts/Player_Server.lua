local cards_remaining
local local_player

local function on_player_joined(player)
	local_player = player
	Task.Wait()
	player.isVisible = false
	player.isMovementEnabled = false
end
local function SetInitialCards(no_cards)
	cards_remaining = no_cards * 2
	Events.BroadcastToPlayer(local_player,"match_UI", cards_remaining)
end
local function AdjustMatches()
	
	cards_remaining = cards_remaining - 1
	Events.BroadcastToPlayer(local_player,"match_UI", cards_remaining)
	if cards_remaining <= 0 then
		Events.Broadcast("game_over")
		Events.BroadcastToPlayer(local_player,"game_over")
	end
end

Game.playerJoinedEvent:Connect(on_player_joined)
Events.Connect("match",AdjustMatches)
Events.Connect("match_deal", SetInitialCards)