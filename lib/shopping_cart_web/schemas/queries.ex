defmodule ShoppingCartWeb.Schemas.Queries do
  use Absinthe.Schema.Notation
  alias ShoppingCartWeb.Schemas.Budget.Items.Queries.ItemsQueries

  import_types(ItemsQueries)
end
