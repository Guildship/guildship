defmodule GuildshipWeb.GuildForumCategoryLive.Show do
  use GuildshipWeb, :guild_live_view

  @impl true
  def handle_params(_, _, socket), do: {:noreply, socket}

  @impl true
  def mount(params, _session, socket) do
    category = Guildship.Guilds.get_forum_category(params["category_id"])

    threads =
      Guildship.Guilds.get_forum_threads_in_category(params["category_id"])
      |> Enum.flat_map(fn t -> Guildship.Guilds.get_forum_thread_replies_in_thread(t.id) end)

    socket =
      socket
      |> assign(
        guild_id: params["guild_id"],
        category_id: params["category_id"],
        category: category,
        threads: threads
      )

    {:ok, socket}
  end
end
