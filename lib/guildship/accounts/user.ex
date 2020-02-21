defmodule Guildship.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :discriminator, :string
    field :type, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :discriminator, :type])
    |> validate_required([:username, :discriminator, :type])
  end
end
