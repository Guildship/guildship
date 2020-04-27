defmodule GuildshipWeb.AdminLive.Index do
  use GuildshipWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket = socket |> assign(:page_title, "Admin")

    {:ok, socket}
  end
end
