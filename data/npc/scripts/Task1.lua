local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
   if (not npcHandler:isFocused(cid)) then
      return false
   end

   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   msg = string.lower(msg)
   ---------
   local need = {
      {id = 27658, qt = 30}, -- bag of pollen
   }
   local rewards = {
      {id = 2160, qt = 1}, -- dinheiro
      {id = 26731, qt = 1}, -- Leaf stone
   }
   local experienceReward = 15000 -- Quantidade de experiencia a ser dada
   ---------

   if msgcontains(msg, 'help') or msgcontains(msg, 'ajuda') then
      -- Verifica se já conversou (agora com a storage do TFS 1.2)
      if getPlayerStorageValue(cid, npc_talk_storage) == 1 then
         selfSay("Voce ja completou essa tarefa! Obrigado novamente!", cid)
         talkState[talkUser] = 0
         return true
      end
      selfSay("Ola meu amigo, voce pode trazer para mim: 30 Bag of Pollen? Eu vou te recompensar!", cid)
      talkState[talkUser] = 1
      return true
   elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 1 then
      if getPlayerItemCount(cid, need[1].id) < need[1].qt then
         selfSay("Voce nao trouxe todos os itens que eu pedi...", cid)
         selfSay("Lembre-se, voce precisa trazer 30 Bag of Pollen...", cid)
         talkState[talkUser] = 0
         return true
      end
      for i = 1, #need do
         doPlayerRemoveItem(cid, need[i].id, need[i].qt)
      end
      for i = 1, #rewards do
         doPlayerAddItem(cid, rewards[i].id, rewards[i].qt)
      end

      -- Adicionando experiencia ao jogador
      local player = Player(cid)
      if player then
         player:addExperience(experienceReward, true)  -- true para não perder experiência em PvP
      else
         selfSay("Erro ao adicionar experiência!", cid)
      end

      selfSay("Obrigado, ate logo! Voce recebeu sua recompensa!", cid)
      setPlayerStorageValue(cid, npc_talk_storage, 1)  -- Marca que o jogador já completou a missão
      talkState[talkUser] = 0
      return true
   end
   return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
