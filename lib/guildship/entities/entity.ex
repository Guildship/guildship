defmodule Guildship.Entities.Entity do
  use Ecto.Schema
  alias Guildship.Entities.{Reaction, Tag}

  schema "entities" do
    has_many :reactions, Reaction
    has_many :tags, Tag

    timestamps()
  end
end
