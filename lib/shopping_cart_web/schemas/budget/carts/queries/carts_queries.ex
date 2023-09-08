defmodule ShoppingCartWeb.Schemas.Budget.Carts.Queries.CartsQueries do
  use Absinthe.Schema.Notation
  alias ShoppingCartWeb.Schemas.Budget.Carts.Resolvers.CartsResolvers

  object :carts_queries do
    @desc "List all items"
    field :list_carts, non_null(list_of(non_null(:item))) do
      resolve &CartsResolvers.list_all_carts/3
    end

    @desc "Get item by id"
    field :cart, :cart do
      arg :id, non_null(:id)
      resolve &CartsResolvers.get_cart_by_id/3
    end
  end
end
