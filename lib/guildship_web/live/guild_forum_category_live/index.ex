defmodule GuildshipWeb.GuildForumCategoryLive.Index do
  use GuildshipWeb, :guild_live_view

  @impl true
  def handle_params(_, _, socket), do: {:noreply, socket}

  @impl true
  def mount(params, _session, socket) do
    categories = Guildship.Guilds.list_forum_categories(params["guild_id"])

    socket =
      socket
      |> assign(
        page_title: "Forum Categories",
        guild_id: params["guild_id"],
        forum_categories: categories
      )

    {:ok, socket}
  end
end
