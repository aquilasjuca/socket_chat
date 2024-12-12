require("./utils.config")

local networkConfig = require("utils.networkConfig")
local utf8 = require 'lua-utf8'
local socket = require("socket")

local function start()
  local udp = socket.udp()
  udp:setsockname(networkConfig.host, networkConfig.port)
  print("Servidor UDP iniciado. Aguardando mensagens na porta 8080...\n")

  while true do
    local message, ip, port = udp:receivefrom()
    if message then
      print("Mensagem recebida: " .. message .. "." )
      local upperMessage = utf8.upper(message)
      print("Mensagem transformada para maiúsculas: " .. upperMessage .. ".")

      udp:sendto(upperMessage, ip, port)
    else
      print("Erro ao receber mensagem.")
    end
  end
end

return {
  start = start
}
