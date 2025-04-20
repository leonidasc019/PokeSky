function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:getSummon() then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce precisa ter um Pokemon pra fora.")
		return true
	end

	local ball = player:getUsingBall()
	if not ball then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Nao foi possível encontrar a Pokebola.")
		return true
	end

	local platesRemoved = false

	for i = 1, 12 do
		if ball:getSpecialAttribute("plate"..i) then
			ball:setSpecialAttribute("plate"..i, 0)
			platesRemoved = true
		end
	end

	if platesRemoved then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Todas as plates foram removidas da sua Pokebola.")
		player:sendSummonMoves() -- 🧠 Atualiza a lista de golpes!
	else
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Nenhuma plate foi encontrada na Pokebola.")
	end

	item:remove(1) -- descomente se o item for consumível
	return true
end
