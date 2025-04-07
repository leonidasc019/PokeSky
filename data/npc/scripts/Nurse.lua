local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local function creatureGreetCallback(cid, message)
    if message == nil then
        return true
    end

    local player = Player(cid)

    -- Verifica se o jogador tem um Pokémon invocado
    if hasSummons(player) then
        selfSay("Por favor, primeiro devolva seu Pokémon à Pokébola.", cid)
        return false
    end

    -- Cura o jogador
    local playerHealth = player:getHealth()
    local playerMaxHealth = player:getMaxHealth()

    if playerHealth < playerMaxHealth then
        player:addHealth(playerMaxHealth - playerHealth)
    end

    -- Cura os Pokémons nas Pokébolas
    local pokeballs = player:getPokeballs()
    for i = 1, #pokeballs do
        local ball = pokeballs[i]
        local ballId = ball:getId()
        local ballKey = getBallKey(ballId)
        ball:setSpecialAttribute("pokeHealth", 100000)
        local isBallBeingUsed = ball:getSpecialAttribute("isBeingUsed")
        if ballId == balls[ballKey].usedOff and isBallBeingUsed ~= 1 then
            ball:transform(balls[ballKey].usedOn)
        end
    end

    selfSay("Todos os seus Pokémon foram curados. boa sorte!", cid)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    return false
end

npcHandler:setCallback(CALLBACK_GREET, creatureGreetCallback)
npcHandler:addModule(FocusModule:new())
