defmodule GuildshipWeb.GuildNavComponent do
  use GuildshipWeb, :live_component

  def render(assigns) do
    ~L"""
    <nav class="flex flex-col items-start">
      <%= live_patch "Forum", to: Routes.live_path(@socket, GuildshipWeb.GuildForumCategoryLive.Index, @guild_id) %>
      <%= live_patch "News", to: Routes.live_path(@socket, GuildshipWeb.GuildNewsPostLive.Index, @guild_id) %>
      <%= live_patch "Calendar", to: Routes.live_path(@socket, GuildshipWeb.GuildCalendarEventLive.Index, @guild_id) %>
      <%= live_patch "Wiki", to: Routes.live_path(@socket, GuildshipWeb.GuildWikiLive.Index, @guild_id) %>
    </nav>
    """
  end
end
