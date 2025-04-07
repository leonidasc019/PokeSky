local usarLevelMinimo = true
local temporizador = 1000  -- Executa uma cura a cada 1 segundo. Configuravel.
local duracao = 10000  -- Duracao do efeito de cura, configuravel.

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local exhaust = Condition(CONDITION_EXHAUST_HEAL)
    if player:isDuelingWithNpc() then
        exhaust:setParameter(CONDITION_PARAM_TICKS, 20000)
    end
    
    if player:getCondition(CONDITION_EXHAUST_HEAL) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
        return true
    end

    if player:isOnLeague() then
        if not player:canUsePotionOnLeague() then
            player:sendCancelMessage("Desculpe, voce nao pode utilizar pocao durante a Liga Pokemon.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

    local totalDuration = 10
    local potionId = item:getId()
    local playerLevel = player:getLevel()

    local potionRequirements = { -- id = level minimo = quantidade de cura
        [27642] = {level = 1, healPerSecond = 600 / totalDuration},  -- Small Potion
        [27643] = {level = 15, healPerSecond = 1500 / totalDuration}, -- Great Potion
        [27641] = {level = 40, healPerSecond = 4000 / totalDuration}, -- Ultra Potion
        [27647] = {level = 60, healPerSecond = 10000 / totalDuration}, -- Hyper Potion
        [27646] = {level = 100, healPerSecond = (player:getSummon():getMaxHealth() or 0) / totalDuration}  -- Ultimate Potion
    }

    if usarLevelMinimo then
        if potionRequirements[potionId] and playerLevel < potionRequirements[potionId].level then
            player:sendCancelMessage("Desculpe, voce precisa ser pelo menos nivel " .. potionRequirements[potionId].level .. " para utilizar esta pocao.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

    local summon = player:getSummon()

    if summon:getHealth() >= summon:getMaxHealth() then
        player:sendCancelMessage("Desculpe, seu Pokemon ja esta com a vida cheia.")
        return true
    end

    if summon:getCondition(CONDITION_REGENERATION) then
        player:sendCancelMessage("Aguarde para usar uma pocao novamente.")
        return true
    end

    local healPerSecond = potionRequirements[potionId].healPerSecond

    if healPerSecond then
        Game.sendAnimatedText(summon:getPosition(), item:getName(), TEXTCOLOR_YELLOW)
    end

    if summon then
        applyPeriodicHealing(player, healPerSecond, totalDuration)
        player:addCondition(exhaust)

        local condition = Condition(CONDITION_REGENERATION)
        condition:setParameter(CONDITION_PARAM_TICKS, totalDuration * 1000)
        summon:addCondition(condition)
    else
        player:sendCancelMessage("Desculpe, esta pocao so pode ser utilizada em Pokemons.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    item:remove(1)
    return true
end

function applyPeriodicHealing(player, healPerSecond, totalDuration)
    local summon = player:getSummon()
    local ticks = 0

    local initialHealth = summon and summon:getHealth()

    local function doHealing()
        if not player:getSummon() or player:getSummon() ~= summon then
            return
        end

        if not summon or summon:getHealth() <= 0 or ticks >= duracao / temporizador then
            if summon then
                summon:removeCondition(CONDITION_REGENERATION)
            end
            return
        end

        local currentHealth = summon:getHealth()
        if currentHealth < initialHealth then
            local summonPosition = summon:getPosition()
            Game.sendAnimatedText(summonPosition, "CURA PERDIDA", TEXTCOLOR_RED)
            summon:removeCondition(CONDITION_REGENERATION)
            return
        end

        if currentHealth >= summon:getMaxHealth() then
            summon:removeCondition(CONDITION_REGENERATION)
            return
        end

        summon:addHealth(healPerSecond)
        summon:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        ticks = ticks + 1

        initialHealth = currentHealth

        if ticks < duracao / temporizador then
            addEvent(doHealing, temporizador)  -- Agenda a proxima cura apos 1 segundo.
        end
    end

    doHealing()  -- Inicia o processo de cura.
end
