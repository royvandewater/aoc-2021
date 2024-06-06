defmodule Day5 do
  use Application

  def start(_type, _args) do
    IO.puts("Day 5")

    input = File.read!("./input.txt") |> parse!()
    IO.puts("part 1: #{part_1(input)}")

    {:ok, self()}
  end

  def parse!(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line!/1)
  end

  defp parse_line!(line) do
    line
    |> String.split("->", trim: true)
    |> Enum.map(&parse_coordinate!/1)
    |> List.to_tuple()
  end

  defp parse_coordinate!(coordinate) do
    coordinate
    |> String.split(",", trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  def part_1(input) do
    input
    |> Enum.filter(&straight_line/1)
    |> Board.from_lines()
    |> Board.score()
  end

  def straight_line({{x0, y0}, {x1, y1}}) do
    x0 == x1 or y0 == y1
  end
end
