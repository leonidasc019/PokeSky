function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target then
        return false
    end

    if type(target) ~= "userdata" then
        return true
    end

    if target:isCreature() then
        return false
    end

    if target:isItem() and not target:isPokeball() then
        player:sendCancelMessage("Desculpe, este item só pode ser utilizado em pokébolas.")
        return true
    end

    local summonHealth = target:getSpecialAttribute("pokeHealth")
    local summonName = target:getSpecialAttribute("pokeName")

    -- -- Bloquear uso se o Pokémon estiver vivo
    
    -- if summonHealth and summonHealth > 0 then
    --     player:sendCancelMessage("Você não pode usar revive em um Pokémon vivo.")
    --     player:getPosition():sendMagicEffect(CONST_ME_POFF)
    --     return true
    -- end

    -- Bloquear uso se o Pokémon ainda estiver fora da pokébola
    if player:getSummon() then
        player:sendCancelMessage("Você precisa recolher o Pokémon para a pokébola antes de usar o revive.")
        -- player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:isDuelingWithNpc() then
        player:sendCancelMessage("Desculpe, você não pode utilizar este item em duelos.")
        -- player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:isOnLeague() then
        if not player:canUseReviveOnLeague() then
            player:sendCancelMessage("Desculpe, você não pode utilizar este item durante a Liga Pokémon.")
            -- player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

    target:setSpecialAttribute("pokeHealth", ((target:getSpecialAttribute("pokeLevel") * 20) + (MonsterType(summonName):getHealth() * 0.10)) + MonsterType(summonName):getHealth())
    for i = 1, 12 do
        target:setSpecialAttribute("cd" .. i, 0)
    end
    local ballKey = getBallKey(target:getId())
    target:transform(balls[ballKey].usedOn)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    item:remove(1)
    return true
end


