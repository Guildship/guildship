defmodule GuildshipWeb.AlertsComponent do
  use GuildshipWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div>
      <div class="alert alert-info" role="alert"
        phx-click="lv:clear-flash"
        phx-value-key="info"><%= live_flash(@flash, :info) %></div>

      <div class="alert alert-danger" role="alert"
        phx-click="lv:clear-flash"
        phx-value-key="error"><%= live_flash(@flash, :error) %></div>
    </div>
    """
  end
end
