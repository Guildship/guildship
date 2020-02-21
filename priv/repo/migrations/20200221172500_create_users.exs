defmodule Guildship.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :discriminator, :string
      add :type, :string

      timestamps()
    end
  end
end
