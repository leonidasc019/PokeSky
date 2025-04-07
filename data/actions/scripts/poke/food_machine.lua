local foodTruck = {
    actionId = 12345, -- Substitua pelo actionid da maquina
    cost = 30000,       -- Quantidade de dinheiro necessaria para jogar
    foods = {35819, 35820, 35821, 35822, 35823} -- IDs dos lanches
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica o dinheiro do jogador
    if not player:removeMoney(foodTruck.cost) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Voce precisa de " .. foodTruck.cost .. " moedas para comprar o lanche.")
        return true
    end

    -- Sorteia o lanche para o jogador
    local foodId = foodTruck.foods[math.random(#foodTruck.foods)]
    player:addItem(foodId, 1)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Lanche entregue! Aproveite sua refeicao!")

    -- Texto Animado na posicao da maquina: "Lanche entregue" (Verde Claro)
    Game.sendAnimatedText(fromPosition, "Lanche entregue", 30) -- 30 = TEXTCOLOR_LIGHTGREEN
    fromPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
    
    return true
end
