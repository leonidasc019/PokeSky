local evAttributes = {
    ["!evattack"] = { stat = "pokeAttack", counter = "EvBaseAtk" },
    ["!evdefense"] = { stat = "pokeDefense", counter = "EvBaseDef" },
    ["!evspeed"] = { stat = "pokeSpeed", counter = "EvBaseSpeed" },
    ["!evspecialattack"] = { stat = "pokeSpecialAttack", counter = "EvBaseSpAtk" },
    ["!evspecialdefense"] = { stat = "pokeSpecialDefense", counter = "EvBaseSpDef" },
    ["!evhp"] = { stat = "pokeMaxHealth", counter = "EvBaseHp" }
}

function onSay(player, words, param)
    local attr = evAttributes[words:lower()]
    if not attr then
        player:sendCancelMessage("Comando de EV inválido.")
        return false
    end

    local summon = player:getSummon()
    if not summon then
        player:sendCancelMessage("Você não tem um Pokémon invocado.")
        return false
    end

    local ball = player:getUsingBall()
    if not ball or not ball:isItem() then
        player:sendCancelMessage("Erro: Pokébola não encontrada.")
        return false
    end

    local availableEV = ball:getSpecialAttribute("pokeEv") or 0
    if availableEV <= 0 then
        player:sendCancelMessage("Seu Pokémon não possui pontos de EV disponíveis.")
        return false
    end

    local baseValue = ball:getSpecialAttribute(attr.stat) or 0
    local currentCounter = ball:getSpecialAttribute(attr.counter) or 0

    -- Atualizando os atributos
    ball:setSpecialAttribute(attr.stat, baseValue + 100)
    ball:setSpecialAttribute(attr.counter, currentCounter + 1)
    ball:setSpecialAttribute("pokeEv", availableEV - 1)

    -- Efeito e mensagem
    summon:getPosition():sendMagicEffect(12)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você adicionou 1 ponto de EV ao seu Pokémon!")

    -- Atualiza o client com os dados novos
    sendEvsUpdateToClient(player, ball)

    return false
end

function sendEvsUpdateToClient(player, ball)
    if not player or not ball then return end

    local summon = player:getSummon()
    if not summon then return end

    local name = summon:getName()
    local lookType = summon:getOutfit().lookType

    -- CORRIGIDO: pega os tipos diretamente da Pokébola
    local type1 = ball:getSpecialAttribute("pokeType1") or "none"
    local type2 = ball:getSpecialAttribute("pokeType2") or "none"

    local stats = {
        ball:getSpecialAttribute("pokeMaxHealth") or 0,
        ball:getSpecialAttribute("pokeAttack") or 0,
        ball:getSpecialAttribute("pokeDefense") or 0,
        ball:getSpecialAttribute("pokeSpecialAttack") or 0,
        ball:getSpecialAttribute("pokeSpecialDefense") or 0,
        ball:getSpecialAttribute("pokeSpeed") or 0,
        ball:getSpecialAttribute("EvBaseHp") or 0,
        ball:getSpecialAttribute("EvBaseAtk") or 0,
        ball:getSpecialAttribute("EvBaseDef") or 0,
        ball:getSpecialAttribute("EvBaseSpAtk") or 0,
        ball:getSpecialAttribute("EvBaseSpDef") or 0,
        ball:getSpecialAttribute("EvBaseSpeed") or 0,
        ball:getSpecialAttribute("pokeEv") or 0
    }
end

