defmodule Day12.Cave do
  def paths(input) do
    input
    |> walk(:start, [])
    |> MapSet.new()
  end

  defp walk(_input, cur, _path) when cur == :end, do: [[:end]]

  defp walk(input, cur, path) do
    if not can_visit?(cur, path) do
      []
    else
      input
      |> Map.get(cur)
      |> Enum.map(&walk(input, &1, [cur | path]))
      |> flatten_1()
      |> Enum.map(&[cur | &1])
      |> Enum.filter(&(List.last(&1) == :end))
    end
  end

  defp can_visit?(cur, path) do
    if is_lower?(cur) do
      !(cur in path)
    else
      true
    end
  end

  defp is_lower?(atom) do
    str = Atom.to_string(atom)

    str == String.downcase(str)
  end

  def flatten_1(list), do: Enum.reduce(list, [], &do_flatten_1/2)
  defp do_flatten_1(cur, acc), do: acc ++ cur
end
