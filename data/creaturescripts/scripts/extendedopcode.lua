local OPCODE_LANGUAGE = 1
local OPCODE_SKILLBAR = 52

function onExtendedOpcode(player, opcode, buffer)
   -- Opcode New Pokebar
   if opcode == 53 then
      local status, data = pcall(function() return json.decode(buffer) end)
      if status and type(data) == "table" then
         player:setStorageValue(9001, buffer) -- salvando JSON completo
      else
      end
   end

	if opcode == OPCODE_TASKS_KILL then
		player:handleTasksKill(buffer)
		return
	end
	
   return true
end