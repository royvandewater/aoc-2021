defmodule Day3 do
  def main() do
    IO.puts("Day 3")
    input = File.read!("./input.txt") |> parse()

    p1 = Part1.part_1(input)
    IO.puts("Part 1: #{p1}")

    p2 = Part2.part_2(input)
    IO.puts("Part 2: #{p2}")
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  def parse_line(line) do
    line
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end

Day3.main()
