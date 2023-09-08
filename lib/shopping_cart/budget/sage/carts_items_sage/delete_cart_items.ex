defmodule ShoppingCart.Budget.Sage.CartsItemsSage.DeleteCartItems do
  import Sage
  import Ecto.Query
  alias ShoppingCart.Repo

  def delete_cart_items(params) do
    new()
    |> run(:verify_cart, &verify_cart/2)
    |> run(:verify_item, &verify_item/2)
    |> run(:verify_cart_item, &verify_cart_item/2)
    |> run(:delete_cart_item, &delete_cart_item/2)
    |> run(:update_cart, &update_cart/2)
    |> transaction(ShoppingCart.Repo, %{params: params})
  end

  defp verify_cart(_, %{params: %{cart_id: cart_id}}) do
    case ShoppingCart.Budget.get_carts(cart_id) do
      nil -> {:error, "cart not founded, try to create or verify id"}
      cart -> {:ok, cart}
    end
  end

  defp verify_item(_, %{params: %{item_id: item_id}}) do
    case ShoppingCart.Budget.get_items(item_id) do
      nil -> {:error, "item not founded, try to create or verify id"}
      item -> {:ok, item}
    end
  end

  def verify_cart_item(_, %{params: %{item_id: item_id, cart_id: cart_id}}) do
    query =
      from ci in ShoppingCart.Budget.CartsItems,
        where: ci.cart_id == ^cart_id and ci.item_id == ^item_id,
        select: ci

    items = Repo.all(query)

    case items do
      [] -> {:error, "not found item in the cart"}
      [item | _] -> {:ok, item}
    end
  end

  defp delete_cart_item(%{verify_cart_item: cart_item}, _) do
    cart_item
    |> Repo.delete()
  end

  defp update_cart(%{verify_cart: cart, verify_item: item}, _) do
    changeset = %{
      total_term_price: cart.total_term_price - item.term_price,
      total_items: cart.total_items - 1,
      total_price:
        round(
          cart.total_price -
            (item.term_price - item.term_price * (item.discount_percentage / 100))
        )
    }

    ShoppingCart.Budget.update_carts(cart, changeset)
  end
end
