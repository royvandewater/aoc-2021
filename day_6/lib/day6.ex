defmodule Day6 do
  use Application

  def start(_type, _arts) do
    IO.puts("Day 6")

    input = File.read!("./input.txt") |> parse!()
    IO.puts("part 1: #{part_1(input)}")

    {:ok, self()}
  end

  def parse!(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(input) do
    days(input, 80)
    |> Enum.count()
  end

  defp days(input, 0), do: input

  defp days(input, n) do
    input
    |> day()
    |> days(n - 1)
  end

  def day([]), do: []

  def day([head | rest]) do
    if head > 0 do
      [head - 1 | day(rest)]
    else
      [6 | day(rest)] ++ [8]
    end
  end
end
