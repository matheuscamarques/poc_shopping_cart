defmodule ShoppingCartWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use ShoppingCartWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate
  alias ShoppingCart.Utils
  using do
    quote do
      # The default endpoint for testing
      @endpoint ShoppingCartWeb.Endpoint

      use ShoppingCartWeb, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import ShoppingCartWeb.ConnCase



    end
  end

  def to_input(input), do: %{"input" => input |> Utils.camelize_keys()}

  defmacro get_query(file) do
    quote do
      file = unquote(file)
      File.read!(Path.join(__DIR__, "#{file}.graphql"))
    end
  end


  setup tags do
    ShoppingCart.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
