defmodule Guildship.Repo.Migrations.CreateGuildCalendarEvents do
  use Ecto.Migration

  def change do
    create table(:guild_calendar_events) do
      add :guild_id, references(:guilds), null: false
      add :entity_id, references(:entities), null: false
      add :author_id, references(:users), null: false
      add :title, :string, null: false
      add :description_raw, :text
      add :description_text, :text
      add :starts_at, :naive_datetime
      add :ends_at, :naive_datetime

      timestamps()
    end
  end
end
