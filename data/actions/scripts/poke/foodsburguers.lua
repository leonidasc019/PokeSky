local foodItems = {
    [35819] = {heal = 500, cooldown = 180},
    [35820] = {heal = 500, cooldown = 180},
    [35821] = {heal = 500, cooldown = 180},
    [35822] = {heal = 500, cooldown = 180},
    [35823] = {heal = 500, cooldown = 180}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local food = foodItems[item.itemid]
    if not food then
        return false
    end

    -- Verifica se o jogador já está com a vida cheia
    if player:getHealth() == player:getMaxHealth() then
        player:sendCancelMessage("Voce ja esta com a vida cheia.")
        return true
    end

    local storage = 1000 + item.itemid -- Armazena o cooldown para cada comida de forma unica
    local lastEat = player:getStorageValue(storage)
    if lastEat > os.time() then
        player:sendCancelMessage("Voce acabou de comer. Espere " .. (lastEat - os.time()) .. " segundos para comer novamente.")
        return true
    end

    -- Cura o jogador
    player:addHealth(food.heal)
    -- player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce recuperou " .. food.heal .. " pontos de vida!")

    -- Envia efeito visual de cura
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

    -- Define o cooldown
    player:setStorageValue(storage, os.time() + food.cooldown)

    -- Remove o item usado
    item:remove(1)
    return true
end
