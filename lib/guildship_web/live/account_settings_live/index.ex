defmodule GuildshipWeb.AccountSettingsLive.Index do
  use GuildshipWeb, :live_view

  def mount(_params, _assigns, socket) do
    socket = socket |> assign(page_title: "Settings")

    {:ok, socket}
  end
end
