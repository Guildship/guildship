defmodule Guildship.Repo.Migrations.CreateGuildNewsPosts do
  use Ecto.Migration

  def change do
    create table(:guild_news_posts) do
      add :entity_id, references(:entities), null: false
      add :guild_id, references(:guilds), null: false
      add :author_id, references(:users), null: false
      add :title, :string, null: false
      add :body_raw, :text, null: false
      add :body_html, :text, null: false

      timestamps()
    end

    create unique_index(:guild_news_posts, [:entity_id])
  end
end
