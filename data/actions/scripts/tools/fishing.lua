-- Configuracoes de pesca
local config = {
    waterIds = { -- IDs das aguas
        [493] = true, [4608] = true, [4609] = true, [4610] = true, [4611] = true,
        [4612] = true, [4613] = true, [4614] = true, [4615] = true, [4616] = true,
        [4617] = true, [4618] = true, [4619] = true, [4620] = true, [4621] = true,
        [4622] = true, [4623] = true, [4624] = true, [4625] = true, [7236] = true,
        [10499] = true, [15401] = true, [15402] = true, [4820] = true, [4821] = true,
        [4822] = true, [4823] = true, [4824] = true, [4825] = true, [4664] = true,
        [4665] = true, [4666] = true
    },
    outfit = {
        [0] = { id = 2008 }, -- PLAYERSEX_FEMALE
        [1] = { id = 2009 }, -- PLAYERSEX_MALE
    },
    fishing = {
        baits = {
            [3976] = { -- Minhoca
                names_pokemon = {"Magikarp", "Goldeen", "Poliwag", "Tentacool", "Krabby", "Horsea", "Shellder", "Staryu", "Psyduck", "Squirtle"},
                count = {min = 1, max = 3},
                time = {min = 10, max = 20},
                requiredFishingLevel = 0,
                exp = 60, -- EXP ao usar esta isca
            },
            [40204] = { -- Seaweed
                names_pokemon = {"Tentacruel", "Seadra", "Poliwhirl", "Kingler", "Seaking", "Cloyster", "Golduck", "Wartortle", "Starmie"},
                count = {min = 1, max = 3},
                time = {min = 15, max = 25},
                requiredFishingLevel = 30,
                exp = 40, -- EXP ao usar esta isca
            },
            [40202] = { -- Fish
                names_pokemon = {"Blastoise", "Gyarados", "Poliwrath", "Kingdra"},
                count = {min = 1, max = 3},
                time = {min = 25, max = 30},
                requiredFishingLevel = 60,
                exp = 20, -- EXP ao usar esta isca
            }
        },
        effects = {
            start = 904,  -- Efeito correto para inicio de pesca
            bite = 905,   -- Efeito para a mordida
            additional = 292, -- Efeito adicional 1
            additional2 = 2,  -- Efeito adicional 2 (novo efeito adicionado)
        },
        maxDistance = 6,
    },
}

-- Funcao para verificar se o jogador tem um Pokemon fora da Pokebola
local function canFishWithoutPokemon(player)
    return player:getSummons() and #player:getSummons() > 0
end

-- Verifica se o jogador esta pescando
local function isFishing(player)
    return player:getCondition(CONDITION_OUTFIT) ~= nil
end

-- Função para capturar a cor do outfit original
local function getOriginalOutfit(player)
    local outfit = player:getOutfit()
    return {lookType = outfit.lookType, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet, lookAddons = outfit.lookAddons}
end

-- Monitoramento da distancia e aplicacao de efeitos
local function monitorFishing(player, waterPosition, fishingTime)
    local startEffect = config.fishing.effects.start
    local biteEffect = config.fishing.effects.bite
    local interval = 1000 -- Intervalo entre efeitos (1 segundo)
    local elapsedTime = 0 -- Tempo que ja passou
    local biteDuration = 2000 -- Duracao extra do efeito de mordida apos o tempo de pesca

    local function applyEffects()
        if not isFishing(player) then
            return -- Interrompe se o jogador nao estiver mais pescando
        end

        if player:getPosition():getDistance(waterPosition) > config.fishing.maxDistance then
            player:removeCondition(CONDITION_OUTFIT)
            player:sendCancelMessage("Voce se afastou da agua e parou de pescar.")
            return
        end

        if elapsedTime >= (fishingTime - 3) * 1000 then
            -- Aplica o efeito de "mordida" nos ultimos 3 segundos e alem
            waterPosition:sendMagicEffect(biteEffect)
            elapsedTime = elapsedTime + interval
            if elapsedTime < fishingTime * 1000 + biteDuration then
                addEvent(applyEffects, interval)
            end
        else
            -- Aplica o efeito de inicio durante o restante do tempo
            waterPosition:sendMagicEffect(startEffect)
            elapsedTime = elapsedTime + interval
            addEvent(applyEffects, interval)
        end
    end

    applyEffects() -- Inicia o ciclo de efeitos
