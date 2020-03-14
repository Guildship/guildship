defmodule Guildship.Repo.Migrations.CreateEntityTags do
  use Ecto.Migration

  def change do
    create table(:entity_tags) do
      add :entity_id, references(:entities), null: false
      add :name, :citext, null: false

      timestamps()
    end
  end
end
