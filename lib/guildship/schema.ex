defmodule Guildship.Schema do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      alias Guildship.Accounts
      alias Guildship.Entities
      alias Guildship.Guilds
      alias Entities.Entity
    end
  end
end
