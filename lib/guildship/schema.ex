defmodule Guildship.Schema do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      use Guildship
      import Ecto.Changeset
      import Ecto.Query, warn: false
      alias Guildship.Entities.Entity
      alias Guildship.Accounts.User
    end
  end
end
