defmodule GuildshipWeb.GuildCalendarEventLive.Index do
  use GuildshipWeb, :live_view

  def mount(params, _session, socket) do
    socket = socket |> assign(page_title: "Guild Calendar", guild_id: params["guild_id"])

    {:ok, socket}
  end
end
