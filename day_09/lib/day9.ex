defmodule Day9 do
  alias Day9.Basin
  alias Day9.Heightmap

  def parse!(str) do
    str
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Heightmap.new()
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(heightmap) do
    heightmap
    |> low_points()
    |> Enum.map(&(&1 + 1))
    |> Enum.sum()
  end

  def part_2(heightmap) do
    heightmap
    |> Map.filter(&low_point?(&1, heightmap))
    |> Map.keys()
    |> Enum.map(&Basin.discover(&1, heightmap))
    |> Enum.map(&MapSet.size/1)
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.take(3)
    |> Enum.product()
  end

  def low_points(heightmap) do
    heightmap
    |> Map.filter(&low_point?(&1, heightmap))
    |> Map.values()
  end

  defp low_point?({{x, y}, v0}, heightmap) do
    [
      {x + 1, y},
      {x - 1, y},
      {x, y + 1},
      {x, y - 1}
    ]
    |> Enum.map(&Map.get(heightmap, &1))
    |> Enum.reject(&is_nil/1)
    |> Enum.all?(&(v0 < &1))
  end
end
