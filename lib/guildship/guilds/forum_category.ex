defmodule Guildship.Guilds.ForumCategory do
  use Guildship.Schema

  schema "guild_forum_categories" do
    field :name
    belongs_to :entity, Entity
    belongs_to :guild, Guilds.Guild
    has_many :threads, Guilds.ForumThread

    timestamps()
  end
end
