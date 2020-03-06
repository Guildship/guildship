defmodule Guildship.Guilds.Membership do
  use Guildship.Schema

  schema "guild_memberships" do
    belongs_to :user, Accounts.User
    belongs_to :guild, Guilds.Guild

    timestamps()
  end
end
