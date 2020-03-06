defmodule Guildship.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :discriminator, :int, null: false

      timestamps()
    end

    create(
      unique_index(:users, [:username, :discriminator], name: :username_discriminator_unique_index)
    )
  end
end
