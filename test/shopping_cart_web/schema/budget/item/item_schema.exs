defmodule ShoppingCartWeb.Schema.Budget.ItemSchema do
  use ShoppingCartWeb.ConnCase

  @create_item_mutation get_query("create_item")
  @update_item_mutation get_query("update_item")
  @delete_item_mutation get_query("delete_item")
  @item_query get_query("item_query")
  @list_items_query get_query("list_items_query")

  test "mutation: create_item", %{conn: conn} do
    conn =
      post(conn, "/graphiql", %{
        "query" => @create_item_mutation,
        "variables" => to_input(%{
          name: "Head Set",
          desc: "Da para ouvir tudo!",
          discountPercentage: 75,
          termPrice: 100000
        })
      })

     %{
      "data" => %{
        "createItem" => %{"item" => item}
      }
    } = json_response(conn, 200)

    assert item["discountPercentage"] == 75
    assert item["name"] == "Head Set"
    assert item["price"] == "R$250.00"
    assert item["termPrice"] == "R$1,000.00"
  end

  test "mutation: update_item", %{conn: conn} do
    {:ok, %{id: id}} = item_factory()
    conn =
      post(conn, "/graphiql", %{
        "query" => @update_item_mutation,
        "variables" => to_input(%{
          id: id,
          name: "Head Set Updated",
          desc: "Da para ouvir tudo!",
          discountPercentage: 75,
          termPrice: 100000
        })
      })

     %{
      "data" => %{
        "updateItem" => %{"item" => item}
      }
    } = json_response(conn, 200)

    assert item["id"] == id
    assert item["discountPercentage"] == 75
    assert item["name"] == "Head Set Updated"
    assert item["price"] == "R$250.00"
    assert item["termPrice"] == "R$1,000.00"
  end

  test "mutation: delete_item", %{conn: conn} do
    {:ok, %{id: id}} = item_factory()
    conn =
      post(conn, "/graphiql", %{
        "query" => @delete_item_mutation,
        "variables" => to_input(%{
          id: id
        })
      })

     assert %{
      "data" => %{
        "deleteItem" => %{"item" => _item}
      }
    } = json_response(conn, 200)

    assert ShoppingCart.Budget.get_items(id) == nil
  end

  test "query: item", %{conn: conn} do
    {:ok, %{id: id}} = item_factory()
    conn =
      post(conn, "/graphiql", %{
        "query" => @item_query,
        "variables" => %{
          id: id
        }
      })

     assert %{
      "data" =>
         %{"item" => item}

    } = json_response(conn, 200)

    assert item["discountPercentage"] == 75
    assert item["name"] == "Head Set"
    assert item["price"] == "R$250.00"
    assert item["termPrice"] == "R$1,000.00"
  end

  test "query: list_items", %{conn: conn} do
    {:ok, _} = item_factory()
    {:ok, _} = item_factory()
    {:ok, _} = item_factory()
    conn =
      post(conn, "/graphiql", %{
        "query" => @list_items_query
      })

     assert %{
      "data" => %{"listItems" => items}
    } = json_response(conn, 200)

    assert length(items) == 3
  end


  def item_factory() do
    items_params() |> ShoppingCart.Budget.create_items()
  end

  def items_params() do
    %{
      name: "Head Set",
      desc: "Da para ouvir tudo!",
      discount_percentage: 75,
      term_price: 100000
    }
  end
end
