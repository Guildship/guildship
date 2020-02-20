defmodule GuildshipWeb.CounterLiveComponent do
  use Phoenix.LiveComponent

  def mount(socket) do
    initial_state = 0
    {:ok, assign(socket, :val, initial_state)}
  end

  def handle_event("increment", _, socket) do
    socket =
      case Map.get(socket, :val) do
        x when x > 10 ->
          socket |> put_flash(:info, "Woah, more than 10!")

        _ ->
          socket
      end

    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("decrement", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def render(assigns) do
    ~L"""
    <div id="<%= @id %>">
      <h1>The count is: <%= @val %></h1>
      <button phx-click="increment" phx-target="#<%= @id %>">Increment</button>
      <button phx-click="decrement" phx-target="#<%= @id %>">Decrement</button>
    </div>
    """
  end
end
