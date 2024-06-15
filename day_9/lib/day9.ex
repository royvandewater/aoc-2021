defmodule Day9 do
  def parse!(str) do
    str
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(input) do
    input
    |> low_points()
    |> Enum.map(&(&1 + 1))
    |> Enum.sum()
  end

  def low_points(rows) do
    coordinates(rows)
    |> Enum.filter(&low_point?(&1, rows))
    |> Enum.map(&value_at(&1, rows))
  end

  defp coordinates(rows) do
    rows
    |> Enum.with_index()
    |> Enum.map(&row_coordinates/1)
    |> List.flatten()
  end

  defp row_coordinates({row, y}) do
    row
    |> Enum.with_index()
    |> Enum.map(fn {_, x} -> {x, y} end)
  end

  defp low_point?({x, y}, rows) do
    v0 = value_at({x, y}, rows)

    [
      {x + 1, y},
      {x - 1, y},
      {x, y + 1},
      {x, y - 1}
    ]
    |> Enum.map(&value_at(&1, rows))
    |> Enum.reject(&is_nil/1)
    |> Enum.all?(&(v0 < &1))
  end

  defp value_at({x, y}, _) when x < 0 or y < 0, do: nil
  defp value_at({x, y}, rows), do: rows |> Enum.at(y, []) |> Enum.at(x, nil)
end
