dofile('data/npc/lib/npcsystem/npcsystem.lua') -- ⚠️ Isso é essencial!

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    local player = Player(cid)
    if not npcHandler:isFocused(cid) then return false end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local msg_l = msg:lower()

    if msg_l == "nickname" or msg_l == "nome" then
        npcHandler:say("Você deseja {colocar}, {trocar} ou {remover} o nickname do seu Pokémon?", cid)
        talkState[talkUser] = 1

    elseif msg_l == "colocar" and talkState[talkUser] == 1 then
        npcHandler:say("Digite o nickname que deseja colocar:", cid)
        talkState[talkUser] = 2

    elseif talkState[talkUser] == 2 then
        local ball = player:getUsingBall()
        if not ball then
            npcHandler:say("Você precisa estar com a Pokébola equipada.", cid)
            return true
        end

        -- if not player:removeItem(ITEM_ID, 1) then
        --     npcHandler:say("Você não tem o item necessário para isso!", cid)
        --     return true
        -- end

        ball:setSpecialAttribute("nick", msg)
        npcHandler:say("Nickname definido com sucesso para: " .. msg, cid)
        talkState[talkUser] = 0

    elseif msg_l == "trocar" and talkState[talkUser] == 1 then
        local ball = player:getUsingBall()
        if not ball or not ball:getSpecialAttribute("nick") then
            npcHandler:say("Seu Pokémon não possui um nickname para ser trocado.", cid)
            return true
        end
        npcHandler:say("Digite o novo nickname:", cid)
        talkState[talkUser] = 3

    elseif talkState[talkUser] == 3 then
        local ball = player:getUsingBall()
        if not ball then
            npcHandler:say("Você precisa estar com a Pokébola equipada.", cid)
            return true
        end

        -- if not player:removeItem(ITEM_ID, 1) then
        --     npcHandler:say("Você não tem o item necessário para isso!", cid)
        --     return true
        -- end

        ball:setSpecialAttribute("nick", msg)
        npcHandler:say("Nickname alterado para: " .. msg, cid)
        talkState[talkUser] = 0

    elseif msg_l == "remover" and talkState[talkUser] == 1 then
        local ball = player:getUsingBall()
        if not ball or not ball:getSpecialAttribute("nick") then
            npcHandler:say("Seu Pokémon não possui um nickname definido.", cid)
            return true
        end

        -- if not player:removeItem(ITEM_ID, 1) then
        --     npcHandler:say("Você não tem o item necessário para isso!", cid)
        --     return true
        -- end

        ball:removeSpecialAttribute("nick")
        npcHandler:say("Nickname removido com sucesso!", cid)
        talkState[talkUser] = 0

    else
        npcHandler:say("Desculpe, não entendi. Deseja {colocar}, {trocar} ou {remover} o nickname?", cid)
        talkState[talkUser] = 1
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
