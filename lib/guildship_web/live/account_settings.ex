defmodule GuildshipWeb.AccountSettingsLive do
  use Phoenix.LiveView, layout: {GuildshipWeb.LayoutView, "live.html"}

  def render(assigns) do
    Phoenix.View.render(GuildshipWeb.AccountView, "settings.html", assigns)
  end

  def mount(_params, _assigns, socket) do
    socket = socket |> assign(:page_title, "Settings")

    {:ok, socket}
  end
end
