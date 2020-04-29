use Mix.Config

config :guildship, GuildshipWeb.Endpoint,
  url: [host: System.get_env("RENDER_EXTERNAL_HOSTNAME") || "localhost", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :guildship,
  hashid_salt: System.get_env("HASHID_SALT")

# Do not print debug messages in production
config :logger, level: :info
