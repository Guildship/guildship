defmodule GuildshipWeb.GuildForumThreadLive.Show do
  use GuildshipWeb, :guild_live_view
  alias Guildship.Markdown

  @impl true
  def handle_params(_, _, socket), do: {:noreply, socket}

  @impl true
  def handle_event("reply_to_thread", %{"body" => body}, socket) do
    Markdown.markdown_to_clean_html!(body) |> IO.inspect()
    {:noreply, socket}
  end

  @impl true
  def mount(params, _session, socket) do
    thread = Guildship.Guilds.get_forum_thread_by_id(params["thread_id"])
    replies = Guildship.Guilds.get_forum_thread_replies_in_thread(params["thread_id"])

    socket =
      socket
      |> assign(
        page_title: thread.title || "Guild Forum Thread",
        guild_id: params["guild_id"],
        thread: thread,
        replies: replies
      )

    {:ok, socket}
  end
end
