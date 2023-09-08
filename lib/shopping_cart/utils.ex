defmodule ShoppingCart.Utils do
  def camelize_keys(map) when is_map(map) do
    Enum.map(map, fn {key, value} -> {camelize(key), camelize_keys(value)} end)
    |> Enum.into(%{})
  end

  def camelize_keys(list) when is_list(list), do: Enum.map(list, &camelize_keys(&1))

  def camelize_keys(term) when is_atom(term) and not (term in [nil, true, false]),
    do: to_string(term)

  def camelize_keys(term), do: term

  def camelize(atom) when is_atom(atom), do: camelize(atom |> Atom.to_string())

  def camelize(string) when is_binary(string) do
    case String.split(string, ~r/[ _-]/) do
      [head | []] ->
        head

      [head | tail] ->
        head <> (tail |> Enum.map(&String.capitalize(&1)) |> Enum.reduce(&(&2 <> &1)))
    end
  end
end
