defmodule Guildship.Schema do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset
      import Ecto.Query, warn: false
      alias Guildship.Accounts
      alias Guildship.Entities
      alias Guildship.Guilds
      alias Entities.Entity
      alias Accounts.User
    end
  end
end
