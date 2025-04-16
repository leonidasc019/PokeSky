function onLogin(player)
    addEvent(function(cid)
        local p = Player(cid)
        if p then
            doSendPokeTeamByClient(p)
        end
    end, 0, player:getId())
    return true
end