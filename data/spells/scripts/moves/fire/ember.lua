local time = 10000  -- Duração da condição de fogo
local effect = 4    -- Efeito do poder de fogo (pode ajustar conforme necessário)
local damageMultiplier = damageMultiplierMoves.singletargetweak
local conditionType = CONDITION_FIRE  -- Tipo da condição (fogo)

-- Criação da área de combate antes da função onCastSpell
local area = createCombatArea(AREA_BEAM1)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, effect)
combat:setArea(area)  -- Aplica a área de combate criada fora da função

function onCastSpell(creature, variant)
    local target = creature:getTarget()
    if not target then return true end

    local damage = damageMultiplier * creature:getTotalMagicAttack()

    -- Criação da condição de fogo
    local condition = Condition(conditionType)
    condition:setParameter(CONDITION_PARAM_PERIODICDAMAGE, -damage)
    condition:setParameter(CONDITION_PARAM_TICKS, time)  -- Duração do efeito de fogo
    condition:setParameter(CONDITION_PARAM_SPEED, -1000)  -- Pode ajustar conforme necessário

    -- Aplica a condição de fogo ao alvo
    target:addCondition(condition)

    -- Realiza o dano ao alvo
    local creaturePosition = creature:getPosition()
    local targetPosition = target:getPosition()

    doSendDistanceShoot(creaturePosition, targetPosition, 4)
    doAreaCombatHealth(creature.uid, COMBAT_FIREDAMAGE, targetPosition, area, -damage, -damage, 676)

    return true
end
