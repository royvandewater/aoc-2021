defmodule Board do
  def new(), do: %{}

  def from_lines([]), do: new()
  def from_lines([line | rest]), do: from_lines(rest) |> Board.add(line)

  def add(board, {{x0, y}, {x1, y}}) do
    x0..x1
    |> Enum.map(&{&1, y})
    |> Enum.reduce(board, &add_cell/2)
  end

  def add(board, {{x, y0}, {x, y1}}) do
    y0..y1
    |> Enum.map(&{x, &1})
    |> Enum.reduce(board, &add_cell/2)
  end

  def add(board, {{x0, y0}, {x1, y1}}) do
    [x0..x1, y0..y1]
    |> Enum.zip()
    |> Enum.reduce(board, &add_cell/2)
  end

  defp add_cell(cell, board) do
    Map.update(board, cell, 1, &(&1 + 1))
  end

  def score(board) do
    board
    |> Map.values()
    |> Enum.filter(&(1 < &1))
    |> Enum.count()
  end
end
