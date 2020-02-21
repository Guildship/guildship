defmodule Guildship.Repo.Migrations.CreateEntities do
  use Ecto.Migration

  def change do
    create table(:entities) do
      timestamps()
    end
  end
end
