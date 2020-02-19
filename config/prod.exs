use Mix.Config

config :guildship, GuildshipWeb.Endpoint,
  url: [host: "guildship.co", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

import_config "prod.secret.exs"
