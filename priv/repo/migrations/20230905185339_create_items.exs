defmodule ShoppingCart.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :desc, :string
      add :term_price, :integer
      add :discount_percentage, :integer

      timestamps()
    end
  end
end
