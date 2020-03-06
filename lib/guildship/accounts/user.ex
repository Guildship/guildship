defmodule Guildship.Accounts.User do
  use Guildship.Schema
  alias Guildship.Repo
  import Ecto.{Query, Changeset}

  schema "users" do
    field :username, :string
    field :discriminator, :integer
    has_many :guild_memberships, Guilds.Membership
    has_many :guild_forum_threads, Guilds.ForumThread
    has_many :guild_forum_thread_replies, Guilds.ForumThreadReply

    timestamps()
  end

  @username_format ~r/^[a-zA-Z0-9_]+$/
  @username_max_length 24
  @min_discriminator 0
  @max_discriminator 9999
  @possible_discriminators MapSet.new(@min_discriminator..@max_discriminator)

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :discriminator])
    |> validate_required([:username, :discriminator])
    |> unique_constraint(:username_discriminator, name: :username_discriminator_unique_index)
    |> validate_length(:username, max: @username_max_length)
    |> validate_format(
      :username,
      @username_format,
      message: "can only contain letters, numbers, and underscores"
    )
    |> validate_number(
      :discriminator,
      less_than_or_equal_to: @max_discriminator,
      greater_than_or_equal_to: @min_discriminator
    )
    |> validate_discriminator()
  end

  defp validate_discriminator(%Ecto.Changeset{valid?: true} = changeset) do
    changeset
  end

  defp validate_discriminator(%Ecto.Changeset{} = changeset), do: changeset

  defp get_available_discriminator(username) do
    query = from u in User, where: u.username == ^username, select: u.discriminator

    used_discriminators = Repo.all(query) |> MapSet.new()
    available_discriminators = MapSet.difference(@possible_discriminators, used_discriminators)

    case Enum.count(available_discriminators) do
      0 -> {:error, "Username \"#{username}\" is not available"}
      _ -> {:ok, available_discriminators |> Enum.random()}
    end
  end
end
