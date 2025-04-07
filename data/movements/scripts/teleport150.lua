function onStepIn(cid, item, position, fromPosition)
    local levelRequired = 150 -- Nível necessário para ser teleportado

    -- Coordenadas dos três destinos possíveis
    local destinations = {
        [114] = {x = 603, y = 838, z = 12}, -- Destino para o actionid 
        [115] = {x = 246, y = 618, z = 12}, -- Destino para o actionid
        [116] = {x = 258, y = 999, z = 12}  -- Destino para o actionid 
    }

    -- Verifica se o jogador tem o nível necessário
    if isPlayer(cid) then
        local actionId = item.actionid -- Obtém o actionid do piso onde o jogador pisou
        local destination = destinations[actionId] -- Obtém a posição de destino com base no actionid

        -- Verifica se o actionid tem um destino configurado
        if destination then
            if getPlayerLevel(cid) >= levelRequired then
                doTeleportThing(cid, destination) -- Teleporta o jogador
                doSendMagicEffect(destination, CONST_ME_TELEPORT) -- Efeito de teleportação
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para a high area!")
            else
                doTeleportThing(cid, fromPosition) -- Retorna o jogador se não tiver nível suficiente
                -- doSendMagicEffect(fromPosition, CONST_ME_POFF) -- Efeito de bloqueio
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voce precisa ser nível " .. levelRequired .. " para acessar esta area.")
            end
        end
    end

    return true
end
