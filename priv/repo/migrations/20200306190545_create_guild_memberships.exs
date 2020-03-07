defmodule Guildship.Repo.Migrations.CreateGuildMemberships do
  use Ecto.Migration

  def change do
    create table(:guild_memberships) do
      add :guild_id, references(:guilds), null: false
      add :user_id, references(:users), null: false
    end

    unique_index(:guild_memberships, [:guild_id, :user_id])
  end
end
