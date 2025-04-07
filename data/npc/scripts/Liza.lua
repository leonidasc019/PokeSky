local priceTable = {
	["Abomasnow"] = 120000,
    ["Abra"] = 800,
    ["Absol"] = 120000,
    ["Aggron"] = 75000,
    ["Aipom"] = 8000,
    ["Alakazam"] = 15800,
    ["Altaria"] = 60000,
    ["Ampharos"] = 18000,
    ["Anorith"] = 20000,
    ["Arbok"] = 3000,
    ["Arcanine"] = 58500,
    ["Ariados"] = 3000,
    ["Armaldo"] = 75000,
    ["Aron"] = 15000,
    ["Azumarill"] = 13000,
    ["Bagon"] = 15000,
    ["Baltoy"] = 3500,
    ["Banette"] = 13500,
    ["Bastiodon"] = 120000,
    ["Bayleef"] = 8000,
    ["Beedrill"] = 2000,
    ["Beldum"] = 15000,
    ["Bellossom"] = 12000,
    ["Bellsprout"] = 80,
    ["Blastoise"] = 18000,
    ["Blaziken"] = 18000,
    ["Blissey"] = 140000,
    ["Bronzong"] = 25000,
    ["Bronzor"] = 15000,
    ["Bulbasaur"] = 3000,
    ["Butterfree"] = 2000,
    ["Camerupt"] = 13000,
    ["Castform"] = 120000,
    ["Caterpie"] = 5,
    ["Chansey"] = 40000,
    ["Charizard"] = 18000,
    ["Charmander"] = 3000,
    ["Charmeleon"] = 8000,
    ["Chikorita"] = 3000,
    ["Chinchou"] = 1000,
    ["Claydol"] = 13500,
    ["Clefable"] = 18000,
    ["Clefairy"] = 8000,
    ["Cleffa"] = 3000,
    ["Cloyster"] = 10200,
    ["Combusken"] = 8000,
    ["Corphish"] = 3500,
    ["Corsola"] = 9000,
    ["Crawdaunt"] = 13500,
    ["Croagunk"] = 11000,
    ["Crobat"] = 58000,
    ["Croconaw"] = 8000,
    ["Cubone"] = 1000,
    ["Cyndaquil"] = 3000,
    ["Dark Abra"] = 920000,
    ["Delibird"] = 10000,
    ["Dewgong"] = 12000,
    ["Diglett"] = 200,
    ["Dodrio"] = 5600,
    ["Doduo"] = 600,
    ["Donphan"] = 13000,
    ["Dragonair"] = 65000,
    ["Dragonite"] = 125000,
    ["Dratini"] = 15000,
    ["Drowzee"] = 1000,
    ["Dugtrio"] = 3000,
    ["Dunsparce"] = 3000,
    ["Dusclops"] = 18000,
    ["Dusknoir"] = 10000000,
    ["Duskull"] = 8000,
    ["Eevee"] = 45000,
    ["Ekans"] = 300,
    ["Electabuzz"] = 120000,
    ["Electivire"] = 10000000,
    ["Electrike"] = 3500,
    ["Electrode"] = 3000,
    ["Elekid"] = 4500,
    ["Empoleon"] = 800000,
    ["Espeon"] = 50000,
    ["Exeggcute"] = 200,
    ["Exeggutor"] = 10000,
    ["Exploud"] = 18000,
    ["Farfetch'd"] = 8000,
    ["Feebas"] = 300,
    ["Feraligatr"] = 18000,
    ["Flareon"] = 50000,
    ["Flygon"] = 58000,
    ["Forretress"] = 10000,
    ["Froslass"] = 60000,
    ["Furret"] = 3000,
    ["Gallade"] = 800000,
    ["Gardevoir"] = 85000,
    ["Gastly"] = 3000,
    ["Gengar"] = 18000,
    ["Geodude"] = 300,
    ["Girafarig"] = 120000,
    ["Glalie"] = 13500,
    ["Gligar"] = 8000,
    ["Gliscor"] = 18000,
    ["Gloom"] = 2250,
    ["Golbat"] = 3000,
    ["Goldeen"] = 200,
    ["Golduck"] = 11500,
    ["Golem"] = 15000,
    ["Granbull"] = 12500,
    ["Graveler"] = 5000,
    ["Grimer"] = 300,
    ["Grovyle"] = 8000,
    ["Growlithe"] = 3500,
    ["Grumpig"] = 13500,
    ["Gyarados"] = 55000,
    ["Hariyama"] = 90000,
    ["Haunter"] = 8000,
    ["Heracross"] = 120000,
    ["Hitmonchan"] = 65500,
    ["Hitmonlee"] = 65500,
    ["Hitmontop"] = 65500,
    ["Honchkrow"] = 800000,
    ["Hoothoot"] = 1500,
    ["Hoppip"] = 80,
    ["Horsea"] = 200,
    ["Houndoom"] = 13500,
    ["Houndour"] = 3500,
    ["Hypno"] = 6000,
    ["Igglybuff"] = 3000,
    ["Infernape"] = 800000,
    ["Ivysaur"] = 8000,
    ["Jigglypuff"] = 8000,
    ["Jolteon"] = 50000,
    ["Jumpluff"] = 12000,
    ["Jynx"] = 120000,
    ["Kabuto"] = 20000,
    ["Kabutops"] = 75000,
    ["Kadabra"] = 5800,
    ["Kakuna"] = 250,
    ["Kangaskhan"] = 120000,
    ["Kecleon"] = 80000,
    ["Kingdra"] = 60000,
    ["Kingler"] = 5200,
    ["Kirlia"] = 35000,
    ["Koffing"] = 300,
    ["Krabby"] = 200,
    ["Lairon"] = 20000,
    ["Lanturn"] = 11000,
    ["Lapras"] = 120000,
    ["Larvitar"] = 15000,
    ["Ledian"] = 3000,
    ["Ledyba"] = 250,
    ["Lickitung"] = 60000,
    ["Lombre"] = 8000,
    ["Lotad"] = 3000,
    ["Loudred"] = 8000,
    ["Lucario"] = 65000,
    ["Ludicolo"] = 18000,
    ["Luxray"] = 800000,
    ["Machamp"] = 17000,
    ["Machoke"] = 7000,
    ["Machop"] = 2000,
    ["Magby"] = 4500,
    ["Magcargo"] = 11000,
    ["Magikarp"] = 5,
    ["Magmar"] = 120000,
    ["Magmortar"] = 10000000,
    ["Magnemite"] = 400,
    ["Magneton"] = 10400,
    ["Magnezone"] = 120000,
    ["Makuhita"] = 80000,
    ["Manectric"] = 13000,
    ["Mankey"] = 300,
    ["Mantine"] = 120000,
    ["Mareep"] = 3000,
    ["Marill"] = 3000,
    ["Marowak"] = 11000,
    ["Marshtomp"] = 8000,
    ["Mawile"] = 80000,
    ["Medicham"] = 13000,
    ["Meditite"] = 3500,
    ["Meganium"] = 18000,
    ["Meowth"] = 300,
    ["Metagross"] = 10000000,
    ["Metang"] = 70000,
    ["Metapod"] = 250,
    ["Milotic"] = 10000000,
    ["Miltank"] = 120000,
    ["Minun"] = 4500,
    ["Misdreavus"] = 200000,
    ["Mr.Mime"] = 40000,
    ["Mudkip"] = 3000,
    ["Muk"] = 11000,
    ["Murkrow"] = 10000,
    ["Natu"] = 3000,
    ["Nidoking"] = 12250,
    ["Nidoqueen"] = 12250,
    ["Nidoranfe"] = 125,
    ["Nidoranma"] = 125,
    ["Nidorina"] = 2250,
    ["Nidorino"] = 2250,
    ["Nincada"] = 300,
    ["Ninetales"] = 11000,
    ["Ninjask"] = 100000,
    ["Noctowl"] = 11500,
    ["Numel"] = 3500,
    ["Nuzleaf"] = 8000,
    ["Octilllery"] = 10000,
    ["Oddish"] = 80,
    ["Omanyte"] = 20000,
    ["Omastar"] = 75000,
    ["Onix"] = 6000,
    ["Pachirisu"] = 15000,
    ["Paras"] = 60,
    ["Parasect"] = 5060,
    ["Persian"] = 3000,
    ["Phanpy"] = 3000,
    ["Pichu"] = 3000,
    ["Pidgeot"] = 11500,
    ["Pidgeotto"] = 1500,
    ["Pidgey"] = 60,
    ["Pikachu"] = 8000,
    ["Piloswine"] = 11000,
    ["Pineco"] = 300,
    ["Pinsir"] = 40000,
    ["Plusle"] = 4500,
    ["Politoed"] = 13000,
    ["Poliwag"] = 80,
    ["Poliwhirl"] = 3000,
    ["Poliwrath"] = 13000,
    ["Ponyta"] = 1500,
    ["Porygon"] = 60000,
    ["Porygon2"] = 120000,
    ["Primeape"] = 5300,
    ["Psyduck"] = 1500,
    ["Pupitar"] = 65000,
    ["Quagsire"] = 12000,
    ["Quilava"] = 8000,
    ["Qwilfish"] = 10000,
    ["Raichu"] = 18000,
    ["Ralts"] = 30000,
    ["Rapidash"] = 11500,
    ["Raticate"] = 2000,
    ["Rattata"] = 5,
    ["Remoraid"] = 200,
    ["Rhydon"] = 13000,
    ["Rhyhorn"] = 3000,
    ["Rhyperior"] = 10000000,
    ["Riolu"] = 15000,
    ["Rotom"] = 120000,
    ["Sableye"] = 22000,
    ["Salamence"] = 10000000,
    ["Sandshrew"] = 1000,
    ["Sandslash"] = 11000,
    ["Sceptile"] = 18000,
    ["Scizor"] = 220000,
    ["Scyther"] = 120000,
    ["Seadra"] = 5500,
    ["Seaking"] = 3000,
    ["Sealeo"] = 11000,
    ["Seedot"] = 3000,
    ["Seel"] = 2000,
    ["Sentret"] = 250,
    ["Seviper"] = 50000,
    ["Shedinja"] = 12000,
    ["Shelgon"] = 65000,
    ["Shellder"] = 200,
    ["Shieldon"] = 80000,
    ["Shiftry"] = 18000,
    ["Shuckle"] = 3500,
    ["Shuppet"] = 3500,
    ["Skarmory"] = 120000,
    ["Skiploom"] = 2250,
    ["Slaking"] = 10000000,
    ["Slakoth"] = 8000,
    ["Slowbro"] = 8000,
    ["Slowking"] = 110000,
    ["Slowpoke"] = 400,
    ["Slugma"] = 1000,

}


