
# TCP and UDP Server-Client Project

Este projeto implementa uma comunicação simples entre um **servidor** e um **cliente** utilizando os protocolos **TCP** e **UDP** em Lua. O servidor transforma as mensagens recebidas para **maiúsculas** e envia de volta para o cliente.

## Estrutura do Projeto

```
.
├── tcp/                 # Implementação TCP
│   ├── server.lua       # Lógica do servidor TCP
│   ├── client.lua       # Lógica do cliente TCP
│   └── main.lua         # Arquivo principal para rodar o servidor ou cliente (TCP)
├── udp/                 # Implementação UDP
│   ├── server.lua       # Lógica do servidor UDP
│   ├── client.lua       # Lógica do cliente UDP
│   └── main.lua         # Arquivo principal para rodar o servidor ou cliente (UDP)
├── utils/               # Arquivos de configuração e utilitários
│   ├── config.lua       # Configuração geral do projeto
│   └── networkConfig.lua# Configuração de rede (host e porta)
├── lua_modules/         # Diretório contendo módulos externos (lua-utf8, luasocket)
└── README.md            # Este arquivo
```

## Pré-requisitos

- **Lua 5.4** ou superior
- **Luarocks** (gerenciador de pacotes para Lua)
- **lua-socket** e **lua-utf8** (instalados via Luarocks)

## Instalação

### 1. Instalar o Lua (se necessário)

Caso você ainda não tenha o Lua instalado, siga as instruções no [site oficial do Lua](https://www.lua.org/download.html) para a instalação.

### 2. Clonar Repositório

1. Clone este repositório para o seu ambiente local:

        git clone 


2. Navegue até o diretório do projeto:

        cd socket_chat

### 3. Instalar dependências

Certifique-se de ter o **Luarocks** instalado. Se não tiver, você pode instalar seguindo as instruções em [https://github.com/luarocks/luarocks/wiki/Download](https://github.com/luarocks/luarocks/wiki/Download).

Com o **Luarocks** instalado, execute o seguinte comando para instalar as dependências:

```bash
luarocks install luasocket --tree=lua_modules/
luarocks install lua-utf8 --tree=lua_modules/
```

Isso irá instalar as bibliotecas necessárias e colocá-las no diretório `lua_modules` do seu projeto.

### 4. Estrutura de Diretórios

A estrutura do diretório do projeto deve ser como mostrado abaixo, com a pasta `lua_modules` contendo as dependências do projeto:

```
.
├── lua_modules/
│   └── share/
│       └── lua/5.4/
│           ├── luasocket/
│           └── lua-utf8/
├── tcp/
│   ├── server.lua
│   ├── client.lua
│   └── main.lua
├── udp/
│   ├── server.lua
│   ├── client.lua
│   └── main.lua
├── utils/
│   ├── config.lua
│   └── networkConfig.lua
└── README.md
```

Certifique-se de que o **Luarocks** tenha colocado as dependências dentro da pasta `lua_modules/share/lua/5.4/`.

### 5. Configuração

Os arquivos de configuração estão localizados na pasta `utils`:

- **`config.lua`**: Arquivo de configuração geral do projeto, incluindo ajustes para os módulos.
- **`networkConfig.lua`**: Arquivo com as configurações de rede, onde você pode definir o **host** e a **porta** para o servidor e cliente.

O conteúdo padrão de `networkConfig.lua`:

```lua
local networkConfig = {
  host = "127.0.0.1", -- Endereço IP do servidor
  port = 8080         -- Porta utilizada pelo servidor
}

return networkConfig
```

---

## Como Usar

### TCP

#### 1. Iniciar o Servidor TCP

Execute o servidor TCP com o comando:

```bash
lua tcp/main.lua
```

Selecione a opção **1** para iniciar o servidor. O servidor ficará aguardando conexões na porta `8080`.

#### 2. Iniciar o Cliente TCP

Em outra janela de terminal, execute o cliente TCP com o comando:

```bash
lua tcp/main.lua
```

Selecione a opção **2** para iniciar o cliente. O cliente pedirá para que você digite uma mensagem, que será enviada ao servidor. O servidor irá responder com a mensagem convertida para maiúsculas.

#### 3. Sair

Selecione a opção **3** para sair do programa.

---

### UDP

#### 1. Iniciar o Servidor UDP

Execute o servidor UDP com o comando:

```bash
lua udp/main.lua
```

Selecione a opção **1** para iniciar o servidor. O servidor ficará esperando por mensagens na porta `8080`.

#### 2. Iniciar o Cliente UDP

Em outra janela de terminal, execute o cliente UDP com o comando:

```bash
lua udp/main.lua
```

Selecione a opção **2** para iniciar o cliente. O cliente pedirá para que você digite uma mensagem, que será enviada ao servidor. O servidor irá responder com a mensagem convertida para maiúsculas.

#### 3. Sair

Selecione a opção **3** para sair do programa.

---

## Fluxo de Comunicação

- O **cliente** envia uma mensagem ao **servidor** na porta `8080`.
- O **servidor** recebe a mensagem, converte para maiúsculas e envia a resposta de volta para o **cliente**.
- O **cliente** exibe a resposta do servidor na tela.

---

## Dependências

- **LuaSocket**: Biblioteca para comunicação de rede (UDP, TCP).
- **lua-utf8**: Biblioteca para manipulação de strings em UTF-8.

Essas bibliotecas são instaladas via Luarocks e estão localizadas dentro do diretório `lua_modules`.

---

## Contribuição

Se você deseja contribuir com melhorias, correções ou novos recursos, fique à vontade para criar um **pull request**.

---

## Licença

Este projeto está licenciado sob a **Licença MIT**.
