defmodule GuildshipWeb.GuildForumCategoryLive.Show do
  use GuildshipWeb, :guild_live_view

  @impl true
  def handle_params(_, _, socket), do: {:noreply, socket}

  @impl true
  def mount(params, _session, socket) do
    category = Guildship.Guilds.get_forum_category(params["category_id"])

    threads = Guildship.Guilds.get_forum_threads_in_category(params["category_id"])

    socket =
      socket
      |> assign(
        guild_id: params["guild_id"],
        category_id: params["category_id"],
        page_title: category.name,
        category: category,
        threads: threads
      )

    {:ok, socket}
  end
end
