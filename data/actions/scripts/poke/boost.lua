local buttonMachineId_on = 26694
local buttonMachineId_off = 26693
local ballMachineId_on = 26695
local ballMachineId_off = 26696
local stoneMachineId_on = 26697
local stoneMachineId_off = 26698

function necessaryStones(boostLevel)
    local stonesTable = {
        [1] = 1, [2] = 2, [3] = 4, [4] = 6, [5] = 9, 
        [6] = 12, [7] = 16, [8] = 20, [9] = 25, [10] = 30,
        [11] = 36, [12] = 42, [13] = 49, [14] = 56, [15] = 64,
        [16] = 72, [17] = 81, [18] = 90, [19] = 100, [20] = 110,
        [21] = 121, [22] = 132, [23] = 144, [24] = 156, [25] = 169,
        [26] = 182, [27] = 196, [28] = 210, [29] = 225, [30] = 240,
        [31] = 256, [32] = 272, [33] = 289, [34] = 306, [35] = 324,
        [36] = 342, [37] = 361, [38] = 380, [39] = 400, [40] = 420,
        [41] = 441, [42] = 462, [43] = 484, [44] = 506, [45] = 529,
        [46] = 552, [47] = 576, [48] = 600, [49] = 625, [50] = 650
    }
    return stonesTable[boostLevel] or 0
end

function countAndRemoveStones(stoneMachine, neededStones, stoneName)
    local totalStones = 0
    local stoneSlots = {}

    -- Conta todas as pedras nos slots da máquina
    for i = 0, 9 do
        local item = stoneMachine:getItem(i)
        if item and item:getName() == stoneName then
            local itemCount = item:getCount()
            totalStones = totalStones + itemCount
            table.insert(stoneSlots, {slot = i, item = item, count = itemCount})
            if totalStones >= neededStones then
                break
            end
        end
    end

    -- Verifica se há pedras suficientes
    if totalStones < neededStones then
        return false -- Não há pedras suficientes
    end

    -- Remove as pedras necessárias dos slots
    local stonesToRemove = neededStones
    for _, slotInfo in ipairs(stoneSlots) do
        local item = slotInfo.item
        if item then
            if stonesToRemove >= slotInfo.count then
                -- Remove todas as pedras deste slot
                item:remove(slotInfo.count)
                stonesToRemove = stonesToRemove - slotInfo.count
            else
                -- Remove apenas o necessário deste slot
                item:remove(stonesToRemove)
                stonesToRemove = 0
            end

            -- Se todas as pedras foram removidas, podemos parar
            if stonesToRemove <= 0 then
                break
            end
        end
    end

    return true -- Pedras removidas com sucesso
end

function doChangeBackBoostMachine(buttonMachinePos, ballMachinePos, stoneMachinePos)
    local button = Tile(buttonMachinePos):getItemById(buttonMachineId_on)
    local ball = Tile(ballMachinePos):getItemById(ballMachineId_on)
    local stone = Tile(stoneMachinePos):getItemById(stoneMachineId_on)
    doTransformItem(button.uid, buttonMachineId_off)
    doTransformItem(ball.uid, ballMachineId_off)
    doTransformItem(stone.uid, stoneMachineId_off)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local buttonMachinePos = Position(fromPosition.x, fromPosition.y, fromPosition.z)
    local ballMachinePos = Position(fromPosition.x+1, fromPosition.y, fromPosition.z)
    local stoneMachinePos = Position(fromPosition.x-1, fromPosition.y, fromPosition.z)

    local buttonMachine = Tile(buttonMachinePos):getItemById(buttonMachineId_off)
    local ballMachine = Tile(ballMachinePos):getItemById(ballMachineId_off)
    local stoneMachine = Tile(stoneMachinePos):getItemById(stoneMachineId_off)

    if buttonMachine and ballMachine and stoneMachine then
        local ball = ballMachine:getItem(0)
        if ball and ball:isPokeball() then
            local pokeName = ball:getSpecialAttribute("pokeName")
            local race = MonsterType(pokeName):getRaceName()

            -- Ajuste do race para pedras
            if race == "psychic" then race = "enigma" end
            if race == "grass" then race = "leaf" end
            if race == "normal" then race = "heart" end
            if race == "electric" then race = "thunder" end
            if race == "poison" then race = "venom" end
            if race == "flying" then race = "feather" end
            if race == "ground" then race = "earth" end
            if race == "bug" then race = "cocoon" end
            if race == "dark" then race = "darkness" end
            if race == "ghost" then race = "darkness" end
            if race == "steel" then race = "metal" end
            if race == "fairy" then race = "heart" end
            if race == "fighting" then race = "punch" end
            if race == "dragon" then race = "crystal" end
            
            local stoneName = race .. " stone"
            if stoneName == "metal stone" then stoneName = "metal coat" end
            
            local currentBoost = ball:getSpecialAttribute("pokeBoost") or 0
            local newBoost = currentBoost + 1

            if newBoost > 50 then
                player:sendCancelMessage("Sorry, not possible. Your pokemon is at the maximum boost.")
                return true
            end

            local neededStones = necessaryStones(newBoost)

            if countAndRemoveStones(stoneMachine, neededStones, stoneName) then
                buttonMachine:transform(buttonMachineId_on)
                ballMachine:transform(ballMachineId_on)
                stoneMachine:transform(stoneMachineId_on)
                ball:setSpecialAttribute("pokeBoost", newBoost)
                addEvent(doChangeBackBoostMachine, 3000, buttonMachinePos, ballMachinePos, stoneMachinePos)
            else
                player:sendCancelMessage("Sorry, not possible. You need " .. neededStones .. " stones to boost this pokemon.")
                return true
            end
        else
            player:sendCancelMessage("Sorry, not possible. Please use the correct items.")
            return true
        end
    else
        print("WARNING: Boost machine not working.")
        player:sendCancelMessage("Sorry, not possible. This problem was reported.")
        return true
    end
    return true
end
