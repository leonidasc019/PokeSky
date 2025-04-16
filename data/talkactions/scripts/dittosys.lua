function onSay(player, words, param)
    local pokeball = player:getUsingBall()  -- Suponha que você tenha um método para obter a pokeball em uso
    
    if not pokeball then
       player:sendTextMessage(MESSAGE_INFO_DESCR,"Você não está usando nenhuma pokeball.")
        return false
    end

    -- Verifica se o Pokémon na pokébola é "Ditto", "Shiny Ditto" ou "Mega Ditto"
    local pokemonName = pokeball:getSpecialAttribute('pokeName')
    if pokemonName ~= "Ditto" and pokemonName ~= "Shiny ditto" and pokemonName ~= "Mega ditto" then
       player:sendTextMessage(MESSAGE_INFO_DESCR,"O comando só pode ser usado com Ditto, Shiny Ditto ou Mega Ditto.")
        return false
    end

    -- Verificação para comandos save2 e use2: verifica se o jogador tem o storage necessário
    if words == "/ditto save2" or words == "/ditto use2" then
        if player:getStorageValue(70000001) <= 0 then
           player:sendTextMessage(MESSAGE_INFO_DESCR,"Você precisa Comprar o Ditto Memory para liberar o 2 slot de Tranformaçao.")
            return false
        end
    end

    -- Verificação de cooldown (10 segundos) para o comando /ditto use1
    if words == "/ditto use1" then
        local lastUse1 = player:getStorageValue("use1_cooldown")
        if lastUse1 > 0 and os.time() - lastUse1 < 10 then
            local timeRemaining = 10 - (os.time() - lastUse1)
           player:sendTextMessage(MESSAGE_INFO_DESCR,"Você deve aguardar " .. timeRemaining .. " segundos para usar a Transformaçao novamente.")
            return false
        end
        player:setStorageValue("use1_cooldown", os.time())  -- Atualiza o tempo de uso do comando use1
    end

    -- Verificação de cooldown (10 segundos) para o comando /ditto use2
    if words == "/ditto use2" then
        local lastUse2 = player:getStorageValue("use2_cooldown")
        if lastUse2 > 0 and os.time() - lastUse2 < 10 then
            local timeRemaining = 10 - (os.time() - lastUse2)
           player:sendTextMessage(MESSAGE_INFO_DESCR,"Você deve aguardar " .. timeRemaining .. " segundos para usar a Transformaçao novamente.")
            return false
        end
        player:setStorageValue("use2_cooldown", os.time())  -- Atualiza o tempo de uso do comando use2
    end

    if words == "/ditto" then
        local dittoTransform = pokeball:getSpecialAttribute("dittoTransform")
        pokeball:setSpecialAttribute("dittoTransform", player:getUsingBall():getSpecialAttribute('pokeName'))
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Volto ao Normal.")
    elseif words == "/ditto save1" then
        local dittoTransform = pokeball:getSpecialAttribute("dittoTransform")
        pokeball:setSpecialAttribute("dittoTransform1", dittoTransform)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "A transformação foi salva no slot 1.")
    elseif words == "/ditto save2" then
        local dittoTransform = pokeball:getSpecialAttribute("dittoTransform")
        pokeball:setSpecialAttribute("dittoTransform2", dittoTransform)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "A transformação foi salva no slot 2.")
    elseif words == "/ditto use1" then
        local dittoTransform1 = pokeball:getSpecialAttribute("dittoTransform1")
        if dittoTransform1 then
            pokeball:setSpecialAttribute("dittoTransform", dittoTransform1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Usando transformação do slot 1.")
        else
           player:sendTextMessage(MESSAGE_INFO_DESCR,"Não há transformação salva no slot 1.")
        end
    elseif words == "/ditto use2" then
        local dittoTransform2 = pokeball:getSpecialAttribute("dittoTransform2")
        if dittoTransform2 then
            pokeball:setSpecialAttribute("dittoTransform", dittoTransform2)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Usando transformação do slot 2.")
        else
           player:sendTextMessage(MESSAGE_INFO_DESCR,"Não há transformação salva no slot 2.")
        end
    else
       player:sendTextMessage(MESSAGE_INFO_DESCR,"Comando inválido.")
    end

    local summon = Creature(player)
    doRemoveSummon(player:getId())
    pokeball:setSpecialAttribute("isBeingUsed", 1)
    doReleaseSummon(player:getId(), summon:getPosition(), false, false)

    return false
end
