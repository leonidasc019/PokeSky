debug = true -- Debug mode for developers
reset = false -- Reset tasks by saying 'reset' to npc

task = {
    storage = {
        onTask         = 6522000,
        monstersLeft   = 6522001,
        completed      = 6522002,
        getFinished    = 6522003,
    },
    
    -- Tabela simplificada com dados da tarefa
    tasks = {
        [1] = {
            name = "A Lenda do Charmander",
            description = "Charmander o lendario Pokemon inicial de Kanto. Eles sao conhecidos por sua forca e coragem. Voce tem o que e preciso para captura-los e provar seu valor? Diga {Task} para saber mais",
            monsters = {"charmander"},
            toKill = 50,
            rewards = { 
                { name = "Fire Stone", itemid = 26728, count = 1 }
            }
        },
        [2] = {
            name = "A Lenda do Bulbasaur",
            description = "Bulbasaur o lendario Pokemon inicial de Kanto. Eles sao conhecidos por sua forca e coragem. Voce tem o que e preciso para captura-los e provar seu valor? Diga {Task} para saber mais",
            monsters = {"bulbasaur"},
            toKill = 50,
            rewards = { 
                { name = "Leaf Stone", itemid = 26731, count = 1 }
            }
        },
        [3] = {
            name = "A Lenda do Squirtle",
            description = "Squirtle o lendario Pokemon inicial de Kanto. Eles sao conhecidos por sua forca e coragem. Voce tem o que e preciso para captura-los e provar seu valor? Diga {Task} para saber mais",
            monsters = {"squirtle"},
            toKill = 50,
            rewards = { 
                { name = "Water Stone", itemid = 26736, count = 1 }
            }
        },
        [4] = {
            name = "Os Rattatas Invasores",
            description = "Rattatas selvagens tem atacado as plantacoes da cidade, roubando alimentos dos moradores Diga {Task} para saber mais.",
            monsters = { "rattata" }, 
            toKill = 30,
            rewards = { 
                { name = "Thousand Dollars", itemid = 2160, count = 1 }, 
                { name = "Poke Ball", itemid = 26662, count = 30 } 
            }
        },
        [5] = {
            name = "Os Pidgeys em Bando",
            description = "Pidgeys estao causando caos em um campo proximo. O chefe local quer que voce elimine esses passaros barulhentos Diga {Task} para saber mais.",
            monsters = { "pidgey", "pidgeotto" },
            toKill = 200,
            rewards = { 
                { name = "Thousand Dollars", itemid = 2160, count = 1 }, 
                { name = "Great Ball", itemid = 26660, count = 30 } 
            }
        },
        [6] = {
            name = "O Exercito de Zubats",
            description = "Zubats se instalaram em uma caverna proxima e estao atacando quem se aproxima. O lider da cidade precisa que voce acabe com essa ameaca Diga {Task} para saber mais.",
            monsters = { "zubat", "golbat" },
            toKill = 200,
            rewards = { 
                { name = "Thousand Dollars", itemid = 2160, count = 1 }, 
                { name = "Super Ball", itemid = 26659, count = 30 } 
            }
        },
        [7] = {
            name = "Os Insetos Gigantes",
            description = "Lagartas gigantes estao consumindo as plantas ao redor da cidade. O chefe local quer que voce derrote essas criaturas rastejantes antes que destruam tudo Diga {Task} para saber mais.",
            monsters = { "caterpie", "metapod" },
            toKill = 200,
            rewards = { 
                { name = "Thousand Dollars", itemid = 2160, count = 1 }, 
                { name = "Ultra Ball", itemid = 26688, count = 30 } 
            }
        },
        [8] = {
            name = "A Fuga dos Magikarp",
            description = "Varios Magikarp escaparam de um criadouro e estao pulando pela cidade. O chefe local precisa que voce os recupere Diga {Task} para saber mais.",
            monsters = { "magikarp" },
            toKill = 200,
            rewards = { 
                { name = "Box 1", itemid = 41616, count = 1 }, 
                { name = "Medicine", itemid = 27644, count = 100 } 
            }
        },
        [9] = {
            name = "O Exercicito de Ekans",
            description = "Ekans se espalharam pela cidade e estao causando panico. O lider da cidade precisa que voce elimine essa ameaca antes que mais pessoas sejam feridas Diga {Task} para saber mais.",
            monsters = { "ekans", "arbok" },
            toKill = 200,
            rewards = { 
                { name = "Box 2", itemid = 41614, count = 6 }, 
                { name = "Revive", itemid = 27645, count = 100 } 
            }
        },
        [10] = {
            name = "A Maldicao do Gastly",
            description = "Um Gastly apareceu em uma antiga mansao na cidade, assustando os moradores. O lider local pede que voce o expulse de la Diga {Task} para saber mais.",
            monsters = { "gastly", "haunter" },
            toKill = 200,
            rewards = { 
                { name = "Box 3", itemid = 41617, count = 1 }, 
                { name = "Small Potion", itemid = 27642, count = 50 } 
            }
        }
    }
}



