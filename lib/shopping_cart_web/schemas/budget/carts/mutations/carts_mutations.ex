defmodule ShoppingCartWeb.Schemas.Budget.Carts.Mutations.CartsMutations do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias ShoppingCartWeb.Schemas.Budget.Carts.Resolvers.CartsResolvers

  object :carts_mutations do
    @desc "Create new cart"
    payload field(:create_carts) do
      output do
        field(:cart, :cart)
      end

      resolve(&CartsResolvers.create_carts/3)
    end

    @desc "Delete cart"
    payload field(:delete_carts) do
      input do
        field :id, non_null(:string)
      end

      output do
        field(:cart, :cart)
      end

      resolve(&CartsResolvers.delete_carts/3)
    end
  end
end
