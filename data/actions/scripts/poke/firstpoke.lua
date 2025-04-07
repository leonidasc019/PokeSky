function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(58000) > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce ja escolheu seu Pokemon inicial.")
        return true
    end
    
    player:sendExtendedOpcode(69, ":)")
    return true
end