task.__index = task

-- Inicia a tarefa
function task:new(player, npcHandler)
    if task:getCompleted(player) > 0 then
        task:reward(player, npcHandler)
        task:set(player, 0)
        return false
    end

    local currentTask, taskName = task:onTask(player)  -- Pega a tarefa ativa e o nome dela
    if currentTask > 0 then
        local monstersLeft = task:getMonstersLeft(player)
        npcHandler:say("Voce ja esta em uma tarefa: " .. taskName .. ". Faltam " .. monstersLeft .. " pokemons para matar.", player:getId())  -- Fala sobre a tarefa ativa e quantidade restante
        return false
    end

    local lastFinished = task:getFinished(player)
    if lastFinished == #task.tasks then
        npcHandler:say("Voce completou todas as tarefas!", player:getId())
        return false
    end

    local newTask = lastFinished + 1
    task:set(player, newTask)
    npcHandler:say(task.tasks[newTask].description, player:getId())
    return true
end

-- Define a tarefa para o jogador
function task:set(player, t)
    if player:setStorageValue(task.storage.onTask, t) then       
        if t == 0 then
            return false
        end
       
        if player:setStorageValue(task.storage.monstersLeft, task.tasks[t].toKill) then
            return true
        end
    end   
    return false
end

-- Verifica se o jogador completou a tarefa
function task:setCompleted(player, t)
    if player:setStorageValue(task.storage.completed, t) then
        return true
    end
    return false
end

function task:getCompleted(player)
    return player:getStorageValue(task.storage.completed)
end

-- Retorna a quantidade de monstros restantes
function task:getMonstersLeft(player)
    return player:getStorageValue(task.storage.monstersLeft)
end

-- Verifica se o jogador esta fazendo alguma tarefa
function task:onTask(player)
    for i = 1, #task.tasks do
        if player:getStorageValue(task.storage.onTask) == i then
            return i, task.tasks[i].name  -- Retorna o índice e o nome da tarefa
        end
    end
    return 0, nil  -- Retorna 0 e nil se não estiver em nenhuma tarefa
end

-- Marca a tarefa como terminada
function task:setFinished(player, t)
    if player:setStorageValue(task.storage.getFinished, t) then
        return true
    end
    return false
end

-- Verifica se o jogador completou uma tarefa
function task:getFinished(player)
    for i = 1, #task.tasks do
        if player:getStorageValue(task.storage.getFinished) == i then
            return i
        end
    end
    return 0
end

-- Quando o jogador mata um monstro
function task:onKill(player, target)
    local currentTask = task:onTask(player)
    for i = 1, #task.tasks[currentTask].monsters do
        if string.lower(target:getName()) == string.lower(task.tasks[currentTask].monsters[i]) then
            if task:getMonstersLeft(player) < 1 then
                return false
            end
            player:setStorageValue(task.storage.monstersLeft, task:getMonstersLeft(player) - 1)
            if task:getMonstersLeft(player) == 0 then
                if task:setCompleted(player, currentTask) then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Voce completou sua tarefa.")
                    return true
                end
            end
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Voce matou um " .. string.lower(target:getName()) .. ". Faltam " .. task:getMonstersLeft(player) .. " para matar!")
            return true
        end
    end
    return false
end

-- Recompensa ao completar a tarefa
function task:reward(player, npcHandler)
    local t = task:onTask(player)
    for i = 1, #task.tasks[t].rewards do
        player:addItem(task.tasks[t].rewards[i].itemid, task.tasks[t].rewards[i].count)
        player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("Voce recebeu %dx %s(s).", task.tasks[t].rewards[i].count, task.tasks[t].rewards[i].name))
    end

    npcHandler:say("Aqui esta!", player:getId())

    task:set(player, 0)
    task:setCompleted(player, 0)
    task:setFinished(player, t)
    return true
end

-- Reseta as tarefas para o jogador
function task:reset(player, npcHandler)
    if reset then
        player:setStorageValue(task.storage.onTask, 0)
        player:setStorageValue(task.storage.monstersLeft, 0)
        player:setStorageValue(task.storage.completed, 0)
        player:setStorageValue(task.storage.getFinished, 0)
        npcHandler:say("Voce resetou todas as tarefas.", player:getId())
    end
end