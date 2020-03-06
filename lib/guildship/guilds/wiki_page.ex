defmodule Guildship.Guilds.WikiPage do
  use Guildship.Schema

  schema "guild_wiki_pages" do
    field :title, :string
    field :body_raw, :string
    field :body_html, :string
    belongs_to :entity, Entity
    belongs_to :guild, Guilds.Guild

    timestamps()
  end
end
