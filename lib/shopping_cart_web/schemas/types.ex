defmodule ShoppingCartWeb.Schemas.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias ShoppingCartWeb.Schemas.Budget.Items.Types.ItemsType

  import_types(Kronky.ValidationMessageTypes)
  import_types(ItemsType)
end
