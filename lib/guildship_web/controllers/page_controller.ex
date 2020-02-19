defmodule GuildshipWeb.PageController do
  use GuildshipWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
