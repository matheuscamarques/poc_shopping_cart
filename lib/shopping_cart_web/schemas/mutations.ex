defmodule ShoppingCartWeb.Schemas.Mutations do
  use Absinthe.Schema.Notation
  alias ShoppingCartWeb.Schemas.Budget.Items.Mutations.ItemsMutations
  alias ShoppingCartWeb.Schemas.Budget.Carts.Mutations.CartsMutations

  import_types(ItemsMutations)
  import_types(CartsMutations)
end
