local initialLevel = 1
local initialBoost = 0
local multiplierExpFirstNormal = 800
local multiplierExpNormal = 200
local multiplierExpFirstShiny = 3000
local multiplierExpShiny = 1000

local function doPlayerSendEffect(cid, effect)
	local player = Player(cid)
	if player then
		player:getPosition():sendMagicEffect(effect)
	end
	return true
end

function getRandomNature()
    local natureNames = {"Adamant", "Modest", "Jolly", "Timid"}
    return natureNames[math.random(#natureNames)]
end


local function doPlayerAddExperience(cid, exp)
	local player = Player(cid)
	if player then
		player:addExperience(exp, true)
	end
	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = Tile(toPosition)
	if not tile or not tile:getTopDownItem() or not ItemType(tile:getTopDownItem():getId()):isCorpse() then
		return false
	end
	local targetCorpse = tile:getTopDownItem()

	local owner = targetCorpse:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
	if owner ~= 0 and owner ~= player:getId() then
		player:sendCancelMessage("Desculpe, n�o � poss�vel. Voc� n�o � o propriet�rio.")
		return true
	end
	
	local ballKey = getBallKey(item:getId())
	local playerPos = getPlayerPosition(player)
	local d = getDistanceBetween(playerPos, toPosition)
	local delay = d * 80
	local delayMessage = delay + 2800
	local name = targetCorpse:getName()
	if name == "dead human" then		
		-- playerPos:sendMagicEffect(CONST_ME_POFF)
		return false
	end
	if name == "dead enlightened of the cult" then
		name = "enlightened of the cult"
	elseif name == "slain undead dragon" then
		name = "undead dragon"
	else
		name = string.gsub(name, "the ", "")
		name = string.gsub(name, "remains of ferumbras", "Ferumbras")
		name = string.gsub(name, "remains of", "")
		name = string.gsub(name, " a ", "")
		name = string.gsub(name, " an ", "")
		name = string.gsub(name, "slain ", "")
		name = string.gsub(name, "fainted ", "")
		name = string.gsub(name, "defeated ", "")
--		name = string.gsub(name, "dead ", "")
	end

	local monsterType = MonsterType(name)
	if not monsterType then
		print("AVISO! Monstro " .. name .. " com erro ao capturar!")
		player:sendCancelMessage("Desculpe, n�o � poss�vel. Este problema foi reportado.")
		return true
	end
	local chance = monsterType:catchChance() * balls[ballKey].chanceMultiplier
	if player:getVocation():getName() == "Catcher" then
		chance = chance * catcherCatchBuff
	end
	if chance == 0 then
		-- playerPos:sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("Desculpe, � imposs�vel capturar este monstro.")
		return true
	end
	local monsterNumber = monsterType:getNumber()
	local storageCatch = baseStorageCatches + monsterNumber
	local storageTry = baseStorageTries + monsterNumber
	local level = targetCorpse:getSpecialAttribute("corpseLevel") or initialLevel
	doSendDistanceShoot(playerPos, toPosition, balls[ballKey].missile)
	item:remove(1)
	targetCorpse:remove()
	if player:getStorageValue(storageTry) < 0 then
		player:setStorageValue(storageTry, 1)
	else
		player:setStorageValue(storageTry, player:getStorageValue(storageTry) + 1)
	end

	local gender = math.random(1, 100) <= 50 and "male" or "female"  -- 50% macho, 50% fêmea
	local ev = 0
	local nature = getRandomNature()

	if math.random(1, 40) <= chance then -- capturado 1 chance em X ( mudar chance de captura)
		-- Gerar IVs aleatórios (de 1 a 31 para cada atributo)
		local ivs = {
		    hp = math.random(1, 31),
		    attack = math.random(1, 31),
		    defense = math.random(1, 31),
		    speed = math.random(1, 31),
		    spAttack = math.random(1, 31),
		    spDefense = math.random(1, 31)
		}

		-- Transformar IVs em string para armazenar na Pokébola
		local ivString = ivs.hp .. ";" .. ivs.attack .. ";" .. ivs.defense .. ";" .. ivs.speed .. ";" .. ivs.spAttack .. ";" .. ivs.spDefense
		-- verifica quantas pok�bolas o jogador tem

		if player:getSlotItem(CONST_SLOT_BACKPACK) and player:getSlotItem(CONST_SLOT_BACKPACK):getEmptySlots() >= 1 and player:getFreeCapacity() >= 1 then
		    addEvent(doAddPokeball, delayMessage, player:getId(), name, level, initialBoost, ballKey, false, delayMessage, ivString, gender, ev, nature)

		else
		    local addPokeball = doAddPokeball(player:getId(), name, level, initialBoost, ballKey, true, delayMessage + 4000, ivString)
			if not addPokeball then
				print("ERRO! Jogador " .. player:getName() .. " perdeu o pok�mon " .. name .. "! addPokeball falso")
			end
			addEvent(doPlayerSendTextMessage, delayMessage + 2000, player:getId(), MESSAGE_EVENT_ADVANCE, "Como voc� est� com a capacidade m�xima, sua bola foi enviada para o CP.")
		end
		
		local playerLevel = player:getLevel()
		local maxExp = getNeededExp(playerLevel + 2) - getNeededExp(playerLevel)
		local maxExpShiny = getNeededExp(playerLevel + 5) - getNeededExp(playerLevel)

		local givenExp = monsterType:getExperience() * configManager.getNumber(configKeys.RATE_EXPERIENCE)
		if msgcontains(name, 'Shiny') and player:getStorageValue(storageCatch) == -1 then
			givenExp = givenExp * multiplierExpFirstShiny
			if givenExp > maxExpShiny then
				givenExp = maxExpShiny 
			end
			addEvent(doPlayerSendTextMessage, delayMessage + 1000, player:getId(), MESSAGE_EVENT_ADVANCE, "Voc� ganhou um b�nus de experi�ncia pela sua primeira captura de " .. name .. "!")
		elseif msgcontains(name, 'Shiny') and player:getStorageValue(storageCatch) > 0 then
			givenExp = givenExp * multiplierExpShiny
			if givenExp > maxExpShiny then
				givenExp = maxExpShiny 
			end
			addEvent(doPlayerSendTextMessage, delayMessage + 1000, player:getId(), MESSAGE_EVENT_ADVANCE, "Voc� ganhou um b�nus de experi�ncia por capturar um shiny!")
		elseif not msgcontains(name, 'Shiny') and player:getStorageValue(storageCatch) == -1 then
			givenExp = givenExp * multiplierExpFirstNormal
			if givenExp > maxExp then
				givenExp = maxExp
			end
			addEvent(doPlayerSendTextMessage, delayMessage + 1000, player:getId(), MESSAGE_EVENT_ADVANCE, "Voc� ganhou um b�nus de experi�ncia pela sua primeira captura de " .. name .. "!")
		else
			givenExp = givenExp * multiplierExpNormal
			if givenExp > maxExp then
				givenExp = maxExp
			end
		end

		if player:getStorageValue(storageCatch) == -1 then
			player:setStorageValue(storageCatch, 1)
		else
			player:setStorageValue(storageCatch, player:getStorageValue(storageCatch) + 1)
		end

		addEvent(doPlayerAddExperience, delayMessage, player:getId(), givenExp)
		addEvent(doSendMagicEffect, delay, toPosition, balls[ballKey].effectSucceed)
		addEvent(doPlayerSendTextMessage, delayMessage, player:getId(), MESSAGE_EVENT_ADVANCE, "Parab�ns! Voc� capturou um " .. name .. "!")
		addEvent(doPlayerSendEffect, delayMessage, player:getId(), 297)
	else -- erro		
		addEvent(doSendMagicEffect, delay, toPosition, balls[ballKey].effectFail)
		addEvent(doPlayerSendEffect, delayMessage, player:getId(), 286)
		return true
	end	

	return true
end
