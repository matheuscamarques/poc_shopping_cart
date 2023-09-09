defmodule ShoppingCartWeb.Schemas.Budget.CartsItems.Mutations.CartsItemsMutations do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias ShoppingCartWeb.Schemas.Budget.CartsItems.Resolvers.CartsItemsResolvers

  object :carts_items_mutations do
    @desc "Create new cart"
    payload field(:add_item_to_cart) do
      input do
        field :carts_id, non_null(:id)
        field :items_id, non_null(:id)
      end

      output do
        field(:cart, :cart)
      end

      resolve(&CartsItemsResolvers.create_carts_items/3)
    end

    @desc "Delete cart"
    payload field(:remove_item_from_cart) do
      input do
        field :carts_id, non_null(:id)
        field :items_id, non_null(:id)
      end

      output do
        field(:cart, :cart)
      end

      resolve(&CartsItemsResolvers.delete_carts_items/3)
    end
  end
end
