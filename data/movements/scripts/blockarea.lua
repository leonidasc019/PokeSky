function onStepIn(cid, item, position, fromPosition)
    local levelRequired = 150 -- Nível necessário para passar
    if isPlayer(cid) then
        if getPlayerLevel(cid) < levelRequired then
            doTeleportThing(cid, fromPosition) -- Retorna o jogador
            -- doSendMagicEffect(fromPosition, CONST_ME_POFF) -- Efeito visual
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voce precisa ser nivel " .. levelRequired .. " para ir para high area.")
        else
            doSendMagicEffect(position, CONST_ME_MAGIC_BLUE) -- Efeito se permitido passar
        end
    end
    return true
end