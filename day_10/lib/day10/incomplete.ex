defmodule Day10.Incomplete do
  import Day10.Line

  def score_line(line) do
    line
    |> String.split("", trim: true)
    |> Enum.reduce([], &keep_unmatched/2)
    |> Enum.reduce(0, &score/2)
  end

  defp keep_unmatched(x, acc) do
    if open?(x) do
      [x | acc]
    else
      Enum.drop(acc, 1)
    end
  end

  defp score(x, acc) do
    acc * 5 + score_char(x)
  end

  defp score_char("("), do: 1
  defp score_char("["), do: 2
  defp score_char("{"), do: 3
  defp score_char("<"), do: 4
  defp score_char(_), do: 0
end
