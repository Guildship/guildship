defmodule Guildship.Guilds.ForumThread do
  use Guildship.Schema

  schema "guild_forum_threads" do
    field :title, :string
    belongs_to :entity, Entity
    belongs_to :user, User
    belongs_to :forum_category, Guilds.ForumCategory
    has_many :forum_thread_replies, Guilds.ForumThreadReply

    timestamps()
  end
end
