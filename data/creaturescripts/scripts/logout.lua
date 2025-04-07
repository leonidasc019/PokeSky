local storageBike = 56000
local storageOutfit = 56001  -- Storage para guardar o outfit original do jogador

function onLogin(player)
    -- Checar se o jogador tem o outfit original salvo
    local savedOutfit = player:getStorageValue(storageOutfit)
    if savedOutfit > 0 then
        -- Restaurar o outfit original
        local outfit = {
            lookType = savedOutfit,
            lookHead = player:getStorageValue(storageOutfit + 1),
            lookBody = player:getStorageValue(storageOutfit + 2),
            lookLegs = player:getStorageValue(storageOutfit + 3),
            lookFeet = player:getStorageValue(storageOutfit + 4)
        }
        player:setOutfit(outfit)
    end
end

function onLogout(player)
    local playerId = player:getId()

    -- Limpar o cooldown de comando ao fazer logout
    local storageCooldown = 12559  -- Identificar a storage para o cooldown deste comando
    player:setStorageValue(storageCooldown, -1)  -- Limpar a storage ao sair do servidor

    -- Limpar o tempo de uso de stamina
    if nextUseStaminaTime[playerId] ~= nil then
        nextUseStaminaTime[playerId] = nil
    end

    -- Verificar se o jogador está em voo
    if player:isOnFly() then
        player:sendCancelMessage("Sorry, you can not logout while on fly.")
        return false
    end

    -- Verificar se o jogador está montado
    if player:isOnRide() then
        player:sendCancelMessage("Sorry, you can not logout while on ride.")
        return false
    end

    -- Verificar se o jogador está surfando
    if player:isOnSurf() then
        player:setStorageValue(storageLogoutSpeed, player:getSpeed())
        player:sendCancelMessage("Sorry, you can not logout while on surf.")
        return false
    end

    -- Verificar se o jogador está usando os patins
    if player:getStorageValue(storageBike) > 0 then
        -- Salvar o outfit original antes de remover a condição de patins
        local currentOutfit = player:getOutfit()
        player:setStorageValue(storageOutfit, currentOutfit.lookType)
        player:setStorageValue(storageOutfit + 1, currentOutfit.lookHead)
        player:setStorageValue(storageOutfit + 2, currentOutfit.lookBody)
        player:setStorageValue(storageOutfit + 3, currentOutfit.lookLegs)
        player:setStorageValue(storageOutfit + 4, currentOutfit.lookFeet)

        -- Remover a condição de patins (outfit de patins)
        player:removeCondition(CONDITION_OUTFIT)

        -- Reverter a velocidade ao padrão
        player:changeSpeed(-player:getStorageValue(storageBike))

        -- Resetar a storage do patins
        player:setStorageValue(storageBike, -1)
    end

    -- Se o jogador está no evento da arena
    if player:getStorageValue(storageArenaEvent) == 2 then
        local town = player:getTown()
        player:teleportTo(town:getTemplePosition())
        player:unregisterEvent("PrepareDeathArena")
        player:setStorageValue(storageArenaEvent, -1)
    end

    -- Enviar efeito mágico na posição do jogador
    player:getPosition():sendMagicEffect(14)

    return true
end
