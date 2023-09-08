defmodule ShoppingCart.BudgetTest do
  use ShoppingCart.DataCase

  alias ShoppingCart.Budget

  describe "cart_items" do
    # alias ShoppingCart.Budget.CartsItems

    import ShoppingCart.BudgetFixtures

    @invalid_attrs %{}

    # test "list_cart_items/0 returns all cart_items" do
    #   cart_items = cart_items_fixture()
    #   assert Budget.list_cart_items() == [cart_items]
    # end

    # test "get_cart_items!/1 returns the cart_items with given id" do
    #   cart_items = cart_items_fixture()
    #   assert Budget.get_cart_items!(cart_items.id) == cart_items
    # end

    # test "create_cart_items/1 with valid data creates a cart_items" do
    #   valid_attrs = %{}

    #   assert {:ok, %CartsItems{} = cart_items} = Budget.create_cart_items(valid_attrs)
    # end

    # test "create_cart_items/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Budget.create_cart_items(@invalid_attrs)
    # end

    # test "update_cart_items/2 with valid data updates the cart_items" do
    #   cart_items = cart_items_fixture()
    #   update_attrs = %{}

    #   assert {:ok, %CartsItems{} = cart_items} = Budget.update_cart_items(cart_items, update_attrs)
    # end

    # test "update_cart_items/2 with invalid data returns error changeset" do
    #   cart_items = cart_items_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Budget.update_cart_items(cart_items, @invalid_attrs)
    #   assert cart_items == Budget.get_cart_items!(cart_items.id)
    # end

    # test "delete_cart_items/1 deletes the cart_items" do
    #   cart_items = cart_items_fixture()
    #   assert {:ok, %CartsItems{}} = Budget.delete_cart_items(cart_items)
    #   assert_raise Ecto.NoResultsError, fn -> Budget.get_cart_items!(cart_items.id) end
    # end

    # test "change_cart_items/1 returns a cart_items changeset" do
    #   cart_items = cart_items_fixture()
    #   assert %Ecto.Changeset{} = Budget.change_cart_items(cart_items)
    # end
  end

  describe "items" do
    alias ShoppingCart.Budget.Items

    import ShoppingCart.BudgetFixtures

    @invalid_attrs %{desc: nil, discount_percentage: nil, name: nil, term_price: nil}

    test "list_items/0 returns all items" do
      items = items_fixture()
      assert Budget.list_items() == [items]
    end

    test "get_items!/1 returns the items with given id" do
      items = items_fixture()
      assert Budget.get_items!(items.id) == items
    end

    test "create_items/1 with valid data creates a items" do
      valid_attrs = %{
        desc: "some desc",
        discount_percentage: 42,
        name: "some name",
        term_price: 42
      }

      assert {:ok, %Items{} = items} = Budget.create_items(valid_attrs)
      assert items.desc == "some desc"
      assert items.discount_percentage == 42
      assert items.name == "some name"
      assert items.term_price == 42
    end

    test "create_items/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_items(@invalid_attrs)
    end

    test "update_items/2 with valid data updates the items" do
      items = items_fixture()

      update_attrs = %{
        desc: "some updated desc",
        discount_percentage: 43,
        name: "some updated name",
        term_price: 43
      }

      assert {:ok, %Items{} = items} = Budget.update_items(items, update_attrs)
      assert items.desc == "some updated desc"
      assert items.discount_percentage == 43
      assert items.name == "some updated name"
      assert items.term_price == 43
    end

    test "update_items/2 with invalid data returns error changeset" do
      items = items_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_items(items, @invalid_attrs)
      assert items == Budget.get_items!(items.id)
    end

    test "delete_items/1 deletes the items" do
      items = items_fixture()
      assert {:ok, %Items{}} = Budget.delete_items(items)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_items!(items.id) end
    end

    test "change_items/1 returns a items changeset" do
      items = items_fixture()
      assert %Ecto.Changeset{} = Budget.change_items(items)
    end
  end

  describe "cart" do
    alias ShoppingCart.Budget.Carts

    import ShoppingCart.BudgetFixtures

    @invalid_attrs %{total_items: nil, total_price: nil, total_term_price: nil}

    test "list_cart/0 returns all cart" do
      cart = cart_fixture()
      assert Budget.list_carts() == [cart]
    end

    test "get_carts!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Budget.get_carts!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      valid_attrs = %{total_items: 42, total_price: 42, total_term_price: 42}

      assert {:ok, %Carts{} = cart} = Budget.create_carts(valid_attrs)
      assert cart.total_items == 42
      assert cart.total_price == 42
      assert cart.total_term_price == 42
    end

    # test "create_cart/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Budget.create_cart(@invalid_attrs)
    # end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      update_attrs = %{total_items: 43, total_price: 43, total_term_price: 43}

      assert {:ok, %Carts{} = cart} = Budget.update_carts(cart, update_attrs)
      assert cart.total_items == 43
      assert cart.total_price == 43
      assert cart.total_term_price == 43
    end

    # test "update_cart/2 with invalid data returns error changeset" do
    #   cart = cart_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Budget.update_cart(cart, @invalid_attrs)
    #   assert cart == Budget.get_carts!(cart.id)
    # end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Carts{}} = Budget.delete_carts(cart)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_carts!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Budget.change_carts(cart)
    end
  end
end
