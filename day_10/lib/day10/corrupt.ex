defmodule Day10.Corrupt do
  import Day10.Line

  def is_corrupt?(line), do: score_line(line) > 0

  def score_line(line) do
    line
    |> first_illegal_character()
    |> score()
  end

  def first_illegal_character(line) do
    line
    |> String.split("", trim: true)
    |> walk([])
  end

  defp score(")"), do: 3
  defp score("]"), do: 57
  defp score("}"), do: 1197
  defp score(">"), do: 25137
  defp score(_), do: 0

  defp walk([], _), do: nil

  defp walk([head | tail], acc) do
    cond do
      open?(head) ->
        walk(tail, [head | acc])

      inverse?(List.first(acc), head) ->
        walk(tail, Enum.drop(acc, 1))

      true ->
        head
    end
  end
end
