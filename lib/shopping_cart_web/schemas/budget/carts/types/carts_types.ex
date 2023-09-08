defmodule ShoppingCartWeb.Schemas.Budget.Carts.Types.CartsTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  use Absinthe.Ecto, repo: ShoppingCart.Repo
  object :cart do
    field :id, non_null(:id)
    field :total_items, non_null(:integer)

    field :total_price, non_null(:string) do
      resolve(fn item, _, _ ->
        money = Money.new(item.total_price, :BRL)
        {:ok, Money.to_string(money)}
      end)
    end

    field :total_term_price, non_null(:string) do
      resolve(fn item, _, _ ->
        money = Money.new(item.total_term_price, :BRL)
        {:ok, Money.to_string(money)}
      end)
    end

    field :items, list_of(:item), resolve: assoc(:items)

  end
end
