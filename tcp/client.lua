require("./utils.config")

local networkConfig = require("utils.networkConfig")
local socket = require("socket")

local function connectToServer()
  local client, err = socket.connect(networkConfig.host, networkConfig.port)
  if not client then
    print("Erro ao conectar ao servidor: " .. err .. ".")
    return nil
  end

  print("\n" .. "Conectado ao servidor.")
  return client
end

local function sendMessage(message)
  local client = connectToServer()
  if not client then return end

  client:send(message .. "\n")
  
  local response, err = client:receive()
  if response then
    print("Resposta do servidor: " .. response .. "." .. "\n")
  else
    print("Erro ao receber resposta: " .. err .. "\n")
  end

  client:close()
end

return {
  sendMessage = sendMessage
}
