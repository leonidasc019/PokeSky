function onSay(player, words, param)
    sendEvsPokemonData(player)
    return false
end

function sendEvsPokemonData(player)
    local ball = player:getUsingBall()
    if not ball then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa ter um Pokémon fora da Pokébola.")
        return false
    end

    local pokeName = ball:getSpecialAttribute("pokeName") or "Unknown"
    local monsterType = MonsterType(pokeName)
    if not monsterType then
        return
    end
    local outfit = monsterType:getOutfit().lookType or 0

    local type1 = ball:getSpecialAttribute("pokeType1") or "none"
    local type2 = ball:getSpecialAttribute("pokeType2") or "none"

    local maxHp = ball:getSpecialAttribute("pokeMaxHealth") or 0
    local atk = ball:getSpecialAttribute("pokeAttack") or 0
    local def = ball:getSpecialAttribute("pokeDefense") or 0
    local spAtk = ball:getSpecialAttribute("pokeSpecialAttack") or 0
    local spDef = ball:getSpecialAttribute("pokeSpecialDefense") or 0
    local speed = ball:getSpecialAttribute("pokeSpeed") or 0

    local evhp = ball:getSpecialAttribute("EvBaseHp") or 0
    local evatk = ball:getSpecialAttribute("EvBaseAtk") or 0
    local evdef = ball:getSpecialAttribute("EvBaseDef") or 0
    local evspatk = ball:getSpecialAttribute("EvBaseSpAtk") or 0
    local evspdef = ball:getSpecialAttribute("EvBaseSpDef") or 0
    local evspeed = ball:getSpecialAttribute("EvBaseSpeed") or 0
    local evpoints = ball:getSpecialAttribute("pokeEv") or 0

    local msg = string.format("EvsPokemon_Open@%s@%d@%s@%s@%d@%d@%d@%d@%d@%d@%d@%d@%d@%d@%d@%d@%d",
        pokeName,
        outfit,
        type1,
        type2,
        maxHp,
        atk,
        def,
        spAtk,
        spDef,
        speed,
        evhp,
        evatk,
        evdef,
        evspatk,
        evspdef,
        evspeed,
        evpoints
    )

    player:sendTextMessage(MESSAGE_FAILURE, msg)
end
