require("./utils.config")

local networkConfig = require("utils.networkConfig")
local utf8 = require 'lua-utf8'
local socket = require("socket")

local function start()
  local server, err = socket.bind(networkConfig.host, networkConfig.port)
  if not server then
    print("Erro ao iniciar o servidor: " .. err .. ".")
    return
  end

  print("Servidor TCP iniciado. Aguardando conexões na porta 8080..." .. "\n")

  while true do
    local client, err = server:accept()
    if client then
      print("Cliente conectado.")
      local message, err = client:receive()

      if message then
        print("Mensagem recebida do cliente: " .. message .. ".")
        
        local upperMessage = utf8.upper(message)
        print("Mensagem transformada para maiúsculas: " .. upperMessage .. "." .. "\n")
        
        client:send(utf8.upper(message) .. "\n")
      else
        print("Erro ao receber mensagem: " .. err .. ".")
      end

      client:close()
    else
      print("Erro ao aceitar conexão: " .. err .. ".")
    end
  end
end

return {
  start = start
}
