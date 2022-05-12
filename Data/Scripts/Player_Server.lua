local cards_remaining
local local_player

local function OnResourceChanged(player, resourceId, newValue)
	local data = Storage.GetPlayerData(player)

    data.wins = player:GetResource("wins")
	data.best_time = player:GetResource("best_time")
    Storage.SetPlayerData(player, data)
end

local function on_player_joined(player)
	local_player = player

	player.resourceChangedEvent:Connect(OnResourceChanged)

	-- Get persistent Data
	local data = Storage.GetPlayerData(player)
	player:SetResource("wins", data.wins or 0)
	player:SetResource("best_time", math.tointeger(data.best_time) or math.tointeger(0))

	

	Task.Wait()
	player.isVisible = false
	player.isMovementEnabled = false
end

local function PlayerLeft(player)
	-- Save persistent Data
    local data = Storage.GetPlayerData(player)

    data.wins = player:GetResource("wins")
	data.best_time = player:GetResource("best_time")
    Storage.SetPlayerData(player, data)
end

local function SetInitialCards(no_cards)
	cards_remaining = no_cards * 2
	Events.BroadcastToPlayer(local_player,"match_UI", cards_remaining)
end

local function AdjustMatches()
	
	cards_remaining = cards_remaining - 1
	Events.BroadcastToPlayer(local_player,"match_UI", cards_remaining)
	if cards_remaining <= 0 then
		
		
		Events.Broadcast("game_over", local_player)
		Events.BroadcastToPlayer(local_player,"game_over")
	end
end

local function SetPlayerStats(game_time)
	--convert time so can be stored as integer. Save to 4 decimal spots
	local time_converted = CoreMath.Round(game_time * 1000)
	local_player:AddResource("wins",1)
	local t = local_player:GetResource("best_time") or 0
	if t > 0 then
		if time_converted <= t then
			--Events.Broadcast("new_record")		--nothing is listening to this yet
			local_player:SetResource("best_time", math.tointeger(time_converted))
			print("new record ", time_converted, t)
		else
			print("NO record ", time_converted, t)
		end
	else
		local_player:SetResource("best_time", math.tointeger(time_converted))
	end

	--get updated data to display on Congrats Panel
	local data = Storage.GetPlayerData(local_player)
    data.wins = local_player:GetResource("wins")
	data.best_time = local_player:GetResource("best_time") / 1000

	Events.BroadcastToPlayer(local_player, "show_stats", data.wins, data.best_time)
end



Game.playerJoinedEvent:Connect(on_player_joined)
Game.playerLeftEvent:Connect(PlayerLeft)
Events.Connect("match",AdjustMatches)
Events.Connect("match_deal", SetInitialCards)
Events.Connect("finish_time", SetPlayerStats)