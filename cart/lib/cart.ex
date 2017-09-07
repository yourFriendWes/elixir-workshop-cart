defmodule Cart do

  # example cart:
  # cart = %{contents: %{banana: 1, candy: 2}}

  # def handle(cart, {:item_added, item}) do
  #   cart = %{contents: [item | Map.get(cart, :contents, [])]}
  # end

  def handle(cart, {:item_added, item}) do
    Map.get_and_update(cart.contents, item, fn(x) -> { x, (x || 1) + 1} end)
  end

  def handle(cart, {:item_removed, item}) do
    cart = %{contents: Map.get(cart, :contents, []) -- [item]}
  end

  def handle(cart, events) when is_list(events) do
    Enum.reduce(events, cart, fn(event, cart) -> handle(cart, event) end)
  end

  def handle(cart, {:display}) do
    Map.get(cart, :contents)
  end

end
