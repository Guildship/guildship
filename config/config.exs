# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :guildship,
  ecto_repos: [Guildship.Repo]

# Configures the endpoint
config :guildship, GuildshipWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C2P5qf5Snj/tcyVHjRIqL4W19UFK9xLic/OmWVwIf5KVoXl4CUAVXATbjteeR8pv",
  render_errors: [view: GuildshipWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Guildship.PubSub,
  live_view: [signing_salt: "GeiCcZTQCoYcs0xwsqzVcqsrgCBZxmdE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
