local OUTFIT_PERMISSION_STORAGE = 15620  -- storage que libera o esqui
local npc_talk_storage = 15621  -- storage para controlar o progresso da quest
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
      {id = 29269 , qt = 1}, --ski blades
      {id = 29268 , qt = 1}, --ski boards
      {id = 29267 , qt = 1}, --ski goggles
   }
   local rewards = {
      {id = 2160, qt = 10}, -- dinheiro
   }
   ---------

   if msgcontains(msg, 'yes') or msgcontains(msg, 'help') then
      -- Verifica se ja conversou (usando a storage do TFS 1.2)
      if getPlayerStorageValue(cid, npc_talk_storage) == 1 then
         selfSay("Voce ja pegou sua roupa de esqui", cid)
         talkState[talkUser] = 0
         return true
      end
      selfSay("Para eu liberar a esqui para voce, preciso que me traga os seguintes itens: {ski blades}{ski boards}{ski goggles}. Volte quando tiver e fale {deliver}", cid)
      talkState[talkUser] = 1
      return true
   elseif (msgcontains(msg, 'deliver') or msgcontains(msg, 'entregar')) and talkState[talkUser] == 1 then
      if getPlayerItemCount(cid, need[1].id) < need[1].qt then
         selfSay("Voce nao trouxe todos os itens que eu pedi...", cid)
         selfSay("Lembre-se, voce precisa trazer {ski blades}{ski boards}{ski goggles}.", cid)
         talkState[talkUser] = 0
         return true
      end
      for i = 1, #need do
         doPlayerRemoveItem(cid, need[i].id, need[i].qt)
      end
      for i = 1, #rewards do
         doPlayerAddItem(cid, rewards[i].id, rewards[i].qt)
      end

      -- Libera o skate para o jogador
      setPlayerStorageValue(cid, OUTFIT_PERMISSION_STORAGE, 1)

      selfSay("Parabens! Agora voce pode usar a roupa de esqui no gelo. Aproveite!!", cid)
      setPlayerStorageValue(cid, npc_talk_storage, 1)  -- Marca que o jogador ja conversou
      talkState[talkUser] = 0
      return true
   end
   return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
