filledPokeball = 2325 -- lixo
maxFilledBalls = 6 -- lixo
firstPortrait = 27117 -- lixo
stonesId = { -- lixo
{"Water", 2267},
{"Fire", 1}
}
-- Ajustes  Pokemons Selvagens

SBonusMelee = 1.5
SBonusDefense = 1.5
SBonusSAtack = 1.5
SBonusSDefense = 1.5
SBonusHP = 2.0
SBonusSpeed = 10

-- Bonus em % que Shiny Tem de força sobre os normais
ShinyBuffHP = 20
ShinyBuffSpeedy = 30
ShinyBonusBuff = 3.0

-- Fim do Ajuste Pokemon Selvagem

-- Bonus de Dano por posição do Pokemon

damageMultiplierMoves = {
    areawaves = 2.0,          
    singletargetweak = 1.3,  
    singletarget = 2.0,        
    singletargetstrong = 3.0,  
    areatarget = 2.5,    
    frontlinear = 2.0,    
    frontarea = 1.5,  
    passive = 3.5,  
    ultimate = 6.0  
}

-- Fim do bonus de dano por posição
maxBoost = 50
summonMaxLevel = 300
maxVitamins = 10
flyFloor = 460 
moveWords = {"m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8", "m9", "m10", "m11", "m12"}
legendaryIndex = {144, 145, 146, 150, 151, 243, 244, 245, 249, 250, 251, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386}
arenaLastPlayerId = 0



summonLevelDamageBuff = 0.001 
playerLevelDamageBuff = 0.002
summonBoostDamageBuff = 0.005 
summonLoveDamageBuff = 0.00 

vitaminStatusBuff = 1.2
hunterDamageBuff = 1.1
blockerHealthBuff = 1.25
catcherCatchBuff = 1.1
explorerExperienceBuff = 1.15
healerHealBuff = 2.0

storageDelay = 1000
storageDelayBag = 1001
baseStorageTries = 61000
baseStorageCatches = 64000
baseStorageDex = 67000
baseStorageMove = 45000

storageRide = 5000
storageFly = 5001
storageSurf = 5002
storageEvolving = 5003
storageDelayTeleport = 5005
storageBike = 5006
storageDelayDesbugar = 5007
storageDive = 5008
storageAutoLoot = 5009
storageTokens = 5014
storageDuelNpc = 5016
storageDuelNpcStatus = 5017
storageLogoutSpeed = 5021
storageLeague = 91006
storageLeagueTime = 91008
storageLeaguePotion = 91009
storageLeagueRevive = 910010
storageVictoryRoadTime = 91011


slotItems = {38680, 38681, 38682, 2263, 2270, 26820}
badgesPortraits = {26611, 26610, 26616, 26613, 26612, 26615, 26609, 26614}
badgesPortraits = {38689, 38683, 38685, 38690, 38684, 38688, 38686, 38687}
badgeContainer = 38680


balls = {
pokeball = {emptyId = 26662, usedOn = 26661, usedOff = 26672, effectFail = 734, effectSucceed = 735, missile = 55, effectRelease = 308, chanceMultiplier = 1.0},
greatball = {emptyId = 26660, usedOn = 26663, usedOff = 26675, effectFail = 738, effectSucceed = 739, missile = 57, effectRelease = 309, chanceMultiplier = 1.2},
superball = {emptyId = 26659, usedOn = 26669, usedOff = 26674, effectFail = 736, effectSucceed = 737, missile = 56, effectRelease = 879, chanceMultiplier = 1.3},
ultraball = {emptyId = 26688, usedOn = 26670, usedOff = 26681, effectFail = 740, effectSucceed = 741, missile = 58, effectRelease = 311, chanceMultiplier = 1.4},
safariball = {emptyId = 26685, usedOn = 26667, usedOff = 26679, effectFail = 323, effectSucceed = 324, missile = 128, effectRelease = 315, chanceMultiplier = 1.0},
itigarball = {emptyId = 39065, usedOn = 39064, usedOff = 39063, effectFail = 899, effectSucceed = 897, missile = 146, effectRelease = 898, chanceMultiplier = 2.0},
premierball = {emptyId = 26683, usedOn = 26666, usedOff = 26678, effectFail = 321, effectSucceed = 322, missile = 129, effectRelease = 310, chanceMultiplier = 1.5},
}

