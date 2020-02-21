defmodule Guildship.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :discriminator, :string, null: false
      add :type, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:username, :discriminator])
  end
end
