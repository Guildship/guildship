defmodule GuildshipWeb.AccountLive.Index do
  use GuildshipWeb, :live_view

  def mount(_params, _session, socket) do
    socket = socket |> assign(:page_title, "My Account")

    {:ok, socket}
  end
end
