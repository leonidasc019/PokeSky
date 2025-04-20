local scrollId = 41688 -- ID do pergaminho que ser� dado ao jogador

local function removeAllAddonsAndCreateScrolls(player)
    -- Verifica se o jogador est� usando uma Pok�bola v�lida
    local usingBall = player:getUsingBall()
    if not usingBall then
        player:sendCancelMessage("Voc� n�o est� usando uma Pok�bola v�lida.")
        return false
    end

    -- Obt�m os addons da Pok�bola
    local addons = usingBall:getSpecialAttribute("addons") or ""
    local addonId = usingBall:getSpecialAttribute("addon") or ""

    -- Divide a lista de addons em IDs individuais
    local addonList = {}
    for addonId in string.gmatch(addons, "([^,]+),") do
        table.insert(addonList, addonId)
    end

    -- Verifica se a lista de addons est� vazia
    if #addonList == 0 then
        player:popupFYI("Nenhum addon v�lido encontrado para este Pok�mon.")
        return false
    end

    -- Processa e remove os addons, criando pergaminhos
    for _, addonId in ipairs(addonList) do
        addonId = tonumber(addonId)
        if addonnumber[addonId] then
            -- Remove o addon da Pok�bola
            addons = addons:gsub(addonId .. ",", "")
            usingBall:setSpecialAttribute("addons", 0)
            usingBall:setSpecialAttribute("usingaddon", 0)

            -- Cria o pergaminho para o addon removido
            local newScroll = player:addItem(scrollId, 1)
            if newScroll then
                newScroll:setSpecialAttribute("addon", addonId)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 
                    "Voc� recebeu um pergaminho contendo o addon **" .. addonnumber[addonId].poke .. "**.")
            else
                player:sendCancelMessage(
                    "N�o foi poss�vel criar um pergaminho para o addon " .. addonnumber[addonId].poke .. ". Verifique o espa�o no invent�rio.")
                return false
            end
        end
    end

    -- Remove o outfit do Pok�mon invocado
    local summon = player:getSummon()
    if summon then
        summon:removeCondition(CONDITION_OUTFIT)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Todos os addons foram removidos e o outfit do Pok�mon foi resetado.")
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
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Esse Pokemon n�o tem Addons.")
    end
    return true
end
