defmodule Guildship.Guilds.Guild do
  use Guildship.Schema

  schema "guilds" do
    field :name, :string
    belongs_to :entity, Entity
    has_many :forum_categories, Guilds.ForumCategory
    has_many :calendar_events, Guilds.CalendarEvent
    has_many :membership, Guilds.Membership
    has_many :news_posts, Guilds.NewsPost
    has_many :wiki_pages, Guilds.WikiPage

    timestamps()
  end
end
