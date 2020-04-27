defmodule GuildshipWeb.GuildLive.Index do
  use GuildshipWeb, :live_view

  @impl true
  def mount(params, _session, socket) do
    socket =
      socket
      |> assign(
        page_title: "Guild with ID of " <> params["guild_id"],
        guild_id: params["guild_id"]
      )

    {:ok, socket}
  end
end
