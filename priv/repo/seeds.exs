# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ShoppingCart.Repo.insert!(%ShoppingCart.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

ShoppingCart.Budget.create_items(%{
  name: "Shampoo",
  desc: "Aroma de morango",
  discount_percentage: 10,
  term_price: 1_0_32
})

ShoppingCart.Budget.create_items(%{
  name: "Condicionador",
  desc: "Aroma de morango",
  discount_percentage: 10,
  term_price: 5_000_25
})

ShoppingCart.Budget.create_items(%{
  name: "Ar Condicionado",
  desc: "Aroma de morango",
  discount_percentage: 10,
  term_price: 10_000_25
})

ShoppingCart.Budget.create_items(%{
  name: "Televisão",
  desc: "50 polegadas",
  discount_percentage: 10,
  term_price: 50_000_50
})

IO.inspect(ShoppingCart.Budget.list_items())
