defmodule ShoppingCart.Budget.Sage.CartsItemsSage.CreateCartsItems do
  import Sage
  alias ShoppingCart.Repo

  def create_carts_items(params) do
    new()
    |> run(:verify_cart, &verify_cart/2)
    |> run(:verify_item, &verify_item/2)
    |> run(:create_cart_item, &create_cart_item/2)
    |> run(:update_cart, &update_cart/2)
    |> transaction(ShoppingCart.Repo, %{params: params})
  end

  defp verify_cart(_, %{params: %{carts_id: cart_id}}) do
    case ShoppingCart.Budget.get_carts(cart_id) do
      nil -> {:error, "cart not founded, try to create or verify id"}
      cart -> {:ok, cart}
    end
  end

  defp verify_item(_, %{params: %{items_id: item_id}}) do
    case ShoppingCart.Budget.get_items(item_id) do
      nil -> {:error, "item not founded, try to create or verify id"}
      item -> {:ok, item}
    end
  end

  defp create_cart_item(_, %{params: %{items_id: item_id, carts_id: cart_id}}) do
    %ShoppingCart.Budget.CartsItems{carts_id: cart_id, items_id: item_id}
    |> Repo.insert()
  end

  defp update_cart(%{verify_cart: cart, verify_item: item}, _) do
    changeset = %{
      total_term_price: cart.total_term_price + item.term_price,
      total_items: cart.total_items + 1,
      total_price:
        round(
          cart.total_price +
            (item.term_price - item.term_price * (item.discount_percentage / 100))
        )
    }

    ShoppingCart.Budget.update_carts(cart, changeset)
  end
end
