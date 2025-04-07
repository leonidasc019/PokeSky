function onLogin(player)
	player:registerEvent("RegisterWildBuffs")
	local loginStr = "Bem vindo ao " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
		player:enableAutoLoot()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Sua ultima visita foi em %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	nextUseStaminaTime[player.uid] = 0

	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("MonsterHealthChange")
	player:registerEvent("GameStore")
	player:updateQuestLog()
	player:refreshPokemonBar({}, {})

	if player:isOnSurf() then
		local totalSpeed = player:getStorageValue(storageLogoutSpeed) or 50
		if totalSpeed < 50 then totalSpeed = 50 end
		player:changeSpeed(-player:getSpeed() + totalSpeed)
	elseif player:isOnRide() then
		local summonName = player:getSummonNameFromBall()
		local monsterType = MonsterType(summonName)
		if monsterType and monsterType:isRideable() > 0 then
			local totalSpeed = player:getStorageValue(storageLogoutSpeed) or 50
			if totalSpeed < 50 then totalSpeed = 50 end
			player:changeSpeed(-player:getSpeed() + totalSpeed)
			doChangeOutfit(player:getId(), {lookType = monsterType:isRideable()})
		else
			print("WARNING! Player " .. player:getName() .. " summonName not found onLogin for ride!")
			player:setStorageValue(storageRide, -1)
			player:teleportTo(player:getTown():getTemplePosition())
		end		
	elseif player:isOnFly() then
		local summonName = player:getSummonNameFromBall()
		local monsterType = MonsterType(summonName)
		if monsterType and monsterType:isFlyable() > 0 then
			local totalSpeed = player:getStorageValue(storageLogoutSpeed) or 50
			if totalSpeed < 50 then totalSpeed = 50 end
			player:changeSpeed(-player:getSpeed() + totalSpeed)
			doChangeOutfit(player:getId(), {lookType = monsterType:isFlyable()})
			player:activateFly()
		else
			print("WARNING! Player " .. player:getName() .. " summonName not found onLogin for fly!")
		end
	elseif player:isOnDive() then
		doChangeOutfit(player:getId(), {lookType = 267})
	end

	checkAndRemoveSkates(player)

	if player:getStorageValue(storageEvolving) == 1 then
		player:setStorageValue(storageEvolving, -1)
		print("WARNING! Player " .. player:getName() .. " got problems while evolving summon.")
	end
	
	if player:isOnEvent() then
		player:setStorageValue(storageEvent, -1)
		print("WARNING! Player " .. player:getName() .. " left event.")
	end

	if player:isDuelingWithNpc() then
		player:unsetDuelWithNpc()
	end

	if player:isOnLeague() then
		player:setOutLeague()
		player:teleportTo(player:getTown():getTemplePosition())
		print("WARNING! Player " .. player:getName() .. " left league.")
	end

	player:addSlotItems()

	local item = player:getSlotItem(CONST_SLOT_AMMO)
	if item then
		local depot = player:getInbox()
		addBall = item:moveTo(depot)
		if not addBall then
			print("WARNING! Player " .. player:getName() .. " had problems sending ball from ammo to cp.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your Pokemon was sent to CP.")
		end
	end
	local portrait = player:getSlotItem(CONST_SLOT_HEAD)
	if portrait then
		removePortrait = player:removeItem(portrait:getId(), 1)
		if not removePortrait then
			print("WARNING! Player " .. player:getName() .. " had problems removing portrait from head.")
		end
	end

	if not monstersTable then
		buildDex()
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Bem-vindo ao Itigar")
	player:addItem(2270, 1, false, 1, CONST_SLOT_HEAD)
	player:registerEvent("Task")

	return true
end


--Itigar Remover Roupas Como Patins Bike...
function checkAndRemoveSkates(player)
	if player:getStorageValue(storageBike) > 0 then
		player:removeCondition(CONDITION_OUTFIT)
		player:setStorageValue(storageBike, -1)

		local originalOutfit = player:getStorageValue(storageOutfit)
		if originalOutfit > 0 then
			local outfit = {
				lookType = originalOutfit,
				lookHead = player:getStorageValue(storageOutfit + 1),
				lookBody = player:getStorageValue(storageOutfit + 2),
				lookLegs = player:getStorageValue(storageOutfit + 3),
				lookFeet = player:getStorageValue(storageOutfit + 4)
			}
			player:setOutfit(outfit)
		end
	end
end
