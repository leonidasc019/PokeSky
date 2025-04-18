function onUse(player, item, fromPosition, target, isHotkey)
    local requiredStorage = 70000001

    -- Verifica se o jogador já tem o storage
    if player:getStorageValue(requiredStorage) == 1 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você já usou esse item. O slot 2 do Ditto Memory já foi liberado.")
        return false
    end

    -- Define o storage para o jogador
    player:setStorageValue(requiredStorage, 1)

    -- Envia uma mensagem informando que os slots do Ditto Memory foram liberados
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Você liberou o segundo slot do Ditto Memory.")

    -- Remove 1 unidade do item
    item:remove(1)

   return true
end