end

-- Função para verificar se o jogador tem apenas um tipo de isca
local function hasOnlyOneBaitType(player)
    local baitTypes = {}
    for baitId, _ in pairs(config.fishing.baits) do
        if player:getItemCount(baitId) > 0 then
            table.insert(baitTypes, baitId)
        end
    end
    return #baitTypes == 1, baitTypes
end

-- Função principal
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local targetId = target.itemid
    if not config.waterIds[targetId] then
        player:sendCancelMessage("Voce so pode pescar na agua.")
        return true
    end

    if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("Nao e permitido pescar em zona protegida.")
        return true
    end

    if player:isOnSurf() or player:isOnRide() or player:isOnFly() then
        player:sendCancelMessage("Voce nao pode pescar enquanto estiver voando, em cima de uma montaria ou surf.")
        return true
    end

    if not canFishWithoutPokemon(player) then
        player:sendCancelMessage("Voce precisa ter um Pokemon fora da Pokebola para pescar.")
        return true
    end
    
    local waterPosition = target:getPosition()
    if player:getPosition():getDistance(waterPosition) > config.fishing.maxDistance then
        player:sendCancelMessage("Voce esta muito longe da agua.")
        return true
    end
    
    if isFishing(player) then
        player:sendCancelMessage("Voce ja esta pescando.")
        return true
    end
    
    -- Verifica se existe uma isca configurada
    local baitId, baitConfig
    for id, config in pairs(config.fishing.baits) do
        if player:getItemCount(id) > 0 and player:getSkillLevel(SKILL_FISHING) >= config.requiredFishingLevel then
            baitId, baitConfig = id, config
            break
        end
    end
    
    if not baitConfig then
        player:sendCancelMessage("Voce precisa de uma isca para pescar ou nao tem o nivel necessario.")
        return true
    end
    
    -- Verifica se o jogador tem apenas um tipo de isca
    local hasOneBait, baitTypes = hasOnlyOneBaitType(player)
    if not hasOneBait then
        player:sendCancelMessage("Voce so pode carregar um tipo de isca no inventario. Remova os outros tipos de iscas.")
        return true
    end

    player:removeItem(baitId, 1)

    -- Captura o outfit original para restaurar após a pesca
    local originalOutfit = getOriginalOutfit(player)

    -- Define o outfit para pescar
    local fishingOutfit = config.outfit[player:getSex()]
    if fishingOutfit then
        local conditionOutfit = Condition(CONDITION_OUTFIT)
        conditionOutfit:setTicks(-1)
        conditionOutfit:setOutfit({lookType = fishingOutfit.id, lookHead = originalOutfit.lookHead, lookBody = originalOutfit.lookBody, lookLegs = originalOutfit.lookLegs, lookFeet = originalOutfit.lookFeet, lookAddons = originalOutfit.lookAddons})
        player:addCondition(conditionOutfit)
    end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce comecou a pescar...")
    local fishingTime = math.random(baitConfig.time.min, baitConfig.time.max)

    monitorFishing(player, waterPosition, fishingTime)

    addEvent(function()
        if isFishing(player) then
            local name_pokemon = baitConfig.names_pokemon[math.random(#baitConfig.names_pokemon)]
            local pokemon_count = math.random(baitConfig.count.min, baitConfig.count.max)
            for i = 1, pokemon_count do
                local pokemon = Game.createMonster(name_pokemon, player:getPosition())

                -- Aplica o efeito adicional no Pokémon, caso exista
                local pokemonPosition = pokemon:getPosition()
                if pokemon then
                    pokemonPosition:sendMagicEffect(config.fishing.effects.additional)
                    pokemonPosition:sendMagicEffect(config.fishing.effects.additional2)
                end
            end
            
            -- Adiciona experiência para a skill de pesca
            local expGain = baitConfig.exp
            player:addSkillTries(SKILL_FISHING, expGain)
            
            player:removeCondition(CONDITION_OUTFIT)
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce pescou " .. name_pokemon .. " e ganhou " .. expGain .. " de experiencia em pesca!")
        end
    end, fishingTime * 1000 + 500)

    return true
end
