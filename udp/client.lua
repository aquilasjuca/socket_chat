require("./utils.config")

local networkConfig = require("utils.networkConfig")
local socket = require("socket")

local function sendMessage(message)
  local udp = socket.udp()
  udp:settimeout(2)
  udp:setpeername(networkConfig.host, networkConfig.port)

  print("\nEnviando mensagem para o servidor...")
  udp:send(message)

  local response, err = udp:receive()
  if response then
    print("Resposta do servidor: " .. response .. "\n")
  else
    print("Erro ao receber resposta: " .. (err or "Desconhecido") .. "\n")
  end
end

return {
  sendMessage = sendMessage
}
