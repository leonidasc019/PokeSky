local Effectiveness = {
NULL = 0,                -- Sem efeito (imune)
VERY_INEFFECTIVE = 0.25, -- Muito ineficaz
INEFFECTIVE = 0.5,       -- Ineficaz
NEUTRAL = 1,             -- Neutro
EFFECTIVE = 2,           -- Eficaz
SUPER_EFFECTIVE = 4      -- Super eficaz
}

local effectivenessTable = {
	["none"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {},
        [Effectiveness.EFFECTIVE] = {},
        [Effectiveness.SUPER_EFFECTIVE] = {}
	},
	["blood"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {},
        [Effectiveness.EFFECTIVE] = {},
        [Effectiveness.SUPER_EFFECTIVE] = {}
	},
	["physical"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {},
        [Effectiveness.EFFECTIVE] = {},
        [Effectiveness.SUPER_EFFECTIVE] = {}
	},
	["healing"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {},
        [Effectiveness.EFFECTIVE] = {},
        [Effectiveness.SUPER_EFFECTIVE] = {}
	},
    ["fire"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fire", "water", "rock", "dragon"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "flying", "poison", "ghost", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"grass", "ice", "bug", "steel"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["water"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"water", "grass", "dragon"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "flying", "poison", "bug", "ghost", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"fire", "ground", "rock"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["electric"] = {
        [Effectiveness.NULL] = {"ground"},
        [Effectiveness.VERY_INEFFECTIVE] = {"electric", "grass", "dragon"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "fighting", "poison", "bug", "ghost", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"water", "flying"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["ground"] = {
        [Effectiveness.NULL] = {"flying"},
        [Effectiveness.VERY_INEFFECTIVE] = {"grass", "bug"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "fire", "poison", "ghost", "dark", "fairy", "bug"},
        [Effectiveness.EFFECTIVE] = {"fire", "electric", "rock", "steel"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["rock"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fighting", "ground", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "electric", "ghost", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"fire", "ice", "flying", "bug"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["grass"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fire", "grass", "poison", "flying", "bug", "dragon", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "electric", "ghost", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"water", "ground", "rock"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["dark"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fighting", "dark", "fairy"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "fire", "water", "electric", "grass", "ice", "poison", "ground", "rock"},
        [Effectiveness.EFFECTIVE] = {"psychic", "ghost"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["flying"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"electric", "rock", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "fire", "ghost", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"grass", "fighting", "bug"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["poison"] = {
        [Effectiveness.NULL] = {"steel"},
        [Effectiveness.VERY_INEFFECTIVE] = {"poison", "ground", "rock", "ghost"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "electric", "fire", "ice", "flying", "dark"},
        [Effectiveness.EFFECTIVE] = {"grass", "fairy"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["ice"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fire", "water", "ice", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "electric", "grass", "poison", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"grass", "ground", "flying", "dragon"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["psychic"] = {
        [Effectiveness.NULL] = {"dark"},
        [Effectiveness.VERY_INEFFECTIVE] = {"psychic", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "electric", "fire", "ice", "flying", "grass", "rock", "dragon", "ghost", "ground"},
        [Effectiveness.EFFECTIVE] = {"fighting", "poison"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["normal"] = {
        [Effectiveness.NULL] = {"ghost"},
        [Effectiveness.VERY_INEFFECTIVE] = {"rock", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "electric", "fire", "ice", "grass", "poison", "ground", "flying", "bug", "psychic", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["steel"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fire", "water", "electric", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "ice", "grass", "flying", "psychic", "dark", "fairy"},
        [Effectiveness.EFFECTIVE] = {"rock", "ice", "fairy"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["fighting"] = {
        [Effectiveness.NULL] = {"ghost"},
        [Effectiveness.VERY_INEFFECTIVE] = {"flying", "psychic", "bug", "fairy"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "electric", "fire", "grass", "dark"},
        [Effectiveness.EFFECTIVE] = {"normal", "rock", "steel", "ice", "dark"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["bug"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fire", "fighting", "poison", "flying", "ghost", "steel", "fairy"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "electric", "ice", "grass", "dark"},
        [Effectiveness.EFFECTIVE] = {"grass", "psychic", "dark"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["dragon"] = {
        [Effectiveness.NULL] = {"fairy"},
        [Effectiveness.VERY_INEFFECTIVE] = {"steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "electric", "fire", "ice", "grass", "poison", "ground", "flying", "bug", "psychic", "dark", "ghost"},
        [Effectiveness.EFFECTIVE] = {"dragon"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["fairy"] = {
        [Effectiveness.NULL] = {},
        [Effectiveness.VERY_INEFFECTIVE] = {"fire", "poison", "steel"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"normal", "water", "electric", "grass", "ice", "flying", "psychic", "bug"},
        [Effectiveness.EFFECTIVE] = {"fighting", "dragon", "dark"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
    ["ghost"] = {
        [Effectiveness.NULL] = {"normal"},
        [Effectiveness.VERY_INEFFECTIVE] = {"dark"},
        [Effectiveness.INEFFECTIVE] = {},
        [Effectiveness.NEUTRAL] = {"fire", "water", "electric", "grass", "ice", "flying", "poison", "ground", "rock", "bug", "steel", "fairy"},
        [Effectiveness.EFFECTIVE] = {"psychic", "ghost"},
        [Effectiveness.SUPER_EFFECTIVE] = {}
    },
}

local criticalProbability = 0
local blockedProbability = 0
local noEffectTypes = {
    ["electric"] = {"ground"},
    ["ghost"] = {"normal", "fighting"},
    ["ground"] = {"flying"},
    ["psychic"] = {"dark"},
    ["dragon"] = {"fairy"}
}

local function hasNoEffect(attackerType, defenderType, defenderType2)
    if noEffectTypes[attackerType] then
        return isInArray(noEffectTypes[attackerType], defenderType) or isInArray(noEffectTypes[attackerType], defenderType2)
    end
    return false
end

-- Função principal para calcular a efetividade
local function getEffectiveness(attackerType, defenderType, defenderType2)
    local effectiveness = Effectiveness.NEUTRAL -- Padrão como neutro

    -- Verificar "No Effect"
    if hasNoEffect(attackerType, defenderType, defenderType2) then
        return Effectiveness.NULL
    end

    -- Verificar a efetividade nos tipos
    if effectivenessTable[attackerType] then
        for level, types in pairs(effectivenessTable[attackerType]) do
            if isInArray(types, defenderType) or isInArray(types, defenderType2) then
                effectiveness = level
                break
            end
        end
    end

    return effectiveness
end

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    if not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local primaryTypeName = getCombatName(primaryType)
    local secondaryTypeName = getCombatName(secondaryType)

    -- Verificar se os tipos são válidos
    if not primaryTypeName or not effectivenessTable[primaryTypeName] then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local damageMultiplier = 1.0
    local defenderMonsterType = MonsterType(creature:getName())
    local defenderRace = defenderMonsterType and defenderMonsterType:getRaceName() or "none"
    local defenderRace2 = defenderMonsterType and defenderMonsterType:getRace2Name() or "none"

    -- Verificar "No Effect"
    if hasNoEffect(primaryTypeName, defenderRace, defenderRace2) then
        return 0, primaryType, secondaryDamage, secondaryType
    end

    -- Determinar efetividade
    local effectiveness = getEffectiveness(primaryTypeName, defenderRace, defenderRace2)
    damageMultiplier = damageMultiplier * effectiveness

    -- Critical and Block mechanics
    if math.random(1, 100) <= criticalProbability then
        damageMultiplier = damageMultiplier * 1.5
        Game.sendAnimatedText(creature:getPosition(), "CRITICAL", TEXTCOLOR_RED)
    elseif math.random(1, 100) <= blockedProbability then
        damageMultiplier = 0.0
        Game.sendAnimatedText(creature:getPosition(), "BLOCKED", TEXTCOLOR_LIGHTGREY)
    end

    -- Garantir que o multiplicador não cause cura
    damageMultiplier = math.max(damageMultiplier, 0)

    -- Calcular os danos finais
    if primaryDamage then primaryDamage = math.floor(primaryDamage * damageMultiplier) end
    if secondaryDamage then secondaryDamage = math.floor(secondaryDamage * damageMultiplier) end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
