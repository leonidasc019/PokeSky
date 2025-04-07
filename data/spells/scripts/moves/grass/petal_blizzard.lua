local combat = COMBAT_GRASSDAMAGE
local time = 70

-- Áreas e efeitos pré-definidos
local areas = {
    createCombatArea(AREA_CROSS1X1_2),
    createCombatArea(AREA_SOUND1),
    createCombatArea(AREA_SOUND2),
    createCombatArea(AREA_SOUND3),
    createCombatArea(AREA_SOUND4),
}

local areaDamage = {
    createCombatArea(AREA_CIRCLE5X5),
    createCombatArea(AREA_CIRCLE5X5),
    createCombatArea(AREA_CIRCLE5X5),
    createCombatArea(AREA_CIRCLE5X5),
    createCombatArea(AREA_CIRCLE5X5),
}

local effects = {199, 199, 199, 199, 199}
local targetEffect = 199
local damageMultiplier = damageMultiplierMoves.ultimate / #areas

local function spellCallback(uid, position, damage, count)
    local creature = Creature(uid)
    if not creature or count > #areas then
        return
    end

    local area = areas[count]
    local effect = effects[count]
    local damageArea = areaDamage[count]

    if area and effect and damageArea then
        doAreaCombatHealth(uid, combat, position, area, 0, 0, effect)
        position:sendMagicEffect(targetEffect)
        doAreaCombatHealth(uid, combat, position, damageArea, -damage, -damage, 0)
        addEvent(spellCallback, time, uid, position, damage, count + 1)
    end
end

function onCastSpell(creature, variant)
    local damage = damageMultiplier * creature:getTotalMagicAttack()
    local position = creature:getPosition()
    spellCallback(creature.uid, position, damage, 1)
    return true
end
