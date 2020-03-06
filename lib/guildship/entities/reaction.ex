defmodule Guildship.Entities.Reaction do
  use Guildship.Schema

  schema "entity_reactions" do
    belongs_to :entity, Entity
    belongs_to :user, User

    timestamps()
  end
end
