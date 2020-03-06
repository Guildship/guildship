defmodule Guildship.Repo.Migrations.CreateGuildWikiPages do
  use Ecto.Migration

  def change do
    create table(:guild_wiki_pages) do
      add :entity_id, references(:entities), null: false
      add :guild_id, references(:guilds), null: false
      add :title, :string, null: false
      add :body_raw, :text
      add :body_html, :text

      timestamps()
    end
  end
end
