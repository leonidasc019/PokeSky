local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			
    npcHandler:onCreatureAppear(cid)			
end

function onCreatureDisappear(cid)		
    npcHandler:onCreatureDisappear(cid)			
end

function onCreatureSay(cid, type, msg)		
    npcHandler:onCreatureSay(cid, type, msg)		
end

function onThink()				
    npcHandler:onThink()					
end

-- Função para enviar o efeito visual
local function sendVisualEffectRepeatedly(position, effectId, times, interval, current)
    if current > times then
        return
    end
    doSendMagicEffect(position, effectId)
    addEvent(sendVisualEffectRepeatedly, interval, position, effectId, times, interval, current + 1)
end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    if not player then
        return false
    end

    -- Se o jogador responder com "sim" ou "yes"
    if msgcontains(msg, "sim") or msgcontains(msg, "yes") then
        if player:getStorageValue(58000) == 0 then
            npcHandler:say("Voce ja escolheu seu pokemon inicial!", cid)
        end
        -- Adiciona o efeito visual 2337 na posição x = 2277, y = 2694, z = 5
        -- sendVisualEffectRepeatedly(position, effectId, intervalMs, durationMs, times)
        sendVisualEffectRepeatedly(Position(16269, 16679, 5), 1574, 7, 815, 1)
        npcHandler:say("Agora voce pode escolher seu Pokemon inicial. Clique na maquina e escolha o seu!", cid)
        npcHandler:releaseFocus(cid)
        return true
    elseif msgcontains(msg, "bye") then
        npcHandler:say("Boa sorte em sua jornada, treinador!", cid)
        npcHandler:releaseFocus(cid)
        return true
    end

    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- Quando o jogador se aproxima, ele inicia a conversa
function onPlayerInteraction(cid)
    local player = Player(cid)
    if player then
        npcHandler:say("Bem-vindo, jovem treinador! Voce esta pronto para escolher seu Pokemon inicial?", cid)
        npcHandler.topic[cid] = 1
        npcHandler:focus(cid)
    end
end
