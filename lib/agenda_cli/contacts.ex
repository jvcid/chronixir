defmodule AgendaCli.Contacts do

  def add(contacts, attrs) do

    contact = %{

      id: System.system_time(:millisecond),
      name: attrs["name"],
      company: attrs["company"],
      phone: attrs["phone"],
      email: attrs["email"],
      metadata: "RXNzYSDDqSBhIG1pbmhiYSBhZ2VuZGEgZW0gZWxpeGlyIDsp"
    }

    [contact | contacts] #define que contact venha antes de contacts [cabeca | cauda]

  end

  def delete(contacts, id) do

    Enum.reject(contacts, fn contact ->

    contact.id == id

    end)

  end

  def edit(contacts, id, updates) do

    Enum.map(contacts, fn contact ->

      if contact.id == id do

        Map.merge(contact, updates)

      else
        contact

      end

    end)

  end

  def show(contacts, id) do

    Enum.find(contacts, fn contact ->

    contact.id == id

    end)

  end

  def list(contacts) do

    Enum.each(contacts, fn contact ->

    IO.puts("""
    ID: #{contact.id}
    Nome: #{contact.name}
    Empresa: #{contact.company}
    Telefone: #{contact.phone}
    Email: #{contact.email}
    """)

    end)
  end

  def search(contacts, field, value) do

    value = String.downcase(value)

    Enum.filter(contacts, fn contact ->

    field_value = Map.get(contact, field)
    |> String.downcase()

  String.contains?(field_value, value)

    end)

end

end
