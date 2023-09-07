defmodule ShoppingCartWeb.Schemas.Mutations do
  use Absinthe.Schema.Notation
  alias ShoppingCartWeb.Schemas.Budget.Items.Mutations.ItemsMutations

  import_types(ItemsMutations)
end
