defmodule Guildship.Entities.Entity do
  use Guildship.Schema
  alias Entities.{Reaction, Tag, Report}

  schema "entities" do
    has_many :reactions, Reaction
    has_many :tags, Tag
    has_many :reports, Report
    has_one :user, Accounts.User
    has_one :guild, Guilds.Guild
    has_one :guild_news_post, Guilds.NewsPost
    has_one :guild_wiki_page, Guilds.WikiPage
    has_one :guild_calendar_event, Guilds.CalendarEvent
    has_one :guild_forum_category, Guilds.ForumCategory
    has_one :guild_forum_thread, Guilds.ForumThread
    has_one :guild_forum_thread_reply, Guilds.ForumThreadReply

    timestamps()
  end
end
