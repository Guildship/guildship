defmodule Guildship.Repo.Migrations.CreateGuildForumThreadReplies do
  use Ecto.Migration

  def change do
    create table(:guild_forum_thread_replies) do
      add :entity_id, references(:entities), null: false
      add :forum_thread_id, references(:guild_forum_threads), null: false
      add :user_id, references(:users), null: false
      add :body_raw, :text, null: false
      add :body_html, :text, null: false

      timestamps()
    end
  end
end
