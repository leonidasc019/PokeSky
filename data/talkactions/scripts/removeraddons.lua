local scrollId = 41688 -- ID do pergaminho que será dado ao jogador

local function removeAllAddonsAndCreateScrolls(player)
    -- Verifica se o jogador está usando uma Pokébola válida
    local usingBall = player:getUsingBall()
    if not usingBall then
        player:sendCancelMessage("Você não está usando uma Pokébola válida.")
        return false
    end

    -- Obtém os addons da Pokébola
    local addons = usingBall:getSpecialAttribute("addons") or ""
    local addonId = usingBall:getSpecialAttribute("addon") or ""

    -- Divide a lista de addons em IDs individuais
    local addonList = {}
    for addonId in string.gmatch(addons, "([^,]+),") do
        table.insert(addonList, addonId)
    end

    -- Verifica se a lista de addons está vazia
    if #addonList == 0 then
        player:popupFYI("Nenhum addon válido encontrado para este Pokémon.")
        return false
    end

    -- Processa e remove os addons, criando pergaminhos
    for _, addonId in ipairs(addonList) do
        addonId = tonumber(addonId)
        if addonnumber[addonId] then
            -- Remove o addon da Pokébola
            addons = addons:gsub(addonId .. ",", "")
            usingBall:setSpecialAttribute("addons", 0)
            usingBall:setSpecialAttribute("usingaddon", 0)

            -- Cria o pergaminho para o addon removido
            local newScroll = player:addItem(scrollId, 1)
            if newScroll then
                newScroll:setSpecialAttribute("addon", addonId)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 
                    "Você recebeu um pergaminho contendo o addon **" .. addonnumber[addonId].poke .. "**.")
            else
                player:sendCancelMessage(
                    "Não foi possível criar um pergaminho para o addon " .. addonnumber[addonId].poke .. ". Verifique o espaço no inventário.")
                return false
            end
        end
    end

    -- Remove o outfit do Pokémon invocado
    local summon = player:getSummon()
    if summon then
        summon:removeCondition(CONDITION_OUTFIT)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Todos os addons foram removidos e o outfit do Pokémon foi resetado.")
    end

    -- Efeito visual
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    return true
end

function onSay(player, words, param)
    -- Tenta remover todos os addons e criar pergaminhos
    if removeAllAddonsAndCreateScrolls(player) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Todos os addons foram removidos e convertidos em pergaminhos.")
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Esse Pokemon não tem Addons.")
    end
    return true
end
