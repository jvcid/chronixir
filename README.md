README — Agenda CLI em Elixir
Sobre o Projeto

A Agenda CLI é uma aplicação de terminal desenvolvida em Elixir para gerenciamento de contatos.

O sistema funciona através de comandos digitados no terminal, permitindo:

adicionar contatos;
listar contatos;
buscar contatos;
editar contatos;
remover contatos;
salvar dados em arquivo JSON.

Os contatos são persistidos localmente utilizando:

arquivos .json;
biblioteca Jason para serialização.
Estrutura do Projeto
lib/
│
├── agenda_cli.ex
├── agenda_cli/
│   ├── contacts.ex
│   └── store.ex
│
contacts.json
mix.exs
README.md
Responsabilidades dos Módulos
AgendaCli

Responsável pelo:

loop principal da aplicação;
leitura de comandos;
interação com o usuário;
navegação entre funcionalidades.
AgendaCli.Contacts

Responsável pela lógica de negócio dos contatos:

adicionar;
editar;
remover;
listar;
buscar.
AgendaCli.Store

Responsável pela persistência:

salvar contatos em JSON;
carregar contatos do arquivo.
Funcionalidades
Comando	Descrição
add	Adiciona um novo contato
list	Lista todos os contatos
show	Mostra um contato específico
edit	Edita um contato
delete	Remove um contato
search	Busca contatos
exit	Encerra a aplicação
Estrutura de um Contato
{
  "id": 1778360030734,
  "name": "Jeferson",
  "company": "Caminhões LTDA",
  "phone": "999999999",
  "email": "email@gmail.com"
}
Tecnologias Utilizadas
Elixir
Erlang OTP
Jason
JSON
Como Executar
1. Clonar o projeto
git clone https://github.com/seu-repositorio.git
2. Entrar na pasta
cd chronixir
3. Instalar dependências
mix deps.get
4. Compilar o projeto
mix compile
5. Executar
iex -S mix

Depois:

AgendaCli.main()
Exemplos de Uso
Adicionando contato
agenda> add
Nome: João
Empresa: Tech
Telefone: 999999999
Email: joao@gmail.com
Listando contatos
agenda> list
Buscando contato
agenda> search
Campo (name/email/phone):
Conceitos Utilizados

O projeto utiliza conceitos importantes da programação funcional:

imutabilidade;
listas;
maps;
pattern matching;
pipelines (|>);
módulos;
funções puras;
Enum.
Persistência de Dados

Os contatos são armazenados em:

contacts.json

A leitura e escrita são feitas utilizando:

File.read!
File.write!
Jason.encode!
Jason.decode!

Autor
João Victor Martins Cid
Projeto desenvolvido para fins acadêmicos utilizando Elixir.
