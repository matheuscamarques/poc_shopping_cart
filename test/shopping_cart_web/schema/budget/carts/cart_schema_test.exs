defmodule ShoppingCartWeb.Schema.Budget.Carts.CartSchemaTest do
  use ShoppingCartWeb.ConnCase
  @entity_name "carts"
  @entity_name_upper "Carts"

  @create_entity_mutation get_query("create_#{@entity_name}")
  # @update_entity_mutation get_query("update_#{@entity_name}")
  @delete_entity_mutation get_query("delete_#{@entity_name}")
  @entity_query get_query("#{@entity_name}_query")
  @list_entity_query get_query("list_#{@entity_name}_query")

  test "mutation: create_#{@entity_name}", %{conn: conn} do
    conn =
      post(conn, "/graphiql", %{
        "query" => @create_entity_mutation,
        "variables" => to_input(entity_params())
      })

    %{
      "data" => data
    } = json_response(conn, 200)

    entity = data |> Map.get("create#{@entity_name_upper}") |> Map.get("#{@entity_name}")
    create_assert(entity)
  end

  # test "mutation: update_#{@entity_name}", %{conn: conn} do
  #   {:ok, %{id: id}} = entity_factory()

  #   conn =
  #     post(conn, "/graphiql", %{
  #       "query" => @update_entity_mutation,
  #       "variables" =>
  #         to_input(
  #           Map.merge(
  #             %{
  #               id: id
  #             },
  #             entity_params()
  #           )
  #         )
  #     })

  #   %{
  #     "data" => %{
  #       "update#{@entity_name_upper}" => %{"#{@entity_name}" => entity}
  #     }
  #   } = json_response(conn, 200)

  #   update_assert(entity, %{id: id})
  # end

  test "mutation: delete_#{@entity_name}", %{conn: conn} do
    {:ok, %{id: id}} = entity_factory()

    conn =
      post(conn, "/graphiql", %{
        "query" => @delete_entity_mutation,
        "variables" =>
          to_input(%{
            id: id
          })
      })

    assert %{
             "data" => _
           } = json_response(conn, 200)

    assert get_entity(id) == nil
  end

  test "query: #{@entity_name}", %{conn: conn} do
    {:ok, %{id: id}} = entity_factory()

    conn =
      post(conn, "/graphiql", %{
        "query" => @entity_query,
        "variables" => %{
          id: id
        }
      })

    %{
      "data" => data
    } = json_response(conn, 200)

    entity = data |> Map.get(@entity_name)
    entity_assert(entity)
  end

  test "query: list_#{@entity_name}", %{conn: conn} do
    {:ok, _} = entity_factory()
    {:ok, _} = entity_factory()
    {:ok, _} = entity_factory()

    conn =
      post(conn, "/graphiql", %{
        "query" => @list_entity_query
      })

    assert %{
             "data" => data
           } = json_response(conn, 200)

    entities = data |> Map.get("list#{@entity_name_upper}")
    assert length(entities) == 3
  end

  # to implements by behavior
  def entity_assert(_entity) do
    # assert entity["discountPercentage"] == 75
    # assert entity["name"] == "Head Set"
    # assert entity["price"] == "R$250.00"
    # assert entity["termPrice"] == "R$1,000.00"
  end

  def create_assert(_entity) do
    # assert entity["discountPercentage"] == 75
    # assert entity["name"] == "Head Set"
    # assert entity["price"] == "R$250.00"
    # assert entity["termPrice"] == "R$1,000.00"
  end

  # def update_assert(entity, %{id: id}) do
  #   assert entity["id"] == id
  # end

  def get_entity(id) do
    ShoppingCart.Budget.get_carts(id)
  end

  def entity_factory() do
    entity_params() |> ShoppingCart.Budget.create_carts()
  end

  def entity_params() do
    %{}
  end
end
