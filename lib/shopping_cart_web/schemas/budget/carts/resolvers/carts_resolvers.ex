defmodule ShoppingCartWeb.Schemas.Budget.Carts.Resolvers.CartsResolvers do
  alias ShoppingCart.Budget
  alias ShoppingCart.Budget.Carts

  def list_all_carts(_root, _args, _info) do
    {:ok, Budget.list_carts()}
  end

  def create_carts(_root, args, _info) do
    case Budget.create_carts(args) do
      {:ok, cart} -> {:ok, %{cart: cart}}
      other -> other
    end
  end

  def get_cart_by_id(_root, %{id: id}, _info) do
    cart = Budget.get_carts(id)

    case cart do
      %Carts{} -> {:ok, cart}
      nil -> {:error, "Cart Not Founded"}
    end
  end

  def update_carts(_root, %{id: id} = attrs, _info) do
    cart = Budget.get_carts(id)

    case cart do
      %Carts{} ->
        case Budget.update_carts(cart, attrs) do
          {:ok, cart} -> {:ok, %{cart: cart}}
          other -> other
        end

      nil ->
        {:error, "Cart Not Founded"}
    end
  end

  def delete_carts(_root, %{id: id}, _info) do
    cart = Budget.get_carts(id)

    case cart do
      nil ->
        {:error, "Cart Not Founded"}

      %Carts{} ->
        {:ok, cart} = Budget.delete_carts(cart)
        {:ok, %{cart: cart}}
    end
  end
end
