local SHOP_EXTENDED_OPCODE = 201
local SHOP_OFFERS = {}
local SHOP_CALLBACKS = {}
local SHOP_CATEGORIES = nil
local SHOP_BUY_URL = "http://otland.net"
local SHOP_AD = {
  image = "https://i.pinimg.com/originals/2b/1d/fe/2b1dfec19b945a19ac39641278a6a799.jpg",
  url = "http://otclient.ovh",
  text = "teste"
}
local MAX_PACKET_SIZE = 50000

function init()

  SHOP_CATEGORIES = {}

  local category1 = addCategory({
    type="item",
    item=ItemType(12568):getClientId(),
    count=100,
    name="Items"
  })
  local category2 = addCategory({
    type="outfit",
    name="Outfits",
    outfit={
        type=2210,
        rotating=false
    }
  })
  
  category1.addItem(1, 36513, 1, "Vip 30 Days")
  category1.addItem(1, 36512, 1, "Bless Plus")
  category1.addItem(1, 36514, 1, "City Teleport")
  category1.addItem(1, 36515, 1, "Change Sex")
  category1.addItem(1, 30196, 1, "Box...")
  category1.addItem(1, 29450, 1, "Box...")
  category1.addItem(1, 27484, 1, "Shiny Ditto")
  category1.addItem(1, 27248, 1, "Ditto")
  category1.addItem(1, 41664, 1, "Skates", "Com esse item voce ganhara uma outfit com effects")
  
-- Adicionando as outfits
category2.addOutfit(25, {
  type=2213,
  rotating=true,
  sex=1  -- Masculino
}, "Outfit Poliwag", "Male")

category2.addOutfit(25, {
  type=2214,
  rotating=true,
  sex=1  -- Masculino
}, "Outfit Zapdos", "Male")

category2.addOutfit(25, {
  type=2220,
  rotating=true,
  sex=0  -- Feminino
}, "Outfit Eevee", "Female")

category2.addOutfit(25, {
  type=2222,
  rotating=true,
  sex=1  -- Masculino
}, "Outfit Sonic", "Male")

category2.addOutfit(25, {
  type=2249,
  rotating=true,
  sex=1  -- Masculino
}, "Outfit Arcanjo", "Male")

category2.addOutfit(25, {
  type=2248,
  rotating=true,
  sex=0  -- Feminino
}, "Outfit Arcanja", "Female")

category2.addOutfit(25, {
  type=2241,
  rotating=true,
  sex=1  -- Masculino
}, "Outfit Blue Exorcist", "Male")

category2.addOutfit(25, {
  type=2211,
  rotating=true,
  sex=0  -- Feminino
}, "Outfit Venusaur", "Female")

category2.addOutfit(25, {
  type=2210,
  rotating=true,
  sex=1  -- Masculino
}, "Outfit Venusaur", "Male")
    
end

function addCategory(data)
  data['offers'] = {}
  table.insert(SHOP_CATEGORIES, data)
  table.insert(SHOP_CALLBACKS, {})
  local index = #SHOP_CATEGORIES
  return {
    addItem = function(cost, itemId, count, title, description, callback)      
      if not callback then
        callback = defaultItemBuyAction
      end
      table.insert(SHOP_CATEGORIES[index]['offers'], {
        cost=cost,
        type="item",
        item=ItemType(itemId):getClientId(),
        itemId=itemId,
        count=count,
        title=title,
        description=description
      })
      table.insert(SHOP_CALLBACKS[index], callback)
    end,
    addOutfit = function(cost, outfit, title, description, callback)
      if not callback then
        callback = defaultOutfitBuyAction
      end
      table.insert(SHOP_CATEGORIES[index]['offers'], {
        cost=cost,
        type="outfit",
        outfit=outfit,
        title=title,
        description=description
      })    
      table.insert(SHOP_CALLBACKS[index], callback)
    end,
    addImage = function(cost, image, title, description, callback)
      if not callback then
        callback = defaultImageBuyAction
      end
      table.insert(SHOP_CATEGORIES[index]['offers'], {
        cost=cost,
        type="image",
        image=image,
        title=title,
        description=description
      })
      table.insert(SHOP_CALLBACKS[index], callback)
    end
  }
