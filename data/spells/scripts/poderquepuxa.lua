local pullRadius = 10 -- Raio de alcance para detectar Pokémon
local primaryEffect = {id = 520, delay = 500} -- Primeiro efeito e seu delay (em ms)
local secondaryEffect = {id = 461, delay = 1000} -- Segundo efeito e seu delay (em ms)

local combat = COMBAT_WATERDAMAGE -- Tipo de dano da magia (vantagens elementais)

-- Função para encontrar um tile livre próximo ao centro
local function findFreeTileAround(centerPos)
    local directions = {
        {x = 0, y = -1}, -- Norte
        {x = 1, y = 0},  -- Leste
        {x = 0, y = 1},  -- Sul
        {x = -1, y = 0}, -- Oeste
        {x = 1, y = -1}, -- Nordeste
        {x = 1, y = 1},  -- Sudeste
        {x = -1, y = 1}, -- Sudoeste
        {x = -1, y = -1} -- Noroeste
    }

    for _, dir in ipairs(directions) do
        local newPos = Position(centerPos.x + dir.x, centerPos.y + dir.y, centerPos.z)
        local tile = Tile(newPos)
        if tile and not tile:hasProperty(CONST_PROP_BLOCKSOLID) and not tile:getTopCreature() then
            return newPos
        end
    end

    return nil -- Retorna nil se não encontrar um tile livre
end

-- Função para puxar criaturas próximas
local function pullNearbyCreatures(centerPos, creatureUid, damage)
    -- Obtém as criaturas próximas dentro do raio
    local spectators = Game.getSpectators(centerPos, false, false, pullRadius, pullRadius, pullRadius, pullRadius)
    if not spectators or #spectators == 0 then
        return -- Não há criaturas para puxar
    end

    for _, spectator in ipairs(spectators) do
        -- Apenas move monstros diferentes do lançador
        if spectator:isMonster() and spectator:getId() ~= creatureUid then
            -- Encontra um sqm livre próximo ao lançador
            local newPosition = findFreeTileAround(centerPos)
            if newPosition then
                spectator:teleportTo(newPosition) -- Teletransporta o Pokémon

                -- Aplica o primeiro efeito com delay configurado
                addEvent(function()
                    newPosition:sendMagicEffect(primaryEffect.id)
                end, primaryEffect.delay)

                -- Aplica o segundo efeito com delay configurado e causa dano
                addEvent(function()
                    newPosition:sendMagicEffect(secondaryEffect.id)
                    doTargetCombatHealth(creatureUid, spectator, combat, -damage, -damage, 0) -- Aplica dano elementar
                end, secondaryEffect.delay)
            end
        end
    end
end

-- Lançador da magia
function onCastSpell(creature, variant)
    if not creature then
        return false
    end

    -- Obtém o dano balanceado com base no sistema de multiplicador
    local damageMultiplier = damageMultiplierMoves.ultimate
    local damage = damageMultiplier * creature:getTotalMeleeAttack() -- Calcula o dano balanceado

    local position = creature:getPosition()
    pullNearbyCreatures(position, creature:getId(), damage) -- Executa a atração
    return true
end
