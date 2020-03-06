defmodule Guildship.Guilds.NewsPost do
  use Guildship.Schema

  schema "guild_news_posts" do
    field :title, :string
    field :body_raw, :string
    field :body_html, :string
    belongs_to :entity, Entity
    belongs_to :guild, Guilds.Guild
    belongs_to :author, Accounts.User

    timestamps()
  end
end
