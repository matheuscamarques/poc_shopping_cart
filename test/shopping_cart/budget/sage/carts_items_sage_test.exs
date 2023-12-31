defmodule ShoppingCart.Budget.Sage.CartsItemsSageTest do
  use ShoppingCart.DataCase
  alias ShoppingCart.Budget

  describe "Carts Items Test" do
    test "adding items" do
      {:ok, cart} = Budget.create_carts()

      {:ok, item} =
        Budget.create_items(%{
          name: "Bag",
          desc: "Bag for trip",
          discount_percentage: 10,
          term_price: 1000
        })

      {:ok, cart, _} =
        Budget.create_carts_items(%{
          carts_id: cart.id,
          items_id: item.id
        })

      assert cart.total_items == 1
      assert cart.total_price == 900

      assert cart.total_term_price == 1000
    end
  end
end
