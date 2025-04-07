function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target then
        player:sendCancelMessage("Voce precisa selecionar um alvo.")
        return false
    end

    if player:isDuelingWithNpc() then
		player:sendCancelMessage("Desculpe, voce nao pode utilizar este item em duelos.")
		-- player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

    if player:isOnLeague() then
		player:sendCancelMessage("Desculpe, voce nao pode utilizar este item na Liga Pokemon.")
		-- player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

    if target:isPlayer() or (target:isCreature() and target:isPokemon()) then
        local conditions = {
            CONDITION_POISON,
            CONDITION_FIRE,
            CONDITION_ENERGY,
            CONDITION_PARALYZE,
            CONDITION_DRUNK,
            CONDITION_DROWN,
            CONDITION_FREEZING,
            CONDITION_DAZZLED,
            CONDITION_CURSED,
            CONDITION_BLEEDING,
            CONDITION_SLEEP,
        }

        for i = 1, #conditions do
            if target:getCondition(conditions[i]) then
                target:removeCondition(conditions[i])
            end
        end

        target:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        item:remove(1) -- remove 1 medicine do invent�rio
    else
        player:sendCancelMessage("Desculpe, voc� n�o pode utilizar este item neste alvo.")
    end

    return true
end
