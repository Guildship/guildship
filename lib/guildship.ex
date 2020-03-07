defmodule Guildship do
  @moduledoc """
  Guildship keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defmacro __using__(_opts) do
    quote do
      alias Guildship.Repo
      alias Guildship.Accounts
      alias Guildship.Entities
      alias Guildship.Guilds
      alias Guildship.Administration
    end
  end
end
