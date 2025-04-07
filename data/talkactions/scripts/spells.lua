function onSay(player, words, param)
    -- Verifica se o jogador tem acesso administrativo
    if not player:getGroup():getAccess() then
        player:sendCancelMessage("Voce nao tem permissao para usar este comando.")
        return false
    end

    -- Verifica se o parametro e valido
    local spellId = tonumber(param)
    if not spellId then
        player:sendCancelMessage("Por favor, insira um ID de feitiço valido.")
        return false
    end

    -- Define a posicao do jogador
    local position = player:getPosition()

    -- Executa o efeito visual na posicao do jogador
    local success = position:sendMagicEffect(spellId)
    if not success then
        player:sendCancelMessage("Feitico ID " .. spellId .. " nao pode ser executado como efeito visual.")
        return false
    end

    -- Mensagem de confirmacao
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Feitico ID " .. spellId .. " executado com efeito visual na sua posicao.")
    return false
end
