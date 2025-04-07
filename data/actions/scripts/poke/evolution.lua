function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not hasSummons(player) then
        player:sendCancelMessage("Desculpe, nao e possivel. Voce precisa de um Pokemon para evoluir.")
        return true
    end

    if not target:isCreature() then
        player:sendCancelMessage("Desculpe, nao e possivel. Voce so pode evoluir Pokemon.")
        return true
    end

    if target:isCreature() then
        if target:isPlayer() then
            player:sendCancelMessage("Desculpe, nao e possivel. Voce so pode evoluir Pokemon.")
            return true
        elseif target ~= player:getSummon() then 
            player:sendCancelMessage("Desculpe, nao e possivel. Voce so pode evoluir seu proprio Pokemon.")
            return true
        end
    end

    if target:isEvolving() then
        player:sendCancelMessage("Desculpe, nao e possivel. Seu summon ja esta evoluindo.")
        return true
    end

    local ball = player:getUsingBall()
    if not ball then 
        player:sendCancelMessage("Desculpe, nao e possivel. Nao foi encontrada a Pokebola do seu Pokemon.")
        return true 
    end

    local dittoTime = ball:getSpecialAttribute("dittoTime")
    if dittoTime and os.time() < dittoTime then
        player:sendCancelMessage("Desculpe, nao e possivel. Voce nao pode evoluir seu Pokemon enquanto estiver transformado.")
        return true
    end

    local summonName = target:getName()
    local monsterType = MonsterType(summonName)
    if not monsterType then
        print("AVISO! Monstro " .. summonName .. " com erro na evolucao!")
        player:sendCancelMessage("Desculpe, nao e possivel. Este problema foi reportado.")
        return true
    end

    -- Obter a lista de evolucoes do Pokemon
    local evolutionList = monsterType:getEvolutionList()
    if #evolutionList >= 1 then
        for i = 1, #evolutionList do
            local evolution = evolutionList[i]
            local evolutionName = evolution.name
            if evolutionName ~= "" then
                local itemType = ItemType(evolution.itemName)
                if itemType and itemType:getId() == item:getId() then
                    -- Verificar se o nivel do jogador atende ao requisito de evolucao
                    if player:getLevel() < evolution.level then
                        player:sendCancelMessage(string.format("Desculpe, nao e possivel. Voce precisa estar no nivel %d para evoluir este Pokemon.", evolution.level))
                        return true
                    end

                    if player:removeItem(itemType:getId(), evolution.count) then
                        doEvolveSummon(target:getId(), evolutionName)
                        return true
                    else
                        player:sendCancelMessage("Desculpe, nao e possivel. Voce nao tem os itens necessarios para evoluir este Pokemon.")
                        return true
                    end
                end
            end
        end
    else
        player:sendCancelMessage("Desculpe, nao e possivel. Voce nao pode evoluir este Pokemon.")
        return true
    end
    return false
end
