defmodule ShoppingCart.Budget.Carts do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "carts" do
    field :total_items, :integer, default: 0
    field :total_price, :integer, default: 0
    field :total_term_price, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:total_items, :total_term_price, :total_price])

    # |> validate_required([:total_items, :total_term_price, :total_price])
  end
end
