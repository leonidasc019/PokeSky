-- Configurações gerais
local CONFIG = {
    -- Cada configuração representa um conjunto de tiles com outfits e bônus específicos
    {
        -- Hoveboard Areia
        outfitPermissionStorage = 15600, -- Storage para verificar permissão
        bonusSpeed = 350, -- Bônus de velocidade
        tileIds = {231, 9059, 10637, 8033, 10637, 10637}, -- IDs dos tiles
        maleOutfit = 2023, -- Outfit masculino
        femaleOutfit = 2022 -- Outfit feminino
    },
    {
        -- Mergulho Agua
        outfitPermissionStorage = 15610, -- Storage para verificar permissão
        bonusSpeed = 450, -- Bônus de velocidade
        tileIds = {5407, 5405, 5406, 5408, 5409, 5410}, -- IDs dos tiles
        maleOutfit = 2006, -- Outfit masculino
        femaleOutfit = 2007 -- Outfit feminino
    },
    {
        -- Esquis Gelo
        outfitPermissionStorage = 15620, -- Storage para verificar permissão
        bonusSpeed = 300, -- Bônus de velocidade
        tileIds = {7145, 670, 671, 6683, 6686, 6684, 6580, 6685, 6580, 6581, 6582, 6583, 6584, 6585, 6586, 6587, 6588, 6589, 6590, 6591, 6592, 6593}, -- IDs dos tiles
        maleOutfit = 2011, -- Outfit masculino
        femaleOutfit = 2010 -- Outfit feminino
    }
}

-- Função para verificar se um tile pertence a alguma configuração
local function getTileConfig(tileId)
    for _, config in ipairs(CONFIG) do
        for _, id in ipairs(config.tileIds) do
            if tileId == id then
                return config
            end
        end
    end
    return nil
end

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local player = Player(cid)
    if player:isOnSurf() or player:isOnRide() or player:isOnFly() then
        return true
    end

    local config = getTileConfig(item.itemid)
    if not config then
        return true
    end

    if player:getStorageValue(config.outfitPermissionStorage) ~= 1 then
        return true
    end

    local newOutfit
    local sex = player:getSex()
    if sex == 1 then
        newOutfit = {lookType = config.maleOutfit}
    elseif sex == 0 then
        newOutfit = {lookType = config.femaleOutfit}
    end

    if newOutfit then
        local originalOutfit = player:getOutfit()
        local conditionOutfit = Condition(CONDITION_OUTFIT)
        conditionOutfit:setTicks(-1)
        conditionOutfit:setOutfit({
            lookType = newOutfit.lookType,
            lookHead = originalOutfit.lookHead,
            lookBody = originalOutfit.lookBody,
            lookLegs = originalOutfit.lookLegs,
            lookFeet = originalOutfit.lookFeet,
            lookAddons = originalOutfit.lookAddons
        })
        player:addCondition(conditionOutfit)
    end

    local currentSpeed = player:getSpeed()
    local baseSpeed = player:getBaseSpeed()
    if currentSpeed == baseSpeed then
        player:changeSpeed(config.bonusSpeed)
    end

    return true
end

function onStepOut(cid, item, position, toPosition)
    if not isPlayer(cid) then
        return true
    end

    local player = Player(cid)
    if player:isOnSurf() or player:isOnRide() or player:isOnFly() then
        if getTileConfig(item.itemid) then
            return true
        end
    end

    local config = getTileConfig(item.itemid)
    if config then
        player:removeCondition(CONDITION_OUTFIT)
        local currentSpeed = player:getSpeed()
        local baseSpeed = player:getBaseSpeed()
        if currentSpeed > baseSpeed then
            player:changeSpeed(baseSpeed - currentSpeed)
        end
    end

    return true
end
