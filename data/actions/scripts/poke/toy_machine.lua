local toyMachine = {
    actionId = 41619, -- Substitua pelo actionid da máquina
    cost = 10000,       -- Quantidade de dinheiro necessária para jogar
    rewardChance = 30,  -- Chance de ganhar algum prêmio (em porcentagem)

    -- Categorias de raridade
    toys = {
        normal = {33564, 33565, 33566, 33567}, -- Toys comuns
        raro = {33568, 33569, 33570},          -- Toys raros
        epico = {33571, 33572},                -- Toys épicos
        lendario = {33573, 33574, 33575}       -- Toys lendários
    },

    -- Chances por categoria
    chances = {
        normal = 60,  -- 60% de chance de ganhar um toy normal
        raro = 25,    -- 25% de chance de ganhar um toy raro
        epico = 10,   -- 10% de chance de ganhar um toy épico
        lendario = 5  -- 5% de chance de ganhar um toy lendário
    }
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica o dinheiro do jogador
    if not player:removeMoney(toyMachine.cost) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa de " .. toyMachine.cost .. " moedas de ouro para jogar.")
        -- fromPosition:sendMagicEffect(CONST_ME_POFF) -- Efeito de falha
        return true
    end

    -- Efeito de interação ao jogar
    fromPosition:sendMagicEffect(906) -- Use o ID 906 ou outro efeito desejado

    -- Define se o jogador ganhou ou não
    if math.random(1, 100) > toyMachine.rewardChance then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Que pena! Você não ganhou nada desta vez.")
        Game.sendAnimatedText(fromPosition, "Perdeu!", TEXTCOLOR_RED)
        -- fromPosition:sendMagicEffect(CONST_ME_POFF) -- Efeito ao não ganhar
        return true
    end

    -- Determina a categoria do prêmio baseado nas chances
    local roll = math.random(1, 100)
    local category = "normal"

    if roll <= toyMachine.chances.lendario then
        category = "lendario"
    elseif roll <= toyMachine.chances.lendario + toyMachine.chances.epico then
        category = "epico"
    elseif roll <= toyMachine.chances.lendario + toyMachine.chances.epico + toyMachine.chances.raro then
        category = "raro"
    end

    -- Escolhe um toy aleatório da categoria definida
    local selectedToys = toyMachine.toys[category]
    local toyId = selectedToys[math.random(#selectedToys)]

    -- Mapeamento de cores por categoria
    local categoryData = {
        normal = {name = "Normal", color = TEXTCOLOR_LIGHTGREEN},
        raro = {name = "Raro", color = TEXTCOLOR_LIGHTBLUE},
        epico = {name = "Épico", color = TEXTCOLOR_YELLOW},
        lendario = {name = "Lendário", color = TEXTCOLOR_PURPLE}
    }

    -- Adiciona o item ao jogador e envia mensagens
    player:addItem(toyId, 1)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Parabéns! Você ganhou um toy " .. categoryData[category].name .. "!")

    -- Texto animado com a cor correspondente
    Game.sendAnimatedText(fromPosition, "Ganhou um " .. categoryData[category].name .. "!", categoryData[category].color)
    fromPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN) -- Efeito ao ganhar

    return true
end
