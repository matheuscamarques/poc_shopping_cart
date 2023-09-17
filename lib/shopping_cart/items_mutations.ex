defmodule ShoppingCartWeb.Schemas.Budget.Items.Mutations.ItemsMutations do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias ShoppingCartWeb.Schemas.Budget.Items.Resolvers.ItemsResolvers

  object :items_mutations do
    @desc "Create new item"
    payload field(:create_item) do
      input do
        field :name, non_null(:string)
        field :desc, non_null(:string)
        # @desc "Discunt percentage is 1 then 100"
        field :discount_percentage, non_null(:integer)
        # @desc "Trem Price is in CENTS "
        field :term_price, non_null(:integer)
      end

      output do
        field(:item, :item)
      end

      resolve(&ItemsResolvers.create_items/3)
    end

    @desc "Update a item"
    payload field(:update_item) do
      input do
        field :id, non_null(:string)
        field :name, non_null(:string)
        field :desc, non_null(:string)
        # @desc "Discunt percentage is 1 then 100"
        field :discount_percentage, non_null(:integer)
        # @desc "Trem Price is in CENTS "
        field :term_price, non_null(:integer)
      end

      output do
        field(:item, :item)
      end

      resolve(&ItemsResolvers.update_items/3)
    end

    @desc "Delete item"
    payload field(:delete_item) do
      input do
        field :id, non_null(:string)
      end

      output do
        field(:item, :item)
      end

      resolve(&ItemsResolvers.delete_items/3)
    end
  end
end
