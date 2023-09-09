defmodule ShoppingCartWeb.Schemas.Budget.ItemsCarts.Types.ItemsCartsTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  use Absinthe.Ecto, repo: ShoppingCart.Repo

  object :carts_items do
    field :id, non_null(:id)
    field :cart, non_null(:cart), resolve: assoc(:carts)
    field :item, list_of(:item), resolve: assoc(:items)
  end
end
