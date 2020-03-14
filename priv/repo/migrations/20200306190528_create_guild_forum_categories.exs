defmodule Guildship.Repo.Migrations.CreateGuildForumCategories do
  use Ecto.Migration

  def change do
    create table(:guild_forum_categories) do
      add :entity_id, references(:entities, on_delete: :delete_all), null: false
      add :guild_id, references(:guilds), null: false
      add :name, :string, null: false

      timestamps()
    end
  end
end
