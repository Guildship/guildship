defmodule Guildship.Accounts.User do
  use Guildship.Schema
  import Ecto.Changeset

  schema "users" do
    field :discriminator, :string
    field :username, :string
    has_many :guild_memberships, Guilds.Membership
    has_many :guild_forum_threads, Guilds.ForumThread
    has_many :guild_forum_thread_replies, Guilds.ForumThreadReply

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :discriminator])
    |> validate_required([:username, :discriminator])
    |> unique_constraint([:username_discriminator], name: :username_discriminator_unique_index)
  end
end
