defmodule Guildship.Entities.Report do
  use Ecto.Schema
  alias Guildship.Accounts.User

  schema "entity_reports" do
    field :body, :string
    belongs_to :user, User

    timestamps()
  end
end
