function onSay(player, words, param)
    local summon = player:getSummon()
    if not summon then
        player:sendCancelMessage("Voce nao tem um Pokemon invocado.")
        return false
    end

    -- Pegando a Pokébola correta
    local ball = player:getUsingBall() 
    if not ball or not ball:isItem() then
        player:sendCancelMessage("Erro: Nao foi possivel encontrar a Pokebola do seu Pokemon.")
        return false
    end

    -- Pegando os EVs corretamente
    local pokeEV = ball:getSpecialAttribute("pokeEv") or 0
    if pokeEV <= 0 then
        player:sendCancelMessage("Seu Pokemon nao possui pontos de EV disponiveis.")
        return false
    end

    local validStats = {
        ["!evattack"] = "pokeAttack",
        ["!evdefense"] = "pokeDefense",
        ["!evspeed"] = "pokeSpeed",
        ["!evspecialattack"] = "pokeSpecialAttack",
        ["!evspecialdefense"] = "pokeSpecialDefense",
        ["!evhp"] = "pokeMaxHealth"
    }

    local statAttr = validStats[words:lower()]
    if not statAttr then
        player:sendCancelMessage("Houve um erro ao processar seu pedido.")
        return false
    end

    -- Adiciona 100 pontos no atributo
    local currentStat = ball:getSpecialAttribute(statAttr) or 0
    ball:setSpecialAttribute(statAttr, currentStat + 100)

    -- Reduz um ponto dos EVs disponíveis
    ball:setSpecialAttribute("pokeEv", pokeEV - 1)

    -- Aplica um efeito visual no Pokémon
    summon:getPosition():sendMagicEffect(12) -- Altere o número para o efeito desejado

    -- Mensagem corrigida para não mostrar caracteres estranhos
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce adicionou 1 ponto de EV seu Pokemon!")

    return false -- Impede que o comando apareça no chat
end
