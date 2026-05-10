# Agenda CLI

Aplicação de terminal desenvolvida em Elixir para gerenciamento de contatos.

A aplicação permite:

- Adicionar contatos;
- Listar contatos;
- Buscar contatos;
- Editar contatos;
- Remover contatos;
- Persistir dados em JSON.

---

# Tecnologias Utilizadas

- Elixir
- Erlang/OTP
- Jason
- JSON

---

# Estrutura do Projeto

```text
lib/
│
├── agenda_cli.ex
│
├── agenda_cli/
│   ├── contacts.ex
│   └── store.ex
│
├── contacts.json
├── mix.exs
└── README.md
```

---

# Responsabilidades dos Módulos

## AgendaCli

Responsável por:

- Loop principal da aplicação;
- Leitura de comandos;
- Interação com o usuário;
- Navegação entre funcionalidades.

---

## AgendaCli.Contacts

Responsável pela lógica dos contatos:

- Adicionar contatos;
- Editar contatos;
- Remover contatos;
- Listar contatos;
- Buscar contatos.

---

## AgendaCli.Store

Responsável pela persistência dos dados:

- Salvar contatos em JSON;
- Carregar contatos do arquivo.

---

# Funcionalidades

| Comando | Descrição |
|---|---|
| `add` | Adiciona um novo contato |
| `list` | Lista todos os contatos |
| `show` | Mostra um contato específico |
| `edit` | Edita um contato |
| `delete` | Remove um contato |
| `search` | Busca contatos |
| `exit` | Encerra a aplicação |

---

# Estrutura de um Contato

```json
{
  "id": 1778360030734,
  "name": "João",
  "company": "Tech LTDA",
  "phone": "999999999",
  "email": "joao@gmail.com"
}
```

---

# Instalação

## 1. Clone o repositório

```bash
git clone https://github.com/seu-repositorio.git
```

---

## 2. Entre na pasta do projeto

```bash
cd chronixir
```

---

## 3. Instale as dependências

```bash
mix deps.get
```

---

## 4. Compile o projeto

```bash
mix compile
```

---

# Execução

Inicie o projeto com:

```bash
iex -S mix
```

Depois execute:

```elixir
AgendaCli.main()
```

---

# Exemplos de Uso

## Adicionando contato

```text
agenda> add

Nome: João
Empresa: Tech
Telefone: 999999999
Email: joao@gmail.com
```

---

## Listando contatos

```text
agenda> list
```

---

## Buscando contatos

```text
agenda> search
Campo (name/email/phone): name
Valor: joao
```

---

## Editando contatos

```text
agenda> edit
ID: 1778360030734
```

---

## Removendo contatos

```text
agenda> delete
ID: 1778360030734
```

---

# Conceitos Utilizados

O projeto utiliza conceitos importantes da programação funcional:

- Imutabilidade;
- Listas;
- Maps;
- Pattern Matching;
- Pipelines (`|>`);
- Módulos;
- Funções puras;
- Enum.

---

# Persistência de Dados

Os contatos são armazenados em:

```text
contacts.json
```

A leitura e escrita são feitas utilizando:

- `File.read!/1`
- `File.write!/2`
- `Jason.encode!/2`
- `Jason.decode!/2`

---

# Autor

Projeto desenvolvido para fins acadêmicos utilizando Elixir.
