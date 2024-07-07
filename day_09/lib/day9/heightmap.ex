defmodule Day9.Heightmap do
  def new(rows) do
    rows
    |> Enum.with_index()
    |> Enum.map(&row_coordinates/1)
    |> List.flatten()
    |> Map.new()
  end

  defp row_coordinates({row, y}) do
    row
    |> Enum.with_index()
    |> Enum.map(fn {h, x} -> {{x, y}, h} end)
  end
end
