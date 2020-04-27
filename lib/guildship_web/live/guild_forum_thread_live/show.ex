defmodule GuildshipWeb.GuildForumThreadLive.Show do
  use GuildshipWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket = socket |> assign(:page_title, "Guild Forum Thread")

    {:ok, socket}
  end
end
