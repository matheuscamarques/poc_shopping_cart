defmodule ShoppingCartWeb.Schemas.Budget.ItemsCarts.Types.ItemsCartsTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  use Absinthe.Ecto, repo: ShoppingCart.Repo

  object :carts_items do
    field :id, non_null(:id)
    field :cart, non_null(:cart), resolve: assoc(:carts)
    field :item, list_of(:item), resolve: assoc(:items)

    field :name, non_null(:string)
    field :desc, non_null(:string)
    field :discount_percentage, non_null(:integer)

    field :term_price, non_null(:string) do
      resolve(fn item, _, _ ->
        money = Money.new(item.term_price, :BRL)
        {:ok, Money.to_string(money)}
      end)
    end

    field :price, non_null(:string) do
      resolve(fn item, _, _ ->
        calculated_price = item.term_price - item.term_price * item.discount_percentage / 100
        calculated_price_in_cents = round(calculated_price)
        money = Money.new(calculated_price_in_cents, :BRL)
        {:ok, Money.to_string(money)}
      end)
    end
  end
end
