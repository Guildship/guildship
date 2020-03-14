defmodule Guildship.Repo.Migrations.CreateEntityReactions do
  use Ecto.Migration

  def change do
    create table(:entity_reactions) do
      add :entity_id, references(:entities, on_delete: :delete_all), null: false
      add :user_id, references(:users), null: false

      timestamps()
    end
  end
end
