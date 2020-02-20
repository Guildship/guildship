defmodule GuildshipWeb.LandingLive do
  use Phoenix.LiveView, layout: {GuildshipWeb.LayoutView, "live.html"}

  def render(assigns) do
    Phoenix.View.render(GuildshipWeb.LandingView, "index.html", assigns)
  end

  def mount(_params, _assigns, socket) do
    socket = socket |> assign(:page_title, "guildship: where communities grow.")

    {:ok, socket}
  end
end
