defmodule ShoppingCart.Budget.Sage.CartsItemsSage do
  def create_carts_items(params) do
    __MODULE__.CreateCartsItems.create_carts_items(params)
  end

  def delete_carts_items(params) do
    __MODULE__.DeleteCartsItems.delete_carts_items(params)
  end
end
