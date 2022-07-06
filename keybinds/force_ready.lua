-- Force all players to be ready, then call for game to start the heist, By ElectricSquid
if Network:is_server() then
    peerCache = managers.network:session():all_peers()

    -- Check if peers are synced
    for k, peer in pairs(peerCache) do
        if not peer:synched() then
            return
        end
    end

    -- Instead of spawning players directly, we attempt to force players to ready up
    for k, peer in pairs(peerCache) do
        peer:set_waiting_for_player_ready(true)
    end

    managers.network:session():check_start_game_intro()
end