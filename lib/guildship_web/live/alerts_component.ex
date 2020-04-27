defmodule GuildshipWeb.AlertsComponent do
  use GuildshipWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <p class="alert alert-info" role="alert"
      phx-click="lv:clear-flash"
      phx-value-key="info"><%= live_flash(@flash, :info) %></p>

    <p class="alert alert-danger" role="alert"
      phx-click="lv:clear-flash"
      phx-value-key="error"><%= live_flash(@flash, :error) %></p>
    """
  end
end
