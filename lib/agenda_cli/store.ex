defmodule AgendaCli.Store do

  @contacts_file "contacts.json"

  def load do

    if File.exists?(@contacts_file) do

      @contacts_file
      |> File.read!()
      |> Jason.decode!(keys: :atoms)

    else

      []

    end

  end

  def save(contacts) do

    json =
      Jason.encode!(contacts, pretty: true)

    File.write!(@contacts_file, json)

  end

end
