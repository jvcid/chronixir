defmodule AgendaCli do

  alias AgendaCli.Store
  alias AgendaCli.Contacts

  def main do

    contacts =
      Store.load()

    IO.puts("""

         AGENDA CLI


    Comandos disponíveis:

    add
    list
    show
    edit
    delete
    search
    exit

    """)

    loop(contacts)

  end

  def loop(contacts) do

    command =
      IO.gets("agenda> ")
      |> String.trim()
      |> String.downcase()

    case command do

      "list" ->

        Contacts.list(contacts)

        loop(contacts)

      "add" ->

        attrs = %{

          "name" =>
            IO.gets("Nome: ")
            |> String.trim(),

          "company" =>
            IO.gets("Empresa: ")
            |> String.trim(),

          "phone" =>
            IO.gets("Telefone: ")
            |> String.trim(),

          "email" =>
            IO.gets("Email: ")
            |> String.trim()

        }

        new_contacts =
          Contacts.add(
            contacts,
            attrs
          )

        Store.save(new_contacts)

        IO.puts("Contato adicionado!")

        loop(new_contacts)

      "show" ->

        id =
          IO.gets("ID: ")
          |> String.trim()
          |> String.to_integer()

        contact =
          Contacts.show(
            contacts,
            id
          )

        case contact do

          nil ->
            IO.puts("Contato não encontrado!")

          _ ->
            IO.inspect(contact)

        end

        loop(contacts)

      "delete" ->

        id =
          IO.gets("ID: ")
          |> String.trim()
          |> String.to_integer()

        new_contacts =
          Contacts.delete(
            contacts,
            id
          )

        Store.save(new_contacts)

        IO.puts("Contato removido!")

        loop(new_contacts)

      "edit" ->

        id =
          IO.gets("ID: ")
          |> String.trim()
          |> String.to_integer()

        updates = %{

          name:
            IO.gets("Novo nome: ")
            |> String.trim(),

          company:
            IO.gets("Nova empresa: ")
            |> String.trim(),

          phone:
            IO.gets("Novo telefone: ")
            |> String.trim(),

          email:
            IO.gets("Novo email: ")
            |> String.trim()

        }

        new_contacts =
          Contacts.edit(
            contacts,
            id,
            updates
          )

        Store.save(new_contacts)

        IO.puts("Contato atualizado!")

        loop(new_contacts)

      "search" ->

        field_input =
          IO.gets("Campo (name/email/phone): ")
          |> String.trim()

        field =
          case field_input do

            "name" ->
              :name

            "email" ->
              :email

            "phone" ->
              :phone

          end

        value =
          IO.gets("Valor: ")
          |> String.trim()

        results =
          Contacts.search(
            contacts,
            field,
            value
          )

        Contacts.list(results)

        loop(contacts)

      "exit" ->

        IO.puts("Encerrando agenda...")

      _ ->

        IO.puts("Comando inválido!")

        loop(contacts)

    end

  end

end
