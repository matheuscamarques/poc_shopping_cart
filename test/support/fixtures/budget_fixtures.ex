defmodule ShoppingCart.BudgetFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ShoppingCart.Budget` context.
  """

  @doc """
  Generate a cart_items.
  """
  def cart_items_fixture(attrs \\ %{}) do
    {:ok, cart_items} =
      attrs
      |> Enum.into(%{
        item_id: "",
        cart_id: ""
      })
      |> ShoppingCart.Budget.create_cart_items()

    cart_items
  end

  @doc """
  Generate a items.
  """
  def items_fixture(attrs \\ %{}) do
    {:ok, items} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        discount_percentage: 42,
        name: "some name",
        term_price: 42
      })
      |> ShoppingCart.Budget.create_items()

    items
  end

  @doc """
  Generate a cart.
  """
  def cart_fixture(attrs \\ %{}) do
    {:ok, cart} =
      attrs
      |> Enum.into(%{
        total_items: 42,
        total_price: 42,
        total_term_price: 42
      })
      |> ShoppingCart.Budget.create_carts()

    cart
  end
end
