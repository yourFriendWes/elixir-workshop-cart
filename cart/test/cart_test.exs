defmodule CartTest do
  use ExUnit.Case
  doctest Cart

  # example cart:
  # cart = %{contents: [:item1, :item2]}
  # cart.contents = [:item1, :item2]

  test "an empty cart is empty" do
    empty_cart = %{}
    assert empty_cart == %{}
  end

  test "adds an item to empty cart" do
    empty_cart = %{}
    cart = Cart.handle(empty_cart, {:item_added, :my_item})
    assert cart.contents == [my_item: 1]
  end

  test "adds an item to existing cart" do
    existing_cart = %{contents: [:item1, :item2]}
    cart = Cart.handle(existing_cart, {:item_added, :banana})
    assert cart.contents == [:banana, :item1, :item2]
  end

  test "displays contents of cart" do
    existing_cart = %{contents: [:item1, :item2]}
    assert Cart.handle(existing_cart, {:display}) == [:item1, :item2]
  end

  test "tells what has been removed from cart" do
    existing_cart = %{contents: [:item1, :item2]}
    cart = Cart.handle(existing_cart, {:item_removed, :item1})
    assert cart.contents == [:item2]
  end

  test "what is the most expensive item" do
  end

  test "tells how old is the cart" do
  end

  test "tells what is the newest item in the cart" do
  end
end
