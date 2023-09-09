defmodule ShoppingCart.Repo.Migrations.AddCartItemsCopyOfValues do
  use Ecto.Migration

  def change do
    alter table(:carts_items) do
      add :term_price, :integer
      add :discount_percentage, :integer
    end
  end
end
