defmodule Day11 do
  alias Day11.Cave

  def parse!(str) do
    str
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line!/1)
  end

  defp parse_line!(line) do
    line
    |> String.trim()
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(input), do: Cave.simulate(input)

  def part_2(_), do: 0
end
