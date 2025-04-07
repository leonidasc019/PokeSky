local animationInterval = 300  -- Intervalo de troca de lookType (em milissegundos)
local animationFrames = {3384, 3385, 3386, 3387, 3388, 3389, 3390, 3391, 3392, 3393}  -- IDs dos lookTypes (as roupas/visuais) para a animação
local activeAnimations = {}  -- Tabela para rastrear animações ativas

-- Função para verificar se o jogador está pescando
local function isFishing(player)
    return player:getCondition(CONDITION_OUTFIT) ~= nil
end

-- Função para iniciar a animação
function startAnimation(player, item)
    -- Verifica se o jogador está em cima de uma montaria, surf, voando ou pescando
    if player:isOnSurf() or player:isOnRide() or player:isOnFly() or isFishing(player) then
        return false
    end

    -- Verifica se já existe uma animação ativa para esse jogador
    if activeAnimations[player] then
        return false
    end

    -- Verifica se o item foi usado recentemente (cooldown de 10 segundos)
    local lastUsedTime = player:getStorageValue(15001)
    local currentTime = os.time()

    if lastUsedTime ~= -1 and currentTime - lastUsedTime < 10 then
        local remainingCooldown = 10 - (currentTime - lastUsedTime)
        player:sendCancelMessage("Você deve esperar " .. remainingCooldown .. " segundos para usar o item novamente.")
        return false
    end

    -- Marca que a animação foi iniciada
    activeAnimations[player] = true
    local frameIndex = 1  -- Começa na primeira imagem (lookType)

    -- Armazena a outfit original do jogador para restaurar depois
    local originalOutfit = player:getOutfit()

    -- Pega as cores do outfit original do jogador
    local originalColors = {
        head = originalOutfit.lookHead,
        body = originalOutfit.lookBody,
        legs = originalOutfit.lookLegs,
        feet = originalOutfit.lookFeet
    }

    -- -- Impede o jogador de se mover durante a animação
    -- local condition = Condition(CONDITION_PARALYZE)
    -- condition:setParameter(CONDITION_PARAM_TICKS, 3000)  -- Duração de 3 segundos
    -- condition:setParameter(CONDITION_PARAM_EFFECT, CONST_ME_NONE)  -- Sem efeito visual
    -- condition:setParameter(CONDITION_PARAM_SPEED, -player:getSpeed())  -- Reduz a velocidade a 0
    -- player:addCondition(condition)

    -- Função para animar
    local function animate()
        if not activeAnimations[player] then
            return  -- Interrompe a animação se for cancelada
        end

        -- Aplica o lookType atual da animação e mantém as cores do jogador
        local outfit = {
            lookType = animationFrames[frameIndex],  -- LookType atual na animação
            lookHead = originalColors.head,   -- Cabeça com a cor original
            lookBody = originalColors.body,   -- Corpo com a cor original
            lookLegs = originalColors.legs,   -- Pernas com a cor original
            lookFeet = originalColors.feet,   -- Pés com a cor original
            lookAddons = 0,  -- Adicionais (pode ser 0, 1 ou 2 para diferentes acessórios)
            lookMount = 0    -- Montaria (pode ser 0 para nenhuma montaria)
        }

        -- Aplica a nova roupa ao jogador
        player:setOutfit(outfit)

        -- Avança para o próximo frame ou reinicia
        frameIndex = frameIndex + 1
        if frameIndex > #animationFrames then
            frameIndex = 1  -- Reinicia a animação
            -- Ao final da animação, restaura a roupa original
            player:setOutfit(originalOutfit)
            activeAnimations[player] = nil  -- Finaliza a animação
            -- Restaura a velocidade
            player:removeCondition(CONDITION_PARALYZE)  -- Remove a condição de paralisia
            return
        end

        -- Reagenda a próxima troca de lookType
        addEvent(animate, animationInterval)
    end

    animate()  -- Inicia a animação

    -- Envia a mensagem animada "Chama no dale!" por 5 segundos
    Game.sendAnimatedText(player:getPosition(), "Chama no dale!", TEXTCOLOR_RED)
    addEvent(function() player:sendCancelMessage("") end, 5000)  -- Remove a mensagem após 5 segundos

    -- Registra o tempo da última utilização do item
    player:setStorageValue(15002, currentTime)

    return true
end

-- Função principal ao usar o item
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Inicia a animação apenas se não houver animação ativa
    if not activeAnimations[player] then
        startAnimation(player, item)
    else
        -- player:sendCancelMessage("Você deve esperar a animação atual terminar antes de iniciar uma nova.")
    end

    return true
end
