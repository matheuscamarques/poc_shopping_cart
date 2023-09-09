defmodule ShoppingCartWeb.Schemas.Mutations do
  use Absinthe.Schema.Notation
  alias ShoppingCartWeb.Schemas.Budget.Items.Mutations.ItemsMutations
  alias ShoppingCartWeb.Schemas.Budget.Carts.Mutations.CartsMutations
  alias ShoppingCartWeb.Schemas.Budget.CartsItems.Mutations.CartsItemsMutations
  import_types(ItemsMutations)
  import_types(CartsMutations)
  import_types(CartsItemsMutations)
end
