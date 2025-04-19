function onSay(player, words, param)
    local summon = player:getSummon()
    if not summon then
        player:sendCancelMessage("Sorry, not possible. You need a summon to conjure spells.")
        return false
    end

    local tile = Tile(player:getPosition())
    if tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("Sorry, not possible in protection zone.")
        return false
    end

    local summonName = summon:getName()
    local monsterType = MonsterType(summonName)
    local move = monsterType:getMoveList()
    local target = summon:getTarget()

    -- Adiciona suporte a TM/Plate se tiver menos de 12 moves
    if #move < 12 then
        for i = #move + 1, 12 do
            local plate = player:getUsingBall():getSpecialAttribute("plate"..i)
            if plate and plate ~= 0 then
                local parts = plate:split("|")
                local movie = {
                    name = parts[1],
                    speed = tonumber(parts[2]),
                    level = tonumber(parts[3]),
                    isTarget = tonumber(parts[4]),
                    range = tonumber(parts[5])
                }
                table.insert(move, movie)
            end
        end
    end

    -- Checa comandos
    for i = 1, #moveWords do
        if words == moveWords[i] then
            local sketch = player:getUsingBall():getSpecialAttribute("sketch"..i)
            local plate = player:getUsingBall():getSpecialAttribute("plate"..i)
            local moveData = move[i]

            if not moveData then
                player:sendCancelMessage("Sorry, not possible.")
                return false
            end

            local moveName = moveData.name
            local isTarget = moveData.isTarget
            local range = moveData.range
            local speed = moveData.speed

            if plate and plate ~= 0 then
                local parts = plate:split("|")
                moveName = parts[1]
                speed = tonumber(parts[2])
                isTarget = tonumber(parts[4])
                range = tonumber(parts[5])
            elseif sketch and sketch ~= 0 then
                local parts = sketch:split("|")
                moveName = parts[1]
                speed = tonumber(parts[2])
                isTarget = tonumber(parts[4])
                range = tonumber(parts[5])
            end

            if isTarget == 1 then
                if not target then
                    player:sendCancelMessage("Sorry, not possible. You need a target.")
                    return false
                elseif range and range > 0 and summon:getPosition():getDistance(target:getPosition()) > range then
                    player:sendCancelMessage("Sorry, not possible. You are too far.")
                    return false
                end
            end

            if getCreatureCondition(summon, CONDITION_SLEEP) then
                player:sendCancelMessage("Sorry, not possible. Your Pokémon is sleeping.")
                return false
            end
            if getCreatureCondition(summon, CONDITION_SILENCE) then
                player:sendCancelMessage("Sorry, not possible. Your Pokémon is silenced.")
                return false
            end

            local exhausted = player:checkMoveExhaustion(i, (speed or 1000) / 1000)
            if not exhausted then
                doCreatureCastSpell(summon, moveName)
                player:say(summonName .. ", use " .. moveName .. "!", TALKTYPE_MONSTER_SAY)
            end
            break
        end
    end

    return false
end