local boostMultiplier = 1000
local levelMultiplier = 10
local pendingSales = {} -- Armazena as vendas pendentes para confirmacao

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

function calculatePrice(basePrice, level, boost)
    local price = basePrice + (level * levelMultiplier) + (boost * boostMultiplier)
    return math.max(price, 500) -- Garantir que o preco minimo seja 500
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    msg = firstToUpper(msg)

    if msgcontains(msg, "bye") then
        selfSay("Ok entao.", cid)
        npcHandler:releaseFocus(cid)
    elseif msgcontains(msg, "name") or msgcontains(msg, "sell") or msgcontains(msg, "buy") then
        selfSay("So diga o nome do Pokemon que voce quer me vender.", cid)
    elseif pendingSales[cid] then
        -- Confirmacao da venda
        if msgcontains(msg, "yes") then
            local sale = pendingSales[cid]
            local ball = sale.ball
            local price = sale.price
            local name = sale.name

            if ball:remove() then
                selfSay("Aqui esta " .. price .. " por seu " .. name .. ". Obrigado!", cid)
                player:addMoney(price)
                player:refreshPokemonBar({}, {})
            else
                selfSay("Algo deu errado. Tente novamente.", cid)
            end
            pendingSales[cid] = nil -- Limpa a venda pendente
        elseif msgcontains(msg, "no") then
            selfSay("Tudo bem, nenhum Pokemon foi vendido.", cid)
            pendingSales[cid] = nil -- Cancela a venda pendente
        else
            selfSay("Por favor, confirme com 'yes' ou cancele com 'no'.", cid)
        end
    else
        -- Primeira etapa: nome do Pokemon
        local basePrice = priceTable[msg]
        if not basePrice then
            selfSay("O Pokemon " .. msg .. " nao tem preco. Por favor, entre em contato com um administrador.", cid)
            return true
        end

        local balls = player:getPokeballs()
        for i = 1, #balls do
            local ball = balls[i]
            local name = firstToUpper(ball:getSpecialAttribute("pokeName"))
            local isShiny = msgcontains(name, "Shiny")
            if name == msg or (isShiny and name == msg:gsub("Shiny ", "")) then
                if isShiny then
                    selfSay("Desculpe, nao compro Pokemons shiny.", cid)
                    return true
                end

                local isBallBeingUsed = ball:getSpecialAttribute("isBeingUsed")
                if isBallBeingUsed and isBallBeingUsed == 1 then
                    selfSay("Desculpe, nao e possivel enquanto o Pokemon estiver em uso.", cid)
                    return true
                end

                local boost = ball:getSpecialAttribute("pokeBoost") or 0
                local level = ball:getSpecialAttribute("pokeLevel") or 1
                local price = calculatePrice(basePrice, level, boost)

                -- Armazena a venda pendente
                pendingSales[cid] = { ball = ball, price = price, name = name }

                -- Solicita confirmacao
                selfSay("Voce realmente quer vender seu " .. name .. " por " .. price .. "? Por favor, confirme com {yes} ou cancele com {no}.", cid)
                return true
            end
        end
        selfSay("Voce nao possui esse Pokemon.", cid)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

