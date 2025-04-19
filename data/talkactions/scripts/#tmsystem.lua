local tms = {"magma storm"}

local tmtable = {
	["magma storm"] = {
		cd = 5000,
		target = 0,
		range = 0,
		qtd = 5,
		level = 1,
		tipo = "Fire",
		canlearn = {"charizard"}
	}
}

local function getMoves(player)
	local ball = Player(player):getUsingBall() or 0
	local pokename = Player(player):getSummon():getName() or 0
	local poke = MonsterType(pokename)
	local moves = poke:getMoveList()
	local movesTable = {}
	for i = 1, 12 do
		local move = moves[i]
		if move then
			if ball:getSpecialAttribute("plate"..tostring(i)) and ball:getSpecialAttribute("plate"..tostring(i)) ~= 0 and ball:getSpecialAttribute("plate"..tostring(i)):split("|") then
				table.insert(movesTable, ball:getSpecialAttribute("plate"..tostring(i)):split("|")[1])
			else
				table.insert(movesTable, move.name)
			end
		elseif i > #moves then
			if ball:getSpecialAttribute("plate"..tostring(i)) and ball:getSpecialAttribute("plate"..tostring(i)) ~= 0 and ball:getSpecialAttribute("plate"..tostring(i)):split("|") then
				table.insert(movesTable, ball:getSpecialAttribute("plate"..tostring(i)):split("|")[1])
			end
		end
	end
	return movesTable
end

function onSay(player, words, param)
	if param == "1" then
		local ball = player:getUsingBall() or 0
		if ball ~= 0 then
			local pokename = ball:getSpecialAttribute("pokeName") or 0
			local evolutionList = MonsterType(pokename):getEvolutionList()
			pokename = string.gsub(firstToUpper(pokename), "Shiny ", "")
			pokename = string.gsub(firstToUpper(pokename), "Alolan ", "")
			pokename = string.gsub(firstToUpper(pokename), "Galarian ", "")
			pokename = string.gsub(firstToUpper(pokename), "Hisuian ", "")
			pokename = string.gsub(firstToUpper(pokename), "Mega ", "")
			pokename = string.gsub(firstToUpper(pokename), " X", "")
			pokename = string.gsub(firstToUpper(pokename), " Y ", "")
			pokename = string.gsub(firstToUpper(pokename), "Cloned ", "")
			if #evolutionList >= 1 then player:sendCancelMessage("This pokemon only learns TMs once it's evolved.") return false end
			if pokename == "Smeargle" then player:sendCancelMessage("Smeargle cant learn TMs.") return false end
			if pokename == "Ditto" then player:sendCancelMessage("Ditto cant learn TMs.") return false end
			local learnable = ""
			for i = 1, #tms do
				if isInArray(tmtable[tms[i]].canlearn, pokename:lower()) or tmtable[tms[i]].canlearn == 1 then
					learnable = learnable .. "" ..tms[i] .. "|" .. tmtable[tms[i]].cd .. "|" .. tmtable[tms[i]].qtd .. "|" .. tmtable[tms[i]].target .. "|" .. tmtable[tms[i]].range .. "|" .. tmtable[tms[i]].level .. "|" .. tmtable[tms[i]].tipo .. "|"
				end
			end
			player:sendExtendedOpcode(66, learnable)
			return false
		else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Seu pokemon precisa estar pra fora da pokebola.")
			return false
		end
	else
		local tmnome = param:split("|")[1]
		local moveslot = tonumber(param:split("|")[2])
		local ball = player:getUsingBall() or 0
		local pokename = ball:getSpecialAttribute("pokeName") or 0
		pokename = string.gsub(firstToUpper(pokename), "Shiny ", "")
		pokename = string.gsub(firstToUpper(pokename), "Alolan ", "")
		pokename = string.gsub(firstToUpper(pokename), "Galarian ", "")
		pokename = string.gsub(firstToUpper(pokename), "Hisuian ", "")
		pokename = string.gsub(firstToUpper(pokename), "Mega ", "")
		pokename = string.gsub(firstToUpper(pokename), " X", "")
		pokename = string.gsub(firstToUpper(pokename), " Y ", "")
		pokename = string.gsub(firstToUpper(pokename), "Cloned ", "")
		if not tmtable[tmnome] then return false end
		if ball == 0 then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Seu pokemon precisa estar pra fora da pokebola.")
			return false
		end
		if not (isInArray(tmtable[tmnome].canlearn, pokename:lower()) or tmtable[tmnome].canlearn == 1) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Este pokemon nao aprende este TM.")
			return false
		end
		local movelist = getMoves(player.uid)
		if isInArray(movelist, tmnome) then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Este pokemon ja sabe este ataque.")
			return false
		end
		local itemremove = 26662
		local quantity = tmtable[tmnome].qtd
		if not tonumber(quantity) then
			if #getMoves(player.uid) < moveslot then moveslot = #getMoves(player.uid) + 1 end
			if player:removeItem(quantity, 1) then
				ball:setSpecialAttribute("plate"..moveslot .. "", "" .. tmnome .. "|" .. tmtable[tmnome].cd .. "|" .. tmtable[tmnome].level .. "|" .. tmtable[tmnome].target .. "|" .. tmtable[tmnome].range .. "")
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Seu pokemon aprendeu o move "..tmnome.." no slot "..moveslot..".")
				local pos = player:getSummon():getPosition()
				doRemoveSummon(player:getId(), false, false, false)
				ball:setBeingUsed()
				doReleaseSummon(player:getId(), pos, false, false)
				return false
			else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao tem CDs o suficiente.")
				return false
			end
		else
			if string.find(tmnome, "judgement") then itemremove = tmtable[tmnome].qtd quantity = 1 end
			if #getMoves(player.uid) < moveslot then moveslot = #getMoves(player.uid) + 1 end
			if player:removeItem(itemremove, quantity) then
				ball:setSpecialAttribute("plate"..moveslot .. "", "" .. tmnome .. "|" .. tmtable[tmnome].cd .. "|" .. tmtable[tmnome].level .. "|" .. tmtable[tmnome].target .. "|" .. tmtable[tmnome].range .. "")
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Seu pokemon aprendeu o move "..tmnome.." no slot "..moveslot..".")
				local pos = player:getSummon():getPosition()
				doRemoveSummon(player:getId(), false, false, false)
				ball:setBeingUsed()
				doReleaseSummon(player:getId(), pos, false, false)
				return false
			else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao tem CDs o suficiente.")
				return false
			end
		end
		return false
	end
	return false
end
