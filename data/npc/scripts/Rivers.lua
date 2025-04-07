local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local destinations = {
        ["trade center"] = {x = 17174, y = 16067, z = 8},
        ["treining center"] = {x = 17182, y = 16009, z = 8},
    }

    local playerMessage = msg:lower()

    -- Verifica se a mensagem é um destino válido
    if destinations[playerMessage] then
        -- Requisitos
        if getPlayerMoney(cid) < 0 then
            selfSay("Você não tem dinheiro suficiente para essa viagem!", cid)
            return true
        elseif getPlayerLevel(cid) < 30 then
            selfSay("Você precisa ser nível 30 ou superior para essa viagem!", cid)
            return true
        end

        -- Teleportar jogador e remover dinheiro
        doTeleportThing(cid, destinations[playerMessage])
        doPlayerRemoveMoney(cid, 0) -- Valor a ser descontado pode ser ajustado aqui
        selfSay("Boa viagem para o " .. playerMessage .. "!", cid)
        return true
    end

    return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
