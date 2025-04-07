local boxes = 
	{
		box1 = {itemid = 41616, pokes = {"Magnemite", "Slowpoke", "Seel", "Grimer", "Gastly", "Drowzee", "Voltorb", "Koffing", "Goldeen", "Bulbasaur", "Charmander", "Squirtle", "Beedrill", "Kakuna", "Metapod", "Pidgeotto", "Spearow", "Raticate", "Staryu", "Abra", "Mankey", "Sandshrew", "Nidoranfe", "Nidoranma", "Zubat", "Diglett", "Venonat", "Growlithe", "Machop", "Weepinbell", "Ponyta", "Geodude", "Psyduck", "Tentacool", "Cleffa", "Cyndaquil", "Chikorita", "Pichu", "Igglybuff", "Mareep", "Wooper", "Togepi", "Hoothoot", "Sentret", "Slugma", "Poliwhirl", "Chinchou", "Natu", "Ledyba", "Snubbull", "Houndour", "Magby", "Elekid", "Totodile", "Butterfree", "Smoochum", "Skiploom", "Vulpix", "Ekans", "Meowth", "Poliwag", "Marill", "Pineco"} },
		box2 = {itemid = 41614, pokes = {"Clefairy", "Jigglypuff", "Kabuto", "Omanyte", "Arbok", "Nidorina", "Nidorino", "Golbat", "Spheal", "Yanma", "Machoke", "Corphish", "Graveler", "Farfetch'd", "Haunter", "Kadabra", "Kingler", "Electrode", "Rhyhorn", "Seadra", "Seaking", "Eevee", "Dratini", "Wartortle", "Ivysaur", "Gligar", "Ariados", "Ledian", "Dunsparce", "Charmeleon", "Bayleef", "Croconaw", "Quilava", "Furret", "Shuckle", "Flaaffy", "Aipom", "Larvitar", "Shuppet", "Smoochum", "Meditite", "Nuzleaf", "Magby", "Swablu", "Snorunt", "Minun", "Plusle", "Aron", "Bronzor", "Taillow", "Numel", "Spoink", "Elekid", "Electrike", "Baltoy", "Slakoth", "Marshtomp", "Duskull", "Grovyle", "Tyrogue", "Dugtrio"} },
		box3 = {itemid = 41617, pokes = {"Sableye", "Lombre", "Loudred", "Marowak", "Tangela", "Cloyster", "Hypno", "Corsola", "Murkrow", "Quagsire", "Fearow", "Sandslash", "Vileplume", "Bellossom", "Primeape", "Noctowl", "Dewgong", "Onix", "Vibrava", "Politoed", "Sneasel", "Delibird", "Stantler", "Victreebel", "Sealeo", "Vigoroth", "Lairon"} },
		box4 = {itemid = 41615, pokes = {"Kangaskhan", "Jynx", "Electabuzz", "Scyther", "Magmar", "Lapras", "Gyarados", "Omastar", "Kabutops", "Ursaring", "Misdreavus", "Skarmory", "Steelix", "Scizor", "Slowking", "Miltank", "Kingdra", "Tyranitar", "Ditto", "Flareon", "Vaporeon", "Jolteon", "Espeon", "Umbreon", "Snorlax", "Dragonite", "Porygon2", "Girafarig", "Mantine", "Blissey"} }
	}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	for key, value in pairs(boxes) do
		if value.itemid == itemId then
			local random = math.random(1, #boxes[key].pokes)
			local pokeName = boxes[key].pokes[random]
			local monsterType = MonsterType(pokeName)
			if not monsterType then
				print("AVISO! Pokemon " .. pokeName .. " nao e valido para caixa.")
				return true
			end
			doAddPokeball(player:getId(), pokeName, math.random(monsterType:getMinLevel(), monsterType:getMaxLevel()), 0, getBallKey(balls.ultraball.emptyId), false, 0)
			player:sendTextMessage(MESSAGE_STATUS_WARNING, "O seu EGG chocou um(a) " .. pokeName .. "! Cuide bem dele(a)!")
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			break
		end
	end
	item:remove(1)
	return true
end
