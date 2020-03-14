defmodule Guildship.Repo.Migrations.CreateEntityReactions do
  use Ecto.Migration

  def change do
    create table(:entity_reactions) do
      add :entity_id, references(:entities), null: false
      add :user_id, references(:users), null: false

      timestamps()
    end

    create unique_index(:entity_reactions, [:user_id, :entity_id])
  end
end
