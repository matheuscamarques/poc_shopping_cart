defmodule ShoppingCart.Budget.Sage.CartsItemsSage do
  def create_cart_items(params) do
    __MODULE__.CreateCartItems.create_cart_items(params)
  end

  def delete_cart_items(params) do
    __MODULE__.DeleteCartItems.delete_cart_items(params)
  end
end
