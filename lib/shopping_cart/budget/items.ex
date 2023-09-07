defmodule ShoppingCart.Budget.Items do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "items" do
    field :desc, :string
    field :discount_percentage, :integer
    field :name, :string
    field :term_price, :integer

    timestamps()
  end

  @doc false
  def changeset(items, attrs) do
    items
    |> cast(attrs, [:name, :desc, :term_price, :discount_percentage])
    |> validate_required([:name, :desc, :term_price, :discount_percentage])
  end
end
