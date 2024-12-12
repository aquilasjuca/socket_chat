require("./utils.config")

local serverModule = require("udp.server")
local clientModule = require("udp.client")

local function startServer()
  print("Iniciando o servidor...")
  serverModule.start()
end

local function startClient()
  io.write("Digite uma mensagem para o servidor: ")
  local input = io.read()

  if input and #input > 0 then
    clientModule.sendMessage(input)
  else
    print("Mensagem vazia não enviada.")
  end
end

local function showMenu()
  print("1. Iniciar servidor")
  print("2. Iniciar cliente")
  print("3. Sair")
  io.write("Escolha uma opção: ")
end

local function handleUserInput(option)
  if option == "1" then
    startServer()
  elseif option == "2" then
    startClient()
  elseif option == "3" then
    print("Saindo...")
    os.exit(0)
  else
    print("Opção inválida.")
  end
end

local function main()
  while true do
    showMenu()
    local option = io.read()
    handleUserInput(option)
  end
end

main()
