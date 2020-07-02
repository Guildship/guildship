defmodule GuildshipWeb.GuildLive.Index do
  use GuildshipWeb, :live_view

  @impl true
  def handle_params(_, _, socket), do: {:noreply, socket}

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(
        page_title: "Guilds"
      )

    {:ok, socket}
  end
end
