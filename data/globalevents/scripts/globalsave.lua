local cleanMapAtServerSave = true -- Define se o mapa será limpo durante o server save

local function serverSave()
    if cleanMapAtServerSave then
        cleanMap() -- Limpa o mapa se a variável estiver ativada
        broadcastMessage("Clean World.", MESSAGE_STATUS_WARNING)
    end
    saveServer() -- Realiza o save do servidor
    broadcastMessage("Clean Save finished.", MESSAGE_STATUS_WARNING)
end

function onThink(interval)
    broadcastMessage("Server Save .", MESSAGE_STATUS_WARNING)
    addEvent(serverSave, 600000) -- Adiciona o evento para salvar o servidor e limpar o mapa após 60 segundos
    return true
end