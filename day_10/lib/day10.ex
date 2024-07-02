defmodule Day10 do
  alias Day10.Corrupt, as: Corrupt
  alias Day10.Incomplete, as: Incomplete

  def parse!(str) do
    str |> String.trim() |> String.split("\n", trim: true) |> Enum.map(&String.trim/1)
  end

  def part_1(lines), do: lines |> Enum.map(&Corrupt.score_line/1) |> Enum.sum()

  def part_2(lines) do
    lines
    |> Enum.reject(&Corrupt.is_corrupt?/1)
    |> Enum.map(&Incomplete.score_line/1)
    |> Enum.sort()
    |> middle()
  end

  defp middle([score]), do: score

  defp middle(scores) do
    scores
    |> List.delete_at(0)
    |> List.delete_at(-1)
    |> middle()
  end
end
