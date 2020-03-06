defmodule Guildship.Repo.Migrations.CreateEntityReports do
  use Ecto.Migration

  def change do
    create table(:entity_reports) do
      add :entity_id, references(:entities), null: false
      add :user_id, references(:users)
      add :reason, :text

      timestamps()
    end

    create unique_index(:entity_reports, [:entity_id, :user_id],
             name: :entity_report_user_entity_unique_index
           )
  end
end
