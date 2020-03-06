defmodule Guildship.Entities.Tag do
  use Guildship.Schema

  schema "entity_tags" do
    field :name, :string
    belongs_to :entity, Entity

    timestamps()
  end
end
