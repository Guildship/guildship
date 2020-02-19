use Mix.Config

config :guildship, Guildship.Repo,
  username: "postgres",
  password: "postgres",
  database: "guildship_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :guildship, GuildshipWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :guildship, GuildshipWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/guildship_web/live/.*(ex)$",
      ~r"lib/guildship_web/views/.*(ex)$",
      ~r"lib/guildship_web/templates/.*(eex)$"
    ]
  ]

config :mix_test_watch,
  clear: true,
  exclude: [~r/\.#/, ~r{priv/repo/migrations}, ~r{pg_data}, ~r{priv/static}]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
