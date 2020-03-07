defmodule Guildship.Administration.Admin do
  use Guildship.Schema

  schema "admins" do
    belongs_to :user, User

    timestamps()
  end

  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
    |> unique_constraint(:user_id)
  end

  def new_changeset(admin, attrs) do
    admin
    |> changeset(attrs)
  end
end
