defmodule ShoppingCartWeb.Schemas.Budget.CartsItems.Resolvers.CartsItemsResolvers do
  alias ShoppingCart.Budget
  # alias ShoppingCart.Budget.CartsItems

  def create_carts_items(_root, args, _info) do
    case Budget.create_carts_items(args) do
      {:ok, cart, _} -> {:ok, %{cart: cart}}
      other -> other
    end
  end

  def delete_carts_items(_root, args, _info) do
    case Budget.delete_carts_items(args) do
      {:ok, cart, _} -> {:ok, %{cart: cart}}
      other -> other
    end
  end
end
