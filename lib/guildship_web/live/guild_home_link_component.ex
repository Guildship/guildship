defmodule GuildshipWeb.GuildHomeLinkComponent do
  use GuildshipWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <%= live_patch "← Back to Guild Home", to: Routes.live_path(@socket, GuildshipWeb.GuildLive.Index, @guild_id) %>
    """
  end
end
