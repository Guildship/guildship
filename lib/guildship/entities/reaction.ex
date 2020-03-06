defmodule Guildship.Entities.Reaction do
  use Guildship.Schema

  schema "entity_reactions" do
    belongs_to :entity, Entity
    belongs_to :user, Accounts.User

    timestamps()
  end
end
