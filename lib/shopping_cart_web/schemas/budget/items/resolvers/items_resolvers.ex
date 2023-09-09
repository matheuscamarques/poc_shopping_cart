defmodule ShoppingCartWeb.Schemas.Budget.Items.Resolvers.ItemsResolvers do
  alias ShoppingCart.Budget
  alias ShoppingCart.Budget.Items

  def list_all_items(_root, _args, _info) do
    {:ok, ShoppingCart.Budget.list_items()}
  end

  def create_items(_root, args, _info) do
    case Budget.create_items(args) do
      {:ok, item} -> {:ok, %{item: item}}
      other -> other
    end
  end

  def get_item_by_id(_root, %{id: id}, _info) do
    item = Budget.get_items(id)

    case item do
      %Items{} -> {:ok, item}
      nil -> {:error, "Item Not Founded"}
    end
  end

  def update_items(_root, %{id: id} = attrs, _info) do
    item = Budget.get_items(id)

    case item do
      %Items{} ->
        case Budget.update_items(item, attrs) do
          {:ok, item} -> {:ok, %{item: item}}
          other -> other
        end

      nil ->
        {:error, "Item Not Founded"}
    end
  end

  def delete_items(_root, %{id: id}, _info) do
    item = Budget.get_items(id)

    case item do
      nil -> {:error, "Item Not Founded"}
      %Items{} -> Budget.delete_items(item)
    end
  end
end
