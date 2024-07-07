defmodule Board do
  def mark(board, n) do
    board |> Enum.map(&mark_line(&1, n))
  end

  defp mark_line(line, n) do
    line |> Enum.map(&mark_cell(&1, n))
  end

  defp mark_cell([n, _], n), do: [n, true]
  defp mark_cell(x, _), do: x

  def parse!(input) do
    input
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line!/1)
  end

  def parse_line!(input) do
    input
    |> String.split("\s", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&[&1, false])
  end

  def score(board) do
    board
    |> Enum.map(&score_row/1)
    |> Enum.sum()
  end

  defp score_row(row) do
    row
    |> Enum.map(&score_cell/1)
    |> Enum.sum()
  end

  defp score_cell([n, false]), do: n
  defp score_cell([_, true]), do: 0

  def wins?(board) do
    wins_by_row?(board) or wins_by_column?(board)
  end

  defp wins_by_column?(board) do
    0..4
    |> Enum.map(&column(board, &1))
    |> Enum.any?(&wins_line?/1)
  end

  defp column(board, n) do
    board
    |> Enum.map(&Enum.at(&1, n))
  end

  defp wins_by_row?(board) do
    board
    |> Enum.any?(&wins_line?/1)
  end

  defp wins_line?(line) do
    line
    |> Enum.all?(&wins_cell?/1)
  end

  defp wins_cell?([_, marked]), do: marked
end
