defmodule Guildship.Entities.Entity do
  use Guildship.Schema
  alias Entities.{Reaction, Tag}

  schema "entities" do
    has_many :reactions, Reaction
    has_many :tags, Tag

    timestamps()
  end
end
