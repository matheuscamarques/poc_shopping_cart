defmodule Mix.Tasks.ShoppingCart.Ecto.Migrate do
  alias ShoppingCart.Repo

  use Mix.Task

  def run(_args) do
    {:ok, _} = Application.ensure_all_started(:shopping_cart)

    path = Application.app_dir(:shopping_cart, "priv/repo/migrations")

    Ecto.Migrator.run(Repo, path, :up, all: true)

    :init.stop()
  end
end
