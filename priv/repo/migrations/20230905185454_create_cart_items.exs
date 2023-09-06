defmodule ShoppingCart.Repo.Migrations.CreateCartItems do
  use Ecto.Migration

  def change do
    create table(:carts_items, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:cart_id,  references(:carts, type: :binary_id))
      add(:item_id,  references(:items, type: :binary_id))

      timestamps()
    end
  end
end
