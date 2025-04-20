local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(-1)

function onStepIn(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return false
    end

    -- Verificar se o jogador tem algum efeito ativo (não pode usar surf, fly ou ride)
    local effectId = getEffectIdForPlayer(creature)
    if effectId then
        creature:sendCancelMessage("Desculpe, nao e possivel enquanto estiver com efeito ativo.", TALKTYPE_MONSTER_SAY)
        creature:teleportTo(fromPosition, false)
        return false
    end

    if creature:getStorageValue(storageBike) > 0 then
        creature:sendCancelMessage("Desculpe, nao e possivel enquanto estiver na bicicleta.", TALKTYPE_MONSTER_SAY)
        creature:teleportTo(fromPosition, false)
        return false
    end

    local outfit = 267

    if hasSummons(creature) then
        local summon = creature:getSummon()
        local summonName = summon:getName()
        local summonSpeed = summon:getTotalSpeed()
        local monsterType = MonsterType(summonName)
        local surfOutfit = monsterType:isSurfable()
        if player:getUsingBall():getSpecialAttribute("usingaddon") and player:getUsingBall():getSpecialAttribute("usingaddon") ~= monsterType:getOutfit().lookType then
            outfit = addonnumber[player:getUsingBall():getSpecialAttribute("usingaddon")].surf
        end
       
        -- Colocando pra utilizar os atributos obtidos pelo Iv e Ev
        local ball = creature:getUsingBall()
        summonSpeed = summonSpeed + ball:getSpecialAttribute("pokeSpeed")

        if surfOutfit > 0 then
            if surfOutfit > 1 then outfit = surfOutfit end
            creature:changeSpeed(summonSpeed)
            creature:setStorageValue(storageSurf, outfit)
            condition:setOutfit({lookType = outfit})
            creature:addCondition(condition)
            doRemoveSummon(creature:getId(), false, nil, false)
            creature:say(summonName .. ", vamos surfar!", TALKTYPE_MONSTER_SAY)
        else
            creature:sendCancelMessage("Desculpe, nao e possivel. Seu pokemon nao pode surfar.", TALKTYPE_MONSTER_SAY)
            creature:teleportTo(fromPosition, false)
            return false        
        end
    else
        if creature:getStorageValue(storageSurf) == -1 then
            creature:sendCancelMessage("Desculpe, nao e possivel. Voce precisa de um pokemon que surfar.", TALKTYPE_MONSTER_SAY)
            creature:teleportTo(fromPosition, false)
            return false
        else
            local surfOutfit = creature:getStorageValue(storageSurf)
            condition:setOutfit({lookType = surfOutfit})
            creature:addCondition(condition)            
        end
    end
    return true
end

function onStepOut(creature, item, position, fromPosition)
    if not creature:isPlayer() then
        return false
    end
    local tile = Tile(creature:getPosition())

    if not tile or not tile:getGround() then
        return false
    end

    local tileId = tile:getGround():getId()
    if (not isInArray(waterIds, tileId) and position == fromPosition) or (creature:getStorageValue(storageDive) > 0) then
        creature:changeSpeed(creature:getBaseSpeed()-creature:getSpeed())
        creature:setStorageValue(storageSurf, -1)
        doReleaseSummon(creature:getId(), creature:getPosition(), false, false)

        local summon = creature:getSummon()
        if summon then
            local summonName = summon:getName() 
            creature:say(summonName .. ", Obrigado!", TALKTYPE_MONSTER_SAY)
        else
            creature:say("Obrigado!", TALKTYPE_MONSTER_SAY)
        end
    end

    if not (creature:getStorageValue(storageRide) > 0 or creature:getStorageValue(storageFly) > 0 or creature:getStorageValue(storageBike) > 0 or creature:getStorageValue(storageDive) > 0) then
        creature:removeCondition(CONDITION_OUTFIT)
    end
    return true
end
