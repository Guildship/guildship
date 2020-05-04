use Mix.Config

# Make Bcrypt slow for tests
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
config :guildship, Guildship.Repo,
  username: "postgres",
  password: "postgres",
  database: "guildship_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :guildship, GuildshipWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
