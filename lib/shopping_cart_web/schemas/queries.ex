defmodule ShoppingCartWeb.Schemas.Queries do
  use Absinthe.Schema.Notation
  alias ShoppingCartWeb.Schemas.Budget.Items.Queries.ItemsQueries
  alias ShoppingCartWeb.Schemas.Budget.Carts.Queries.CartsQueries

  import_types(ItemsQueries)
  import_types(CartsQueries)
end
