local combat = COMBAT_GHOSTDAMAGE
local time = 70

-- Áreas e efeitos pré-definidos
local areas = {
    createCombatArea(AREA_CROSS1X1_2),
}

local areaDamage = {
    createCombatArea(AREA_CIRCLE5X5),
}

local effects = {CONST_ME_NONE, CONST_ME_NONE, CONST_ME_NONE, CONST_ME_NONE, CONST_ME_NONE}  -- Sem efeitos visuais nas áreas
local targetEffect = CONST_ME_NONE  -- Sem efeito no centro
local damageMultiplier = damageMultiplierMoves.ultimate / #areas

-- Offset para ajustar a posição do efeito
local offsetX = 3  -- Ajuste para mover o poder para a direita
local offsetY = 3  -- Ajuste para mover o poder para cima, arredondando para inteiro

-- Função de arredondamento personalizada
function math.round(num)
    return math.floor(num + 0.5)
end

local function spellCallback(uid, position, damage, count)
    local creature = Creature(uid)
    if not creature or count > #areas then
        return
    end

    local area = areas[count]
    local damageArea = areaDamage[count]

    if area and damageArea then
        doAreaCombatHealth(uid, combat, position, damageArea, -damage, -damage, 0)
    end

    position.x = position.x + offsetX
    position.y = position.y + math.round(offsetY)
    doAreaCombatHealth(uid, combat, position, 0, -damage, -damage, 912) --effeito

    addEvent(spellCallback, time, uid, position, damage, count + 1)
end

function onCastSpell(creature, variant)
    local damage = damageMultiplier * creature:getTotalMagicAttack()
    local position = creature:getPosition()
    spellCallback(creature.uid, position, damage, 1)
    return true
end
