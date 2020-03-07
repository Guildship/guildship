defmodule Guildship.Entities.Report do
  use Guildship.Schema
  alias User

  schema "entity_reports" do
    field :body, :string
    belongs_to :entity, Entity
    belongs_to :user, User

    timestamps()
  end
end
