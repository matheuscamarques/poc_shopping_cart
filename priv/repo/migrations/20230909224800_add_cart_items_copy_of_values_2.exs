defmodule ShoppingCart.Repo.Migrations.AddCartItemsCopyOfValues2 do
  use Ecto.Migration

  def change do
    alter table(:carts_items) do
      add :name, :string
      add :desc, :string
    end
  end
end
