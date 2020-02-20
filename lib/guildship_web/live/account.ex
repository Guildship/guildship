defmodule GuildshipWeb.AccountLive do
  use Phoenix.LiveView, layout: {GuildshipWeb.LayoutView, "live.html"}

  def render(assigns) do
    Phoenix.View.render(GuildshipWeb.AccountView, "index.html", assigns)
  end

  def mount(_params, _session, socket) do
    socket = socket |> assign(:page_title, "Account")

    {:ok, socket}
  end
end
