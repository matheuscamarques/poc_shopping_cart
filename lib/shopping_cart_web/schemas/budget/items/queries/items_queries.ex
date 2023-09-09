defmodule ShoppingCartWeb.Schemas.Budget.Items.Queries.ItemsQueries do
  use Absinthe.Schema.Notation
  alias ShoppingCartWeb.Schemas.Budget.Items.Resolvers.ItemsResolvers

  object :items_queries do
    @desc "List all items"
    field :list_items, non_null(list_of(non_null(:item))) do
      resolve(&ItemsResolvers.list_all_items/3)
    end

    @desc "Get item by id"
    field :item, :item do
      arg(:id, non_null(:id))
      resolve(&ItemsResolvers.get_item_by_id/3)
    end
  end
end
