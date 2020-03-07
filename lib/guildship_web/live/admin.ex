defmodule GuildshipWeb.AdminLive do
  use Phoenix.LiveView, layout: {GuildshipWeb.LayoutView, "live.html"}

  def mount(_params, _session, socket) do
    socket = socket |> assign(:page_title, "Admin")

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(GuildshipWeb.AdminView, "index.html", assigns)
  end
end
