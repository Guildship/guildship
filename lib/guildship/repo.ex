defmodule Guildship.Repo do
  use Ecto.Repo,
    otp_app: :guildship,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 25
end
