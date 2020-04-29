defmodule Guildship.Schema do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      use Guildship
      import Ecto.Changeset
      import Ecto.Query, warn: false
      alias Guildship.Entities.Entity
      alias Guildship.Accounts.User

      @primary_key {:id, Guildship.HashidEctoType, read_after_writes: true}
      @foreign_key_type Guildship.HashidEctoType
    end
  end
end
