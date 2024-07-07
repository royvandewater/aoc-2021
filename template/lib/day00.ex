defmodule Day00 do
  def parse!(str) do
    str
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line!/1)
  end

  defp parse_line!(line) do
    line
  end

  def part_1(_input), do: 0

  def part_2(_input), do: 0
end
