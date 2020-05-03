defmodule Guildship.MixProject do
  use Mix.Project

  def project do
    [
      app: :guildship,
      package: package(),
      version: "1.0.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def package() do
    [
      licenses: ["GPL-3.0-only"],
      links: %{
        "GitHub" => "https://github.com/Guildship"
      }
    ]
  end

  def application do
    [
      mod: {Guildship.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.5.0"},
      {:phoenix_ecto, "~> 4.0"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:phoenix_live_view, "~> 0.12.1"},
      {:phoenix_live_dashboard, "~> 0.2.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:floki, ">= 0.0.0", only: :test},
      {:ex_machina, "~> 2.4.0"},
      {:faker, "~> 0.13.0"},
      {:earmark, "~> 1.4.3"},
      {:html_sanitize_ex, "~> 1.4.0"},
      {:recase, "~> 0.6.0"},
      {:hashids, "~> 2.0.4"},
      {:ex_cldr, "~> 2.13.0"},
      {:ex_cldr_messages, "~> 0.4.0"},
      {:ex_cldr_dates_times, "~> 2.3.0"},
      {:ex_cldr_numbers, "~> 2.12.1"},
      {:scrivener_ecto, "~> 2.3.0"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd yarn --cwd assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
