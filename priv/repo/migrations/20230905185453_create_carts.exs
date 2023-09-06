defmodule ShoppingCart.Repo.Migrations.CreateCart do
  use Ecto.Migration

  def change do
    create table(:carts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :total_items, :integer
      add :total_term_price, :integer
      add :total_price, :integer

      timestamps()
    end
  end
end
