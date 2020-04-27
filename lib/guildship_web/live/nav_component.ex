defmodule GuildshipWeb.NavComponent do
  use GuildshipWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <nav class="light-mode:bg-white shadow p-4 z-50">
      <div class="flex items-center justify-between flex-wrap">
        <div class="flex items-center flex-shrink-0 mr-6">
          <span class="font-bold text-xl tracking-tight cursor-default">
            <%= live_patch "Guildship", to: Routes.live_path(@socket, GuildshipWeb.HomeLive.Index) %>
          </span>
        </div>
        <div class="block lg:hidden">
          <button class="flex items-center px-3 py-2 border rounded light-mode:text-gray-100 light-mode:border-gray-400 hover:text-white hover:border-white">
            <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>Menu</title><path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/></svg>
          </button>
        </div>
        <div class="w-full block flex-grow lg:flex lg:items-center mt-4 lg:mt-0 lg:w-auto">
          <div class="text-sm lg:flex-grow flex flex-col lg:flex-row">
            <%= live_patch "Go to Guild 123", to: Routes.live_path(@socket, GuildshipWeb.GuildLive.Index, "123"), class: "block py-2 lg:px-2 light-mode:hover:text-black" %>
            <%= if function_exported?(Routes, :live_dashboard_path, 2) do %>
              <%= link "LiveDashboard", to: Routes.live_dashboard_path(@socket, :home), class: "block py-2 lg:px-2 light-mode:hover:text-black" %>
            <% end %>
          </div>
        </div>
      </div>
    </nav>
    """
  end
end
