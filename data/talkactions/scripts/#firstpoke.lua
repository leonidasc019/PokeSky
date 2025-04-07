function onSay(player, words, param)
    local starterPokemons = { "bulbasaur", "charmander", "squirtle" }
    local pokemonName = nil
	print(player:getStorageValue(58000))
    if player:getStorageValue(58000) < 1 then
        -- Verificar se o Pokémon é um inicial
        for i = 1, #starterPokemons do
            if param:lower() == starterPokemons[i]:lower() then
                pokemonName = starterPokemons[i]
                break
            end
        end

        if not pokemonName then
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Esse Pokemon nao e um inicial valido.")
            return false
        end

        player:addSlotItems()
        local monsterType = MonsterType(pokemonName)
        local baseHealth = monsterType:getMaxHealth()
        local maxHealth = math.floor(baseHealth * statusGainFormula(player:getLevel(), 5, 0, 0)) * 1000
        local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
        local addPokeball = backpack:addItem(26661, 1)

        local gender = math.random(1, 100) <= 50 and "male" or "female"
        local nature = getRandomNature()
        local natureBonus = getNatureBonus(nature) or {}
        local ivs = {
            hp = math.random(1, 31),
            attack = math.random(1, 31),
            defense = math.random(1, 31),
            speed = math.random(1, 31),
            spAttack = math.random(1, 31),
            spDefense = math.random(1, 31)
        }
        local ivString = table.concat({ivs.hp, ivs.attack, ivs.defense, ivs.speed, ivs.spAttack, ivs.spDefense}, ";")

        if addPokeball then
            addPokeball:setSpecialAttribute("pokeName", pokemonName)
            addPokeball:setSpecialAttribute("pokeLevel", 10)
            addPokeball:setSpecialAttribute("pokeExperience", 0)
            addPokeball:setSpecialAttribute("pokeBoost", 0)
            addPokeball:setSpecialAttribute("pokeMaxHealth", maxHealth)
            addPokeball:setSpecialAttribute("pokeHealth", maxHealth)
            addPokeball:setSpecialAttribute("pokeLove", 0)
            addPokeball:setSpecialAttribute("pokeEv", 0)
            addPokeball:setSpecialAttribute("pokeGender", gender)
            addPokeball:setSpecialAttribute("pokeNature", nature)
            addPokeball:setSpecialAttribute("pokeIV", ivString)

            local attack = math.floor(monsterType:getMeleeDamage() * (1 + (ivs.attack / 31) * 0.3))
            local defense = math.floor(monsterType:getDefense() * (1 + (ivs.defense / 31) * 0.3))
            local spAttack = math.floor(monsterType:getMoveMagicAttackBase() * (1 + (ivs.spAttack / 31) * 0.3))
            local spDefense = math.floor(monsterType:getMoveMagicDefenseBase() * (1 + (ivs.spDefense / 31) * 0.3))
            local speed = math.floor(100 * (1 + (ivs.speed / 31) * 1.1))

            attack = math.floor(attack * (natureBonus.atk or 1.0))
            defense = math.floor(defense * (natureBonus.def or 1.0))
            spAttack = math.floor(spAttack * (natureBonus.spatk or 1.0))
            spDefense = math.floor(spDefense * (natureBonus.spdef or 1.0))
            speed = math.floor(speed * (natureBonus.speed or 1.0))

            addPokeball:setSpecialAttribute("pokeAttack", attack)
            addPokeball:setSpecialAttribute("pokeDefense", defense)
            addPokeball:setSpecialAttribute("pokeSpecialAttack", spAttack)
            addPokeball:setSpecialAttribute("pokeSpecialDefense", spDefense)
            addPokeball:setSpecialAttribute("pokeSpeed", speed)
        else
            print("WARNING! Player " .. player:getName() .. " without initial pokeball.")
        end

        -- 🎁 Adiciona os reward items aqui
        local rewardItems = {
            {id = 26662, count = 100},
            {id = 27642, count = 30},
            {id = 27645, count = 20}
        }

		for _, reward in ipairs(rewardItems) do
			player:addItem(reward.id, reward.count)
		end

        player:setStorageValue(58000, 1)
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você ja escolheu seu Pokemon inicial.")
    end

    return false
end
