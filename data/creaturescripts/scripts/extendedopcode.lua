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

   	if opcode == OPCODE_LANGUAGE then
		-- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			--player:setStorageValue(SOME_STORAGE_ID, SOME_VALUE)
		end
	elseif opcode == OPCODE_SKILLBAR then

	end
   return true
end