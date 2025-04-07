-- local halloweenChance = 4 
-- local christmasChance = 4 
-- local megaChance = 1 
local bossChance = 5
local shinyChance = 10

function Monster:onSpawn(position, startup, artificial)
    if not artificial and not startup then
        local name = self:getName()
        local monsterType = MonsterType(name)

        if math.random(1, 300) <= shinyChance then
            if monsterType:hasShiny() > 0 then
                local shinyName = "Shiny " .. name
                local shinyMonsterType = MonsterType(shinyName)

                if not shinyMonsterType then
                    print("AVISO! " .. shinyName .. " não encontrado para respawn.")
                else
                    -- Criação do Pokémon Shiny Itigar
                    local shinyMonster = Game.createMonster(shinyName, position, false, false, 0, 0)
                    if shinyMonster then
                        -- Adiciona a aura ao Pokémon Shiny
                        doSendShinyAura(shinyMonster:getId())
                    end
                    return false
                end
            end
        end

        if math.random(1, 500) <= bossChance then
            local bossList = {"Salamence", "Togekiss", "Slaking", "Rhyperior", "Metagross", "Magmortar", "Milotic", "Dusknoir", "Tangrowth", "Electivire", "Shiny Salamence", "Shiny Slaking", "Shiny Rhyperior", "Shiny Metagross", "Shiny Magmortar", "Shiny Milotic", "Shiny Tangrowth", "Shiny Electivire", "Shiny Dusknoir", "Shiny Togekiss", "Shiny Tangrowth"}
            local randomBoss = bossList[math.random(#bossList)]

            Game.createMonster(randomBoss, position)
            return false
        end
    end

    return true
end

