defmodule Guildship.Repo.Migrations.CreateGuildForumCategories do
  use Ecto.Migration

  def change do
    create table(:guild_forum_categories) do
      add :entity_id, references(:entities), null: false
      add :guild_id, references(:guilds), null: false
      add :name, :string, null: false

      timestamps()
    end
  end
end
