defmodule ShoppingCartWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(ShoppingCartWeb.Schemas.Types)
  import_types(ShoppingCartWeb.Schemas.Queries)
  import_types(ShoppingCartWeb.Schemas.Mutations)

  query do
    import_fields(:items_queries)
    import_fields(:carts_queries)
  end

  mutation do
    import_fields(:items_mutations)
    import_fields(:carts_mutations)
  end
end
