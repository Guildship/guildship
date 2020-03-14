defmodule Guildship.Repo.Migrations.CreateGuildForumThreads do
  use Ecto.Migration

  def change do
    create table(:guild_forum_threads) do
      add :entity_id, references(:entities), null: false
      add :forum_category_id, references(:guild_forum_categories), null: false
      add :user_id, references(:users), null: false
      add :title, :string, null: false

      timestamps()
    end

    create unique_index(:guild_forum_threads, [:entity_id])
  end
end
