local npcHandler = NpcHandler:new(KeywordHandler:new())
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local questStorage = 58000 
local starterPokemons = {
    ["bulbasaur"] = {name = "Bulbasaur", ballId = 26661},
    ["charmander"] = {name = "Charmander", ballId = 26661},
    ["squirtle"] = {name = "Squirtle", ballId = 26661},
}
local rewardItems = {
    {id = 26662, count = 100},
    {id = 27642, count = 30}, 
    {id = 27645, count = 20} 
}

local function createPokemonBall(player, pokemonName, ballId)
    -- Obtém os dados do Pokémon
    local monsterType = MonsterType(pokemonName)
    if not monsterType then
        print("WARNING: Invalid Pokémon name: " .. pokemonName)
        return false
    end

    local baseHealth = monsterType:getMaxHealth()
    local maxHealth = baseHealth
    local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)

    if not backpack then
        print("WARNING: Player " .. player:getName() .. " has no backpack!")
        return false
    end

    -- Define gênero e natureza do Pokémon
    local gender = math.random(1, 100) <= 50 and "male" or "female"
    local nature = getRandomNature()
    local natureBonus = getNatureBonus(nature) or {}

    -- Gera IVs aleatórios entre 1 e 31
    local ivs = {
        hp = math.random(1, 31),
        attack = math.random(1, 31),
        defense = math.random(1, 31),
        speed = math.random(1, 31),
        spAttack = math.random(1, 31),
        spDefense = math.random(1, 31)
    }
    local ivString = table.concat({ivs.hp, ivs.attack, ivs.defense, ivs.speed, ivs.spAttack, ivs.spDefense}, ";")

    -- Cria a Pokébola no inventário
    local pokeball = backpack:addItem(ballId, 1)
    if not pokeball then
        print("ERROR: Falha ao criar Pokébola para " .. player:getName())
        return false
    end

    -- Define atributos básicos da Pokébola
    pokeball:setSpecialAttribute("pokeName", pokemonName)
    pokeball:setSpecialAttribute("pokeLevel", 10)
    pokeball:setSpecialAttribute("pokeExperience", 0)
    pokeball:setSpecialAttribute("pokeBoost", 0)
    pokeball:setSpecialAttribute("pokeMaxHealth", maxHealth)
    pokeball:setSpecialAttribute("pokeHealth", maxHealth)
    pokeball:setSpecialAttribute("pokeLove", 0)
    pokeball:setSpecialAttribute("pokeEv", 0)
    pokeball:setSpecialAttribute("pokeGender", gender)
    pokeball:setSpecialAttribute("pokeNature", nature)
    pokeball:setSpecialAttribute("pokeIV", ivString)

    -- Ajusta os atributos com base nos IVs e Nature
    local attack = math.floor(monsterType:getMeleeDamage() * (1 + (ivs.attack / 31) * 0.3))
    local defense = math.floor(monsterType:getDefense() * (1 + (ivs.defense / 31) * 0.3))
    local spAttack = math.floor(monsterType:getMoveMagicAttackBase() * (1 + (ivs.spAttack / 31) * 0.3))
    local spDefense = math.floor(monsterType:getMoveMagicDefenseBase() * (1 + (ivs.spDefense / 31) * 0.3))
    local speed = math.floor(100 * (1 + (ivs.speed / 31) * 1.1))

    -- Aplica os bônus da Natureza
    attack = math.floor(attack * (natureBonus.atk or 1.0))
    defense = math.floor(defense * (natureBonus.def or 1.0))
    spAttack = math.floor(spAttack * (natureBonus.spatk or 1.0))
    spDefense = math.floor(spDefense * (natureBonus.spdef or 1.0))
    speed = math.floor(speed * (natureBonus.speed or 1.0))

    -- Define os novos atributos na Pokébola
    pokeball:setSpecialAttribute("pokeAttack", attack)
    pokeball:setSpecialAttribute("pokeDefense", defense)
    pokeball:setSpecialAttribute("pokeSpecialAttack", spAttack)
    pokeball:setSpecialAttribute("pokeSpecialDefense", spDefense)
    pokeball:setSpecialAttribute("pokeSpeed", speed)

    return true
end


function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if not player then
        return false
    end

    if msgcontains(msg, "yes") or msgcontains(msg, "inicial") then
        if player:getStorageValue(questStorage) > 0 then
            npcHandler:say("Voce ja escolheu seu Pokemon inicial!", cid)
            npcHandler:releaseFocus(cid)
            return true
        end
        npcHandler:say("Ola! Voce pode escolher um Pokemon inicial: Bulbasaur, Charmander ou Squirtle. Qual voce escolhe?", cid)
        npcHandler.topic[cid] = 1
    elseif npcHandler.topic[cid] == 1 then
        local choice = msg:lower()
        if starterPokemons[choice] then
            local pokemon = starterPokemons[choice]
            if createPokemonBall(player, pokemon.name, pokemon.ballId) then
                for _, reward in ipairs(rewardItems) do
                    player:addItem(reward.id, reward.count)
                end
                player:setStorageValue(questStorage, 1)
                npcHandler:say("Parabens! Voce escolheu " .. choice .. " como seu Pokemon inicial e recebeu alguns itens!", cid)
            else
                npcHandler:say("Houve um problema ao entregar o seu Pokemon inicial. Tente novamente.", cid)
            end
            npcHandler:releaseFocus(cid)
        else
            npcHandler:say("Por favor, escolha entre Bulbasaur, Charmander ou Squirtle.", cid)
        end
    elseif msgcontains(msg, "bye") then
        npcHandler:say("Boa sorte em sua jornada, treinador!", cid)
        npcHandler:releaseFocus(cid)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
