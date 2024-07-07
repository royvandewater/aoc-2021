defmodule Day12 do
  alias Day12.Cave

  def parse!(str) do
    str
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.flat_map(&parse_line!/1)
    |> Enum.reduce(%{}, &build_input/2)
  end

  defp parse_line!(line) do
    [a, b] =
      line
      |> String.trim()
      |> String.split("-", trim: true)
      |> Enum.map(&String.to_atom/1)

    [{a, b}, {b, a}]
  end

  defp build_input({key, val}, acc) do
    Map.update(acc, key, [val], &[val | &1])
  end

  def part_1(input), do: input |> Cave.paths() |> MapSet.size()

  def part_2(_input), do: 0
end
