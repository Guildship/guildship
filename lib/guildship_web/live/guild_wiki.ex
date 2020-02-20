defmodule GuildshipWeb.GuildWikiLive do
  use Phoenix.LiveView, layout: {GuildshipWeb.LayoutView, "live.html"}

  def render(assigns) do
    Phoenix.View.render(GuildshipWeb.GuildView, "wiki.html", assigns)
  end

  def mount(_params, _session, socket) do
    socket = socket |> assign(:page_title, "Account")

    {:ok, socket}
  end
end
