--Itigar
local delay = 0.1
local bonusSpeed = 1.0
local outfitMale = 2346
local outfitFemale = 2345
local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(-1)
local storageBike = 56000 
local effectStorage = 56203 
local storageOutfit = 56001
local efeitoStorage = {56204, 56205}  -- Bloquear Qualquer Erro com o rastros de efeitos

local function checkOutfit(player)
    if player:getStorageValue(storageBike) > 0 then
        local currentOutfit = player:getOutfit()
        local isPatinsOutfit = (currentOutfit.lookType == outfitMale or currentOutfit.lookType == outfitFemale)
        
        if not isPatinsOutfit then
            local outfit = {
                lookType = player:getSex() == PLAYERSEX_MALE and outfitMale or outfitFemale,
                lookHead = currentOutfit.lookHead,
                lookBody = currentOutfit.lookBody,
                lookLegs = currentOutfit.lookLegs,
                lookFeet = currentOutfit.lookFeet
            }
            player:setOutfit(outfit)
        end
    end
end

local function startOutfitCheck(player)
    addEvent(function()
        checkOutfit(player)
        startOutfitCheck(player)
    end, 500)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if os.time() > player:getStorageValue(storageDelay) then
        player:setStorageValue(storageDelay, os.time() + delay)
    else
        player:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
        return true
    end

    if fromPosition.x ~= 65535 then
        player:sendCancelMessage("Primeiro pegue o patins.")
        return true
    end

    if player:isOnSurf() or player:isOnRide() or player:isOnFly() then
        player:sendCancelMessage("Voce nao pode pescar enquanto estiver voando, em cima de uma montaria ou surf.")
        return true
    end

        -- Verifica se o jogador tem algum dos storages do efeito de rastro
    for _, storage in ipairs(efeitoStorage) do
        if player:getStorageValue(storage) > 0 then
            player:sendCancelMessage("Você não pode trocar de roupa enquanto o efeito de rastro estiver ativo.")
            return true
        end
    end

    if player:getStorageValue(storageBike) > 0 then
        player:removeCondition(CONDITION_OUTFIT)
        player:changeSpeed(player:getBaseSpeed() - player:getSpeed())
        player:setStorageValue(storageBike, -1)
        
        player:setStorageValue(effectStorage, 0)
        
        local originalOutfit = player:getStorageValue(storageOutfit)
        if originalOutfit > 0 then
            local outfit = {
                lookType = originalOutfit,
                lookHead = player:getStorageValue(storageOutfit + 1),
                lookBody = player:getStorageValue(storageOutfit + 2),
                lookLegs = player:getStorageValue(storageOutfit + 3),
                lookFeet = player:getStorageValue(storageOutfit + 4)
            }
            player:setOutfit(outfit)
        end
    else
        local currentOutfit = player:getOutfit()
        player:setStorageValue(storageOutfit, currentOutfit.lookType)
        player:setStorageValue(storageOutfit + 1, currentOutfit.lookHead)
        player:setStorageValue(storageOutfit + 2, currentOutfit.lookBody)
        player:setStorageValue(storageOutfit + 3, currentOutfit.lookLegs)
        player:setStorageValue(storageOutfit + 4, currentOutfit.lookFeet)

        local outfit = {
            lookType = player:getSex() == PLAYERSEX_MALE and outfitMale or outfitFemale,
            lookHead = currentOutfit.lookHead,
            lookBody = currentOutfit.lookBody,
            lookLegs = currentOutfit.lookLegs,
            lookFeet = currentOutfit.lookFeet
        }
        condition:setOutfit(outfit)
        player:addCondition(condition)
        player:setStorageValue(storageBike, 1)

        local delta = player:getBaseSpeed() * bonusSpeed
        player:changeSpeed(delta)

        player:setStorageValue(effectStorage, 1)

        effectWhenWalking(player:getId(), effectId)

        startOutfitCheck(player)
    end

    return true
end