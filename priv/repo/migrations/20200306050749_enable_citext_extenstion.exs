defmodule Guildship.Repo.Migrations.EnableCitextExtenstion do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION citext", "DROP EXTENSION citext"
  end
end
