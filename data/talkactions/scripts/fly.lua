local prohibitedItems = {}

function onSay(player, words)
    -- Verificação para a funcionalidade de subir em uma escada (surf)
    if words == "!up" and player:getStorageValue(storageDive) > 0 then
        local nextPosition = player:getPosition():moveUpstairs()
        local tile = Tile(nextPosition)
        if tile and isInArray(waterIds, tile:getGround():getId()) and hasSummons(player) and MonsterType(player:getSummon():getName()):isSurfable() > 0 then
            player:setStorageValue(storageDive, -1)
            player:removeCondition(CONDITION_OUTFIT)
            player:teleportTo(nextPosition, false)
            player:say("I can now surf upwards!", TALKTYPE_MONSTER_SAY)  -- Mensagem de sucesso
        else
            player:say("You need a surfable pokemon to go up.", TALKTYPE_MONSTER_SAY)  -- Mensagem de erro
        end
        return true
    end

    -- Verificação se o jogador está voando
    if not player:isOnFly() then
        player:say("You are not flying.", TALKTYPE_MONSTER_SAY)  -- Mensagem de erro
        return false
    end

    -- Controle de delay para os comandos !up e !down
    local last = player:getStorageValue(storageDelay)
    local interval = 0.5 -- intervalo de tempo em segundos
    if last + interval > os.time() then
        --  player:say("You are exhausted. Try again later.", TALKTYPE_MONSTER_SAY)  -- Mensagem de delay
        return false
    end

    -- Comando !up
    if words == "!up" then
        local ret = player:flyUp()
        if ret == false then
            player:say("You cannot fly up.", TALKTYPE_MONSTER_SAY)  -- Mensagem de erro
        else
            player:activateFly()
            player:setStorageValue(storageDelay, os.time())
            -- Escolher o efeito para subida, aqui você escolhe o ID que deseja (12 como exemplo)
            local upEffect = 900  -- Troque esse ID para o efeito desejado para subida
            player:getPosition():sendMagicEffect(upEffect)  -- Mudança para chamar o efeito na posição do jogador
            player:say("I am flying up!", TALKTYPE_MONSTER_SAY)  -- Mensagem de sucesso
        end

    -- Comando !down
    elseif words == "!down" then
        local ret = player:flyDown()
        if ret == false then
            -- player:say("You cannot fly down.", TALKTYPE_MONSTER_SAY)  -- Mensagem de erro
        else
            player:deactivateFly()
            player:setStorageValue(storageDelay, os.time())
            -- Escolher o efeito para descida, aqui você escolhe o ID que deseja (13 como exemplo)
            local downEffect = 901  -- Troque esse ID para o efeito desejado para descida
            player:getPosition():sendMagicEffect(downEffect)  -- Mudança para chamar o efeito na posição do jogador
            player:say("I am flying down!", TALKTYPE_MONSTER_SAY)  -- Mensagem de sucesso
        end
    end

    return false
end