end

function getPoints(player)
  local points = 0
  local resultId = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = " .. player:getAccountId())
  if resultId ~= false then
    points = result.getDataInt(resultId, "premium_points")
    result.free(resultId)
  end
  return points
end

function getStatus(player)
  local status = {
    ad = SHOP_AD,
    points = getPoints(player),
    buyUrl = SHOP_BUY_URL
  }
  return status
end

function sendJSON(player, action, data, forceStatus)
  local status = nil
  if not player:getStorageValue(1150001) or player:getStorageValue(1150001) + 10 < os.time() or forceStatus then
      status = getStatus(player)
  end
  player:setStorageValue(1150001, os.time())
  

  local buffer = json.encode({action = action, data = data, status = status})  
  local s = {}
  for i=1, #buffer, MAX_PACKET_SIZE do
     s[#s+1] = buffer:sub(i,i+MAX_PACKET_SIZE - 1)
  end
  local msg = NetworkMessage()
  if #s == 1 then
    msg:addByte(50)
    msg:addByte(SHOP_EXTENDED_OPCODE)
    msg:addString(s[1])
    msg:sendToPlayer(player)
    return  
  end

  msg:addByte(50)
  msg:addByte(SHOP_EXTENDED_OPCODE)
  msg:addString("S" .. s[1])
  msg:sendToPlayer(player)
  for i=2,#s - 1 do
    msg = NetworkMessage()
    msg:addByte(50)
    msg:addByte(SHOP_EXTENDED_OPCODE)
    msg:addString("P" .. s[i])
    msg:sendToPlayer(player)
  end
  msg = NetworkMessage()
  msg:addByte(50)
  msg:addByte(SHOP_EXTENDED_OPCODE)
  msg:addString("E" .. s[#s])
  msg:sendToPlayer(player)
end

function sendMessage(player, title, msg, forceStatus)
  sendJSON(player, "message", {title=title, msg=msg}, forceStatus)
end

function onExtendedOpcode(player, opcode, buffer)
  if opcode ~= SHOP_EXTENDED_OPCODE then
    return false
  end
  local status, json_data = pcall(function() return json.decode(buffer) end)
  if not status then
    return false
  end

  local action = json_data['action']
  local data = json_data['data']
  if not action or not data then
    return false
  end

  if SHOP_CATEGORIES == nil then
    init()    
  end

  if action == 'init' then
    sendJSON(player, "categories", SHOP_CATEGORIES)
  elseif action == 'buy' then
    processBuy(player, data)
  elseif action == "history" then
    sendHistory(player)
  end
  return true
end

function processBuy(player, data)
  local categoryId = tonumber(data["category"])
  local offerId = tonumber(data["offer"])
  local offer = SHOP_CATEGORIES[categoryId]['offers'][offerId]
  local callback = SHOP_CALLBACKS[categoryId][offerId]
  if not offer or not callback or data["title"] ~= offer["title"] or data["cost"] ~= offer["cost"] then
    sendJSON(player, "categories", SHOP_CATEGORIES)
    return sendMessage(player, "Error!", "Invalid offer")      
  end
  local points = getPoints(player)
  if not offer['cost'] or offer['cost'] > points or points < 1 then
    return sendMessage(player, "Error!", "You don't have enough points to buy " .. offer['title'] .."!", true)    
  end
  local status = callback(player, offer)
  if status == true then    
    db.query("UPDATE `accounts` set `premium_points` = `premium_points` - " .. offer['cost'] .. " WHERE `id` = " .. player:getAccountId())
    db.asyncQuery("INSERT INTO `shop_history` (`account`, `player`, `date`, `title`, `cost`, `details`) VALUES ('" .. player:getAccountId() .. "', '" .. player:getGuid() .. "', NOW(), " .. db.escapeString(offer['title']) .. ", " .. db.escapeString(offer['cost']) .. ", " .. db.escapeString(json.encode(offer)) .. ")")
    return sendMessage(player, "Success!", "You bought " .. offer['title'] .."!", true)
  end
  if status == nil or status == false then
    status = "Unknown error while buying " .. offer['title']
  end
  sendMessage(player, "Error!", status)
end

function sendHistory(player)
  if player:getStorageValue(1150002) and player:getStorageValue(1150002) + 10 > os.time() then
    return
  end
  player:setStorageValue(1150002, os.time())
  
  local history = {}
	local resultId = db.storeQuery("SELECT * FROM `shop_history` WHERE `account` = " .. player:getAccountId() .. " order by `id` DESC")

	if resultId ~= false then
    repeat
      local details = result.getDataString(resultId, "details")
      local status, json_data = pcall(function() return json.decode(details) end)
      if not status then    
        json_data = {
          type = "image",
          title = result.getDataString(resultId, "title"),
          cost = result.getDataInt(resultId, "cost")
        }
      end
      table.insert(history, json_data)
      history[#history]["description"] = "Bought on " .. result.getDataString(resultId, "date") .. " for " .. result.getDataInt(resultId, "cost") .. " points."
    until not result.next(resultId)
    result.free(resultId)
	end
  
  sendJSON(player, "history", history)
end

function defaultItemBuyAction(player, offer)
  if player:addItem(offer["itemId"], offer["count"], false) then
    return true
  end
  return "Can't add item! Do you have enough space?"
end

function defaultOutfitBuyAction(player, offer)
  local outfit = offer["outfit"]
  local outfitId = outfit.type
  local addons = outfit.addons or 0
  local outfitSex = outfit.sex

  local playerSex = player:getSex()

  if outfitSex ~= playerSex then
    return "You cannot purchase this outfit because your sex is different."
  end

  if player:hasOutfit(outfitId, addons) then
    return "You already unlocked this outfit! Check your outfit list to use it."
  end

  if player:addOutfit(outfitId, addons) then
    return true
  end

  return "Failed to unlock the outfit. Please try again later."
end

function defaultImageBuyAction(player, offer)
  return "default image buy action is not implemented"
end

function customImageBuyAction(player, offer)
  return "custom image buy action is not implemented. Offer: " .. offer['title']
end

function sendPokemonStatsToClient(player, pokemon)
    if not player or not pokemon then return end
    
    local ball = getPlayerSlotItem(player, CONST_SLOT_FEET) -- Pegamos a Pokébola equipada
    if not ball then return end

    local ivString = ball:getSpecialAttribute("pokeIV") or "1;1;1;1;1;1"
    local evString = ball:getSpecialAttribute("pokeEV") or "0;0;0;0;0;0"

    local ivs = string.explode(ivString, ";")
    local evs = string.explode(evString, ";")

    -- Enviar para o cliente via NetworkMessage
    local msg = NetworkMessage()
    msg:addByte(55) -- ID do protocolo (deve ser único)
    
    -- IVs
    msg:addU16(tonumber(ivs[1])) -- HP IV
    msg:addU16(tonumber(ivs[2])) -- Atk IV
    msg:addU16(tonumber(ivs[3])) -- Def IV
    msg:addU16(tonumber(ivs[4])) -- Speed IV
    msg:addU16(tonumber(ivs[5])) -- SpAtk IV
    msg:addU16(tonumber(ivs[6])) -- SpDef IV
    
    -- EVs
    msg:addU16(tonumber(evs[1])) -- HP EV
    msg:addU16(tonumber(evs[2])) -- Atk EV
    msg:addU16(tonumber(evs[3])) -- Def EV
    msg:addU16(tonumber(evs[4])) -- Speed EV
    msg:addU16(tonumber(evs[5])) -- SpAtk EV
    msg:addU16(tonumber(evs[6])) -- SpDef EV

    msg:sendToPlayer(player)
end