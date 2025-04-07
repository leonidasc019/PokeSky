local questItems = {
    {id = 2160, count = 5}, -- 5 Crystal Coins
}

local outfitIdMale = 2068 -- ID da outfit masculina (Coelho)
local outfitIdFemale = 2067 -- ID da outfit feminina (Coelha)

local npcHandler = NpcHandler:new(KeywordHandler:new())
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if not player then
        return false
    end

    if msgcontains(msg, "missao") or msgcontains(msg, "mission") then
        local outfitId = player:getSex() == 0 and outfitIdFemale or outfitIdMale

        if player:hasOutfit(outfitId) then
            player:sendCancelMessage("Voce ja completou esta missao e possui a outfit!")
            npcHandler:releaseFocus(cid)
            return true
        end

        selfSay("Ola! Se voce me trouxer 5 crystal coins, eu desbloquearei uma outfit especial para voce. Voce aceita a missao?", cid)
        npcHandler.topic[cid] = 1
    elseif npcHandler.topic[cid] == 1 and (msgcontains(msg, "sim") or msgcontains(msg, "yes")) then
        selfSay("Muito bem! Volte quando tiver os itens necessarios.", cid)
        npcHandler.topic[cid] = 0
    elseif msgcontains(msg, "completei") or msgcontains(msg, "complete") then
        local hasAllItems = true
        for _, item in ipairs(questItems) do
            local itemCount = player:getItemCount(item.id) or 0 -- Verifica se o valor é válido
            if itemCount < item.count then
                hasAllItems = false
                break
            end
        end

        if hasAllItems then
            for _, item in ipairs(questItems) do
                player:removeItem(item.id, item.count)
            end

            local outfitId = player:getSex() == 0 and outfitIdFemale or outfitIdMale
            player:addOutfit(outfitId)
            selfSay("Parabens! Voce desbloqueou a outfit especial!", cid)
        else
            selfSay("Voce ainda nao tem todos os itens necessarios.", cid)
        end
    elseif msgcontains(msg, "bye") then
        selfSay("Ate logo!", cid)
        npcHandler:releaseFocus(cid)
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
