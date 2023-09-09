defmodule ShoppingCartWeb.Schemas.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias ShoppingCartWeb.Schemas.Budget.Items.Types.ItemsTypes
  alias ShoppingCartWeb.Schemas.Budget.Carts.Types.CartsTypes
  alias ShoppingCartWeb.Schemas.Budget.ItemsCarts.Types.ItemsCartsTypes

  import_types(Kronky.ValidationMessageTypes)
  import_types(ItemsTypes)
  import_types(CartsTypes)
  import_types(ItemsCartsTypes)
end
