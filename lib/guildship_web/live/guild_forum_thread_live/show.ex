defmodule GuildshipWeb.GuildForumThreadLive.Show do
  use GuildshipWeb, :guild_live_view

  @impl true
  def handle_params(_, _, socket), do: {:noreply, socket}

  @impl true
  def mount(_params, _session, socket) do
    socket = socket |> assign(:page_title, "Guild Forum Thread")

    {:ok, socket}
  end
end