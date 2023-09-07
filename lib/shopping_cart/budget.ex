defmodule ShoppingCart.Budget do
  @moduledoc """
  The Budget context.
  """

  import Ecto.Query, warn: false
  alias ShoppingCart.Repo

  alias ShoppingCart.Budget.Carts
  alias ShoppingCart.Budget.Sage.CartsItemsSage

  @doc """
  Returns the list of cart.

  ## Examples

      iex> list_cart()
      [%Carts{}, ...]

  """
  def list_cart do
    Repo.all(Carts)
  end

  @doc """
  Gets a single cart.

  Raises `Ecto.NoResultsError` if the Carts does not exist.

  ## Examples

      iex> get_cart!(123)
      %Carts{}

      iex> get_cart!(456)
      ** (Ecto.NoResultsError)

  """
  def get_carts!(id), do: Repo.get!(Carts, id)
  def get_carts(id), do: Repo.get(Carts, id)

  @doc """
  Creates a cart.

  ## Examples

      iex> create_cart(%{field: value})
      {:ok, %Carts{}}

      iex> create_cart(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cart(attrs \\ %{}) do
    %Carts{}
    |> Carts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cart.

  ## Examples

      iex> update_cart(cart, %{field: new_value})
      {:ok, %Carts{}}

      iex> update_cart(cart, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cart(%Carts{} = cart, attrs) do
    cart
    |> Carts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cart.

  ## Examples

      iex> delete_cart(cart)
      {:ok, %Carts{}}

      iex> delete_cart(cart)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cart(%Carts{} = cart) do
    Repo.delete(cart)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cart changes.

  ## Examples

      iex> change_cart(cart)
      %Ecto.Changeset{data: %Carts{}}

  """
  def change_cart(%Carts{} = cart, attrs \\ %{}) do
    Carts.changeset(cart, attrs)
  end

  alias ShoppingCart.Budget.CartsItems

  @doc """
  Returns the list of cart_items.

  ## Examples

      iex> list_cart_items()
      [%CartsItems{}, ...]

  """
  def list_cart_items do
    Repo.all(CartsItems)
  end

  @doc """
  Gets a single cart_items.

  Raises `Ecto.NoResultsError` if the Carts items does not exist.

  ## Examples

      iex> get_cart_items!(123)
      %CartsItems{}

      iex> get_cart_items!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cart_items!(id), do: Repo.get!(CartsItems, id)

  @doc """
  Creates a cart_items.

  ## Examples

      iex> create_cart_items(%{field: value})
      {:ok, %CartsItems{}}

      iex> create_cart_items(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cart_items(attrs \\ %{}) do
    CartsItemsSage.create_cart_items(attrs)
  end

  @doc """
  Updates a cart_items.

  ## Examples

      iex> update_cart_items(cart_items, %{field: new_value})
      {:ok, %CartsItems{}}

      iex> update_cart_items(cart_items, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cart_items(%CartsItems{} = cart_items, attrs) do
    cart_items
    |> CartsItems.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cart_items.

  ## Examples

      iex> delete_cart_items(cart_items)
      {:ok, %CartsItems{}}

      iex> delete_cart_items(cart_items)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cart_items(%CartsItems{} = cart_items) do
    Repo.delete(cart_items)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cart_items changes.

  ## Examples

      iex> change_cart_items(cart_items)
      %Ecto.Changeset{data: %CartsItems{}}

  """
  def change_cart_items(%CartsItems{} = cart_items, attrs \\ %{}) do
    CartsItems.changeset(cart_items, attrs)
  end

  alias ShoppingCart.Budget.Items

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Items{}, ...]

  """
  def list_items do
    Repo.all(Items)
  end

  @doc """
  Gets a single items.

  Raises `Ecto.NoResultsError` if the Items does not exist.

  ## Examples

      iex> get_items!(123)
      %Items{}

      iex> get_items!(456)
      ** (Ecto.NoResultsError)

  """
  def get_items!(id), do: Repo.get!(Items, id)
  def get_items(id), do: Repo.get(Items, id)

  @doc """
  Creates a items.

  ## Examples

      iex> create_items(%{field: value})
      {:ok, %Items{}}

      iex> create_items(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_items(attrs \\ %{}) do
    %Items{}
    |> Items.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a items.

  ## Examples

      iex> update_items(items, %{field: new_value})
      {:ok, %Items{}}

      iex> update_items(items, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_items(%Items{} = items, attrs) do
    items
    |> Items.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a items.

  ## Examples

      iex> delete_items(items)
      {:ok, %Items{}}

      iex> delete_items(items)
      {:error, %Ecto.Changeset{}}

  """
  def delete_items(%Items{} = items) do
    Repo.delete(items)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking items changes.

  ## Examples

      iex> change_items(items)
      %Ecto.Changeset{data: %Items{}}

  """
  def change_items(%Items{} = items, attrs \\ %{}) do
    Items.changeset(items, attrs)
  end
end
