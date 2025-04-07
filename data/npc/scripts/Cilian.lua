local npcHandler = NpcHandler:new(KeywordHandler:new())
NpcSystem.parseParameters(npcHandler)

local outfits = {
    {name = "Adventurer ", outfitIdMale = 2200, outfitIdFemale = 2201, price = 200},
    {name = "Athletic ", outfitIdMale = 2042, outfitIdFemale = 2043, price = 200},
    {name = "Hiker ", outfitIdMale = 2046, outfitIdFemale = 2039, price = 200},
    {name = "Jamaican ", outfitIdMale = 2051, outfitIdFemale = 2052, price = 200},
    {name = "Mercenary ", outfitIdMale = 2204, outfitIdFemale = 2205, price = 200},
    {name = "Nerd ", outfitIdMale = 2206, outfitIdFemale = 2207, price = 150},
    {name = "Oriental ", outfitIdMale = 2049, outfitIdFemale = 2050, price = 200},
    {name = "Punk ", outfitIdMale = 2044, outfitIdFemale = 2045, price = 200},
    {name = "Rapper ", outfitIdMale = 2048, outfitIdFemale = 2047, price = 200},
    {name = "Social ", outfitIdMale = 2041, outfitIdFemale = 2040, price = 300}
}

local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if not player then
        return false
    end

    -- Dialogo inicial
    if msgcontains(msg, "hi") then
        selfSay("Bem-vindo(a) a Star Clothes, nos temos as melhores roupas de Kanto. Aqui voce pode se sentir como uma estrela.", cid)
        return true
    end

    -- Verifica se o jogador esta pedindo informacoes sobre ofertas
    if msgcontains(msg, "offer") then
        selfSay("Nos temos as seguintes roupas: {Rapper Outfit}, {Jamaican Outfit}, {Athletic Outfit}, {Oriental Outfit}, {Hiker Outfit}, {Punk Outfit}, {Adventurer Outfit}, {Mercenary Outfit}, {Nerd Outfit} e {Social Outfit}. Escolha a sua!", cid)
        return true
    end

    -- Logica para comprar as roupas
    for _, outfit in ipairs(outfits) do
        if msgcontains(msg, outfit.name) then
            local outfitId = player:getSex() == 0 and outfit.outfitIdFemale or outfit.outfitIdMale
            local price = outfit.price

            -- Verifica se o jogador ja tem a roupa
            if player:hasOutfit(outfitId) then
                selfSay("Voce ja comprou esta roupa anteriormente.", cid)
                return true
            end

            -- Verifica se o jogador tem dinheiro suficiente (usando o ID do dinheiro 2160)
            local playerMoney = player:getItemCount(2160)
            if playerMoney >= price then
                -- Retira o dinheiro e da a roupa ao jogador
                player:removeItem(2160, price)
                player:addOutfit(outfitId)
                selfSay("Aqui esta sua " .. outfit.name .. "!", cid)
            else
                selfSay("Voce nao tem dinheiro suficiente para comprar esta roupa.", cid)
            end
            return true
        end
    end

    -- Resposta para outros tipos de mensagem
    if msgcontains(msg, "bye") then
        selfSay("Ate logo!", cid)
        npcHandler:releaseFocus(cid)
        return true
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
