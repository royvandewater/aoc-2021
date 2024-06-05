defmodule Board do
  def new(), do: %{bounds: %{x: 0..0, y: 0..0}, cells: %{}}

  def add(board, line) do
    board
    |> Map.update!(:cells, &add_line(&1, line))
    |> Map.update!(:bounds, &calculate_new_bounds(&1, line))
  end

  defp add_line(cells, {{x0, y}, {x1, y}}) do
    x0..x1
    |> Enum.map(&{&1, y})
    |> Enum.reduce(cells, &add_cell/2)
  end

  defp add_line(cells, {{x, y0}, {x, y1}}) do
    y0..y1
    |> Enum.map(&{x, &1})
    |> Enum.reduce(cells, &add_cell/2)
  end

  defp add_cell(cell, cells) do
    Map.update(cells, cell, 1, &(&1 + 1))
  end

  defp calculate_new_bounds(bounds, {{x0, y0}, {x1, y1}}) do
    minX = Enum.min([Enum.min(bounds[:x]), x0, x1])
    maxX = Enum.max([Enum.max(bounds[:x]), x0, x1])

    minY = Enum.min([Enum.min(bounds[:y]), y0, y1])
    maxY = Enum.max([Enum.max(bounds[:y]), y0, y1])

    %{x: minX..maxX, y: minY..maxY}
  end

  def score(board) do
    board
    |> Map.fetch!(:cells)
    |> Map.values()
    |> Enum.filter(&(1 < &1))
    |> Enum.count()
  end
end
