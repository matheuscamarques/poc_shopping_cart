defmodule ShoppingCart.Repo do
  use Ecto.Repo,
    otp_app: :shopping_cart,
    adapter: Ecto.Adapters.Postgres
end
