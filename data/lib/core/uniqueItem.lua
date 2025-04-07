function addUniqueItem(player, itemId, count, uniqueActionId)
    local item = Game.createItem(itemId, count)
    if item then
        item:setAttribute(ITEM_ATTRIBUTE_ACTIONID, uniqueActionId)

        local item_id = item:getId()
        local itemType = ItemType(item_id)
        if not itemType then return false end
        local description = itemType:getDescription()

        if description ~= "" then
            description = description .. "\n"
        end
        
        item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description .. "Item unico")
        if player:addItemEx(item) ~= RETURNVALUE_NOERROR then
            item:remove()
            return false
        end
        return true
    else
        return false
    end
end
