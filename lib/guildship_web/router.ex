defmodule GuildshipWeb.Router do
  use GuildshipWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_user_token
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GuildshipWeb do
    pipe_through :browser

    live "/", LandingLive
  end

  scope "/g/:guild_id", GuildshipWeb do
    pipe_through :browser

    live "/", GuildLive
    live "/news", GuildNewsLive
    live "/forum", GuildForumLive
    live "/calendar", GuildCalendarLive
    live "/wiki", GuildWikiLive
  end

  scope "/me", GuildshipWeb do
    pipe_through :browser

    live "/", AccountLive
    live "/settings", AccountSettingsLive
  end

  defp put_user_token(conn, _) do
    if current_user = conn.assigns[:current_user] do
      token = Phoenix.Token.sign(conn, "user socket", current_user.id)
      assign(conn, :user_token, token)
    else
      conn
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuildshipWeb do
  #   pipe_through :api
  # end
end