-- insignias 
	quests = 
	{
	boulderBadge = {
			prizes = {
				[1] = {
					uid = 92000,
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26614, add = 26608}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	cascadeBadge = {
			prizes = {
				[1] = {
					uid = 92001,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26609, add = 26607}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	thunderBadge = {
			prizes = {
				[1] = {
					uid = 92002,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26615, add = 26603}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	rainbowBadge = {
			prizes = {
				[1] = {
					uid = 92003,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26612, add = 26602}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	soulBadge = {
			prizes = {
				[1] = {
					uid = 92004,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26613, add = 26605}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	marshBadge = {
			prizes = {
				[1] = {
					uid = 92005,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26616, add = 26606}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	volcanoBadge = {
			prizes = {
				[1] = {
					uid = 92006,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26610, add = 26601}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	earthBadge = {
			prizes = {
				[1] = {
					uid = 92007,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 26611, add = 26604}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	zephyrBadge = {
			prizes = {
				[1] = {
					uid = 92008,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38689, add = 38695}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},
	hiveBadge = {
			prizes = {
				[1] = {
					uid = 92009,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38683, add = 38694}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	plainBadge = {
			prizes = {
				[1] = {
					uid = 92010,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38685, add = 38691}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	fogBadge = {
			prizes = {
				[1] = {
					uid = 92011,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38690, add = 38693}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	stormBadge = {
			prizes = {
				[1] = {
					uid = 92012,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38684, add = 38697}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	mineralBadge = {
			prizes = {
				[1] = {
					uid = 92013,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38688, add = 38698}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	glacierBadge = {
			prizes = {
				[1] = {
					uid = 92014,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38686, add = 38692}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	risingBadge = {
			prizes = {
				[1] = {
					uid = 92015,				
					items = {
					},
					pokes = {
					},
					badges = {
						[1] = {remove = 38687, add = 38696}, 
					}
				}
			},
			level = 1, 
			teleportCP = 0
		},

	}

-- Fim Insignias

function getShinysBuffs()
    local hpBuff = ShinyBuffHP
    local speedBuff = ShinyBuffSpeedy

    return hpBuff, speedBuff
end

function getMonsterBuffs()
    local hpBuff = SBonusHP
    local speedBuff = SBonusSpeed

    return hpBuff, speedBuff
end

function buildDex()
	monstersTable = {}
	local monstersName = getMonstersName()
	for i = 1, #monstersName do
		local monsterNumber = MonsterType(monstersName[i]):dexEntry()
		if monsterNumber > 0 then
			monstersTable[monsterNumber] = monstersName[i]
		end
	end
	-- print("WARNING! Pokedex successfully built.") Itigar
end

function getBlessingsCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 120 then
		return 20000
	else
		return (level - 20) * 200
	end
end

function getPvpBlessingCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 270 then
		return 50000
	else
		return (level - 20) * 200
	end
end

--Itigar Bike
Config_ = {
    back = {
        [0] = {x = 0, y = 1},
        [1] = {x = -1, y = 0},
        [2] = {x = 0, y = -1},
        [3] = {x = 1, y = 0},
    };
}

local lastPositions = {}

--Condiçao Para nao deixar usar Outra roupa por cima e adicionar rastro de efeitos
function getEffectIdForPlayer(player)
    if player:getStorageValue(56203) == 1 then --Patins
        return 1565
    end
    return nil
end

function effectWhenWalking(player_uid)
    local player = Player(player_uid)
    if player then
        local id_effect = getEffectIdForPlayer(player)
        if id_effect then
            local player_position = player:getPosition()

            local lastPosition = lastPositions[player_uid] or {x = -1, y = -1, z = -1}

            if player_position.x ~= lastPosition.x or player_position.y ~= lastPosition.y or player_position.z ~= lastPosition.z then
                local player_direction = player:getDirection()
                local player_pos_x = player_position.x
                local player_pos_y = player_position.y
                local player_pos_z = player_position.z
                local position = {x = player_pos_x + Config_.back[player_direction].x, 
                                  y = player_pos_y + Config_.back[player_direction].y, 
                                  z = player_pos_z}
                doSendMagicEffect(position, id_effect)

                lastPositions[player_uid] = player_position
            end

            addEvent(effectWhenWalking, 200, player_uid)
        else
            return
        end
    end
end

function getTibianTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getNeededExp(level) return (15 * (level * level * level - 6 * level * level + 17 * level - 12) / 3) end

function statusGainFormula(playerLevel, summonLevel, summonBoost, pokeLove)
	return (1.0 + summonLevel * summonLevelDamageBuff + playerLevel * playerLevelDamageBuff + summonBoost * summonBoostDamageBuff + pokeLove * summonLoveDamageBuff)
end

function damageFormula(playerLevel, summonLevel, summonBoost, pokeLove)
	return statusGainFormula(playerLevel, summonLevel, summonBoost, pokeLove)
end

function defenseFormula(playerLevel, summonLevel, summonBoost, pokeLove)
	return (1.0 / 600.0 * statusGainFormula(playerLevel, summonLevel, summonBoost, pokeLove))
end

function getBallKey(uid)
	for key, value in pairs(balls) do
		if uid == value.emptyId or uid == value.usedOn or uid == value.usedOff then
			return key
		end
	end
	return "pokeball"
end

function Monster.getTotalHealth(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then
		local total = math.floor(monsterType:getMaxHealth() * statusGainFormula(self:getMaster():getLevel(), self:getLevel(), self:getBoost(), self:getLove()))
		if self:getMaster():getVocation():getName() == "Blocker" then
			total = total * blockerHealthBuff
		end
		local vitamins = self:getUsedVitaminsNumber("hp")
		if vitamins > 0 then
			total = total + math.floor(monsterType:getMaxHealth() * vitamins / maxVitamins * vitaminStatusBuff)
		end
		return total
	elseif self:isMonster() then
		return math.floor(monsterType:getMaxHealth() * statusGainFormula(0, self:getLevel(), 0, 0))
	end
	return 0
end

function Monster.getTotalHealthVocationContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then
		if self:getMaster():getVocation():getName() == "Blocker" then
			return math.floor(monsterType:getMaxHealth() * statusGainFormula(self:getMaster():getLevel(), self:getLevel(), self:getBoost(), self:getLove()) * (blockerHealthBuff - 1.0))
		end
	end
	return 0
end

function Monster.getTotalHealthPlayerContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMaxHealth() * (statusGainFormula(self:getMaster():getLevel(), 0, 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalHealthSummonLevelContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMaxHealth() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	elseif self:isMonster() then
		return math.floor(monsterType:getMaxHealth() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))	
	end	
	return 0
end

function Monster.getTotalHealthSummonBoostContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMaxHealth() * (statusGainFormula(0, 0, self:getBoost(), 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalHealthSummonVitaminContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		local vitamins = self:getUsedVitaminsNumber("hp")
		if vitamins > 0 then
			return math.floor(monsterType:getMaxHealth() * vitamins / maxVitamins * vitaminStatusBuff)
		end
	end
	return 0
end

function MonsterType.getMeleeDamage(self)
	local minMelee = 0
	local maxMelee = 0
	for i = 1, #self:getAttackList() do
		if self:getAttackList()[i].isMelee == 1 then	
			minMelee = minMelee - self:getAttackList()[i].minCombatValue		
			maxMelee = maxMelee - self:getAttackList()[i].maxCombatValue			
		end
	end
	local aveMelee = (minMelee + maxMelee) / 2
	return math.floor(aveMelee)
end

-- Atualizado para Utilizar os IVs 
function Monster.getTotalMeleeAttack(self)
	local monsterType = MonsterType(self:getName())
	local minMelee, maxMelee = 0, 0

	-- Calcula o dano médio do ataque físico
	for _, attack in ipairs(monsterType:getAttackList()) do
		if attack.isMelee == 1 then
			minMelee = minMelee - attack.minCombatValue
			maxMelee = maxMelee - attack.maxCombatValue
		end
	end
	local aveMelee = (minMelee + maxMelee) / 2

	-- Se for um Pokémon, tentamos pegar o valor da Pokébola
	if self:isPokemon() and self:getMaster() then
		local master = self:getMaster()
		local ball = master:getUsingBall() -- Pegamos a Pokébola correta

		-- Se encontrou a Pokébola, pega o valor do ataque físico salvo
		if ball and ball:getSpecialAttribute("pokeName") == self:getName() then
			if ball:getSpecialAttribute("pokeGender") == "male" then
				aveMelee = (ball:getSpecialAttribute("pokeAttack") or aveMelee) * 1.08
			else
				aveMelee = ball:getSpecialAttribute("pokeAttack") or aveMelee
			end
		end

		-- Aplicamos os cálculos padrão
		local total = math.floor(aveMelee * statusGainFormula(master:getLevel(), self:getLevel(), self:getBoost(), self:getLove()))

		if master:getVocation():getName() == "Hunter" then
			total = total * hunterDamageBuff
		end

		local vitamins = self:getUsedVitaminsNumber("attack")
		if vitamins > 0 then
			total = total + math.floor(aveMelee * vitamins / maxVitamins * vitaminStatusBuff)
		end

		return total
		elseif self:isMonster() then
		    local name = self:getName()
		    local isShiny = name:find("Shiny") ~= nil

		    local shinyBonus = isShiny and ShinyBonusBuff or 1.0

		    return math.floor(aveMelee * SBonusMelee * shinyBonus * statusGainFormula(0, self:getLevel(), 0, 0))
		end
	
	return 0
end


function Monster.getTotalMeleeAttackPlayerContribution(self)
	local monsterType = MonsterType(self:getName())
	local minMelee = 0
	local maxMelee = 0
	for i = 1, #monsterType:getAttackList() do
		if monsterType:getAttackList()[i].isMelee == 1 then	
			minMelee = minMelee - monsterType:getAttackList()[i].minCombatValue		
			maxMelee = maxMelee - monsterType:getAttackList()[i].maxCombatValue			
		end
	end
	local aveMelee = (minMelee + maxMelee) / 2
	if self:isPokemon() then 
		return math.floor(aveMelee * (statusGainFormula(self:getMaster():getLevel(), 0, 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMeleeAttackSummonLevelContribution(self)
	local monsterType = MonsterType(self:getName())
	local minMelee = 0
	local maxMelee = 0
	for i = 1, #monsterType:getAttackList() do
		if monsterType:getAttackList()[i].isMelee == 1 then	
			minMelee = minMelee - monsterType:getAttackList()[i].minCombatValue		
			maxMelee = maxMelee - monsterType:getAttackList()[i].maxCombatValue			
		end
	end
	local aveMelee = (minMelee + maxMelee) / 2
	if self:isPokemon() then 
		return math.floor(aveMelee * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	elseif self:isMonster() then
		return math.floor(aveMelee * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMeleeAttackSummonBoostContribution(self)
	local monsterType = MonsterType(self:getName())
	local minMelee = 0
	local maxMelee = 0
	for i = 1, #monsterType:getAttackList() do
		if monsterType:getAttackList()[i].isMelee == 1 then	
			minMelee = minMelee - monsterType:getAttackList()[i].minCombatValue		
			maxMelee = maxMelee - monsterType:getAttackList()[i].maxCombatValue			
		end
	end
	local aveMelee = (minMelee + maxMelee) / 2
	if self:isPokemon() then 
		return math.floor(aveMelee * (statusGainFormula(0, 0, self:getBoost(), 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMeleeAttackVocationContribution(self)
	local monsterType = MonsterType(self:getName())
	local minMelee = 0
	local maxMelee = 0
	for i = 1, #monsterType:getAttackList() do
		if monsterType:getAttackList()[i].isMelee == 1 then	
			minMelee = minMelee - monsterType:getAttackList()[i].minCombatValue		
			maxMelee = maxMelee - monsterType:getAttackList()[i].maxCombatValue			
		end
	end
	local aveMelee = (minMelee + maxMelee) / 2
	if self:isPokemon() then 
		if self:getMaster():getVocation():getName() == "Hunter" then
			return math.floor(aveMelee * statusGainFormula(self:getMaster():getLevel(), self:getLevel(), self:getBoost(), self:getLove()) * (hunterDamageBuff - 1.0))
		end
	end
	return 0
end

function Monster.getTotalMeleeAttackVitaminContribution(self)
	local monsterType = MonsterType(self:getName())
	local minMelee = 0
	local maxMelee = 0
	for i = 1, #monsterType:getAttackList() do
		if monsterType:getAttackList()[i].isMelee == 1 then	
			minMelee = minMelee - monsterType:getAttackList()[i].minCombatValue		
			maxMelee = maxMelee - monsterType:getAttackList()[i].maxCombatValue			
		end
	end
	local aveMelee = (minMelee + maxMelee) / 2
	if self:isPokemon() then
		local vitamins = self:getUsedVitaminsNumber("attack")
		if vitamins > 0 then
			return math.floor(aveMelee * vitamins / maxVitamins * vitaminStatusBuff)
		end
	end
	return 0
end
-- Base pra fazer IV nas Spells
function Monster.getTotalMagicAttack(self)
	local monsterType = MonsterType(self:getName())
	local specialAttack = monsterType:getMoveMagicAttackBase() -- Valor padrão

	-- Verifica se é um Pokémon e tem um mestre
	if self:isPokemon() and self:getMaster() then
		local master = self:getMaster()
		local ball = master:getUsingBall() -- ✅ Pega a Pokébola diretamente do Player

		-- Se encontrou a Pokébola, pega o Special Attack dela
		if ball and ball:getSpecialAttribute("pokeName") == self:getName() then
			if ball:getSpecialAttribute("pokeGender") == "male" then
				specialAttack = (ball:getSpecialAttribute("pokeSpecialAttack") or specialAttack) * 1.08
			else
				specialAttack = ball:getSpecialAttribute("pokeSpecialAttack") or specialAttack
			end
		end
	end

	if self:isPokemon() then
		local total = math.floor(specialAttack * statusGainFormula(self:getMaster():getLevel(), self:getLevel(), self:getBoost(), self:getLove()))
		
		if self:getMaster():getVocation():getName() == "Hunter" then
			total = total * hunterDamageBuff
		end

		local vitamins = self:getUsedVitaminsNumber("magicAttack")
		if vitamins > 0 then
			total = total + math.floor(specialAttack * vitamins / maxVitamins * vitaminStatusBuff)
		end

		return total

	elseif self:isMonster() then
	    local name = self:getName()
	    local isShiny = name:find("Shiny") ~= nil

	    local shinyBonus = isShiny and ShinyBonusBuff or 1.0
		return math.floor(specialAttack * SBonusSAtack * shinyBonus * statusGainFormula(0, self:getLevel(), 0, 0))
	end
	
	return 0
end


function Monster.getTotalMagicAttackVocationContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then
		if self:getMaster():getVocation():getName() == "Hunter" then
			return math.floor(monsterType:getMoveMagicAttackBase() * statusGainFormula(self:getMaster():getLevel(), self:getLevel(), self:getBoost(), self:getLove()) * (hunterDamageBuff - 1.0))
		end
	end
	return 0
end

function Monster.getTotalMagicAttackPlayerContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMoveMagicAttackBase() * (statusGainFormula(self:getMaster():getLevel(), 0, 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMagicAttackSummonLevelContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMoveMagicAttackBase() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	elseif self:isMonster() then
		return math.floor(monsterType:getMoveMagicAttackBase() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMagicAttackSummonBoostContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMoveMagicAttackBase() * (statusGainFormula(0, 0, self:getBoost(), 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMagicAttackVitaminContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		local vitamins = self:getUsedVitaminsNumber("magicAttack")
		if vitamins > 0 then
			return math.floor(monsterType:getMoveMagicAttackBase() * vitamins / maxVitamins * vitaminStatusBuff)
		end
	end
	return 0
end

-- Utilizando novos valores de Defesa com IV System
function Monster.getTotalDefense(self)
	local monsterType = MonsterType(self:getName())

	-- Se for um Pokemon, tentamos encontrar a pokebola
	if self:isPokemon() and self:getMaster() then
		local master = self:getMaster()
		local ball = master:getUsingBall() -- Pegamos a pokebola correta
		-- se for encontrado a pokebola, vamos usar o valor da defesa novo
		if ball and ball:getSpecialAttribute("pokeName") == self:getName() then
			if ball:getSpecialAttribute("pokeGender") == "male" then
				total = (ball:getSpecialAttribute("pokeDefense")) * 1.08
			else
				total = ball:getSpecialAttribute("pokeDefense")
			end
		end
		-- Se for pokemon selvagem, usaremos cálculo padrão
		local total = math.floor(monsterType:getDefense() * statusGainFormula(self:getMaster():getLevel(), self:getLevel(), self:getBoost(), self:getLove()))
		
		local vitamins = self:getUsedVitaminsNumber("defense")
		if vitamins > 0 then
			total = total + math.floor(monsterType:getDefense() * vitamins / maxVitamins * vitaminStatusBuff)
		end
		return total
	elseif self:isMonster() then
	    local name = self:getName()
	    local isShiny = name:find("Shiny") ~= nil

	    local shinyBonus = isShiny and ShinyBonusBuff or 1.0
		return math.floor(monsterType:getDefense() * SBonusDefense * shinyBonus * statusGainFormula(0, self:getLevel(), 0, 0))
	end
	return 0
end

function Monster.getTotalDefensePlayerContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getDefense() * (statusGainFormula(self:getMaster():getLevel(), 0, 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalDefenseSummonLevelContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getDefense() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	elseif self:isMonster() then
		return math.floor(monsterType:getDefense() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalDefenseSummonBoostContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getDefense() * (statusGainFormula(0, 0, self:getBoost(), 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalDefenseVitaminContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		local vitamins = self:getUsedVitaminsNumber("defense")
		if vitamins > 0 then
			return math.floor(monsterType:getDefense() * vitamins / maxVitamins * vitaminStatusBuff)
		end
	end
	return 0
end

function Monster.getTotalMagicDefense(self)
	local monsterType = MonsterType(self:getName())

	-- Se for um Pokémon pertencente a um jogador
	if self:isPokemon() and self:getMaster() then
		local master = self:getMaster()
		local ball = master:getUsingBall() -- Pegamos a Pokébola correta

		-- Se a Pokébola armazenar um valor especial de defesa mágica, usamos ele
		if ball and ball:getSpecialAttribute("pokeName") == self:getName() then
			if ball:getSpecialAttribute("pokeGender") == "male" then
				total = (ball:getSpecialAttribute("pokeMagicDefense")) * 1.08
				return total
			else
				total = ball:getSpecialAttribute("pokeMagicDefense")
				return total
			end
		end

		-- Se não houver valor na Pokébola, usamos o cálculo padrão
		local total = math.floor(monsterType:getMoveMagicDefenseBase() * statusGainFormula(master:getLevel(), self:getLevel(), self:getBoost(), self:getLove()))
		
		local vitamins = self:getUsedVitaminsNumber("magicDefense")
		if vitamins > 0 then
			total = total + math.floor(monsterType:getMoveMagicDefenseBase() * vitamins / maxVitamins * vitaminStatusBuff)
		end
		
		return total
	elseif self:isMonster() then
		-- Se for um Pokémon selvagem, usamos a fórmula padrão sem buffs
	    local name = self:getName()
	    local isShiny = name:find("Shiny") ~= nil

	    local shinyBonus = isShiny and ShinyBonusBuff or 1.0
		return math.floor(monsterType:getMoveMagicDefenseBase() * SBonusSDefense * shinyBonus * statusGainFormula(0, self:getLevel(), 0, 0))
	end
	
	return 0
end


function Monster.getTotalMagicDefensePlayerContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMoveMagicDefenseBase() * (statusGainFormula(self:getMaster():getLevel(), 0, 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMagicDefenseSummonLevelContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMoveMagicDefenseBase() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	elseif self:isMonster() then
		return math.floor(monsterType:getMoveMagicDefenseBase() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMagicDefenseSummonBoostContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getMoveMagicDefenseBase() * (statusGainFormula(0, 0, self:getBoost(), 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalMagicDefenseVitaminContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		local vitamins = self:getUsedVitaminsNumber("magicDefense")
		if vitamins > 0 then
			return math.floor(monsterType:getMoveMagicDefenseBase() * vitamins / maxVitamins * vitaminStatusBuff)
		end
	end
	return 0
end

function Monster.getTotalSpeed(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		local total = math.floor(monsterType:getBaseSpeed() * statusGainFormula(self:getMaster():getLevel(), self:getLevel(), self:getBoost(), self:getLove()))
		local vitamins = self:getUsedVitaminsNumber("speed")
		if vitamins > 0 then
			total = total + math.floor(monsterType:getBaseSpeed() * vitamins / maxVitamins * vitaminStatusBuff)
		end
		return total
	elseif self:isMonster() then
		return math.floor(monsterType:getBaseSpeed() * SBonusSpeedy * statusGainFormula(0, self:getLevel(), 0, 0))
	end
	return 0
end

function Monster.getTotalSpeedPlayerContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getBaseSpeed() * (statusGainFormula(self:getMaster():getLevel(), 0, 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalSpeedSummonLevelContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getBaseSpeed() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	elseif self:isMonster() then
		return math.floor(monsterType:getBaseSpeed() * (statusGainFormula(0, self:getLevel(), 0, 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalSpeedSummonBoostContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		return math.floor(monsterType:getBaseSpeed() * (statusGainFormula(0, 0, self:getBoost(), 0) - statusGainFormula(0, 0, 0, 0)))
	end
	return 0
end

function Monster.getTotalSpeedVitaminContribution(self)
	local monsterType = MonsterType(self:getName())
	if self:isPokemon() then 
		local vitamins = self:getUsedVitaminsNumber("speed")
		if vitamins > 0 then
			return math.floor(monsterType:getBaseSpeed() * vitamins / maxVitamins * vitaminStatusBuff)
		end
	end
	return 0
end

function Creature.isPokemon(self)
	local master = self:getMaster()
	if master and master:isPlayer() then return true end
	return false
end

function Monster.getMonsterNumber(self)
	return MonsterType(self:getName()):dexEntry()

--	local name = self:getName()
--	local output = 0
--	for _,v in pairs(monsterNumber) do
--		if name == v[1] then
--			output = v[2]
--			break
--		end
--	end 
--	return output
end

function MonsterType.getNumber(self)
	return self:dexEntry()
--	local name = self:getName()
--	local output = 0
--	for _,v in pairs(monsterNumber) do
--		if name == v[1] then
--			output = v[2]
--			break
--		end
--	end 
--	return output
end

function hasSummons(cid)
	local summons = cid:getSummons()
	if #summons > 0 then
		return true
	end
	return false
end

--function MonsterType.getMeleeMaxDamage(self)
--	for i = 1, #self:getAttackList() do
--		if self:getAttackList()[i].isMelee == 1 then
--			
--			return -self:getAttackList()[i].maxCombatValue
--		end
--	end
--	return 0
--end

--function MonsterType.getMeleeMinDamage(self)
--	for i = 1, #self:getAttackList() do
--		if self:getAttackList()[i].isMelee == 1 then
--			return -self:getAttackList()[i].minCombatValue
--		end
--	end
--	return 0
--end

--function MonsterType.getMagicMaxDamage(self)
--	local damage = 0
--	for i = 1, #self:getAttackList() do
--		if self:getAttackList()[i].isMelee == 0 then
--			damage = damage - self:getAttackList()[i].maxCombatValue 
--		end
--	end
--	return damage
--end

--function MonsterType.getMagicMinDamage(self)
--	local damage = 0
--	for i = 1, #self:getAttackList() do
--		if self:getAttackList()[i].isMelee == 0 then
--			damage = damage - self:getAttackList()[i].minCombatValue 
--		end
--	end
--	return damage
--end

function Player.checkExhaustion(self, storage, delay)
	if os.time() > self:getStorageValue(storage) then
		self:setStorageValue(storage, os.time() + delay)
	else
		self:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
		-- self:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true		
	end
	return false
end

function Player.checkMoveExhaustion(self, storage, delay)
--	local item = self:getSlotItem(CONST_SLOT_AMMO)
	local item = self:getUsingBall()
	if item then
		local move = "cd" .. tostring(storage)
		local moveCooldown = item:getSpecialAttribute(move) or 0
		if os.time() > moveCooldown then
			item:setSpecialAttribute(move, os.time() + delay)
		else
			 self:sendTextMessage(MESSAGE_STATUS_SMALL, "You must wait " .. math.floor(item:getSpecialAttribute(move) + 1 - os.time()) .. " seconds to use this move again")
			-- self:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true		
		end
	end
	return false
end

function Player.getSummonNameFromBall(self)
--	local item = self:getSlotItem(CONST_SLOT_AMMO)
	local item = self:getUsingBall()
	if item then
		local pokeName = item:getSpecialAttribute("pokeName")
		if pokeName ~= nil then			
			return pokeName
		end
	end
	return "unamed"
end

function Player.getSummonLevelFromBall(self)
--	local item = self:getSlotItem(CONST_SLOT_AMMO)
	local item = self:getUsingBall()
	if item then
		local pokeLevel = item:getSpecialAttribute("pokeLevel")
		if pokeLevel ~= nil then			
			return pokeLevel
		end
	end
	return 1
end

function Player.getSummonBoostFromBall(self)
--	local item = self:getSlotItem(CONST_SLOT_AMMO)
	local item = self:getUsingBall()
	if item then
		local pokeBoost = item:getSpecialAttribute("pokeBoost")
		if pokeBoost ~= nil then			
			return pokeBoost
		end
	end
	return 0
end

function Player.getUsingBall(self)
	local pokeballs = self:getPokeballs()
--	local pokeballs = self:getSpecialStorage("pokes") --stability problems
	if not pokeballs then
		print("WARNING! UsingBall not found player " .. self:getName())
		return nil
	end
	for i = 1, #pokeballs do

		local ball = pokeballs[i]
		if not ball then return end
		local isBallBeingUsed = ball:getSpecialAttribute("isBeingUsed")
		if isBallBeingUsed and isBallBeingUsed == 1 then
			return ball
		end
	end
--	local item = self:getSlotItem(CONST_SLOT_AMMO)
--	if item then
--		return item
--	end
end

function MonsterType.getRaceName(self)
	local raceNumber = self:getRace()
	if raceNumber == 1 then return "venon" end
	if raceNumber == 2 then return "blood" end
	if raceNumber == 3 then return "undead" end
	if raceNumber == 4 then return "fire" end
	if raceNumber == 5 then return "energy" end
	if raceNumber == 6 then return "grass" end
	if raceNumber == 7 then return "normal" end
	if raceNumber == 8 then return "water" end
	if raceNumber == 9 then return "flying" end
	if raceNumber == 10 then return "poison" end
	if raceNumber == 11 then return "electric" end
	if raceNumber == 12 then return "ground" end
	if raceNumber == 13 then return "psychic" end
	if raceNumber == 14 then return "rock" end
	if raceNumber == 15 then return "ice" end
	if raceNumber == 16 then return "bug" end
	if raceNumber == 17 then return "dragon" end
	if raceNumber == 18 then return "ghost" end
	if raceNumber == 19 then return "dark" end
	if raceNumber == 20 then return "steel" end
	if raceNumber == 21 then return "fairy" end
	if raceNumber == 22 then return "fighting" end
	return "none"
end

function MonsterType.getRace2Name(self)
	local raceNumber = self:getRace2()
	if raceNumber == 1 then return "venon" end
	if raceNumber == 2 then return "blood" end
	if raceNumber == 3 then return "undead" end
	if raceNumber == 4 then return "fire" end
	if raceNumber == 5 then return "energy" end
	if raceNumber == 6 then return "grass" end
	if raceNumber == 7 then return "normal" end
	if raceNumber == 8 then return "water" end
	if raceNumber == 9 then return "flying" end
	if raceNumber == 10 then return "poison" end
	if raceNumber == 11 then return "electric" end
	if raceNumber == 12 then return "ground" end
	if raceNumber == 13 then return "psychic" end
	if raceNumber == 14 then return "rock" end
	if raceNumber == 15 then return "ice" end
	if raceNumber == 16 then return "bug" end
	if raceNumber == 17 then return "dragon" end
	if raceNumber == 18 then return "ghost" end
	if raceNumber == 19 then return "dark" end
	if raceNumber == 20 then return "steel" end
	if raceNumber == 21 then return "fairy" end
	if raceNumber == 22 then return "fighting" end
	return "none"
end

--function searchInContainer(container, itemId)
--	local count = 0
--	if container:isContainer() then
--		for i = 0, container:getSize() do
--			local item = container:getItem(i)
--			if item then
--				if item:isContainer() then
--					if item:getId() == itemId then
--						count = count + item:getCount()
--					end
--					count = count + searchInContainer(item, itemId)
--				elseif item:getId() == itemId then
--					count = count + item:getCount()
--				end
--			end
--		end
--	end
--	return count
--end

function teleportMonster(cid, position)
    local monster = Monster(cid)
    if monster then
        monster:teleportTo(position)
    end
end
 
function Player.getSummon(self)
	if hasSummons(self) then
		return self:getSummons()[1]
	end
	return false
end

function Player.isOnRide(self)
	if self:getStorageValue(storageRide) > 0 then
		return true
	end
	return false
end

function Player.isOnFly(self)
	if self:getStorageValue(storageFly) > 0 then
		return true
	end
	return false
end

function Player.isOnSurf(self)
	if self:getStorageValue(storageSurf) > 0 then
		return true
	end
	return false
end

function Player.isOnBike(self)
	if self:getStorageValue(storageBike) == 1 then
		return true
	end
	return false
end

function Player.isOnEvent(self)
	if self:getStorageValue(storageEvent) == 1 then
		return true
	end
	return false
end

function Player.isOnDive(self)
	if self:getStorageValue(storageDive) == 1 then
		return true
	end
	return false
end

function Player.isAutoLooting(self)
	if self:getStorageValue(storageAutoLoot) == 1 then
		return true
	end
	return false
end

function Player.enableAutoLoot(self)
	if self:getStorageValue(storageAutoLoot) < 0 then
		self:setStorageValue(storageAutoLoot, 1)
		return true
	end
	return false
end

function Player.disableAutoLoot(self)
	if self:getStorageValue(storageAutoLoot) == 1 then
		self:setStorageValue(storageAutoLoot, -1)
		return true
	end
	return false
end

function Monster.getSummonLevel(self)
	if self:isPokemon() then
		local master = self:getMaster()
--		local item = master:getSlotItem(CONST_SLOT_AMMO)
		local item = master:getUsingBall()
		local pokeLevel = item:getSpecialAttribute("pokeLevel")
		if pokeLevel ~= nil then			
			return pokeLevel
		end
	elseif isMonster(self) then
		return self:getLevel()
	end
	return 1
end

function Monster.getSummonBoost(self)
	if self:isPokemon() then
		local master = self:getMaster()
--		local item = master:getSlotItem(CONST_SLOT_AMMO)
		local item = master:getUsingBall()
		local pokeBoost = item:getSpecialAttribute("pokeBoost")
		if pokeBoost ~= nil then
			return pokeBoost
		end
	end
	return 0
end

function Monster.getLove(self)
	if self:isPokemon() then
		local master = self:getMaster()
--		local item = master:getSlotItem(CONST_SLOT_AMMO)
		local item = master:getUsingBall()
		local pokeLove = item:getSpecialAttribute("pokeLove")
		if pokeLove ~= nil then
			return pokeLove
		end
	end
	return 0
end

function Monster.getMasterLevel(self)
	if self:isPokemon() then
		local master = self:getMaster()
		if master then			
			return master:getLevel()
		end
	end
	return 1
end

function Monster.getSummonName(self)
	if isSummon(self) then
		local master = self:getMaster()
--		local item = master:getSlotItem(CONST_SLOT_AMMO)
		local item = master:getUsingBall()
		local pokeName = item:getSpecialAttribute("pokeName")
		if pokeName ~= nil then			
			return pokeName
		end
	end
	return "unamed"
end

function Monster.isEvolving(self)
	if self:isPokemon() then
		local master = self:getMaster()
		if master and master:getStorageValue(storageEvolving) == 1 then return true end
	end
	return false
end

function doChangeOutfit(cid, outfit, time)
	local creature = Creature(cid)
	if not creature then return false end
	if time == nil then time = -1 end
	doSetCreatureOutfit(creature, outfit, time)
	return true
end

function doSendDelayedEffect(pos, effect)
	local tile = Tile(pos)
	if tile then
		pos:sendMagicEffect(effect)
	end
	return true
end

function doTransformPokeball(item)
	if not item:isPokeball() then return false end
	for key, value in pairs(balls) do
		if value.usedOn == item:getId() then
			doTransformItem(item.uid, value.usedOff)
			return true			
		end
		if value.usedOff == item:getId() then
			doTransformItem(item.uid, value.usedOn)
			return true			
		end
	end
	return false
end

function doReleaseSummon(cid, pos, effect, message, missile)
    local player = Player(cid)
    if not player then return false end

    local ball = player:getUsingBall()
    if not ball then return false end

    if effect == nil then effect = CONST_ME_TELEPORT end
    if message == nil then message = true end

    local name = ball:getSpecialAttribute("pokeName")
    if not name then
        ball:remove()
        return false
    end

    if name == "Ditto" or name == "Shiny ditto" or name == "Xmas ditto" then
        local dittoTime = ball:getSpecialAttribute("dittoTime")
        if dittoTime and os.time() < dittoTime then
            name = ball:getSpecialAttribute("dittoTransform")
        end
    end

    local monsterType = MonsterType(name)
    if not monsterType:isConvinceable() or not monsterType:isIllusionable() or not monsterType:isSummonable() then
        print("WARNING: Monster " .. name .. " cannot be summoned.")
        player:sendCancelMessage("Sorry, not possible. This problem was reported.")
        ball:setSpecialAttribute("isBeingUsed", 0)
        return false
    end

    local health = ball:getSpecialAttribute("pokeHealth") or 0
    if health <= 0 then
        player:sendCancelMessage("Sorry, not possible. Your summon is dead.")
        ball:setSpecialAttribute("isBeingUsed", 0)
        return true
    end

    local summonLevel = ball:getSpecialAttribute("pokeLevel")
    local summonBoost = ball:getSpecialAttribute("pokeBoost") or 0

    local newPos = player:getClosestFreePosition(pos, 2) or pos
    if newPos.x == 0 then
        newPos = pos
    end

    local monster = Game.createMonster(name, newPos, true, true, summonLevel, summonBoost)
    if monster then
        if message then
            local monsterName = monster:getName()
            if string.find(monsterName, "Shiny ") == 1 then
                monsterName = string.sub(monsterName, 7)
                doSendShinyAura(monster)
            end
        end

        player:addSummon(monster)
        monster:setDirection(ball:getSpecialAttribute("pokeLookDir") or DIRECTION_SOUTH)
        if summonBoost >= maxBoost then
            doStartAurea(monster)
        end

        -- 🔥 Aplicando os IVs e os atributos salvos na Pokébola 🔥
        local maxHealth = ball:getSpecialAttribute("pokeMaxHealth") or monster:getTotalHealth()
        local attack = ball:getSpecialAttribute("pokeAttack") or monster:getTotalMeleeAttack()
        local defense = ball:getSpecialAttribute("pokeDefense") or monster:getTotalDefense()
        local spAttack = ball:getSpecialAttribute("pokeSpecialAttack") or monster:getTotalMagicAttack()
        local spDefense = ball:getSpecialAttribute("pokeSpecialDefense") or monster:getTotalMagicDefense()
        local speed = ball:getSpecialAttribute("pokeSpeed") or monster:getTotalSpeed()


        monster:setMaxHealth(maxHealth)
        monster:setHealth(health)
        monster:changeSpeed(monster:getSpeed() + speed)

        if effect then
            monster:getPosition():sendMagicEffect(effect)
        end
        if missile then
            doSendDistanceShoot(player:getPosition(), monster:getPosition(), missile)
        end

        monster:removeTarget(player)
        monster:registerEvent("MonsterHealthChange")
        monster:registerEvent("MonsterDeath")

        -- Transferindo ataques para a UI
        local movesTable = {}
        local moves = monsterType:getMoveList()
        for i = 1, #moveWords do
            local move = moves[i]
            if move then
                if i == 1 then
                    table.insert(movesTable, move.name)
                else
                    table.insert(movesTable, "," .. move.name)
                end
            end
        end
        for i = 1, #moveWords do
            local move = moves[i]
            if move then
                table.insert(movesTable, "," .. move.speed)
            end
        end
        for i = 1, #moveWords do
            local move = "cd" .. tostring(i)
            local moveCooldown = ball:getSpecialAttribute(move) or 0
            if os.time() > moveCooldown then
                table.insert(movesTable, ",0")
            else
                table.insert(movesTable, "," .. 1000 * math.floor(ball:getSpecialAttribute(move) - os.time()))
            end
        end
        table.insert(movesTable, ",")
		player:sendSummonMoves()
		doSendGobackInformations(player, monster, "release")
		doSendPokeTeamByClient(player:getId())

        return monster:getId()
    end
    return true
end

-- New Poke Moves 
function Player:sendSummonMoves()
	local summon = self:getSummon()
	if not summon then
		return false
	end

	local monsterType = MonsterType(summon:getName())
	if not monsterType then
		return false
	end

	local ball = self:getUsingBall()
	if not ball then
		return false
	end

	local cleanedMoves = {}
	local moves = monsterType:getMoveList()

	for moveId, moveInfo in ipairs(moves) do
		local moveCooldownKey = string.format("cd%d", moveId)
		local moveCooldown = ball:getSpecialAttribute(moveCooldownKey) or 0

		-- Cria uma versão limpa do moveInfo
		local cleanedMove = {
			name = moveInfo.name,
			level = moveInfo.level,
			bar = moveInfo.bar,
			cooldown = moveInfo.cooldown,
			cooldownReal = os.time() > moveCooldown and 0 or 1000 * math.floor(moveCooldown - os.time())
		}

		table.insert(cleanedMoves, cleanedMove)
	end

	self:sendExtendedOpcode(52, json.encode(cleanedMoves))
	return true
end


function doRemoveSummon(cid, effect, uid, message, missile)
	local player = Player(cid)
	if not player then return false end
	if effect == nil then effect = CONST_ME_POFF end
	if message == nil then message = true end
	local summons = player:getSummons()
	if not summons then return false end
	local summon = Creature(summons[1])
	if not summon then
		return false
	end
	local summonPos = summon:getPosition()
	local attackers = Game.getSpectators(summonPos, true, false) 
	for i = 1, #attackers do
		local attacker = attackers[i]
		if attacker and attacker:isMonster() then
--			attacker:say(attacker:getTargetCount(), TALKTYPE_SAY)
			local targetList = attacker:getTargetList()
			for j = 1, #targetList do
				if targetList[j] == summon then
					attacker:removeTarget(summon)
					attacker:setIdle()
				end
			end
		end
	end
	if effect then
		summonPos:sendMagicEffect(effect)
	end
	if missile then
		doSendDistanceShoot(summonPos, player:getPosition(), missile)
	end
	summon:unregisterEvent("MonsterGetExperience")
	summon:unregisterEvent("MonsterHealthChange")
	player:unregisterEvent("RemoveSummon")
--	local ball = player:getSlotItem(CONST_SLOT_AMMO)
	local ball = player:getUsingBall()
	if uid and not ball then
		ball = Item(uid)
	end
	if ball and ball:isPokeball() then
		ball:setSpecialAttribute("pokeHealth", summon:getHealth())
		ball:setSpecialAttribute("pokeLookDir", summon:getDirection())
	end
	if not (player:isOnFly() or player:isOnRide() or player:isOnSurf() or summon:isEvolving()) then
		if ball then
			ball:setSpecialAttribute("isBeingUsed", 0)
		else
			print("WARNING! Player " .. player:getName() .. " had problems on remove summon: ball does not exist.")
		end
	end
	if summon:isEvolving() then 
		player:setStorageValue(storageEvolving, -1)
	end
	if message then
		local summonName = summon:getName()
		if string.find(summonName, "Shiny ") == 1 then
			summonName = string.sub(summonName, 7) -- Remove "Shiny " do nome
		end
		if player:getStorageValue(storageFly) < 0 then

			-- player:say("Thanks, " .. summonName .. "!", TALKTYPE_MONSTER_SAY)
		end
	end
	doSendGobackInformations(player, summon, "remove")
	summon:remove()
	doSendPokeTeamByClient(player:getId())
	return true
end

function doEvolveSummon(cid, evolutionName)
	local monsterType = MonsterType(evolutionName)
	local summon = Creature(cid)
	local master = summon:getMaster()
	local summonPos = summon:getPosition()
	local item = master:getUsingBall()
	if monsterType and summon:isMonster() then
		master:say("Wow, my " .. summon:getName() .. " is evolving!", TALKTYPE_MONSTER_SAY)
		master:getPosition():sendMagicEffect(292)
		master:setStorageValue(storageEvolving, 1)
		summon:changeSpeed(-summon:getSpeed())
		item:setSpecialAttribute("pokeName", evolutionName)

		local baseHealth = MonsterType(evolutionName):getMaxHealth()
		local newMaxHealth = math.floor(baseHealth * statusGainFormula(master:getLevel(), item:getSpecialAttribute("pokeLevel"), item:getSpecialAttribute("pokeBoost"), item:getSpecialAttribute("pokeLove") or 0))
		summon:setMaxHealth(newMaxHealth)
		summon:setHealth(newMaxHealth)

		addEvent(doChangeOutfit, 500, summon:getId(), monsterType:getOutfit(), 500)
		addEvent(doSendDelayedEffect, 500, summon:getPosition(), 10)
		addEvent(doSendDelayedEffect, 1000, summon:getPosition(), 12)
		addEvent(doChangeOutfit, 1500, summon:getId(), monsterType:getOutfit(), 500)
		addEvent(doSendDelayedEffect, 1500, summon:getPosition(), 10)
		addEvent(doSendDelayedEffect, 2000, summon:getPosition(), 12)
		addEvent(doSendDelayedEffect, 4000, summon:getPosition(), CONST_ME_HEARTS)

		addEvent(doRemoveSummon, 4000, master:getId(), false, nil, false)
		addEvent(doReleaseSummon, 4001, master:getId(), summonPos, false, false)
		master:refreshPokemonBar({}, {})
		return true
	else
		print("WARNING! Problem on evolution to " .. evolutionName .. " player " .. master:getName())
	end
	return false
end

function Position:sendAnimatedNumber(message_type, text, value, color)
	local message_type = message_type or MESSAGE_EXPERIENCE
	local color = color or TEXTCOLOR_BLUE
	local valid_message_types = {
		MESSAGE_DAMAGE_DEALT,
		MESSAGE_DAMAGE_OTHERS,
		MESSAGE_DAMAGE_RECEIVED,
		MESSAGE_EXPERIENCE,
		MESSAGE_EXPERIENCE_OTHERS,
		MESSAGE_HEALED,
		MESSAGE_HEALED_OTHERS,
	}
	assert(isInArray(valid_message_types, message_type), "invalid 'message_type', must output to server log")
	for _, v in ipairs(Game.getSpectators(self, false, true)) do
		if v:isPlayer() then
			v:sendTextMessage(message_type, text, self, value, color)
		end
	end
end


--function Item.isPokeball(self)
--	if self:getId() == filledPokeball then
--		return true
--	end
--	return false
--end


function Item.isPokeball(self)
	for key, value in pairs(balls) do
		if value.usedOn == self:getId() or value.usedOff == self:getId() then
			return true			
		end
	end
	return false
end

function doAddPokeball(cid, name, level, boost, ballKey, dp, msg, ivString, gender, ev, nature)
    local player = Player(cid)
    if player then
        name = firstToUpper(name)
        local monsterType = MonsterType(name)
        if not monsterType then 
            print("WARNING: Monster " .. name .. " impossible to catch.") 
            player:sendCancelMessage("Sorry, not possible. This problem was reported.")
            return false 
        end

        local addBall
        if dp == false then
            addBall = player:addItem(balls[ballKey].usedOn, 1, false)
        else
            local depot = player:getInbox()
            addBall = depot:addItem(balls[ballKey].usedOn, 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
        end

        if not addBall then
            if dp == false then -- tenta enviar ao CP se BP estiver cheia
                local depot = player:getInbox()
                addBall = depot:addItem(balls[ballKey].usedOn, 1, INDEX_WHEREEVER, FLAG_NOLIMIT)
                addEvent(doPlayerSendTextMessage, msg, cid, MESSAGE_EVENT_ADVANCE, "Since you are at maximum capacity, your ball was sent to CP.")
                dp = true
				doSendPokeTeamByClient(self)
            else
                addBall = player:addItem(balls[ballKey].usedOn, 1)
                addEvent(doPlayerSendTextMessage, msg, cid, MESSAGE_STATUS_WARNING, "Pokemon lost. Your CP is full!")
                print("WARNING! Player " .. player:getName() .. " lost pokemon " .. name .. " because CP is full.")
            end
        end

        if addBall then
            -- Base de atributos
            local baseHealth = monsterType:getHealth()
            print(baseHealth)
            local maxHealth = math.floor(baseHealth * statusGainFormula(player:getLevel(), level, boost, 0))
            
            -- Salvar atributos básicos na Pokébola
            addBall:setSpecialAttribute("pokeName", name)
            addBall:setSpecialAttribute("pokeLevel", level)
            addBall:setSpecialAttribute("pokeBoost", boost)
            addBall:setSpecialAttribute("pokeExperience", getNeededExp(level))
            addBall:setSpecialAttribute("pokeMaxHealth", maxHealth)
            addBall:setSpecialAttribute("pokeHealth", baseHealth)
            addBall:setSpecialAttribute("pokeLove", 0)
            addBall:setSpecialAttribute("pokeEv", 0)
            addBall:setSpecialAttribute("pokeGender", gender)
            addBall:setSpecialAttribute("pokeNature", nature)

            -- Obter o bônus da Nature
            local natureBonus = getNatureBonus(nature)

            -- Aplicando IVs nos status do Pokémon
            if ivString then
                local ivs = {}
                for iv in ivString:gmatch("%d+") do
                    table.insert(ivs, tonumber(iv))
                end

                -- Garantir que os IVs tenham 6 valores (HP, Atk, Def, Sp.Atk, Sp.Def, Speed)
                if #ivs == 6 then
                    local ivHP, ivAtk, ivDef, ivSpAtk, ivSpDef, ivSpeed = unpack(ivs)

                    -- Melhorando os status com base nos IVs (+10% no máximo)
                    maxHealth = maxHealth + math.floor(maxHealth * (ivHP / 31) * 0.3)
                    local attack = math.floor(monsterType:getMeleeDamage() * (1 + (ivAtk / 31) * 0.3))
                    local defense = math.floor(monsterType:getDefense() * (1 + (ivDef / 31) * 0.3))
                    local spAttack = math.floor(monsterType:getMoveMagicAttackBase() * (1 + (ivSpAtk / 31) * 0.3))
                    local spDefense = math.floor(monsterType:getMoveMagicDefenseBase() * (1 + (ivSpDef / 31) * 0.3))
                    local speed = math.floor(100 * (1 + (ivSpeed / 31) * 1.1))

                    attack = math.floor(attack * (natureBonus.atk or 1.0))
                    defense = math.floor(defense * (natureBonus.def or 1.0))
                    spAttack = math.floor(spAttack * (natureBonus.spatk or 1.0))
                    spDefense = math.floor(spDefense * (natureBonus.spdef or 1.0))
                    speed = math.floor(speed * (natureBonus.speed or 1.0))

                    -- Salvando os novos atributos na Pokébola
                    addBall:setSpecialAttribute("pokeMaxHealth", maxHealth)
                    addBall:setSpecialAttribute("pokeHealth", baseHealth)
                    addBall:setSpecialAttribute("pokeAttack", attack)
                    addBall:setSpecialAttribute("pokeDefense", defense)
                    addBall:setSpecialAttribute("pokeSpecialAttack", spAttack)
                    addBall:setSpecialAttribute("pokeSpecialDefense", spDefense)
                    addBall:setSpecialAttribute("pokeSpeed", speed)
                    addBall:setSpecialAttribute("pokeIV", ivString)
                else
                    print("ERRO: IVs inválidos para", name)
                end
            end

            if dp == false then
                -- player:refreshPokemonBar({}, {})
            end
            return true
        else
            print("ERROR! Player " .. player:getName() .. " lost pokemon " .. name .. " for unknown reason.")
        end
    end

    print("WARNING! Player not found to add pokeball.")
    return false    
end



function searchInContainer(container, itemId)
	local count = 0
	if container:isContainer() then
		local items = container:getItem()
		for i = 0, container:getSize() do
			local item = container:getItem(i)
			if item then
				if item:isContainer() then
					if item:getId() == itemId then
						count = count + item:getCount()
					end
					count = count + searchInContainer(item, itemId)
				elseif item:getId() == itemId then
					count = count + item:getCount()
				end
			end
		end
	end
	return count
end

function Item.isStone(self)
	if isInArray(stonesId[1], self:getId()) then
		return true
	end
	return false
end

function doSendAurea(cid)
	local monster = Monster(cid)	
	if monster then		
		monster:getPosition():sendMagicEffect(1565)
		doStartAurea(monster)
	end
end

function doStartAurea(monster)
	addEvent(doSendAurea, 6000, monster.uid)
end


--Itigar
function isShiny(monster)
    return monster and string.find(monster:getName(), "Shiny ") == 1
end

function doSendShinyAura(cid)
    local monster = Monster(cid)
    if isShiny(monster) then
        monster:getPosition():sendMagicEffect(1569)
        doStartShinyAura(monster)
    end
end

function doStartShinyAura(monster)
    if monster and monster:isCreature() then
        addEvent(doSendShinyAura, 3000, monster.uid)
    end
end

function Container.getPokeballs(self)
	local ret = {}
		local size = self:getSize()
		for i = size - 1, 0, -1 do
			local item = self:getItem(i)
			if item:isPokeball() then
				table.insert(ret, item)
			elseif item:isContainer() then
				local itemsInside = item:getPokeballs()
				for i=0, #itemsInside do
					table.insert(ret, itemsInside[i])
				end
			end
		end
	return ret
end

function Player.getPokeballs(self)
	local pokeballs = {}

	local backpack = self:getSlotItem(CONST_SLOT_BACKPACK)
	if backpack then
		pokeballs = backpack:getPokeballs()
	end	

	local ballOn = self:getSlotItem(CONST_SLOT_AMMO)
	if ballOn and ballOn:isPokeball() then
		table.insert(pokeballs, ballOn)
	end

	return pokeballs
end

function Player.updateQuestLog(self)
	for key, value in pairs(quests) do
		if self:getLevel() >= value.level then
			for j = 1, #value.prizes do
				for k = 1, #value.prizes do
					if self:getStorageValue(value.prizes[k].uid) < 0 then
						self:setStorageValue(value.prizes[k].uid, 0)
					end
				end
			end
		end
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

local areafly = createCombatArea({
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
})

function Position:createFlyFloor()
    local toTile = Tile(self)
    if toTile and toTile:getItems() and toTile:getGround() then
        -- Aqui voc� deve colocar o c�digo que ser� executado quando a tile e os itens forem v�lidos.
        -- Por exemplo, voc� pode querer criar itens, aplicar efeitos ou realizar outras a��es.
    else
        doAreaCombatHealth(0, 0, self, areafly, 0, 0, CONST_ME_NONE)
        local posarea = {-1, 1}
        local position = self
        for x = position.x + posarea[1], position.x + posarea[2] do
            for y = position.y + posarea[1], position.y + posarea[2] do    
                local posFinal = Position(x, y, position.z)
                Game.createItem(flyFloor, 1, posFinal)
                addEvent(removeFlyFloorMix, 10000, posFinal)
            end
        end
    end
    return true
end

function removeFlyFloorMix(posFinal)
    local fromTile = Tile(posFinal)
    if fromTile then
        local topCreature = fromTile:getTopCreature()
        if topCreature == nil then
            local fromItem = fromTile:getItemById(flyFloor)
            if fromItem then
                fromItem:remove()
            end
        end
    end
end

-- function Position:createFlyFloor()
-- 	local toTile = Tile(self)
-- 	if not toTile or not toTile:getItems() or not toTile:getGround() then
-- 		doAreaCombatHealth(0, 0, self, 0, 0, 0, CONST_ME_NONE)
-- 		Game.createItem(flyFloor, 1, self)--:decay()
-- 	end
-- 	return true
-- end


 
function Tile:hasValidGround()
	local ground = self:getGround()
	local nilItem = self:getItemById(flyFloor)
	if ground and not nilItem then
		return true
	end 
	return false
end
 
function Player:activateFly()
	self:setStorageValue(storageFly, 1)
	self:registerEvent("FlyEvent")
	return true
end
 
function Player:deactivateFly()
	local can, floor = self:canDeactivateFly()
	local pos = self:getPosition()
	if can then
		local curtile = Tile(pos)
		local nilItem = curtile:getItemById(flyFloor)
		if nilItem then
			nilItem:remove()
		end
		self:unregisterEvent("FlyEvent")
		if pos.z ~= floor then
			pos.z = floor
			self:teleportTo(pos)
			pos:sendMagicEffect(CONST_ME_TELEPORT)
		end
	end 
	return can
end

function Player:canDeactivateFly()
    local pos = self:getPosition()
--    for z = pos.z, 15 do
        local tmp = Tile(pos.x, pos.y, pos.z)
        if tmp and tmp:hasValidGround() then
            if self:canFlyDown(pos.z) then
                return true, pos.z
            else
                return false
            end
        end
--    end
 
    return false
end
 
function Player:canFlyUp()
	local pos = self:getPosition()
	local tmp = Tile(pos.x, pos.y, pos.z-1)
	if tmp and tmp:hasValidGround() then
		return false
	end
	tmp = Tile(pos.x, pos.y, pos.z-1)

	if tmp and (tmp:getHouse() or tmp:hasFlag(TILESTATE_PROTECTIONZONE) or tmp:hasFlag(TILESTATE_FLOORCHANGE) or tmp:hasFlag(TILESTATE_BLOCKSOLID) ) then
		return false
	end

	if tmp and tmp:getGround() and isInArray(waterIds, tmp:getGround():getId()) then
		return false
	end
	return true
end
 
function Player:canFlyDown(floor)
	local pos = self:getPosition()
	local tmp = Tile(pos)
	if floor and floor == pos.z then
		return true
	end 
	if tmp:hasValidGround() then
		return false
	end 
	tmp = Tile(pos.x, pos.y, floor or pos.z+1)

	if tmp and (tmp:getHouse() or tmp:hasFlag(TILESTATE_PROTECTIONZONE) or tmp:hasFlag(TILESTATE_FLOORCHANGE) or tmp:hasFlag(TILESTATE_BLOCKSOLID) ) then
		return false
	end 

	if tmp and tmp:getGround() and isInArray(waterIds, tmp:getGround():getId()) then
		return false
	end
    return true
end
 
function Player:flyUp()
	if self:isOnFly() then
		if self:canFlyUp() then
			local pos = self:getPosition()
			local tile = Tile(pos)
			local itemfloor = tile:getItemById(flyFloor)
			if itemfloor then
				itemfloor:remove()
			end 
			pos.z = pos.z-1
			pos:createFlyFloor()
			self:teleportTo(pos)
			-- pos:sendMagicEffect(CONST_ME_TELEPORT) itigar
			return true
		end 
		return false
	else
		self:sendCancelMessage("You are not flying.")
		return false
	end
end
 
function Player:flyDown()
	if self:isOnFly() then
		if self:canFlyDown() then
			local pos = self:getPosition()
			local tile = Tile(pos)
			local itemfloor = tile:getItemById(flyFloor)
			if itemfloor then
				itemfloor:remove()
			end 
			pos.z = pos.z+1
			pos:createFlyFloor()
			self:teleportTo(pos)
			-- pos:sendMagicEffect(CONST_ME_TELEPORT) itigar
			return true
		end 
		return false
	else
		self:sendCancelMessage("You are not flying.")
		return false
	end
end

function Player:addTokens(number)
	if self:getStorageValue(storageTokens) < 0 then
		self:setStorageValue(storageTokens, number)
	else
		self:setStorageValue(storageTokens, self:getStorageValue(storageTokens) + number)
	end
	return true
end

function Player:removeTokens(number)
	if self:getStorageValue(storageTokens) < number then
		return false
	else
		self:setStorageValue(storageTokens, self:getStorageValue(storageTokens) - number)
	end
	return true
end

function Player:getTokens()
	if self:getStorageValue(storageTokens) < 0 then
		return 0
	end
	return self:getStorageValue(storageTokens)
end

function Player:isDuelingWithNpc()
	if self:getStorageValue(storageDuelNpc) > 0 then
		return true
	end
	return false
end

function Player:setDuelWithNpc()
	self:setStorageValue(storageDuelNpc, 1)
	self:setStorageValue(storageDuelNpcStatus, 1)
	return true
end

function Player:setOnLeague()
	self:setStorageValue(storageLeague, 1)
	self:setStorageValue(storageLeaguePotion, 0)
	self:setStorageValue(storageLeagueRevive, 0)
	self:setStorageValue(storageLeagueTime, os.time())
	return true
end

function Player:setOutLeague()
	self:setStorageValue(storageLeague, -1)
	return true
end

function Player:isOnLeague()
	if self:getStorageValue(storageLeague) == 1 then
		return true
	end
	return false
end

function Player:canUsePotionOnLeague()
	if self:getStorageValue(storageLeaguePotion) < 0 then self:setStorageValue(storageLeaguePotion, 0) end
	if self:getStorageValue(storageLeaguePotion) < 25 then
		self:setStorageValue(storageLeaguePotion, self:getStorageValue(storageLeaguePotion) + 1)
		self:sendTextMessage(MESSAGE_INFO_DESCR, "Usando potion " .. self:getStorageValue(storageLeaguePotion) .. " de 25.")
		return true
	end
	return false
end

function Player:canUseReviveOnLeague()
	if self:getStorageValue(storageLeagueRevive) < 0 then self:setStorageValue(storageLeagueRevive, 0) end
	if self:getStorageValue(storageLeagueRevive) < 5 then
		self:setStorageValue(storageLeagueRevive, self:getStorageValue(storageLeagueRevive) + 1)
		self:sendTextMessage(MESSAGE_INFO_DESCR, "Usando revive " .. self:getStorageValue(storageLeagueRevive) .. " de 5.")
		return true
	end
	return false
end

function Player:unsetDuelWithNpc()
	self:setStorageValue(storageDuelNpc, -1)
	return true
end

function Player:getDuelWithNpcStatus()
	if self:getStorageValue(storageDuelNpcStatus) < 1 then
		return 1
	end
	return self:getStorageValue(storageDuelNpcStatus)
end

function Player:increaseDuelWithNpcStatus()
	if self:getStorageValue(storageDuelNpcStatus) < 1 then
		self:setStorageValue(storageDuelNpcStatus, 1)
	else
		self:setStorageValue(storageDuelNpcStatus, self:getStorageValue(storageDuelNpcStatus) + 1)
	end	
	return true
end

function Player:giveQuestPrize(uid, ignore)
	local playerCap = self:getFreeCapacity()
	local totalWeight = 0
	if ignore == nil then ignore = false end

	for key, value in pairs(quests) do
		for j = 1, #value.prizes do
			if uid == value.prizes[j].uid then
				if self:getLevel() >= value.level then
					local questDone = false
					for k = 1, #value.prizes do
						if self:getStorageValue(value.prizes[k].uid) > 0 then
							questDone = true
						end
					end
					if ignore == true then questDone = false end
					if questDone == false then
						for i = 1, #value.prizes[j].items do
							totalWeight = totalWeight + ItemType(value.prizes[j].items[i].item):getWeight()
						end
						if playerCap >= totalWeight then
							if value.teleportCP == 1 then
								self:teleportTo(self:getTown():getTemplePosition())
							end
							for i = 1, #value.prizes[j].pokes do
								local dp = 1
								local container = self:getSlotItem(CONST_SLOT_BACKPACK)							
								if self:getFreeCapacity() >= 1 and container and container:getEmptySlots() > 0 then
									dp = 0
								end
								doAddPokeball(self:getId(), value.prizes[j].pokes[i].name, value.prizes[j].pokes[i].level, value.prizes[j].pokes[i].boost, getBallKey(balls.ultraball.usedOn), dp, 0)
								local msg = 'You have found: ' .. value.prizes[j].pokes[i].name .. ', level ' .. value.prizes[j].pokes[i].level ..', boost ' .. value.prizes[j].pokes[i].boost .. '.'
								if dp == 1 then
									msg = msg .. " It was sent do CP because you do not have enough capacity."
								end
								self:sendTextMessage(MESSAGE_INFO_DESCR, msg)

							end
							
							for i = 1, #value.prizes[j].items do
								self:addItem(value.prizes[j].items[i].item, value.prizes[j].items[i].count)
								self:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found: ' .. value.prizes[j].items[i].count .. " " .. ItemType(value.prizes[j].items[i].item):getName() .. '.')
							end

							for i = 1, #value.prizes[j].badges do
								local item = self:getItemById(value.prizes[j].badges[i].remove, true)
								if item then
									item:transform(value.prizes[j].badges[i].add)
									self:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found: ' .. ItemType(value.prizes[j].badges[i].add):getName() .. '.')
								else
									print("WARNING! Player " .. self:getName() .. " with problems while adding " .. ItemType(value.prizes[j].badges[i].add):getName() .. ".")
								end
							end
							self:setStorageValue(uid, 1)
							for k = 1, #value.prizes do
								if self:getStorageValue(value.prizes[k].uid) <= 0 then
									self:setStorageValue(value.prizes[k].uid, 1)
								end
							end
						else
							self:sendTextMessage(MESSAGE_INFO_DESCR, 'Too heavy for you.')
						end

					else
						self:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
					end
				else
					self:sendTextMessage(MESSAGE_INFO_DESCR, "You need level " .. value.level .. " to open.")
				end
				return true
			end
		end
	end

	self:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	return false
end

function Player:addSlotItems()
	for i = 1, #slotItems do
		local itemId = slotItems[i]
		if not self:getItemById(itemId) then
			local item = self:addItem(itemId)
			if item and itemId == badgeContainer and ItemType(itemId) then
				local container = Container(item.uid)
				if container then
					for j = 1, #badgesPortraits do
						container:addItem(badgesPortraits[j])
					end
				end
			end
		end
	end
end

function Position:getClosestTownId()
	local distances = {}

	for i = 1, 15 do
		local town = Town(i)
		if town then
			local templePosition = town:getTemplePosition()
			distances[i] = getDistanceBetween(templePosition, self)
		end
	end

	local key = next(distances)
	local min = distances[key]

	for k, v in pairs(distances) do
	    if distances[k] < min then
		key, min = k, v
	    end
	end

	return key
end

function MonsterType:isLegendary()
	if isInArray(self:getCreatureEvents(), "LegendariesDeath") then
		return true
	end
	return false
end

-- function Player:refreshPokemonBar(add, remove)
-- 	local pokeballs = self:getPokeballs()
-- 	local pokemonsTable = {}
-- 	for i = 1, #pokeballs do
-- 		local ball = pokeballs[i]
-- 		local pokeName = ball:getSpecialAttribute("pokeName")
-- 		if not pokeName then -- fix ball bug
-- 			ball:remove()
-- 			print("WARNING! Player " .. self:getName() .. " had one ball removed!")
-- 		else
-- 			if not isInArray(remove, pokeName) then
-- 				table.insert(pokemonsTable, "," .. pokeName)
-- 			end
-- 		end
		
-- 	end
-- 	for i = 1, #add do
-- 		table.insert(pokemonsTable, "," .. add[i])
-- 	end
-- 	table.insert(pokemonsTable, ",")
-- 	self:sendExtendedOpcode(53, table.concat(pokemonsTable))
-- --	self:setSpecialStorage("pokes", pokeballs)
-- 	return true
-- end

--Itigar
function Player:isSummonBlocked()

	--volte se quiser delay na hora de soltar pokemon
    -- if os.time() > self:getStorageValue(storageDelay) then
    --     self:setStorageValue(storageDelay, os.time() + 1)
    -- else
    --     self:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
    --     return true
    -- end

	if self:getSlotItem(CONST_SLOT_LEFT) == nil then
		self:sendCancelMessage("Sorry, not possible. You need a wand to control your summon.")
                return true
	end

	if self:getStorageValue(storageRide) == 1 then
		self:sendCancelMessage("Sorry, not possible while on ride.")
		return true
	end

	if self:getStorageValue(storageFly) == 1 then
		self:sendCancelMessage("Sorry, not possible while on fly.")
		return true
	end

	if self:getStorageValue(storageSurf) > 0 then
		self:sendCancelMessage("Sorry, not possible while on surf.")
		return true
	end

	if self:getStorageValue(storageEvent) > 0 then
		self:sendCancelMessage("Sorry, not possible while on event.")
		return true
	end

	if self:getStorageValue(storageEvolving) == 1 then
		self:sendCancelMessage("Sorry, not possible while evolving.")
		return true
	end

	return false
end

function doSendGobackInformations(player, summon, actionId)
	if not summon then return end
	local data = {
		action = actionId,
		creature = summon:getId(),
	}
	if data then
		player:sendExtendedOpcode(18, json.encode(data))
	end
end


function Player:canReleaseSummon(pokeLevel, pokeBoost, ownerName)

	-- to fix ball bug
	if not pokeLevel then return false end

	local playerLevel = self:getLevel()
	local minimumLevel = pokeLevel  -- Usando apenas o nível original do Pokémon Itigar
	
	if playerLevel < minimumLevel then
		self:sendCancelMessage("Sorry, not possible. You need level " .. minimumLevel .. " to use this pokemon.")
		return false
	end

	if ownerName then
		if self:getStorageValue(quests.cathemAll.prizes[1].uid) < 2 then
			print("WARNING! Player " .. self:getName() .. " using unique Pokemon without finish the quest!")
		end
	end

	if ownerName and ownerName ~= self:getName() then
		self:sendCancelMessage("Sorry, it belongs to " .. ownerName .. ".")
		return false
	end

	return true
end

function Item:getSummonLevel()
	return self:getSpecialAttribute("pokeLevel")
end

function Item:getSummonName()
	return self:getSpecialAttribute("pokeName")
end

function Item:getSummonBoost()
	return self:getSpecialAttribute("pokeBoost")
end

function Item:getSummonOwner()
	return self:getSpecialAttribute("owner")
end

function Item:isBeingUsed()
	local isBallBeingUsed = self:getSpecialAttribute("isBeingUsed")
	if isBallBeingUsed and isBallBeingUsed == 1 then
		return true
	end
	return false
end

function Item:setBeingUsed()
	self:setSpecialAttribute("isBeingUsed", 1)
	return true
end

function Item:unsetBeingUsed()
	self:setSpecialAttribute("isBeingUsed", 0)
	return true
end

function Player:getCatchRemain(table)
	local catchRemain = 0
	local msg = "Pokemons que faltam catalogar: \n"
	for i = 1, #table do
		if self:getStorageValue(baseStorageCatches + table[i]) <= 0 then
			catchRemain = catchRemain + 1
--			msg = msg .. "[" .. table[i] .. "] " .. monsterNumber[table[i]][1] .. "\n"
			msg = msg .. "[" .. table[i] .. "] " .. monstersTable[tonumber(table[i])] .. "\n"
		end
	end
	if msg ~= "Pokemons que faltam catalogar: \n" then
		self:showTextDialog(2263, msg)
	end
	return catchRemain
end

function Monster:getUsedVitaminsNumber(status)
	if status == nil then status = "vitTotal" end
	local total = 0
	if self:isPokemon() then
		local item = self:getMaster():getUsingBall()
		if item then
			total = item:getSpecialAttribute(status)
			if not total or total < 0 then total = 0 end
		end		
	end	
	return total
end

function Monster:increaseUsedVitaminsNumber()
	if self:isPokemon() then
		local item = self:getMaster():getUsingBall()
		if item then
			local total = item:getSpecialAttribute("vitTotal")
			if not total or total < 0 then total = 0 end
			if total < maxVitamins then
				item:setSpecialAttribute("vitTotal", total + 1)
				return true
			end
		end		
	end
	return false
end

function Monster:increaseStatus(statusName)
	if self:isPokemon() then
		local master = self:getMaster()
		local item = master:getUsingBall()
		if item then
			local total = item:getSpecialAttribute(statusName)
			if not total or total < 0 then total = 0 end
			item:setSpecialAttribute(statusName, total + 1)
			if statusName == "pokeLevel" then
				item:setSpecialAttribute("pokeExperience", getNeededExp(total + 1))
				doRemoveSummon(master:getId(), false, nil, false)
				item:setSpecialAttribute("isBeingUsed", 1)
				doReleaseSummon(master:getId(), self:getPosition(), false, false)
			end
			return true
		end		
	end
	return false
end

function Player:getCatchRemainNumber(table)
	local catchRemain = 0
	for i = 1, #table do
		if self:getStorageValue(baseStorageCatches + table[i]) <= 0 then
			catchRemain = catchRemain + 1
		end
	end
	return catchRemain
end

-- Sistema de Natures

NATURES = {
    ["Adamant"]   = { atk = 1.1, spatk = 0.9 },  -- +Atk, -Sp.Atk
    ["Bashful"]   = { atk = 1.0, spatk = 1.0 },  -- Neutro
    ["Bold"]      = { def = 1.1, atk = 0.9 },    -- +Def, -Atk
    ["Brave"]     = { atk = 1.1, speed = 0.9 },  -- +Atk, -Speed
    ["Calm"]      = { spdef = 1.1, atk = 0.9 },  -- +Sp.Def, -Atk
    ["Careful"]   = { spdef = 1.1, spatk = 0.9 },-- +Sp.Def, -Sp.Atk
    ["Docile"]    = { atk = 1.0, spatk = 1.0 },  -- Neutro
    ["Gentle"]    = { spdef = 1.1, def = 0.9 },  -- +Sp.Def, -Def
    ["Hardy"]     = { atk = 1.0, spatk = 1.0 },  -- Neutro
    ["Hasty"]     = { speed = 1.1, def = 0.9 },  -- +Speed, -Def
    ["Impish"]    = { def = 1.1, spatk = 0.9 },  -- +Def, -Sp.Atk
    ["Jolly"]     = { speed = 1.1, spatk = 0.9 },-- +Speed, -Sp.Atk
    ["Lax"]       = { def = 1.1, spdef = 0.9 },  -- +Def, -Sp.Def
    ["Lonely"]    = { atk = 1.1, def = 0.9 },    -- +Atk, -Def
    ["Mild"]      = { spatk = 1.1, def = 0.9 },  -- +Sp.Atk, -Def
    ["Modest"]    = { spatk = 1.1, atk = 0.9 },  -- +Sp.Atk, -Atk
    ["Naive"]     = { speed = 1.1, spdef = 0.9 },-- +Speed, -Sp.Def
    ["Naughty"]   = { atk = 1.1, spdef = 0.9 },  -- +Atk, -Sp.Def
    ["Quiet"]     = { spatk = 1.1, speed = 0.9 },-- +Sp.Atk, -Speed
    ["Quirky"]    = { atk = 1.0, spatk = 1.0 },  -- Neutro
    ["Rash"]      = { spatk = 1.1, spdef = 0.9 },-- +Sp.Atk, -Sp.Def
    ["Relaxed"]   = { def = 1.1, speed = 0.9 },  -- +Def, -Speed
    ["Sassy"]     = { spdef = 1.1, speed = 0.9 },-- +Sp.Def, -Speed
    ["Serious"]   = { atk = 1.0, spatk = 1.0 },  -- Neutro
    ["Timid"]     = { speed = 1.1, atk = 0.9 }   -- +Speed, -Atk
}

function Player:getPokeballsCached()
    local cache = {}
    local backpack = self:getSlotItem(CONST_SLOT_BACKPACK)
    if not backpack then return cache end

    for i = 0, backpack:getSize() - 1 do
        local item = backpack:getItem(i)
        if item and item:getSpecialAttribute("pokeName") then
            table.insert(cache, item)
        end
    end

    return cache
end

function getNatureBonus(nature)
    return NATURES[nature] or { atk = 1.0, def = 1.0, spatk = 1.0, spdef = 1.0, speed = 1.0 }
end
	-- Funções para New Pokebar
function getPokeballsCached(player)
	local balls = {}
	for slot = CONST_SLOT_FIRST, CONST_SLOT_LAST do
		local item = player:getSlotItem(slot)
		if item and item:isPokeball() then
			table.insert(balls, item)
		end
	end
	return balls
end

function doUpdatePokebarOnRevive(player, index)
	local player = type(player) == "userdata" and player or type(player) == "number" and Player(player)
	player:sendExtendedOpcode(53, json.encode({update = true, index = index}))
end

function doSendPokeTeamByClient(player)

    player = Player(player)
    if not player then
        return
    end

    local pokeballs = player:getPokeballsCached()
    if not pokeballs then
        return
    end
    if #pokeballs == 0 then
        return
    end

    local pokemons = {}

    for i, ball in ipairs(pokeballs) do
        local pokeName = ball:getSpecialAttribute("pokeName") or ""
      
        local monsterType = MonsterType(pokeName)
        if not monsterType then
            return
        end
		local health = ball:getSpecialAttribute("pokeHealth") or 0
		local maxHealth = ball:getSpecialAttribute("pokeMaxHealth") or monster:getTotalHealth()
		local looktype = monsterType:getOutfit().lookType
        local nickname = pokeName
        local used = ball:getSpecialAttribute("isBeingUsed") == 1
        local boost = ball:getSpecialAttribute("pokeBoost") or 0
        local ballKey = getBallKey(ball:getId())

        local pokemon = {
            type = "PokeBar",
            pokeid = "!p " .. i,
            name = pokeName,
            nickname = nickname,
            use = used,
            ball = ballKey,
            health = health,
            maxHealth = maxHealth,
            looktype = looktype,
            boost = boost,
        }

        table.insert(pokemons, pokemon)
    end

    -- Enviar os dados pro OTC
    local success, result = pcall(json.encode, pokemons)
    if not success then
        return
    end
    player:sendExtendedOpcode(53, result)
end


