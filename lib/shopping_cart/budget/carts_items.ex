defmodule ShoppingCart.Budget.CartsItems do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id


  schema "carts_items" do
    belongs_to :cart, ShoppingCart.Budget.Carts
    belongs_to :item, ShoppingCart.Budget.Items
    timestamps()
  end

  @doc false
  def changeset(cart_items, attrs) do
    cart_items
    |> cast(attrs, [])
    |> validate_required([])
  end
end
