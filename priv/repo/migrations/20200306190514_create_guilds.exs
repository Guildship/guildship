defmodule Guildship.Repo.Migrations.CreateGuilds do
  use Ecto.Migration

  def change do
    create table(:guilds) do
      add :name, :string, null: false
      add :entity_id, references(:entities, on_delete: :delete_all)

      timestamps()
    end
  end
end
