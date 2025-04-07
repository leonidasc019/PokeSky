local function getStatusName(itemId)
    local statusName
    if itemId == 38779 then
        statusName = "magicAttack"
    elseif itemId == 38780 then
        statusName = "speed"
    elseif itemId == 38781 then
        statusName = "hp"
    elseif itemId == 38782 then
        statusName = "defense"
    elseif itemId == 38783 then
        statusName = "ppMax"
    elseif itemId == 38784 then
        statusName = "ppUp"
    elseif itemId == 38785 then
        statusName = "attack"
    elseif itemId == 38786 then
        statusName = "magicDefense"
    elseif itemId == 38787 then
        statusName = "pokeLevel"
    end
    return statusName
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o target é válido e é uma criatura
    if not target or not target:isCreature() then
        player:sendCancelMessage("You can only use this item on a Pokémon.")
        return true
    end

    -- Verifica se o target é um monstro (Pokémon) controlado pelo jogador
    if not target:isMonster() then
        player:sendCancelMessage("You can only use this item on a Pokémon.")
        return true
    end

    -- Verifica se o jogador é o dono do Pokémon
    if player ~= target:getMaster() then
        player:sendCancelMessage("Sorry, not possible. You must use this item on your Pokémon.")
        return true
    end

    -- Determina qual status será aumentado
    local statusToBeIncreased = getStatusName(item:getId())
    if not statusToBeIncreased then
        print("WARNING! Problem on status increasing player " .. player:getName() .. " item " .. item:getName())
        return true
    end

    -- Aumenta o nível do Pokémon ou outro status
    if statusToBeIncreased == "pokeLevel" then
        if target:getLevel() >= summonMaxLevel then
            player:sendCancelMessage("Sorry, not possible to feed this Pokémon anymore.")
        else
            player:say(target:getName() .. ", take this!", TALKTYPE_MONSTER_SAY)
            target:say("Hmm", TALKTYPE_MONSTER_SAY)
            target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
            target:increaseStatus(statusToBeIncreased)
            item:remove(1)
        end
    else
        if target:increaseUsedVitaminsNumber() then
            player:say(target:getName() .. ", take this!", TALKTYPE_MONSTER_SAY)
            target:say("Hmm", TALKTYPE_MONSTER_SAY)
            target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
            target:increaseStatus(statusToBeIncreased)
            item:remove(1)
        else
            player:sendCancelMessage("Sorry, not possible to feed this Pokémon anymore.")
        end
    end

    return true
end