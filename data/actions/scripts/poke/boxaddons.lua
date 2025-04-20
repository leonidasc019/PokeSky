local addon = {
	-- Novos Addons
	['Charizard OLD 1'] = {add = 6, chance = 10},
	--FIM
}

local config = {
	price = 1,
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemId = item:getId()
    local boxId = 41689  -- Substitua pelo ID correto da sua caixa
    
    -- Verifica se o item usado corresponde à caixa correta
    if itemId == boxId then
        -- Seleciona aleatoriamente um nome de addon da tabela 'addon'
		local totalChance = 0
		local randomAddonName = false
        for _, addonInfo in pairs(addon) do
			totalChance = totalChance + addonInfo.chance
        end
		local randomChance = math.random(totalChance)
        for k, v in pairs(addon) do
			randomChance = randomChance - v.chance
			if randomChance <= 0 then
				randomAddonName = k
				break
			end
		end
        
        -- Verifica se o addon selecionado existe na tabela 'addon'
        if addon[randomAddonName] then
            -- Verifica se o jogador pode pagar pelo addon
            if player then
                -- Adiciona o item correspondente à caixa aberta (exemplo: item 39647)
                local newBox = player:addItem(41687, 1)
                -- Define um atributo especial no item para o addon
                newBox:setSpecialAttribute("addon", ""..addon[randomAddonName].add)
                
                -- Mensagem para o jogador informando o addon encontrado
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You have found the addon: " .. randomAddonName .. ".")
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
                
                item:remove(1)  -- Remove a caixa usada após todas as operações concluídas
            else
                player:sendCancelMessage("You do not have enough of item 38971 to open this box.")
            end
        else
            print("Addon not found in table:", randomAddonName)  -- Debug: Imprime o nome do addon não encontrado
        end
    end
    return true
end