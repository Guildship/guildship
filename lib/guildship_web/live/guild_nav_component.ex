defmodule GuildshipWeb.GuildNavComponent do
  use GuildshipWeb, :live_component

  def render(assigns) do
    ~L"""
    <nav class="flex flex-col items-start">
      <%= live_patch to: Routes.live_path(@socket, GuildshipWeb.GuildForumCategoryLive.Index, @guild_id) do %>
        Forum
      <% end %>
      <%= live_patch to: Routes.live_path(@socket, GuildshipWeb.GuildNewsPostLive.Index, @guild_id) do %>
        News
      <% end %>
      <%= live_patch to: Routes.live_path(@socket, GuildshipWeb.GuildCalendarEventLive.Index, @guild_id) do %>
        Calendar
      <% end %>
      <%= live_patch to: Routes.live_path(@socket, GuildshipWeb.GuildWikiLive.Index, @guild_id) do %>
        Wiki
      <% end %>
    </nav>
    """
  end
end
