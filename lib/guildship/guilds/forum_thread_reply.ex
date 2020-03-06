defmodule Guildship.Guilds.ForumThreadReply do
  use Guildship.Schema

  schema "guild_forum_thread_replies" do
    field :body_raw, :string
    field :body_html, :string
    belongs_to :entity, Entity
    belongs_to :user, Accounts.User
    belongs_to :forum_thread, Guilds.ForumThread

    timestamps()
  end
end
