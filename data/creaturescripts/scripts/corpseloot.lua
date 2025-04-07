local stonesEffects = {
    ["leaf stone"] = 856,     -- Efeito para Leaf Stone
    ["boost stone"] = 292,    -- Efeito para Boost Stone
    ["water stone"] = 855,    -- Efeito para Water Stone
    ["venom stone"] = 859,    -- Efeito para Venom Stone
    ["thunder stone"] = 858,  -- Efeito para Thunder Stone
    ["rock stone"] = 861,     -- Efeito para Rock Stone
    ["punch stone"] = 865,    -- Efeito para Punch Stone
    ["fire stone"] = 854,     -- Efeito para Fire Stone
    ["ice stone"] = 863,      -- Efeito para Ice Stone
    ["cocoon stone"] = 866,   -- Efeito para Cocoon Stone
    ["crystal stone"] = 869,  -- Efeito para Crystal Stone
    ["darkness stone"] = 864, -- Efeito para Darkness Stone
    ["earth stone"] = 862,    -- Efeito para Earth Stone
    ["enigma stone"] = 860,   -- Efeito para Enigma Stone
    ["heart stone"] = 857,    -- Efeito para Heart Stone
    ["metal stone"] = 867,     -- Efeito para Metal Coat
    ["sun stone"] = 292,      -- Efeito para Sun Stone
    ["feather stone"] = 870,  -- Efeito para Feather Stone
    ["king's rock stone"] = 292, -- Efeito para King's Rock Stone
    ["dragon stone"] = 729,    -- Efeito para Dragon Stone 
    ["shining stone"] = 868,    -- Efeito para Shining Stone
}

local function doSendMultipleEffects(pos, effect, times, interval)
    for i = 1, times do
        addEvent(doSendMagicEffect, i * interval, pos, effect)
    end
    return
end

function onPostDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    if not corpse or not creature then
        return true
    end
    if type(corpse) ~= "userdata" then
        return true
    end
    local monsterType = MonsterType(creature:getName())
    if not monsterType or monsterType:getCorpseId() == 0 then
        return true
    end
    if not corpse:isContainer() then
        print("WARNING! Corpse not container, creature " .. creature:getName() .. ".")
        return true
    end
    if not corpse:hasAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) then
        return true
    end
    local owner = corpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
    if not owner then
        return true
    end
    local player = Player(owner)
    if player and player:isPlayer() and player:isAutoLooting() then
        local msg = "Autoloot: "
        local nItems = 0
        for i = corpse:getSize() - 1, 0, -1 do
            local item = corpse:getItem(i)
            if item then
                local itemId = item:getId()
                local itemName = item:getName()
                local itemCount = item:getCount()
                msg = msg .. itemCount .. " " .. itemName .. ", "
                player:addItem(itemId, itemCount)
                item:remove()
                nItems = nItems + 1
                if stonesEffects[itemName] then
                    doSendMultipleEffects(corpse:getPosition(), stonesEffects[itemName], 1, 600)
                end
            end
        end
        if nItems >= 1 then
            -- Aqui a mensagem é enviada para o chat padrão do jogador, sem poluir a tela
            player:sendTextMessage(MESSAGE_DAMAGE_DEALT, msg:sub(1, -3) .. ".")
        end
    end
    return true
end