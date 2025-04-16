function onSay(player, words, param)
    local index = tonumber(param)
    if not index then
        print("[Pokebar DEBUG] Índice inválido recebido: " .. tostring(param))
        return false
    end

    local jsonStr = player:getStorageValue(9001)
    if not jsonStr or jsonStr == -1 then
        print("[Pokebar DEBUG] Nenhum time encontrado para o player: " .. player:getName())
        return false
    end

    local status, pokes = pcall(function() return json.decode(jsonStr) end)
    if not status or type(pokes) ~= "table" then
        print("[Pokebar DEBUG] Falha ao decodificar time do player: " .. player:getName())
        return false
    end

    local data = pokes[index]
    if not data then
        print("[Pokebar DEBUG] Nenhum Pokémon encontrado na posição " .. index)
        return false
    end
    
    -- Se já tiver um summon, remove primeiro
    if hasSummons(player) then
        local usingBall = player:getUsingBall()
        if usingBall then
            local usingBallKey = getBallKey(usingBall:getId())
            doRemoveSummon(player:getId(), balls[usingBallKey].effectRelease, false, true, balls[usingBallKey].missile)
            usingBall:transform(balls[usingBallKey].usedOn)
        end
    end

    -- Aqui, chamamos o Pokémon com os dados recebidos
    -- Certifique-se que a função abaixo esteja adaptada pro seu servidor
    doReleaseSummon(player:getId(), player:getPosition(), 10, true, 0)

    return false
end
