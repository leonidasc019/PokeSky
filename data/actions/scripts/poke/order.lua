local outfit = {lookType = 267, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
local rocks = {1285, 3609}
local bushes = {2767}
local holes = {468, 481, 483, 7932}

local function walkToPosition(cid, path, count, extra)
	local creature = Creature(cid)
	if not creature then return true end
	if creature:getCondition(CONDITION_MOVING) == nil then return true end
	if count > #path then
		if extra then
			if extra.action == "destroy" then
				local item = extra.tile:getTopTopItem()
				if item and (isInArray(rocks, item:getId()) or isInArray(bushes, item:getId())) then
					extra.position:sendMagicEffect(extra.effect)
					item:transform(extra.newItem)
					item:decay()
				end
			elseif extra.action == "changeGround" then
				local ground = extra.tile:getGround()
				if ground and (isInArray(holes, ground:getId())) then
					extra.position:sendMagicEffect(extra.effect)
					ground:transform(extra.newGround)
					ground:decay()
				end
			elseif extra.action == "mount" then
				local player = Player(extra.playerId)
				if player then
					player:setStorageValue(extra.storage, 1)
					doRemoveSummon(extra.playerId, false)
					doChangeOutfit(extra.playerId, extra.outfit)
					player:changeSpeed(extra.speed)
				end
			end
		end
		return true
	end

	local dir = path[count]
	creature:move(dir)
	count = count + 1
	addEvent(walkToPosition, creature:getWalkDelay(dir), cid, path, count, extra)
end

local function setCreatureIdle(cid, time)
	local creature = Creature(cid)
	if not creature then return true end
	local condition = Condition(CONDITION_MOVING)
	condition:setParameter(CONDITION_PARAM_TICKS, time)
	creature:addCondition(condition)
end

function Creature.walk(self, position, maxDistance, extra)
	local path = self:getPathTo(position, 0, maxDistance, true, false, 14)
	if not path then return false end

	setCreatureIdle(self.uid, #path * 500 + 10000)
	walkToPosition(self.uid, path, 1, extra)

	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target then
		return true
	end

	if type(target) ~= "userdata" then
		return true
	end

	if target:isItem() or target == player then
		local tileUnder = Tile(player:getPosition())
		if not tileUnder then
			player:sendCancelMessage("WARNING! Tile not found pos " .. player:getPosition().x .. " " .. player:getPosition().y .. " " .. player:getPosition().z .. ".")
			return true
		end
		local groundUnder = tileUnder:getGround()
		if not groundUnder then
			player:sendCancelMessage("WARNING! Ground not found pos " .. player:getPosition().x .. " " .. player:getPosition().y .. " " .. player:getPosition().z .. ".")
			return true
		end		
		if groundUnder:getId() == flyFloor then
			player:sendCancelMessage("Sorry, not possible. First go downstairs.")
			return true
		end
		if (player:getStorageValue(storageRide) == 1 or player:getStorageValue(storageFly) == 1) then
			local summonName = player:getSummonNameFromBall()
			local actualSpeed = player:getSpeed()
			player:say("Let me dismount, " .. summonName .. "!", TALKTYPE_MONSTER_SAY)
			player:removeCondition(CONDITION_OUTFIT)
			player:changeSpeed(-actualSpeed+player:getBaseSpeed())
			player:setStorageValue(storageRide, -1)
			player:setStorageValue(storageFly, -1)
			doReleaseSummon(player:getId(), player:getPosition(), false)
			return true
		end
	end

	if not hasSummons(player) then
		player:sendCancelMessage("Sorry, not possible. You need a summon to order.")
		return true
	end

	local summon = player:getSummon()
	local summonName = summon:getName()
	local summonPos = summon:getPosition()
	local playerPos = player:getPosition()

	if summon:getCondition(CONDITION_PARALYZE) or summon:getCondition(CONDITION_SLEEP) then
		player:sendCancelMessage("Sorry, not possible. Your Pokemon is either paralyzed or sleeping.")
		return true
	end

	if target:isCreature() then
		if target ~= player and target:isMonster() then
			local name = player:getSummonNameFromBall()
			if name == "Ditto" or name == "Shiny ditto" or name == "Xmas ditto" then
				local ball = player:getUsingBall()
				local dittoTime = ball:getSpecialAttribute("dittoTime")
				if dittoTime and os.time() < dittoTime then
				player:sendCancelMessage("Sorry, not possible. You must wait " .. dittoTime - os.time() .. " seconds to transform your Pokemon again.")
					return true
				end
				local targetName = target:getName()
				if MonsterType(targetName):isLegendary() then
					player:sendCancelMessage("Sorry, not possible. You can not transform your Pokemon into a legendary Pokemon.")
					return true
				end
				if name == "Ditto" and msgcontains(targetName, "Shiny") then
					player:sendCancelMessage("Sorry, not possible. Only Shiny Ditto can transform into a Shiny Pokemon.")
					return true
				end

				local ballKey = getBallKey(ball:getId())
				ball:setSpecialAttribute("dittoTime", os.time() + 2 * 60 * 60)
				ball:setSpecialAttribute("dittoTransform", targetName)
				doRemoveSummon(player:getId(), false, false, false)
				ball:setBeingUsed()
				doReleaseSummon(player:getId(), summonPos, false, false)
				player:say(name .. ", transform into a " .. targetName .. "!", TALKTYPE_MONSTER_SAY)
				summonPos:sendMagicEffect(80)
				return true
			else
				player:sendCancelMessage("Sorry, not possible. You can only use order on the ground or in yourself.")
				return true
			end
		end
	end

	if target:isItem() then
		local tile = Tile(toPosition)
		if not tile then
			return false
		end
		local ground = tile:getGround()
		if not ground then
			return false
		end

		local destTile = getTileInfo(toPosition)
		if not destTile or destTile.house or destTile.protection then
			return false
		end

		local item = tile:getTopTopItem()
		if item and isInArray(rocks, item:getId()) then
			local race = MonsterType(summonName):getRaceName()
			local race2 = MonsterType(summonName):getRace2Name()
			if race == "rock" or race2 == "rock" or race == "fighting" or race2 == "fighting" then
				summon:walk(toPosition, 1, {action = "destroy", effect = CONST_ME_GROUNDSHAKER, position = toPosition, tile = tile, newItem = 1313})
				player:say(summonName .. ", destroy it!", TALKTYPE_MONSTER_SAY)
			else
				player:sendCancelMessage("Sorry, not possible. You need a rock type pokemon for rock smash.")
			end
			return true
		end
		if item and isInArray(bushes, item:getId()) then
			local race = MonsterType(summonName):getRaceName()
			local race2 = MonsterType(summonName):getRace2Name()
			if race == "grass" or race2 == "grass" then
				summon:walk(toPosition, 1, {action = "destroy", effect = CONST_ME_GROUNDSHAKER, position = toPosition, tile = tile, newItem = 6216})
				player:say(summonName .. ", cut it!", TALKTYPE_MONSTER_SAY)
			else
				player:sendCancelMessage("Sorry, not possible. You need a grass type pokemon for cut.")
			end
			return true
		end
		local groundId = ground:getId()
		if isInArray(holes, groundId) then
			local race = MonsterType(summonName):getRaceName()
			local race2 = MonsterType(summonName):getRace2Name()
			if race == "ground" or race2 == "ground" then
				summon:walk(toPosition, 1, {action = "changeGround", effect = CONST_ME_GROUNDSHAKER, position = toPosition, tile = tile, newGround = groundId + 1})
				player:say(summonName .. ", use dig!", TALKTYPE_MONSTER_SAY)
			else
				player:sendCancelMessage("Sorry, not possible. You need a ground type pokemon for dig.")
			end
			return true
		end

		if Tile(toPosition):hasProperty(CONST_PROP_BLOCKSOLID) or Tile(toPosition):hasProperty(CONST_PROP_BLOCKPATH) then
			return false
		end

		-- adicionado blink nos pokémon psychic ghost Itigar
		local blinkEffect = 681  -- effect
		
		if not summon:getCondition(CONDITION_MOVING) then
			-- Verifica se o Pokémon é do tipo Ghost ou Psychic
			local race = MonsterType(summon:getName()):getRaceName()
			local race2 = MonsterType(summon:getName()):getRace2Name()
		
			if race == "ghost" or race2 == "ghost" or race == "psychic" or race2 == "psychic" then
				-- Se for do tipo Ghost ou Psychic, teleporta o Pokémon
				summon:teleportTo(toPosition)
				toPosition:sendMagicEffect(blinkEffect)  -- Aplica o efeito configurado
				player:say(summon:getName() .. ", use Blink!", TALKTYPE_MONSTER_SAY)
			else
				-- Se não for do tipo Ghost ou Psychic, o Pokémon se move normalmente (sem efeito)
				if summon:walk(toPosition, 0) then
					player:say(summon:getName() .. ", move there!", TALKTYPE_MONSTER_SAY)
				else
					player:sendCancelMessage("Sorry, not possible. Too far away.")
				end
			end
		else
			summon:removeCondition(CONDITION_MOVING)
			player:sendCancelMessage("Sorry, not possible. Your Pokémon was already moving.")
		end
		return true
	end


	if target:isCreature() then
		if target == player then -- order ride or fly Itigar
			-- Verificar se o jogador tem algum efeito ativo (condição para não usar fly ou ride)
			local effectId = getEffectIdForPlayer(player)
			if effectId then
				player:sendCancelMessage("Sorry, not possible while on bike or with active effect.")
				return true
			end
			
			local msg = summonName
			local monsterType = MonsterType(summonName)
			local flyOutfit = monsterType:isFlyable()
			local rideOutfit = monsterType:isRideable()    
			local summonSpeed = summon:getTotalSpeed() + player:getSpeed()
			local storage = 0
			-- Colocando pra utilizar os atributos obtidos pelo Iv e Ev
			local ball = player:getUsingBall()
			summonSpeed = summonSpeed + ball:getSpecialAttribute("pokeSpeed")
	
			if rideOutfit > 0 and flyOutfit == 0 then -- ride
				if rideOutfit > 1 then outfit.lookType = rideOutfit end
				msg = msg .. ", give me a ride!"
				storage = storageRide
				summonSpeed = summonSpeed
				if rideOutfit == 1 then
					outfit.lookType = monsterType:getOutfit().lookType
				else
					outfit.lookType = rideOutfit
				end
			elseif rideOutfit == 0 and flyOutfit > 0 then -- fly
				if flyOutfit > 1 then outfit.lookType = flyOutfit end
				msg = msg .. ", let me fly on you!"
				storage = storageFly
				summonSpeed = summonSpeed
				if flyOutfit == 1 then
					outfit.lookType = monsterType:getOutfit().lookType
				else
					outfit.lookType = flyOutfit
				end                
			elseif rideOutfit > 0 and flyOutfit > 0 then -- fly
				if flyOutfit > 1 then outfit.lookType = flyOutfit end
				msg = msg .. ", let me fly on you!"
				storage = storageFly
				if flyOutfit == 1 then
					outfit.lookType = monsterType:getOutfit().lookType
				else
					outfit.lookType = flyOutfit
				end
			else -- none
				player:sendCancelMessage("Sorry, not possible. You can not get ride or fly in your summon.")
				return true
			end
	
			summon:walk(toPosition, 1, {action = "mount", playerId = player:getId(), outfit = outfit, speed = summonSpeed, storage = storage})
			if string.find(msg, "^Shiny ") then
				-- Remove "Shiny " do início do nome
				msg = string.gsub(msg, "^Shiny ", "")
			end
			player:say(msg, TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end	
