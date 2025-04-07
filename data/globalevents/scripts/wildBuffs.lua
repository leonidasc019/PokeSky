local buffedMonsters = {}

function onThink(interval)
    for _, player in ipairs(Game.getPlayers()) do
        local pos = player:getPosition()
        local spectators = Game.getSpectators(pos, false, false, 10, 10, 10, 10)

        if spectators then
            for _, creature in ipairs(spectators) do
                if creature:isMonster() and not creature:getMaster() then
                    local id = creature:getId()

                    if not buffedMonsters[id] then
                        buffedMonsters[id] = true

                        local hpBuff, speedBuff

                        -- Verifica se é Shiny e chama a função correta
                        if creature:getName():find("Shiny") then
                            hpBuff, speedBuff = getShinysBuffs()
                        else
                            hpBuff, speedBuff = getMonsterBuffs()
                        end

                        creature:setMaxHealth(creature:getMaxHealth() * hpBuff)
                        creature:setHealth(creature:getMaxHealth())
                        creature:changeSpeed(speedBuff)
                        creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
                    end
                end
            end
        end
    end

    return true
end
