defmodule GuildshipWeb.Router do
  use GuildshipWeb, :router
  import GuildshipWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GuildshipWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", GuildshipWeb do
    pipe_through :browser

    live "/", HomeLive.Index
  end

  scope "/", GuildshipWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live "/login", LoginLive.Index
    live "/register", RegisterLive.Index
    live "/reset-password", ResetPasswordLive.Index
    live "/reset-password/:token", ConfirmResetPasswordLive.Index
  end

  scope "/dash", GuildshipWeb do
    pipe_through [:browser, :require_authenticated_user]

    live "/", DashboardLive.Index
  end

  scope "/g/:guild_id", GuildshipWeb do
    pipe_through :browser

    live "/", GuildLive.Show
    live "/news", GuildNewsPostLive.Index
    live "/news/p/:news_post_id", GuildNewsPostLive.Show
    live "/forum", GuildForumCategoryLive.Index
    live "/forum/c/:category_id", GuildForumCategoryLive.Show
    live "/forum/c/:category_id/t/:thread_id", GuildForumThreadLive.Show
    live "/calendar", GuildCalendarEventLive.Index
    live "/calendar/e/:calendar_event_id", GuildCalendarEventLive.Show
    live "/wiki", GuildWikiLive.Index
  end

  scope "/me", GuildshipWeb do
    pipe_through [:browser, :require_authenticated_user]

    live "/", AccountLive.Index
    live "/logout", LogoutLive.Index
    live "/settings", AccountSettingsLive.Index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: GuildshipWeb.Telemetry
    end
  end
end
